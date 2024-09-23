@implementation FigTransportDiscoveryRemoveEventHandler

void __FigTransportDiscoveryRemoveEventHandler_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex FirstIndexOfValue;
  CFIndex v4;
  CFRange v5;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 32);
  v5.length = CFArrayGetCount(v2);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v5, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
  {
    v4 = FirstIndexOfValue;
    ftd_FreeHandler(*(void **)(a1 + 40));
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 32), v4);
  }
}

@end
