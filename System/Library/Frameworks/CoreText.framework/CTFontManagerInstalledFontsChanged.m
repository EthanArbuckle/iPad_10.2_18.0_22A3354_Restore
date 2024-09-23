@implementation CTFontManagerInstalledFontsChanged

void __CTFontManagerInstalledFontsChanged_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("CTFontManagerFontChangedNotification"), 0, *(CFDictionaryRef *)(a1 + 32), 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
