@implementation HPSiriController

+ (BOOL)isSiriEnabled
{
  id v2;
  void *v3;
  unsigned __int8 v4;

  v2 = -[objc_class sharedPreferences](off_1000B7950(), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  return v4;
}

+ (BOOL)isHeySiriEnabled
{
  CFTypeID TypeID;
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  int v9;

  v9 = 0;
  TypeID = CFStringGetTypeID();

  v3 = -[objc_class sharedPreferences](off_1000B7958(), "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[objc_class sharedPreferences](off_1000B7950(), "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = 0;
  if (objc_msgSend(v6, "assistantIsEnabled"))
    v7 = objc_msgSend(v4, "voiceTriggerEnabled");

  return v7;
}

+ (BOOL)isSiriAllowedWhileLocked
{
  id v2;
  void *v3;
  char v4;

  v2 = -[objc_class sharedPreferences](off_1000B7950(), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "disableAssistantWhilePasscodeLocked") ^ 1;

  return v4;
}

+ (BOOL)isCurrentLocaleSupported
{
  id v2;
  void *v3;
  unsigned __int8 v4;

  v2 = -[objc_class sharedPreferences](off_1000B7950(), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "isCurrentLocaleNativelySupported");

  return v4;
}

+ (BOOL)hasUserSeenAnnounceMessagesOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted](SFDefaults, "siriNotificationsPrompted") == (id)3;
}

+ (void)setHasUserSeenAnnounceMessagesOptOutScreen:(BOOL)a3
{
  if (a3)
    +[SFDefaults setSiriNotificationsPrompted:](SFDefaults, "setSiriNotificationsPrompted:", 3);
}

+ (BOOL)hasUserSeenAnnounceCallsOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted](SFDefaults, "siriNotificationsPrompted") == (id)4;
}

+ (void)setHasUserSeenAnnounceCallsOptOutScreen:(BOOL)a3
{
  if (a3)
    +[SFDefaults setSiriNotificationsPrompted:](SFDefaults, "setSiriNotificationsPrompted:", 4);
}

+ (BOOL)isAnnounceMessagesEnabled
{
  id v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = -[objc_class currentNotificationSettingsCenter](off_1000B7960(), "currentNotificationSettingsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationSystemSettings"));
  v5 = objc_msgSend(v4, "announcementSetting") == (id)2;

  return v5;
}

+ (void)setAnnounceMessagesEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a3;
  v4 = -[objc_class currentNotificationSettingsCenter](off_1000B7960(), "currentNotificationSettingsCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notificationSystemSettings"));
  v6 = v5;
  if (v3)
    v7 = 2;
  else
    v7 = 1;
  if (objc_msgSend(v5, "announcementSetting") != (id)v7)
  {
    v8 = objc_alloc_init(off_1000B7968());
    objc_msgSend(v8, "setAnnouncementSetting:", v7);
    objc_msgSend(v8, "setShowPreviewsSetting:", objc_msgSend(v6, "showPreviewsSetting"));
    objc_msgSend(v9, "setNotificationSystemSettings:", v8);

  }
}

+ (BOOL)isAnnounceMessagesSupported
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = -[objc_class currentNotificationSettingsCenter](off_1000B7960(), "currentNotificationSettingsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationSystemSettings"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "announcementSetting") != 0;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)isAnnounceEnabledForHeadphones
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = -[objc_class currentNotificationSettingsCenter](off_1000B7960(), "currentNotificationSettingsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationSystemSettings"));
  v5 = objc_msgSend(v4, "announcementHeadphonesSetting");

  return v5 == (id)2;
}

+ (BOOL)isAnnounceSupported
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = -[objc_class currentNotificationSettingsCenter](off_1000B7960(), "currentNotificationSettingsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationSystemSettings"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "announcementSetting") != 0;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)hasUserSeenAnnounceNotificationsOptOutScreen
{
  return +[SFDefaults hasSeenAnnounceNotifications](SFDefaults, "hasSeenAnnounceNotifications");
}

+ (void)setHasUserSeenAnnounceNotificationsOptOutScreen:(BOOL)a3
{
  +[SFDefaults setHasSeenAnnounceNotifications:](SFDefaults, "setHasSeenAnnounceNotifications:", a3);
}

+ (int64_t)announceCallsState
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_alloc_init(off_1000B7970());
  v3 = objc_msgSend(v2, "announceCalls");
  if ((unint64_t)v3 >= 4)
  {
    v4 = sub_1000069C0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100084918((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    v3 = 0;
  }

  return (int64_t)v3;
}

+ (void)setAnnounceCallsState:(int64_t)a3
{
  id v4;
  int64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;

  v4 = objc_alloc_init(off_1000B7970());
  v5 = a3;
  if ((unint64_t)a3 >= 4)
  {
    v6 = sub_1000069C0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100084980(a3, v7, v8, v9, v10, v11, v12, v13);

    v5 = 0;
  }
  objc_msgSend(v4, "setAnnounceCalls:", v5);
  v14 = sub_1000069C0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3)
      v16 = CFSTR("?");
    else
      v16 = *(&off_1000A5760 + a3);
    v17 = 138412290;
    v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Set Announce Calls state to %@\n", (uint8_t *)&v17, 0xCu);
  }

}

