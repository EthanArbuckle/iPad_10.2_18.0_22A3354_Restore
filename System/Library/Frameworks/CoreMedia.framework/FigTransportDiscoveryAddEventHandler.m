@implementation FigTransportDiscoveryAddEventHandler

void __FigTransportDiscoveryAddEventHandler_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 32), *(const void **)(a1 + 40));
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (_QWORD *)v2[7];
  if (v3)
  {
    do
    {
      ftd_PostEvent(*(const void **)(a1 + 32), *(int **)(a1 + 40), 1, (uint64_t)v3);
      v3 = (_QWORD *)*v3;
    }
    while (v3);
    v2 = *(_QWORD **)(a1 + 32);
  }
  CFRelease(v2);
}

@end
