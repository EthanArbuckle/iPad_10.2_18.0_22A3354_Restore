@implementation CALNLegacyIdentifierUtils

+ (void)setLegacyIdentifier:(id)a3 onNotificationContent:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInt:", 393216);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUserInfoValue:forKey:", v9, CFSTR("BLTWatchLegacyMap"));
}

+ (void)setLegacyIdentifierForCalendarNotification:(id)a3 onNotificationContent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a4;
  objc_msgSend(a3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setLegacyIdentifier:onNotificationContent:", v9, v6);

  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:onNotificationContent:].cold.1(v10);

  }
}

+ (void)setLegacyIdentifierForCalendarNotification:(os_log_t)log onNotificationContent:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Cannot set legacy identifier for calendar notification with no URL.", v1, 2u);
}

@end