+ (BOOL)shouldPromptForAnnounceMessagesForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  id v9;
  int v10;
  unsigned int v12;
  unsigned int v13;
  id v14;
  const __CFString *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  _BOOL4 v23;

  v4 = a4;
  if (objc_msgSend((id)objc_opt_class(a1), "productHasW1Chip:", *(_QWORD *)&a3))
  {
    v6 = sub_1000069C0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v8 = "Announce Messages not needed because it's a W1 product\n";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v4
    && ((objc_msgSend(a1, "hasUserSeenAnnounceMessagesOptOutScreen") & 1) != 0
     || objc_msgSend(a1, "hasUserSeenAnnounceCallsOptOutScreen")))
  {
    v9 = sub_1000069C0();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v8 = "Already prompted device for announce messages";
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(v10) = 0;
    goto LABEL_11;
  }
  v12 = objc_msgSend(a1, "isSiriAllowedWhileLocked");
  if (objc_msgSend(a1, "isAnnounceMessagesSupported"))
    v13 = objc_msgSend(a1, "isAnnounceMessagesEnabled") ^ 1;
  else
    v13 = 0;
  if (v4)
    v10 = v12 & v13;
  else
    v10 = v13;
  v14 = sub_1000069C0();
  v7 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    v16 = 138413058;
    if (v10)
      v15 = CFSTR("YES");
    v17 = v15;
    v18 = 1024;
    v19 = v12;
    v20 = 1024;
    v21 = v13;
    v22 = 1024;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Needs announce messages? %@ (isSiriAllowedWhileLocked=%d announceSettingDisabled=%d isUpsellFlow=%d)", (uint8_t *)&v16, 0x1Eu);
  }
LABEL_11:

  return v10;
}

+ (BOOL)shouldPromptForAnnounceCallsForProductID:(unsigned int)a3 supportsInEarDetection:(BOOL)a4 isUpsellFlow:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  id v12;
  _BOOL4 v13;
  unsigned int v15;
  id v16;
  unsigned int v17;
  id v18;
  const __CFString *v19;
  const __CFString *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  const __CFString *v26;

  v5 = a5;
  if (objc_msgSend((id)objc_opt_class(a1), "productHasW1Chip:", *(_QWORD *)&a3))
  {
    v8 = sub_1000069C0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v10 = "Announce Calls not needed because it's a W1 product\n";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v21, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!a4)
  {
    v12 = sub_1000069C0();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v10 = "Announce Calls not needed because devices does not support IED\n";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v5 && objc_msgSend(a1, "hasUserSeenAnnounceCallsOptOutScreen"))
  {
    v11 = sub_1000069C0();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v10 = "Already prompted device for announce calls";
      goto LABEL_11;
    }
LABEL_12:
    LOBYTE(v13) = 0;
    goto LABEL_13;
  }
  v15 = objc_msgSend(a1, "isSiriAllowedWhileLocked");
  v16 = objc_msgSend(a1, "announceCallsState");
  if (v16)
    v17 = 0;
  else
    v17 = v15;
  if (v5)
    v13 = v17;
  else
    v13 = v16 == 0;
  v18 = sub_1000069C0();
  v9 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    if (v13)
      v19 = CFSTR("YES");
    if ((unint64_t)v16 > 3)
      v20 = CFSTR("?");
    else
      v20 = *(&off_1000A5760 + (_QWORD)v16);
    v21 = 138412802;
    v22 = v19;
    v23 = 1024;
    v24 = v15;
    v25 = 2112;
    v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Needs announce calls? %@ (isSiriAllowedWhileLocked=%d announceCallState=%@)", (uint8_t *)&v21, 0x1Cu);
  }
LABEL_13:

  return v13;
}

+ (BOOL)shouldPromptForAnnounceNotificationsForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  id v9;
  _BOOL4 v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  _BOOL4 v23;

  v4 = a4;
  if (objc_msgSend((id)objc_opt_class(a1), "productHasW1Chip:", *(_QWORD *)&a3))
  {
    v6 = sub_1000069C0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v8 = "Announce Notifications not needed because it's a W1 product\n";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v4 && objc_msgSend(a1, "hasUserSeenAnnounceNotificationsOptOutScreen"))
  {
    v9 = sub_1000069C0();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v8 = "Already prompted device for Announce Notifications";
      goto LABEL_8;
    }
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_20;
  }
  v11 = objc_msgSend(a1, "isSiriAllowedWhileLocked");
  if (objc_msgSend(a1, "isAnnounceSupported"))
    v12 = objc_msgSend(a1, "isAnnounceEnabledForHeadphones") ^ 1;
  else
    v12 = 0;
  if (v4)
    v10 = v11;
  else
    v10 = v12;
  v13 = sub_1000069C0();
  v7 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    v16 = 138413058;
    if (v10)
      v14 = CFSTR("YES");
    v17 = v14;
    v18 = 1024;
    v19 = v11;
    v20 = 1024;
    v21 = v12;
    v22 = 1024;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Needs Announce Notifications? %@ (isSiriAllowedWhileLocked=%d announceSettingDisabled=%d isUpsellFlow=%d)", (uint8_t *)&v16, 0x1Eu);
  }
LABEL_20:

  return v10;
}

+ (BOOL)productHasW1Chip:(unsigned int)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", *(_QWORD *)&a3);
  v4 = objc_msgSend(v3, "hasW1Chip");

  return v4;
}

@end
