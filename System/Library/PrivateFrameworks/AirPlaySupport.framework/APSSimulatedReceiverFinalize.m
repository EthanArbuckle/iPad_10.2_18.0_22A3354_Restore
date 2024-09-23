@implementation APSSimulatedReceiverFinalize

void ___APSSimulatedReceiverFinalize_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 100) = 0;
  *(_DWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  v3 = *(const void **)(v2 + 16);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(v2 + 64));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 64);
  if (v5)
  {
    dispatch_release(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(NSObject **)(v4 + 72);
  if (v6)
  {
    dispatch_release(v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  }
}

@end
