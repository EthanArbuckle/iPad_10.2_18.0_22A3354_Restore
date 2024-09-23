@implementation AudioComponentValidate

void __AudioComponentValidate_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];
  __int128 v6;
  int v7;

  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 72);
  v2 = *(void **)(a1 + 40);
  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __AudioComponentValidate_block_invoke_2;
  v5[3] = &unk_1E2921C38;
  v4 = *(_QWORD *)(a1 + 48);
  v5[4] = a2;
  v5[5] = v4;
  validateComponent(&v6, v3, v2, v5);
}

uint64_t __AudioComponentValidate_block_invoke_2(uint64_t a1, int a2)
{
  **(_DWORD **)(a1 + 40) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
