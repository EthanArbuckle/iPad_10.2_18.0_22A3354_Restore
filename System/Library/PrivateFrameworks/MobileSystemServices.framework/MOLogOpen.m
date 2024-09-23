@implementation MOLogOpen

void __MOLogOpen_block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[5];

  v2 = *(NSObject ***)(a1 + 32);
  v3 = *v2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___MOLogLoadPreferences_block_invoke;
  block[3] = &__block_descriptor_tmp_25;
  block[4] = v2;
  dispatch_sync(v3, block);
  MOLogWrite(*(_QWORD *)(a1 + 32), 5, 0, CFSTR("%s: set log level to %s"), v4, v5, v6, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

@end
