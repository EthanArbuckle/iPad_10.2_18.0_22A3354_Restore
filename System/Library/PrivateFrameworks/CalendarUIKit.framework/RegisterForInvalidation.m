@implementation RegisterForInvalidation

void __RegisterForInvalidation_block_invoke()
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v1;
  __CFNotificationCenter *v2;
  __CFNotificationCenter *v3;
  __CFNotificationCenter *v4;
  CUIKTodayInvalidationTimerWrapper *v5;
  void *v6;
  id v7;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)InvalidateFormatter, (CFStringRef)*MEMORY[0x1E0D0C4C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)InvalidateFormatter, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v2, 0, (CFNotificationCallback)InvalidateFormatter, CFSTR("com.apple.mobilecal.preference.notification.weekStart"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v3, 0, (CFNotificationCallback)InvalidateFormatter, CFSTR("com.apple.mobilecal.preference.notification.overlayCalendarID"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)InvalidateFormatter, CFSTR("com.apple.mobilecal.preference.notification.OverrideLocaleWeekends"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CUIKCalendarWithoutRegisteringForInvalidation();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CUIKTodayInvalidationTimerWrapper initWithCalendar:]([CUIKTodayInvalidationTimerWrapper alloc], "initWithCalendar:", v7);
  v6 = (void *)__todayInvalidationTimerWrapper;
  __todayInvalidationTimerWrapper = (uint64_t)v5;

}

@end
