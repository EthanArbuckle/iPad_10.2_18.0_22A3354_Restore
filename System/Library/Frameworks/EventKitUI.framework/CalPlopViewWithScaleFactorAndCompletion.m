@implementation CalPlopViewWithScaleFactorAndCompletion

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(double *)(a1 + 40) * 1.11, *(double *)(a1 + 40) * 1.11);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

void __CalPlopViewWithScaleFactorAndCompletion_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_3;
  v10[3] = &unk_1E6018688;
  v11 = *(id *)(a1 + 32);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_4;
  v6[3] = &unk_1E601CCE0;
  v4 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0, v10, v6, 0.100000001, 0.0);

}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.95, 0.95);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

void __CalPlopViewWithScaleFactorAndCompletion_block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_5;
  v9[3] = &unk_1E6018FC8;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_6;
  v6[3] = &unk_1E601CCB8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0, v9, v6, 0.100000001, 0.0);

}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_5(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(double *)(a1 + 40) * 1.05, *(double *)(a1 + 40) * 1.05);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

void __CalPlopViewWithScaleFactorAndCompletion_block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_7;
  v5[3] = &unk_1E6018688;
  v6 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_8;
  v4[3] = &unk_1E601BC70;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0x20000, v5, v4, 0.100000001, 0.0);

}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_7(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __CalPlopViewWithScaleFactorAndCompletion_block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
