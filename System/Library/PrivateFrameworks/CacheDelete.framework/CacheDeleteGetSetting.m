@implementation CacheDeleteGetSetting

uint64_t __CacheDeleteGetSetting_block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __CacheDeleteGetSetting_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __CacheDeleteGetSetting_block_invoke_2;
  v4[3] = &unk_1E4A329E0;
  v2 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "clientGetState:replyBlock:", v2, v4);
}

@end
