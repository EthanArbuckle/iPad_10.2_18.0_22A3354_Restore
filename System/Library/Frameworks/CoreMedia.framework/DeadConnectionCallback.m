@implementation DeadConnectionCallback

void __remoteXPCEndpointManagerClient_DeadConnectionCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  FigEndpointRPCCacheRemoveAllEndpoints(*(_QWORD *)(v2 + 32));
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v2 + 24));
  v3 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;
}

@end
