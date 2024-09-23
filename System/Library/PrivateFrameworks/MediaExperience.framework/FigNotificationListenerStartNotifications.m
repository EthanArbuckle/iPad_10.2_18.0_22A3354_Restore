@implementation FigNotificationListenerStartNotifications

void __FigNotificationListenerStartNotifications_block_invoke(uint64_t a1)
{
  const void *v2;

  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), CFSTR("notificationBlock"), *(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), CFSTR("completionBlock"), v2);
}

@end
