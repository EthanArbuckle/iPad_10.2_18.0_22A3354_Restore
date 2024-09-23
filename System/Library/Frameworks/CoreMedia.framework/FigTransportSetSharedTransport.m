@implementation FigTransportSetSharedTransport

dispatch_queue_t __FigTransportSetSharedTransport_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.coremedia.transport.init", 0);
  sTransportQueue = (uint64_t)result;
  sTransportUsageCount = 0;
  sTransport = 0;
  return result;
}

void __FigTransportSetSharedTransport_block_invoke_2(uint64_t a1)
{
  const void *v1;
  const void *v2;

  v1 = (const void *)sTransport;
  v2 = *(const void **)(a1 + 32);
  sTransport = (uint64_t)v2;
  if (v2)
    CFRetain(v2);
  if (v1)
    CFRelease(v1);
}

@end
