@implementation UNNotificationSettings

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings alertSetting](self, "alertSetting"), CFSTR("alertSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings alertStyle](self, "alertStyle"), CFSTR("alertStyle"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings authorizationStatus](self, "authorizationStatus"), CFSTR("authorizationStatus"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings badgeSetting](self, "badgeSetting"), CFSTR("badgeSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings carPlaySetting](self, "carPlaySetting"), CFSTR("carPlaySetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), CFSTR("remoteNotificationsSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings announcementSetting](self, "announcementSetting"), CFSTR("announcementSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting"), CFSTR("criticalAlertSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings timeSensitiveSetting](self, "timeSensitiveSetting"), CFSTR("timeSensitiveSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting"), CFSTR("lockScreenSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting"), CFSTR("notificationCenterSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings soundSetting](self, "soundSetting"), CFSTR("soundSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings showPreviewsSetting](self, "showPreviewsSetting"), CFSTR("showPreviewsSetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings groupingSetting](self, "groupingSetting"), CFSTR("groupingSetting"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSettings providesAppNotificationSettings](self, "providesAppNotificationSettings"), CFSTR("providesAppNotificationSettings"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), CFSTR("scheduledDeliverySetting"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings directMessagesSetting](self, "directMessagesSetting"), CFSTR("directMessagesSetting"));

}

- (UNAuthorizationStatus)authorizationStatus
{
  return self->_authorizationStatus;
}

- (UNNotificationSetting)badgeSetting
{
  return self->_badgeSetting;
}

- (UNAlertStyle)alertStyle
{
  return self->_alertStyle;
}

- (UNNotificationSetting)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (UNNotificationSetting)soundSetting
{
  return self->_soundSetting;
}

- (UNNotificationSetting)lockScreenSetting
{
  return self->_lockScreenSetting;
}

- (UNNotificationSetting)notificationCenterSetting
{
  return self->_notificationCenterSetting;
}

- (UNNotificationSetting)alertSetting
{
  return self->_alertSetting;
}

- (UNNotificationSetting)carPlaySetting
{
  return self->_carPlaySetting;
}

- (UNNotificationSetting)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (UNNotificationSetting)directMessagesSetting
{
  return self->_directMessagesSetting;
}

- (UNNotificationSetting)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (UNShowPreviewsSetting)showPreviewsSetting
{
  return self->_showPreviewsSetting;
}

- (BOOL)providesAppNotificationSettings
{
  return self->_providesAppNotificationSettings;
}

- (int64_t)groupingSetting
{
  return self->_groupingSetting;
}

- (UNNotificationSetting)announcementSetting
{
  return self->_announcementSetting;
}

- (UNNotificationSettings)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v22 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("authorizationStatus"));
  v21 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("soundSetting"));
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("badgeSetting"));
  v19 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("alertSetting"));
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("criticalAlertSetting"));
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("timeSensitiveSetting"));
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("notificationCenterSetting"));
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("lockScreenSetting"));
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("carPlaySetting"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("remoteNotificationsSetting"));
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("announcementSetting"));
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("scheduledDeliverySetting"));
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("directMessagesSetting"));
  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("alertStyle"));
  v10 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("showPreviewsSetting"));
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("groupingSetting"));
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("providesAppNotificationSettings"));

  LOBYTE(v14) = v12;
  return -[UNNotificationSettings initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:](self, "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", v22, v21, v20, v19, v17, v15, v4, v5, v6, v18, v16, v7, v8, v9, v10,
           v11,
           v14);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 scheduledDeliverySetting:(int64_t)a13 directMessagesSetting:(int64_t)a14 alertStyle:(int64_t)a15 showPreviewsSetting:(int64_t)a16 groupingSetting:(int64_t)a17 providesAppNotificationSettings:(BOOL)a18
{
  uint64_t v19;

  LOBYTE(v19) = a18;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, 0, a10, a11, a12, a13, a14, a15,
                                     a16,
                                     a17,
                                     v19);
}

