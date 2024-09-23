@implementation FigHTTPRequestCommonMandatoryRequestFinish

void __FigHTTPRequestCommonMandatoryRequestFinish_block_invoke()
{
  NSObject *v0;
  dispatch_time_t v1;

  if (!--gActiveMandatoryConnectionCount)
  {
    gMandatoryConnectionCountAtIdle = gMandatoryConnectionCount;
    v0 = gMandatoryActivityIdleTimer;
    v1 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(v0, v1, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

@end
