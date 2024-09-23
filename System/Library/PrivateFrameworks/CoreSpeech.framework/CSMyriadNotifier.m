@implementation CSMyriadNotifier

+ (void)notifyInEarMyriadTrigger
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.in.ear"), 0, 0, 1u);
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[CSMyriadNotifier notifyInEarMyriadTrigger]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Send a In-Ear Myriad notification", (uint8_t *)&v4, 0xCu);
  }
}

@end
