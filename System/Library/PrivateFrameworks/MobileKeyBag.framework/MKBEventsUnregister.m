@implementation MKBEventsUnregister

void __MKBEventsUnregister_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 20) = 0;
  _Block_release(*(const void **)(v2 + 8));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  free(*(void **)(a1 + 32));
}

@end
