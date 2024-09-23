@implementation Suspend

void __lowPowerKeepAliveController_Suspend_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    v2 = *(NSObject **)(v1 + 24);
    if (v2)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v1 + 24));
      dispatch_release(v2);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
      v1 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 32) = 0;
  }
}

@end
