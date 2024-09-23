@implementation MTPlayerPlay

void __MTPlayerPlay_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v1 + 24);
  v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __MTPlayerPlay_block_invoke_2;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = v1;
  dispatch_group_async(v2, v3, block);
}

void __MTPlayerPlay_block_invoke_2(uint64_t a1)
{
  mt_PlayerPlaybackTimerHandler(*(_QWORD *)(a1 + 32));
}

@end
