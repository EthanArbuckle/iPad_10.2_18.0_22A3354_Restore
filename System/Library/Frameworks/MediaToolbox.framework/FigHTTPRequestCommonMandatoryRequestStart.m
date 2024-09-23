@implementation FigHTTPRequestCommonMandatoryRequestStart

void __FigHTTPRequestCommonMandatoryRequestStart_block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  dispatch_time_t v4;

  v2 = ++gActiveMandatoryConnectionCount;
  ++gMandatoryConnectionCount;
  if (gMandatoryConnectionCountAtIdle)
  {
    v3 = gMandatoryActivityIdleTimer;
    v4 = dispatch_time(0, 0x7FFFFFFFFFFFFFFFLL);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    gMandatoryConnectionCountAtIdle = 0;
    v2 = gActiveMandatoryConnectionCount;
  }
  if (v2 == 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

@end
