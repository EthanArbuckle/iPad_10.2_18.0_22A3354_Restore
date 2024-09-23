@implementation CTUtilities

+ (BOOL)isClassCLocked
{
  BOOL v2;
  const void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (MKBDeviceUnlockedSinceBoot())
    return 0;
  v3 = (const void *)MGCopyAnswer();
  v2 = v3 == (const void *)*MEMORY[0x24BDBD270];
  if (v3)
  {
    CFRelease(v3);
  }
  else
  {
    +[CTLogging contextKitHandle](CTLogging, "contextKitHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_209572000, v4, OS_LOG_TYPE_INFO, "No response from MobileGestalt.", v6, 2u);
    }

  }
  return v2;
}

@end
