@implementation FigRouteDiscoveryManagerStart

void __FigRouteDiscoveryManagerStart_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)v2 = 1;
  v3 = *(const __CFArray **)(v2 + 264);
  if (v3)
  {
    Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 264), i);
        discoveryManager_registerEndpointManager(ValueAtIndex);
      }
    }
  }
  v8 = *(const void **)(*(_QWORD *)(a1 + 32) + 264);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = 0;
  }
}

@end
