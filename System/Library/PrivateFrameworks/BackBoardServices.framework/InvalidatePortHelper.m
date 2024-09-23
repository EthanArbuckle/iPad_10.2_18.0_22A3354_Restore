@implementation InvalidatePortHelper

void ___lock_InvalidatePortHelper_block_invoke(uint64_t a1)
{
  const char *v1;
  const __CFString *v2;
  __CFNotificationCenter *LocalCenter;

  v1 = *(const char **)(a1 + 32);
  if (v1)
  {
    if (!strcmp("com.apple.backboard.hid.services", v1))
    {
      v2 = CFSTR("kBKSHIDServerDiedNotification");
    }
    else
    {
      if (strcmp("com.apple.backboard.display.services", v1))
        return;
      v2 = CFSTR("kBKSDisplayServerDiedNotification");
    }
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, v2, 0, 0, 1u);
  }
}

@end
