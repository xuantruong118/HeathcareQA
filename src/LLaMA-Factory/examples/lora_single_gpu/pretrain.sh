#!/bin/bash

CUDA_VISIBLE_DEVICES=0 python src/train_bash.py \
    --stage pt \
    --do_train \
    --dataset_dir data \
    --overwrite_cache \
    --flash_attn True \
    --lora_dropout 0.05 \
    --lora_alpha 32\
    --use_unsloth True \
    --finetuning_type lora \
    --model_name_or_path models/seallm-7b-v2.5 \
    --lora_target q_proj,v_proj \
    --output_dir saves/SeaLLM-7B-v2.5/lora/pretrain \
    --dataset medical_llm \
    --cutoff_len 1024 \
    --preprocessing_num_workers 16 \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 8 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --weight_decay 0.1 \
    --logging_steps 10 \
    --warmup_steps 150 \
    --save_steps 300 \
    --eval_steps 300 \
    --evaluation_strategy steps \
    --load_best_model_at_end \
    --learning_rate 1e-5 \
    --num_train_epochs 1.0 \
    --val_size 0.1 \
    --plot_loss \
    --bf16 