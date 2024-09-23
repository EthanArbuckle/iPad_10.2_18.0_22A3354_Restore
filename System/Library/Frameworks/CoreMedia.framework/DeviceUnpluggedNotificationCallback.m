@implementation DeviceUnpluggedNotificationCallback

void __brokeredPlugin_DeviceUnpluggedNotificationCallback_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DefaultLocalCenter;
  const __CFArray *v3;
  CFIndex FirstIndexOfValue;
  CFRange v5;

  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener(DefaultLocalCenter, *(const void **)(a1 + 32), (int)brokeredPlugin_DeviceUnpluggedNotificationCallback, CFSTR("FigHALAudioDeviceUnplugged"), *(void **)(a1 + 40));
  v3 = *(const __CFArray **)(*(_QWORD *)(a1 + 48) + 40);
  v5.length = CFArrayGetCount(v3);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v5, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 48) + 40), FirstIndexOfValue);
}

void __DeviceUnpluggedNotificationCallback_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DefaultLocalCenter;
  const __CFArray *v3;
  CFIndex FirstIndexOfValue;
  CFRange v5;

  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener(DefaultLocalCenter, *(const void **)(a1 + 32), (int)DeviceUnpluggedNotificationCallback, CFSTR("FigHALAudioDeviceUnplugged"), *(void **)(a1 + 40));
  v3 = *(const __CFArray **)(*(_QWORD *)(a1 + 48) + 24);
  v5.length = CFArrayGetCount(v3);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v5, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 48) + 24), FirstIndexOfValue);
}

@end
