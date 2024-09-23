@implementation CFLocaleResetCurrent

void ____CFLocaleResetCurrent_block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  +[NSLocale _resetCurrent](NSLocale, "_resetCurrent");
  ++__noteCount;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kCFLocaleCurrentLocaleDidChangeNotification-4"), 0, 0, 1u);
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kCFLocaleCurrentLocaleDidChangeNotification-2"), 0, 0, 1u);
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kCFLocaleCurrentLocaleDidChangeNotification"), 0, 0, 1u);
}

@end
