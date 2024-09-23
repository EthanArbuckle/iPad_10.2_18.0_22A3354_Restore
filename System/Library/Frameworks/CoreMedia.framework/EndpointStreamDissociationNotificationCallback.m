@implementation EndpointStreamDissociationNotificationCallback

void __EndpointStreamDissociationNotificationCallback_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DefaultLocalCenter;
  const __CFArray *v3;
  CFIndex FirstIndexOfValue;
  CFRange v5;

  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener(DefaultLocalCenter, *(const void **)(a1 + 32), (int)EndpointStreamDissociationNotificationCallback, CFSTR("EndpointStreamNotification_Dissociated"), *(void **)(a1 + 40));
  v3 = *(const __CFArray **)(*(_QWORD *)(a1 + 48) + 80);
  v5.length = CFArrayGetCount(v3);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v5, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 48) + 80), FirstIndexOfValue);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
