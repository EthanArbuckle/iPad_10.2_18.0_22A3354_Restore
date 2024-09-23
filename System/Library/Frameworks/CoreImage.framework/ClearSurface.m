@implementation ClearSurface

void *__ClearSurface_block_invoke(uint64_t a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v7;

  if (a3)
    v7 = 128;
  else
    v7 = *(_DWORD *)(a1 + 32);
  return memset(__b, v7, a6 * a5);
}

void __ClearSurface_block_invoke_2(uint64_t a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  char *p_pattern4;
  _BYTE v10[4];
  char __pattern4;
  char v12;
  char v13;
  char v14;

  __pattern4 = 0x80;
  v12 = *(_BYTE *)(a1 + 32);
  v13 = 0x80;
  v14 = v12;
  v10[0] = v12;
  v10[1] = 0x80;
  v10[2] = v12;
  v10[3] = 0x80;
  v6 = *(_DWORD *)(a1 + 36);
  if (v6 <= 2037741157)
  {
    if (v6 != 846624102 && v6 != 846624121)
      return;
    p_pattern4 = &__pattern4;
LABEL_14:
    memset_pattern4(__b, p_pattern4, a6 * a5);
    return;
  }
  if (v6 == 2037741171 || v6 == 2037741158)
  {
    p_pattern4 = v10;
    goto LABEL_14;
  }
}

void __ClearSurface_block_invoke_3(int a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  memset_pattern4(__b, &unk_192499A90, a6 * a5);
}

void __ClearSurface_block_invoke_4(uint64_t a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int __pattern4;

  if (a3)
    v6 = -2147450880;
  else
    v6 = ((*(_DWORD *)(a1 + 32) & 0x3FF) << 6) | (*(_DWORD *)(a1 + 32) << 22);
  __pattern4 = v6;
  memset_pattern4(__b, &__pattern4, a6 * a5);
}

void __ClearSurface_block_invoke_5(uint64_t a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int __pattern4;

  if (a3)
    v6 = -2147450880;
  else
    v6 = (16 * (*(_DWORD *)(a1 + 32) & 0xFFF)) | (*(_DWORD *)(a1 + 32) << 20);
  __pattern4 = v6;
  memset_pattern4(__b, &__pattern4, a6 * a5);
}

void __ClearSurface_block_invoke_6(uint64_t a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int __pattern4;

  if (a3)
    v6 = -2147450880;
  else
    v6 = *(unsigned __int16 *)(a1 + 32) | (*(unsigned __int16 *)(a1 + 32) << 16);
  __pattern4 = v6;
  memset_pattern4(__b, &__pattern4, a6 * a5);
}

void __ClearSurface_block_invoke_7(uint64_t a1, void *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int __pattern4;

  if (a3)
    v6 = 537395712;
  else
    v6 = (*(_DWORD *)(a1 + 32) << 10) | (*(_DWORD *)(a1 + 32) << 20) | *(_DWORD *)(a1 + 32);
  __pattern4 = v6;
  memset_pattern4(__b, &__pattern4, a6 * a5);
}

void __ClearSurface_block_invoke_8(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  bzero(a2, a6 * a5);
}

@end
