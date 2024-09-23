@implementation CalScaleViewOut

uint64_t __CalScaleViewOut_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __CalScaleViewOut_block_invoke_2(uint64_t a1)
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
  v7[2] = __CalScaleViewOut_block_invoke_3;
  v7[3] = &unk_1E6018688;
  v8 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __CalScaleViewOut_block_invoke_4;
  v4[3] = &unk_1E601CC90;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v7, v4, 0.05);

}

uint64_t __CalScaleViewOut_block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __CalScaleViewOut_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
