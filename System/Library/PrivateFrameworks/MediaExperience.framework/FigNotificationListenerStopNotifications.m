@implementation FigNotificationListenerStopNotifications

void __FigNotificationListenerStopNotifications_block_invoke(uint64_t a1)
{
  const void *Value;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("completionBlock"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = _Block_copy(Value);
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), CFSTR("notificationBlock"));
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), CFSTR("completionBlock"));
}

@end
