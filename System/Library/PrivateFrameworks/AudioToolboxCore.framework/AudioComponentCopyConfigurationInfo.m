@implementation AudioComponentCopyConfigurationInfo

uint64_t __AudioComponentCopyConfigurationInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  const AudioComponentDescription *v4;
  uint64_t v5;
  _QWORD v7[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (const AudioComponentDescription *)(v2 + 36);
  v5 = *(unsigned int *)(v2 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = __AudioComponentCopyConfigurationInfo_block_invoke_2;
  v7[3] = &unk_1E2921CA8;
  v7[4] = a2;
  v7[5] = v3;
  return getConfigurationInfo(v4, v5, v7);
}

uint64_t __AudioComponentCopyConfigurationInfo_block_invoke_2(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(a1 + 40) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
