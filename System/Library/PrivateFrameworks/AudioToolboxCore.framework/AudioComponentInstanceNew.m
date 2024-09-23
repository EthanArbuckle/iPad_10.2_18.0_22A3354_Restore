@implementation AudioComponentInstanceNew

void __AudioComponentInstanceNew_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (***v3)(_QWORD);
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __AudioComponentInstanceNew_block_invoke_2;
  v4[3] = &unk_1E2921BE8;
  v2 = a1[6];
  v3 = (uint64_t (***)(_QWORD))a1[5];
  v4[5] = a1[4];
  v4[6] = v2;
  v4[4] = a2;
  instantiate(v3, 0, 0, (uint64_t)v4);
}

uint64_t __AudioComponentInstanceNew_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  **(_QWORD **)(a1 + 48) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
