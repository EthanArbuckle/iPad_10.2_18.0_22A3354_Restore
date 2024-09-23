@implementation ActivatedEndpointsChangedNotificationCallback

uint64_t __ActivatedEndpointsChangedNotificationCallback_block_invoke(uint64_t a1)
{
  return PeruseActivatedEndpoints(*(const void **)(a1 + 32));
}

void __endpointCentricPlugin_ActivatedEndpointsChangedNotificationCallback_block_invoke(uint64_t a1)
{
  endpointCentricPlugin_PeruseActivatedEndpoints(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
