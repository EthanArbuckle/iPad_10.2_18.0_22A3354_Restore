@implementation CNMobileKeyBag

+ (BOOL)isDevicePasscodeProtected
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)softLinkMGCopyAnswer((uint64_t)CFSTR("yNesiJuidlesNpI/K5Ri4A"), 0);
  v3 = v2;
  v4 = (const void *)*MEMORY[0x1E0C9AE50];
  if (v2)
    CFRelease(v2);
  return v3 == v4;
}

+ (BOOL)isDeviceUnlockedSinceBoot
{
  return softLinkMKBDeviceUnlockedSinceBoot() != 0;
}

+ (const)firstUnlockNotificationID
{
  return "com.apple.mobile.keybagd.first_unlock";
}

@end
