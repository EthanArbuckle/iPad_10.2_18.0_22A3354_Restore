@implementation FABroadcaster

+ (void)broadcastFamilyChangedNotification
{
  objc_msgSend(a1, "_broadcastNotificationName:userInfo:", CFSTR("com.apple.family.family_updated"), 0);
}

+ (void)broadcastFamilyMarqueeChangedNotification
{
  objc_msgSend(a1, "_broadcastNotificationName:userInfo:", CFSTR("com.apple.family.family_marquee_updated"), 0);
}

+ (void)broadcastServicesChangedNotification
{
  objc_msgSend(a1, "_broadcastNotificationName:userInfo:", CFSTR("com.apple.family.services_updated"), 0);
}

+ (void)broadcastRemoteUIWillDismissNotification:(id)a3
{
  objc_msgSend(a1, "_broadcastNotificationName:userInfo:", CFSTR("com.apple.family.remoteui_will_dismiss"), a3);
}

+ (void)_broadcastNotificationName:(id)a3 userInfo:(id)a4
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "+[FABroadcaster _broadcastNotificationName:userInfo:]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1CAEBA000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, v6, 0, 1u);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v5, 0, v6);

}

@end