- (id)description
{
  UNAuthorizationStatus v3;
  UNNotificationSetting v4;
  UNNotificationSetting v5;
  UNNotificationSetting v6;
  UNNotificationSetting v7;
  UNNotificationSetting v8;
  unint64_t v9;
  UNNotificationSetting v10;
  UNNotificationSetting v11;
  __CFString *v12;
  UNNotificationSetting v13;
  __CFString *v14;
  UNNotificationSetting v15;
  __CFString *v16;
  UNNotificationSetting v17;
  __CFString *v18;
  UNNotificationSetting v19;
  __CFString *v20;
  UNShowPreviewsSetting v21;
  __CFString *v22;
  UNAlertStyle v23;
  __CFString *v24;
  unint64_t v25;
  __CFString *v26;
  _BOOL4 v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  void *v41;

  v41 = (void *)MEMORY[0x1E0CB3940];
  v40 = objc_opt_class();
  v3 = -[UNNotificationSettings authorizationStatus](self, "authorizationStatus");
  if ((unint64_t)v3 > UNAuthorizationStatusEphemeral)
    v39 = 0;
  else
    v39 = off_1E57EF9E8[v3];
  v4 = -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting");
  if ((unint64_t)v4 > UNNotificationSettingEnabled)
    v38 = 0;
  else
    v38 = off_1E57EFA10[v4];
  v5 = -[UNNotificationSettings soundSetting](self, "soundSetting");
  if ((unint64_t)v5 > UNNotificationSettingEnabled)
    v37 = 0;
  else
    v37 = off_1E57EFA10[v5];
  v6 = -[UNNotificationSettings badgeSetting](self, "badgeSetting");
  if ((unint64_t)v6 > UNNotificationSettingEnabled)
    v36 = 0;
  else
    v36 = off_1E57EFA10[v6];
  v7 = -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting");
  if ((unint64_t)v7 > UNNotificationSettingEnabled)
    v35 = 0;
  else
    v35 = off_1E57EFA10[v7];
  v8 = -[UNNotificationSettings carPlaySetting](self, "carPlaySetting");
  if ((unint64_t)v8 > UNNotificationSettingEnabled)
    v34 = 0;
  else
    v34 = off_1E57EFA10[v8];
  v9 = -[UNNotificationSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
  if (v9 > 2)
    v33 = 0;
  else
    v33 = off_1E57EFA10[v9];
  v10 = -[UNNotificationSettings announcementSetting](self, "announcementSetting");
  if ((unint64_t)v10 > UNNotificationSettingEnabled)
    v32 = 0;
  else
    v32 = off_1E57EFA10[v10];
  v11 = -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting");
  if ((unint64_t)v11 > UNNotificationSettingEnabled)
    v12 = 0;
  else
    v12 = off_1E57EFA10[v11];
  v13 = -[UNNotificationSettings timeSensitiveSetting](self, "timeSensitiveSetting");
  if ((unint64_t)v13 > UNNotificationSettingEnabled)
    v14 = 0;
  else
    v14 = off_1E57EFA10[v13];
  v15 = -[UNNotificationSettings alertSetting](self, "alertSetting");
  if ((unint64_t)v15 > UNNotificationSettingEnabled)
    v16 = 0;
  else
    v16 = off_1E57EFA10[v15];
  v17 = -[UNNotificationSettings scheduledDeliverySetting](self, "scheduledDeliverySetting");
  if ((unint64_t)v17 > UNNotificationSettingEnabled)
    v18 = 0;
  else
    v18 = off_1E57EFA10[v17];
  v19 = -[UNNotificationSettings directMessagesSetting](self, "directMessagesSetting");
  if ((unint64_t)v19 > UNNotificationSettingEnabled)
    v20 = 0;
  else
    v20 = off_1E57EFA10[v19];
  v21 = -[UNNotificationSettings showPreviewsSetting](self, "showPreviewsSetting");
  if ((unint64_t)v21 > UNShowPreviewsSettingNever)
    v22 = 0;
  else
    v22 = off_1E57EFA28[v21];
  v23 = -[UNNotificationSettings alertStyle](self, "alertStyle");
  if ((unint64_t)v23 > UNAlertStyleAlert)
    v24 = 0;
  else
    v24 = off_1E57EFA40[v23];
  v25 = -[UNNotificationSettings groupingSetting](self, "groupingSetting");
  if (v25 > 2)
    v26 = 0;
  else
    v26 = off_1E57EFA58[v25];
  v27 = -[UNNotificationSettings providesAppNotificationSettings](self, "providesAppNotificationSettings");
  v28 = CFSTR("No");
  if (v27)
    v28 = CFSTR("Yes");
  v29 = v28;
  objc_msgSend(v41, "stringWithFormat:", CFSTR("<%@: %p; authorizationStatus: %@, notificationCenterSetting: %@, soundSetting: %@, badgeSetting: %@, lockScreenSetting: %@, carPlaySetting: %@, remoteNotifications: %@, announcementSetting: %@, criticalAlertSetting: %@, timeSensitiveSetting: %@, alertSetting: %@, scheduledDeliverySetting: %@, directMessagesSetting: %@, showsPreviewsSetting: %@, alertStyle: %@, groupingSetting: %@ providesAppNotificationSettings: %@>"),
    v40,
    self,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v32,
    v12,
    v14,
    v16,
    v18,
    v20,
    v22,
    v24,
    v26,
    v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)hasEnabledSettings
{
  return -[UNNotificationSettings hasEnabledAlertSettings](self, "hasEnabledAlertSettings")
      || -[UNNotificationSettings soundSetting](self, "soundSetting") == UNNotificationSettingEnabled
      || -[UNNotificationSettings badgeSetting](self, "badgeSetting") == UNNotificationSettingEnabled
      || -[UNNotificationSettings announcementSetting](self, "announcementSetting") == UNNotificationSettingEnabled;
}

- (BOOL)hasEnabledAlertSettings
{
  return -[UNNotificationSettings alertSetting](self, "alertSetting") == UNNotificationSettingEnabled
      && -[UNNotificationSettings alertStyle](self, "alertStyle")
      || -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting") == UNNotificationSettingEnabled
      || -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting") == UNNotificationSettingEnabled
      || -[UNNotificationSettings carPlaySetting](self, "carPlaySetting") == UNNotificationSettingEnabled
      || -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting") == UNNotificationSettingEnabled;
}

+ (id)emptySettings
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           0,
                                           0,
                                           0,
                                           v3));
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 spokenSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 alertStyle:(int64_t)a12 showPreviewsSetting:(int64_t)a13 providesAppNotificationSettings:(BOOL)a14
{
  uint64_t v15;

  LOBYTE(v15) = a14;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0, 0, a12, a13,
                                     0,
                                     v15);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 alertStyle:(int64_t)a12 showPreviewsSetting:(int64_t)a13 groupingSetting:(int64_t)a14 providesAppNotificationSettings:(BOOL)a15
{
  uint64_t v16;

  LOBYTE(v16) = a15;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0, 0, a12, a13,
                                     a14,
                                     v16);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 alertStyle:(int64_t)a13 showPreviewsSetting:(int64_t)a14 groupingSetting:(int64_t)a15 providesAppNotificationSettings:(BOOL)a16
{
  uint64_t v17;

  LOBYTE(v17) = a16;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0, a13, a14,
                                     a15,
                                     v17);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 scheduledDeliverySetting:(int64_t)a13 alertStyle:(int64_t)a14 showPreviewsSetting:(int64_t)a15 groupingSetting:(int64_t)a16 providesAppNotificationSettings:(BOOL)a17
{
  uint64_t v18;

  LOBYTE(v18) = a17;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, a14, a15,
                                     a16,
                                     v18);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 alertStyle:(int64_t)a16 showPreviewsSetting:(int64_t)a17 groupingSetting:(int64_t)a18 providesAppNotificationSettings:(BOOL)a19
{
  uint64_t v20;

  LOBYTE(v20) = a19;
  return (UNNotificationSettings *)objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13,
                                                                     a14,
                                                                     a15,
                                                                     a16,
                                                                     a17,
                                                                     a18,
                                                                     v20));
}

