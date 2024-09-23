@implementation EndpointStreamsChangedNotificationCallback

void __EndpointStreamsChangedNotificationCallback_block_invoke(uint64_t a1)
{
  PeruseAudioStreamsForEndpoint(*(const void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
