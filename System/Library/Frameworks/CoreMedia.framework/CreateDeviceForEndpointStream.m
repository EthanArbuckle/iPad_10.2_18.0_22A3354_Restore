@implementation CreateDeviceForEndpointStream

void __brokeredPlugin_CreateDeviceForEndpointStream_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DefaultLocalCenter;

  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 40));
  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener(DefaultLocalCenter, *(const void **)(a1 + 48), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))brokeredPlugin_DeviceUnpluggedNotificationCallback, CFSTR("FigHALAudioDeviceUnplugged"), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __CreateDeviceForEndpointStream_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DefaultLocalCenter;

  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 24), *(const void **)(a1 + 40));
  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener(DefaultLocalCenter, *(const void **)(a1 + 48), (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))DeviceUnpluggedNotificationCallback, CFSTR("FigHALAudioDeviceUnplugged"), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
