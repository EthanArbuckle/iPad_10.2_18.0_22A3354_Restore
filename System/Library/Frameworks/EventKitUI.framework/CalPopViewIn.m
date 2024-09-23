@implementation CalPopViewIn

uint64_t __CalPopViewIn_block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  CGAffineTransformMakeScale(&v5, 1.11, 1.11);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

void __CalPopViewIn_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __CalPopViewIn_block_invoke_3;
  v7[3] = &unk_1E6018688;
  v8 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __CalPopViewIn_block_invoke_4;
  v4[3] = &unk_1E601CC90;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0, v7, v4, 0.100000001, 0.0);

}

uint64_t __CalPopViewIn_block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.95, 0.95);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

void __CalPopViewIn_block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __CalPopViewIn_block_invoke_5;
  v7[3] = &unk_1E6018688;
  v8 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __CalPopViewIn_block_invoke_6;
  v4[3] = &unk_1E601CC90;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0, v7, v4, 0.100000001, 0.0);

}

uint64_t __CalPopViewIn_block_invoke_5(uint64_t a1)
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

uint64_t __CalPopViewIn_block_invoke_6(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