- (UNNotificationSettings)initWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 alertStyle:(int64_t)a16 showPreviewsSetting:(int64_t)a17 groupingSetting:(int64_t)a18 providesAppNotificationSettings:(BOOL)a19
{
  UNNotificationSettings *result;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)UNNotificationSettings;
  result = -[UNNotificationSettings init](&v26, sel_init);
  if (result)
  {
    result->_authorizationStatus = a3;
    result->_soundSetting = a4;
    result->_badgeSetting = a5;
    result->_alertSetting = a6;
    result->_notificationCenterSetting = a7;
    result->_lockScreenSetting = a8;
    result->_carPlaySetting = a9;
    result->_remoteNotificationsSetting = a10;
    result->_showPreviewsSetting = a17;
    result->_criticalAlertSetting = a12;
    result->_timeSensitiveSetting = a13;
    result->_scheduledDeliverySetting = a14;
    result->_directMessagesSetting = a15;
    result->_alertStyle = a16;
    result->_announcementSetting = a11;
    result->_groupingSetting = a18;
    result->_providesAppNotificationSettings = a19;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings alertSetting](self, "alertSetting"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v35, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings alertStyle](self, "alertStyle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v34, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings authorizationStatus](self, "authorizationStatus"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v33, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings badgeSetting](self, "badgeSetting"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v32, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings carPlaySetting](self, "carPlaySetting"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v31, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v30, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings announcementSetting](self, "announcementSetting"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v28, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v27, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings soundSetting](self, "soundSetting"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings groupingSetting](self, "groupingSetting"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UNNotificationSettings directMessagesSetting](self, "directMessagesSetting"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UNNotificationSettings providesAppNotificationSettings](self, "providesAppNotificationSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v15 ^ v23 ^ objc_msgSend(v24, "hash");

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UNNotificationSetting v5;
  UNAlertStyle v6;
  UNAuthorizationStatus v7;
  UNNotificationSetting v8;
  UNNotificationSetting v9;
  int64_t v10;
  UNNotificationSetting v11;
  UNNotificationSetting v12;
  UNNotificationSetting v13;
  UNNotificationSetting v14;
  int64_t v15;
  int v16;
  UNNotificationSetting v17;
  UNNotificationSetting v18;
  UNNotificationSetting v19;
  UNNotificationSetting v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  v5 = -[UNNotificationSettings alertSetting](self, "alertSetting");
  if (v5 != objc_msgSend(v4, "alertSetting"))
    goto LABEL_18;
  v6 = -[UNNotificationSettings alertStyle](self, "alertStyle");
  if (v6 != objc_msgSend(v4, "alertStyle"))
    goto LABEL_18;
  v7 = -[UNNotificationSettings authorizationStatus](self, "authorizationStatus");
  if (v7 != objc_msgSend(v4, "authorizationStatus"))
    goto LABEL_18;
  v8 = -[UNNotificationSettings badgeSetting](self, "badgeSetting");
  if (v8 != objc_msgSend(v4, "badgeSetting"))
    goto LABEL_18;
  v9 = -[UNNotificationSettings carPlaySetting](self, "carPlaySetting");
  if (v9 != objc_msgSend(v4, "carPlaySetting"))
    goto LABEL_18;
  v10 = -[UNNotificationSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
  if (v10 != objc_msgSend(v4, "remoteNotificationsSetting"))
    goto LABEL_18;
  v11 = -[UNNotificationSettings announcementSetting](self, "announcementSetting");
  if (v11 != objc_msgSend(v4, "announcementSetting"))
    goto LABEL_18;
  v12 = -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting");
  if (v12 != objc_msgSend(v4, "lockScreenSetting"))
    goto LABEL_18;
  v13 = -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting");
  if (v13 == objc_msgSend(v4, "notificationCenterSetting")
    && (v14 = -[UNNotificationSettings soundSetting](self, "soundSetting"), v14 == objc_msgSend(v4, "soundSetting"))
    && (v15 = -[UNNotificationSettings groupingSetting](self, "groupingSetting"),
        v15 == objc_msgSend(v4, "groupingSetting"))
    && (v16 = -[UNNotificationSettings providesAppNotificationSettings](self, "providesAppNotificationSettings"),
        v16 == objc_msgSend(v4, "providesAppNotificationSettings"))
    && (v17 = -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting"),
        v17 == objc_msgSend(v4, "criticalAlertSetting"))
    && (v18 = -[UNNotificationSettings timeSensitiveSetting](self, "timeSensitiveSetting"),
        v18 == objc_msgSend(v4, "timeSensitiveSetting"))
    && (v19 = -[UNNotificationSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"),
        v19 == objc_msgSend(v4, "scheduledDeliverySetting")))
  {
    v20 = -[UNNotificationSettings directMessagesSetting](self, "directMessagesSetting");
    v21 = v20 == objc_msgSend(v4, "directMessagesSetting");
  }
  else
  {
LABEL_18:
    v21 = 0;
  }

  return v21;
}

- (BOOL)isEligibleForIndexing
{
  if (-[UNNotificationSettings authorizationStatus](self, "authorizationStatus") != UNAuthorizationStatusAuthorized)
    return 0;
  if (-[UNNotificationSettings alertSetting](self, "alertSetting") == UNNotificationSettingEnabled
    && -[UNNotificationSettings alertStyle](self, "alertStyle")
    || -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting") == UNNotificationSettingEnabled)
  {
    return 1;
  }
  return -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting") == UNNotificationSettingEnabled;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4;
  UNNotificationSetting v5;
  UNNotificationSetting v6;
  UNNotificationSetting v7;
  UNNotificationSetting v8;
  UNNotificationSetting v9;
  UNAlertStyle v10;
  UNShowPreviewsSetting v11;
  int64_t v12;
  uint64_t v14;
  UNNotificationSetting v15;
  UNNotificationSetting v16;
  UNNotificationSetting v17;
  UNNotificationSetting v18;
  UNNotificationSetting v19;
  UNNotificationSetting v20;
  UNAuthorizationStatus v21;
  UNMutableNotificationSettings *v22;

  v22 = [UNMutableNotificationSettings alloc];
  v21 = -[UNNotificationSettings authorizationStatus](self, "authorizationStatus");
  v20 = -[UNNotificationSettings soundSetting](self, "soundSetting");
  v19 = -[UNNotificationSettings badgeSetting](self, "badgeSetting");
  v18 = -[UNNotificationSettings alertSetting](self, "alertSetting");
  v17 = -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting");
  v16 = -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting");
  v15 = -[UNNotificationSettings carPlaySetting](self, "carPlaySetting");
  v4 = -[UNNotificationSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
  v5 = -[UNNotificationSettings announcementSetting](self, "announcementSetting");
  v6 = -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting");
  v7 = -[UNNotificationSettings timeSensitiveSetting](self, "timeSensitiveSetting");
  v8 = -[UNNotificationSettings scheduledDeliverySetting](self, "scheduledDeliverySetting");
  v9 = -[UNNotificationSettings directMessagesSetting](self, "directMessagesSetting");
  v10 = -[UNNotificationSettings alertStyle](self, "alertStyle");
  v11 = -[UNNotificationSettings showPreviewsSetting](self, "showPreviewsSetting");
  v12 = -[UNNotificationSettings groupingSetting](self, "groupingSetting");
  LOBYTE(v14) = -[UNNotificationSettings providesAppNotificationSettings](self, "providesAppNotificationSettings");
  return -[UNNotificationSettings initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:](v22, "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", v21, v20, v19, v18, v17, v16, v15, v4, v5, v6, v7, v8, v9, v10, v11,
           v12,
           v14);
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

@end
