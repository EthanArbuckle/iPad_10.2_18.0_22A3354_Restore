@implementation BBSectionInfoSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_lastUserGrantedAuthorizationDate, 0);
  objc_storeStrong((id *)&self->_authorizationExpirationDate, 0);
}

- (BOOL)allowsNotifications
{
  return -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus") == 2
      || -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus") == 3
      || -[BBSectionInfoSettings isAuthorizedTemporarily](self, "isAuthorizedTemporarily");
}

- (BBSectionInfoSettings)initWithDefaultsForSectionType:(int64_t)a3
{
  BBSectionInfoSettings *v4;
  BBSectionInfoSettings *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BBSectionInfoSettings;
  v4 = -[BBSectionInfoSettings init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[BBSectionInfoSettings setAuthorizationStatus:](v4, "setAuthorizationStatus:", 2);
    -[BBSectionInfoSettings setNotificationCenterSetting:](v5, "setNotificationCenterSetting:", 2);
    if ((a3 | 2) == 2)
    {
      -[BBSectionInfoSettings setLockScreenSetting:](v5, "setLockScreenSetting:", 2);
      -[BBSectionInfoSettings setShowsOnExternalDevices:](v5, "setShowsOnExternalDevices:", 1);
      -[BBSectionInfoSettings setContentPreviewSetting:](v5, "setContentPreviewSetting:", 0);
      -[BBSectionInfoSettings setAlertType:](v5, "setAlertType:", 1);
      -[BBSectionInfoSettings setPushSettings:](v5, "setPushSettings:", 0);
      -[BBSectionInfoSettings setCarPlaySetting:](v5, "setCarPlaySetting:", 0);
      -[BBSectionInfoSettings setRemoteNotificationsSetting:](v5, "setRemoteNotificationsSetting:", 2);
      -[BBSectionInfoSettings setCriticalAlertSetting:](v5, "setCriticalAlertSetting:", 0);
      -[BBSectionInfoSettings setTimeSensitiveSetting:](v5, "setTimeSensitiveSetting:", 0);
      -[BBSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](v5, "setUserConfiguredTimeSensitiveSetting:", 0);
      -[BBSectionInfoSettings setScheduledDeliverySetting:](v5, "setScheduledDeliverySetting:", 1);
      -[BBSectionInfoSettings setAnnounceSetting:](v5, "setAnnounceSetting:", 1);
      -[BBSectionInfoSettings setDirectMessagesSetting:](v5, "setDirectMessagesSetting:", 0);
      -[BBSectionInfoSettings setUserConfiguredDirectMessagesSetting:](v5, "setUserConfiguredDirectMessagesSetting:", 0);
    }
    v5->_sectionType = a3;
  }
  return v5;
}

- (BBSectionInfoSettings)initWithCoder:(id)a3
{
  id v4;
  BBSectionInfoSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BBSectionInfoSettings;
  v5 = -[BBSectionInfoSettings init](&v19, sel_init);
  if (v5)
  {
    -[BBSectionInfoSettings setAuthorizationStatus:](v5, "setAuthorizationStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authorizationStatus")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationExpirationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoSettings setAuthorizationExpirationDate:](v5, "setAuthorizationExpirationDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUserGrantedAuthorizationDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoSettings setLastUserGrantedAuthorizationDate:](v5, "setLastUserGrantedAuthorizationDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("muteAssertion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoSettings setMuteAssertion:](v5, "setMuteAssertion:", v8);

    -[BBSectionInfoSettings setNotificationCenterSetting:](v5, "setNotificationCenterSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationCenterSetting")));
    -[BBSectionInfoSettings setLockScreenSetting:](v5, "setLockScreenSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lockScreenSetting")));
    -[BBSectionInfoSettings setShowsOnExternalDevices:](v5, "setShowsOnExternalDevices:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsOnExternalDevices")));
    -[BBSectionInfoSettings setShowsCustomSettingsLink:](v5, "setShowsCustomSettingsLink:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsCustomSettingsLink")));
    -[BBSectionInfoSettings setContentPreviewSetting:](v5, "setContentPreviewSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentPreviewSetting")));
    -[BBSectionInfoSettings setAlertType:](v5, "setAlertType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alertType")));
    -[BBSectionInfoSettings setPushSettings:](v5, "setPushSettings:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pushSettings")));
    -[BBSectionInfoSettings setCarPlaySetting:](v5, "setCarPlaySetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carPlaySetting")));
    -[BBSectionInfoSettings setRemoteNotificationsSetting:](v5, "setRemoteNotificationsSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteNotificationsSetting")));
    -[BBSectionInfoSettings setCriticalAlertSetting:](v5, "setCriticalAlertSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("criticalAlertSetting")));
    -[BBSectionInfoSettings setTimeSensitiveSetting:](v5, "setTimeSensitiveSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeSensitiveSetting")));
    -[BBSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](v5, "setUserConfiguredTimeSensitiveSetting:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userConfiguredTimeSensitiveSetting")));
    -[BBSectionInfoSettings setBulletinGroupingSetting:](v5, "setBulletinGroupingSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bulletinGroupingSetting")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("announceSetting")))
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("announceSetting"));
    else
      v9 = 1;
    if (v9 <= 1)
      v10 = 1;
    else
      v10 = v9;
    -[BBSectionInfoSettings setAnnounceSetting:](v5, "setAnnounceSetting:", v10);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("scheduledDeliverySetting")))
      v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledDeliverySetting"));
    else
      v11 = 1;
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    -[BBSectionInfoSettings setScheduledDeliverySetting:](v5, "setScheduledDeliverySetting:", v12);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("directMessagesSettingKey")))
      v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("directMessagesSettingKey"));
    else
      v13 = 0;
    -[BBSectionInfoSettings setDirectMessagesSetting:](v5, "setDirectMessagesSetting:", v13);
    -[BBSectionInfoSettings setUserConfiguredDirectMessagesSetting:](v5, "setUserConfiguredDirectMessagesSetting:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userConfiguredDirectMessagesSetting")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsNotifications")))
      -[BBSectionInfoSettings setAllowsNotifications:](v5, "setAllowsNotifications:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNotifications")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("showsMessagePreview")))
      -[BBSectionInfoSettings setShowsMessagePreview:](v5, "setShowsMessagePreview:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsMessagePreview")));
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("notificationCenterSetting")) & 1) == 0
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("showsInNotificationCenter")))
    {
      -[BBSectionInfoSettings setShowsInNotificationCenter:](v5, "setShowsInNotificationCenter:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsInNotificationCenter")));
    }
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("lockScreenSetting")) & 1) == 0
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("showsInLockScreen")))
    {
      -[BBSectionInfoSettings setShowsInLockScreen:](v5, "setShowsInLockScreen:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsInLockScreen")));
    }
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("announceSetting")) & 1) == 0
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("spokenNotificationSetting")))
    {
      v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("spokenNotificationSetting"));
      if (v14)
      {
        if (v14 != 2)
        {
          v15 = v14 == 1;
LABEL_37:
          -[BBSectionInfoSettings setAnnounceSetting:](v5, "setAnnounceSetting:", v15);
          goto LABEL_38;
        }
        v16 = -[BBSectionInfoSettings timeSensitiveSetting](v5, "timeSensitiveSetting") == 0;
        v17 = 2;
      }
      else
      {
        v16 = -[BBSectionInfoSettings timeSensitiveSetting](v5, "timeSensitiveSetting") == 2;
        v17 = 1;
      }
      if (v16)
        v15 = v17 + 1;
      else
        v15 = v17;
      goto LABEL_37;
    }
  }
LABEL_38:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus"), CFSTR("authorizationStatus"));
  -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("authorizationExpirationDate"));

  -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("lastUserGrantedAuthorizationDate"));

  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("muteAssertion"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"), CFSTR("notificationCenterSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"), CFSTR("lockScreenSetting"));
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"), CFSTR("showsOnExternalDevices"));
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"), CFSTR("showsCustomSettingsLink"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"), CFSTR("contentPreviewSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings alertType](self, "alertType"), CFSTR("alertType"));
  objc_msgSend(v7, "encodeInt32:forKey:", -[BBSectionInfoSettings pushSettings](self, "pushSettings"), CFSTR("pushSettings"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"), CFSTR("carPlaySetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), CFSTR("remoteNotificationsSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"), CFSTR("criticalAlertSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"), CFSTR("timeSensitiveSetting"));
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"), CFSTR("userConfiguredTimeSensitiveSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"), CFSTR("bulletinGroupingSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings announceSetting](self, "announceSetting"), CFSTR("announceSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), CFSTR("scheduledDeliverySetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"), CFSTR("directMessagesSettingKey"));
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"), CFSTR("userConfiguredDirectMessagesSetting"));
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsInLockScreen](self, "showsInLockScreen"), CFSTR("showsInLockScreen"));
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsInNotificationCenter](self, "showsInNotificationCenter"), CFSTR("showsInNotificationCenter"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAuthorizationStatus:", -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus"));
  -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthorizationExpirationDate:", v6);

  -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastUserGrantedAuthorizationDate:", v7);

  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setMuteAssertion:", v9);

  objc_msgSend(v5, "setNotificationCenterSetting:", -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"));
  objc_msgSend(v5, "setLockScreenSetting:", -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"));
  objc_msgSend(v5, "setShowsOnExternalDevices:", -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  objc_msgSend(v5, "setShowsCustomSettingsLink:", -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  objc_msgSend(v5, "setContentPreviewSetting:", -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"));
  objc_msgSend(v5, "setAlertType:", -[BBSectionInfoSettings alertType](self, "alertType"));
  objc_msgSend(v5, "setPushSettings:", -[BBSectionInfoSettings pushSettings](self, "pushSettings"));
  objc_msgSend(v5, "setCarPlaySetting:", -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"));
  objc_msgSend(v5, "setRemoteNotificationsSetting:", -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  objc_msgSend(v5, "setCriticalAlertSetting:", -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"));
  objc_msgSend(v5, "setTimeSensitiveSetting:", -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  objc_msgSend(v5, "setUserConfiguredTimeSensitiveSetting:", -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
  objc_msgSend(v5, "setBulletinGroupingSetting:", -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"));
  objc_msgSend(v5, "setAnnounceSetting:", -[BBSectionInfoSettings announceSetting](self, "announceSetting"));
  objc_msgSend(v5, "setScheduledDeliverySetting:", -[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"));
  objc_msgSend(v5, "setDirectMessagesSetting:", -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"));
  objc_msgSend(v5, "setUserConfiguredDirectMessagesSetting:", -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
  return v5;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (int64_t)notificationCenterSetting
{
  return self->_notificationCenterSetting;
}

- (int64_t)lockScreenSetting
{
  return self->_lockScreenSetting;
}

- (void)setAnnounceSetting:(int64_t)a3
{
  self->_announceSetting = a3;
}

- (void)setCarPlaySetting:(int64_t)a3
{
  self->_carPlaySetting = a3;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  self->_scheduledDeliverySetting = a3;
}

- (int64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  self->_contentPreviewSetting = a3;
}

- (void)setPushSettings:(unint64_t)a3
{
  self->_pushSettings = a3;
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  self->_timeSensitiveSetting = a3;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  self->_criticalAlertSetting = a3;
}

- (void)setAlertType:(unint64_t)a3
{
  self->_alertType = a3;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  self->_notificationCenterSetting = a3;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  self->_lockScreenSetting = a3;
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  self->_directMessagesSetting = a3;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  self->_showsOnExternalDevices = a3;
}

- (int64_t)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (int64_t)carPlaySetting
{
  return self->_carPlaySetting;
}

- (int64_t)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (int64_t)announceSetting
{
  return self->_announceSetting;
}

- (int64_t)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (int64_t)directMessagesSetting
{
  return self->_directMessagesSetting;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  self->_userConfiguredTimeSensitiveSetting = a3;
}

- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3
{
  self->_userConfiguredDirectMessagesSetting = a3;
}

- (BOOL)showsCustomSettingsLink
{
  return self->_showsCustomSettingsLink;
}

- (NSDate)authorizationExpirationDate
{
  return self->_authorizationExpirationDate;
}

- (int64_t)bulletinGroupingSetting
{
  return self->_bulletinGroupingSetting;
}

- (BOOL)showsOnExternalDevices
{
  return self->_showsOnExternalDevices;
}

- (BBMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (NSDate)lastUserGrantedAuthorizationDate
{
  return self->_lastUserGrantedAuthorizationDate;
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  return self->_userConfiguredTimeSensitiveSetting;
}

- (BOOL)hasUserConfiguredDirectMessagesSetting
{
  return self->_userConfiguredDirectMessagesSetting;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  self->_showsCustomSettingsLink = a3;
}

- (void)setMuteAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_muteAssertion, a3);
}

- (void)setLastUserGrantedAuthorizationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserGrantedAuthorizationDate, a3);
}

- (void)setBulletinGroupingSetting:(int64_t)a3
{
  self->_bulletinGroupingSetting = a3;
}

- (void)setAuthorizationExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationExpirationDate, a3);
}

- (unint64_t)pushSettings
{
  return self->_pushSettings;
}

- (BOOL)showsInNotificationCenter
{
  return -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting") == 2;
}

- (BOOL)showsInLockScreen
{
  return -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting") == 2;
}

- (BOOL)isAuthorizedTemporarily
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 > 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BBSectionInfoSettings *v4;
  BBSectionInfoSettings *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  _BOOL4 v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  _BOOL4 v30;

  v4 = (BBSectionInfoSettings *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus");
      if (v6 == -[BBSectionInfoSettings authorizationStatus](v5, "authorizationStatus"))
      {
        -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBSectionInfoSettings authorizationExpirationDate](v5, "authorizationExpirationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](v5, "lastUserGrantedAuthorizationDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 == v11)
          {
            -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[BBSectionInfoSettings muteAssertion](v5, "muteAssertion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!BSEqualObjects())
              goto LABEL_30;
            v14 = -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting");
            if (v14 != -[BBSectionInfoSettings notificationCenterSetting](v5, "notificationCenterSetting"))
              goto LABEL_30;
            v15 = -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting");
            if (v15 != -[BBSectionInfoSettings lockScreenSetting](v5, "lockScreenSetting"))
              goto LABEL_30;
            v16 = -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices");
            if (v16 != -[BBSectionInfoSettings showsOnExternalDevices](v5, "showsOnExternalDevices"))
              goto LABEL_30;
            v17 = -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink");
            if (v17 != -[BBSectionInfoSettings showsCustomSettingsLink](v5, "showsCustomSettingsLink"))
              goto LABEL_30;
            v18 = -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting");
            if (v18 != -[BBSectionInfoSettings contentPreviewSetting](v5, "contentPreviewSetting"))
              goto LABEL_30;
            v19 = -[BBSectionInfoSettings alertType](self, "alertType");
            if (v19 != -[BBSectionInfoSettings alertType](v5, "alertType"))
              goto LABEL_30;
            v20 = -[BBSectionInfoSettings pushSettings](self, "pushSettings");
            if (v20 != -[BBSectionInfoSettings pushSettings](v5, "pushSettings"))
              goto LABEL_30;
            v21 = -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting");
            if (v21 != -[BBSectionInfoSettings carPlaySetting](v5, "carPlaySetting"))
              goto LABEL_30;
            v22 = -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
            if (v22 != -[BBSectionInfoSettings remoteNotificationsSetting](v5, "remoteNotificationsSetting"))
              goto LABEL_30;
            v23 = -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting");
            if (v23 == -[BBSectionInfoSettings criticalAlertSetting](v5, "criticalAlertSetting")
              && (v24 = -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"),
                  v24 == -[BBSectionInfoSettings timeSensitiveSetting](v5, "timeSensitiveSetting"))
              && (v25 = -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"), v25 == -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](v5, "hasUserConfiguredTimeSensitiveSetting"))&& (v26 = -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"), v26 == -[BBSectionInfoSettings bulletinGroupingSetting](v5, "bulletinGroupingSetting"))&& (v27 = -[BBSectionInfoSettings announceSetting](self, "announceSetting"), v27 == -[BBSectionInfoSettings announceSetting](v5, "announceSetting"))&& (v28 = -[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), v28 == -[BBSectionInfoSettings scheduledDeliverySetting](v5, "scheduledDeliverySetting"))&& (v29 = -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"), v29 == -[BBSectionInfoSettings directMessagesSetting](v5, "directMessagesSetting")))
            {
              v30 = -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting");
              v9 = v30 ^ -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](v5, "hasUserConfiguredDirectMessagesSetting") ^ 1;
            }
            else
            {
LABEL_30:
              LOBYTE(v9) = 0;
            }

          }
          else
          {
            LOBYTE(v9) = 0;
          }

        }
        else
        {
          LOBYTE(v9) = 0;
        }

      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

+ (id)sectionInfoSettingsForManagedBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  BBSectionInfoSettings *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restrictionEnforcedNotificationSettingsForBundleID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E68]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v7;
    if (v7)
    {
      v8 = objc_msgSend(v7, "BOOLValue");
      v9 = 1;
      if (v8)
        v9 = 2;
    }
    else
    {
      v9 = 2;
    }
    v51 = v9;
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v11;
    if (v11)
    {
      v12 = objc_msgSend(v11, "BOOLValue");
      v13 = 1;
      if (v12)
        v13 = 2;
    }
    else
    {
      v13 = 2;
    }
    v50 = v13;
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v14;
    if (v14)
    {
      v15 = objc_msgSend(v14, "BOOLValue");
      v16 = 1;
      if (v15)
        v16 = 2;
    }
    else
    {
      v16 = 2;
    }
    v48 = v16;
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E78]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v17;
    if (v17)
    {
      v18 = objc_msgSend(v17, "BOOLValue");
      v19 = 1;
      if (v18)
        v19 = 2;
    }
    else
    {
      v19 = 2;
    }
    v47 = v19;
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E58]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v20;
    if (v20)
    {
      v21 = objc_msgSend(v20, "BOOLValue");
      v22 = 1;
      if (v21)
        v22 = 2;
    }
    else
    {
      v22 = 2;
    }
    v46 = v22;
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E40]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = objc_msgSend(v23, "unsignedIntegerValue");
      v26 = 1;
      if (v25 == 2)
        v26 = 2;
      if (v25)
        v27 = v26;
      else
        v27 = 0;
    }
    else
    {
      v27 = 1;
    }
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E60]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = objc_msgSend(v28, "unsignedIntegerValue");
      v31 = v30 == 1;
      if (v30 == 2)
        v31 = 2;
      v45 = v31;
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E48]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
      v34 = objc_msgSend(v32, "BOOLValue");
    else
      v34 = 1;
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E90]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
      v37 = objc_msgSend(v35, "BOOLValue");
    else
      v37 = 1;
    objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x24BE63E70]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = objc_msgSend(v38, "unsignedIntegerValue");
      if (v40 <= 2)
        v41 = v40 + 1;
      else
        v41 = 0;
    }
    else
    {
      v41 = 0;
    }
    v42 = 7;
    if (v27 == 2)
      v42 = 39;
    if (v34)
      v42 |= 8uLL;
    if (v37)
      v43 = v42 | 0x10;
    else
      v43 = v42;
    v10 = -[BBSectionInfoSettings initWithDefaultsForSectionType:]([BBSectionInfoSettings alloc], "initWithDefaultsForSectionType:", 0);
    -[BBSectionInfoSettings setAuthorizationStatus:](v10, "setAuthorizationStatus:", v51);
    -[BBSectionInfoSettings setNotificationCenterSetting:](v10, "setNotificationCenterSetting:", v50);
    -[BBSectionInfoSettings setLockScreenSetting:](v10, "setLockScreenSetting:", v48);
    -[BBSectionInfoSettings setCarPlaySetting:](v10, "setCarPlaySetting:", v47);
    -[BBSectionInfoSettings setCriticalAlertSetting:](v10, "setCriticalAlertSetting:", v46);
    -[BBSectionInfoSettings setTimeSensitiveSetting:](v10, "setTimeSensitiveSetting:", 2);
    -[BBSectionInfoSettings setAlertType:](v10, "setAlertType:", v27);
    -[BBSectionInfoSettings setBulletinGroupingSetting:](v10, "setBulletinGroupingSetting:", v45);
    -[BBSectionInfoSettings setContentPreviewSetting:](v10, "setContentPreviewSetting:", v41);
    -[BBSectionInfoSettings setPushSettings:](v10, "setPushSettings:", v43);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;

  -[BBSectionInfoSettings _authorizationStatusDescription](self, "_authorizationStatusDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR(" Section settings"), "stringByAppendingFormat:", CFSTR(": authorized = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(", authorization expiration date = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", last user granted authorization date = %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(", mute configuration = %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"))
  {
    if (-[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting") == 2)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", notification center = %@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if (-[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"))
  {
    if (-[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting") == 2)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", lock screen = %@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  if (-[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"))
  {
    if (-[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting") == 2)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", scheduled delivery = %@"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v16;
  }
  if (-[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"))
  {
    if (-[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting") == 2)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", CarPlay = %@"), v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
  }
  if (-[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"))
  {
    if (-[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting") == 2)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", remote notifications = %@"), v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v20;
  }
  if (-[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"))
  {
    if (-[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting") == 2)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", critical alert = %@"), v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v22;
  }
  if (-[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"))
  {
    if (-[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting") == 2)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", time sensitive = %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"))
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR(", user configured time sensitive = %@"), v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[BBSectionInfoSettings announceSetting](self, "announceSetting"))
  {
    -[BBSectionInfoSettings _announceSettingDescription](self, "_announceSettingDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", announce setting = %@"), v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v27;
  }
  if (-[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"))
  {
    if (-[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting") == 2)
      v28 = CFSTR("YES");
    else
      v28 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", direct messages = %@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"))
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(", user configured direct messages = %@"), v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", shows on external devices = %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"))
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  objc_msgSend(v32, "stringByAppendingFormat:", CFSTR(", shows custom settings = %@"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoSettings _contentPreviewSettingDescription](self, "_contentPreviewSettingDescription");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringByAppendingFormat:", CFSTR(", content preview setting = %@"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoSettings _alertTypeDescription](self, "_alertTypeDescription");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringByAppendingFormat:", CFSTR(", Alert style = %@"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  BBPushSettingsDescription(-[BBSectionInfoSettings pushSettings](self, "pushSettings"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByAppendingFormat:", CFSTR(", Push settings = %@"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoSettings _bulletinGroupingSettingDescription](self, "_bulletinGroupingSettingDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringByAppendingFormat:", CFSTR(", grouping = %@"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v46.receiver = self;
  v46.super_class = (Class)BBSectionInfoSettings;
  -[BBSectionInfoSettings description](&v46, sel_description);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringByAppendingString:", v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)_contentPreviewSettingDescription
{
  unint64_t v2;

  v2 = -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting");
  if (v2 > 3)
    return CFSTR("<invalid>");
  else
    return off_24C564890[v2];
}

- (id)_bulletinGroupingSettingDescription
{
  unint64_t v2;

  v2 = -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting");
  if (v2 > 2)
    return CFSTR("<invalid>");
  else
    return off_24C5648B0[v2];
}

- (id)_authorizationStatusDescription
{
  unint64_t v2;

  v2 = -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus");
  if (v2 > 4)
    return CFSTR("<invalid>");
  else
    return off_24C564850[v2];
}

- (id)_announceSettingDescription
{
  unint64_t v2;

  v2 = -[BBSectionInfoSettings announceSetting](self, "announceSetting");
  if (v2 > 3)
    return 0;
  else
    return off_24C5648C8[v2];
}

- (id)_alertTypeDescription
{
  unint64_t v2;

  v2 = -[BBSectionInfoSettings alertType](self, "alertType");
  if (v2 > 2)
    return CFSTR("<invalid>");
  else
    return off_24C564878[v2];
}

- (void)setAllowsNotifications:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[BBSectionInfoSettings setAuthorizationStatus:](self, "setAuthorizationStatus:", v3);
}

- (void)muteSectionUntilDate:(id)a3
{
  id v4;

  +[BBSectionMuteAssertion sectionMuteAssertionUntilDate:](BBSectionMuteAssertion, "sectionMuteAssertionUntilDate:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BBSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:", v4);

}

- (void)unmuteSection
{
  -[BBSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:", 0);
}

- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[BBSectionInfoSettings muteAssertion](self, "muteAssertion"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        v9,
        (isKindOfClass & 1) == 0))
  {
    v23 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      -[BBSectionInfoSettings muteThreadIdentifier:untilDate:].cold.2((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
  }
  else if (v6 && objc_msgSend(v6, "length"))
  {
    -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      +[BBThreadsMuteAssertion threadsMuteAssertion](BBThreadsMuteAssertion, "threadsMuteAssertion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:", v13);

    }
    -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMutedUntilDate:forThreadIdentifier:", v7, v6);

  }
  else
  {
    v15 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      -[BBSectionInfoSettings muteThreadIdentifier:untilDate:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (void)unmuteThreadIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[BBSectionInfoSettings muteAssertion](self, "muteAssertion"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    v18 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      -[BBSectionInfoSettings unmuteThreadIdentifier:].cold.2((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
  }
  else if (v4 && objc_msgSend(v4, "length"))
  {
    -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnmutedForThreadIdentifier:", v4);

  }
  else
  {
    v10 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      -[BBSectionInfoSettings unmuteThreadIdentifier:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isActiveForThreadIdentifier:currentDate:", v4, v6);

  return v7;
}

- (NSDictionary)stateCapture
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[BBSectionInfoSettings _authorizationStatusDescription](self, "_authorizationStatusDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("Authorized"));

  -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("Authorization Expiration Date"));

  -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("Last User Granted Authorizated"));

  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("Mute Configuration"));

  if (-[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting") == 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("NotificationCenter"));

  }
  if (-[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting") == 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("LockScreen"));

  }
  if (-[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting") == 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("CarPlay"));

  }
  if (-[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting") == 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("RemoteNotifications"));

  }
  if (-[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting") == 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("CriticalAlerts"));

  }
  if (-[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting") == 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("TimeSensitive"));

    BBStringFromBool(-[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("UserConfiguredTimeSensitive"));

  }
  if (-[BBSectionInfoSettings announceSetting](self, "announceSetting"))
  {
    -[BBSectionInfoSettings _announceSettingDescription](self, "_announceSettingDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("AnnounceNotifications"));

  }
  if (-[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting") == 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("ScheduledDelivery"));

  }
  if (-[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"))
  {
    BBStringFromBool(-[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting") == 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("DirectMessages"));

    BBStringFromBool(-[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("UserConfiguredDirectMessages"));

  }
  BBStringFromBool(-[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("ShowsOnExternalDevices"));

  BBStringFromBool(-[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v23, CFSTR("CustomSettingsLink"));

  -[BBSectionInfoSettings _contentPreviewSettingDescription](self, "_contentPreviewSettingDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v24, CFSTR("ContentPreviewSetting"));

  -[BBSectionInfoSettings _alertTypeDescription](self, "_alertTypeDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v25, CFSTR("AlertType"));

  BBStringFromBool(-[BBSectionInfoSettings pushSettings](self, "pushSettings") & 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v26, CFSTR("PushSettingsBadgeSupported"));

  BBStringFromBool((-[BBSectionInfoSettings pushSettings](self, "pushSettings") >> 3) & 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v27, CFSTR("PushSettingsBadgeEnabled"));

  BBStringFromBool((-[BBSectionInfoSettings pushSettings](self, "pushSettings") >> 1) & 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v28, CFSTR("PushSettingsSoundSupported"));

  BBStringFromBool((-[BBSectionInfoSettings pushSettings](self, "pushSettings") >> 4) & 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("PushSettingsSoundEnabled"));

  BBStringFromBool((-[BBSectionInfoSettings pushSettings](self, "pushSettings") >> 2) & 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v30, CFSTR("PushSettingsAlertSupported"));

  BBStringFromBool((-[BBSectionInfoSettings pushSettings](self, "pushSettings") >> 5) & 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v31, CFSTR("PushSettingsAlertEnabled"));

  -[BBSectionInfoSettings _bulletinGroupingSettingDescription](self, "_bulletinGroupingSettingDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v32, CFSTR("GroupingSetting"));

  return (NSDictionary *)v3;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;

  v3 = -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus");
  -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting");
  v11 = v10 ^ -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting");
  v12 = v9 ^ v11 ^ -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices");
  v13 = -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink");
  v14 = v13 ^ -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting");
  v15 = v12 ^ v14 ^ -[BBSectionInfoSettings alertType](self, "alertType");
  v16 = -[BBSectionInfoSettings pushSettings](self, "pushSettings");
  v17 = v16 ^ -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting");
  v18 = v17 ^ -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
  v19 = v18 ^ -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting");
  v20 = v19 ^ -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting");
  v21 = v15 ^ v20 ^ -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting");
  v22 = -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting");
  v23 = v22 ^ -[BBSectionInfoSettings announceSetting](self, "announceSetting");
  v24 = v23 ^ -[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting");
  v25 = v24 ^ -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting");
  v26 = v21 ^ v25 ^ -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting");

  return v26;
}

- (BBSectionInfoSettings)initWithUNCSectionInfoSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BBSectionInfoSettings *v13;
  objc_super v15;

  v4 = a3;
  if (v4
    && (v15.receiver = self,
        v15.super_class = (Class)BBSectionInfoSettings,
        (self = -[BBSectionInfoSettings init](&v15, sel_init)) != 0))
  {
    -[BBSectionInfoSettings setAuthorizationStatus:](self, "setAuthorizationStatus:", objc_msgSend(v4, "authorizationStatus"));
    objc_msgSend(v4, "authorizationExpirationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoSettings setAuthorizationExpirationDate:](self, "setAuthorizationExpirationDate:", v5);

    objc_msgSend(v4, "lastUserGrantedAuthorizationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoSettings setLastUserGrantedAuthorizationDate:](self, "setLastUserGrantedAuthorizationDate:", v6);

    objc_msgSend(v4, "muteAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BBUNCoreConversion toBBMuteAssertion:](BBUNCoreConversion, "toBBMuteAssertion:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:", v8);

    -[BBSectionInfoSettings setNotificationCenterSetting:](self, "setNotificationCenterSetting:", objc_msgSend(v4, "notificationCenterSetting"));
    -[BBSectionInfoSettings setLockScreenSetting:](self, "setLockScreenSetting:", objc_msgSend(v4, "lockScreenSetting"));
    -[BBSectionInfoSettings setShowsOnExternalDevices:](self, "setShowsOnExternalDevices:", objc_msgSend(v4, "showsOnExternalDevices"));
    -[BBSectionInfoSettings setShowsCustomSettingsLink:](self, "setShowsCustomSettingsLink:", objc_msgSend(v4, "showsCustomSettingsLink"));
    -[BBSectionInfoSettings setContentPreviewSetting:](self, "setContentPreviewSetting:", objc_msgSend(v4, "contentPreviewSetting"));
    -[BBSectionInfoSettings setAlertType:](self, "setAlertType:", objc_msgSend(v4, "alertType"));
    -[BBSectionInfoSettings setPushSettings:](self, "setPushSettings:", objc_msgSend(v4, "pushSettings"));
    -[BBSectionInfoSettings setCarPlaySetting:](self, "setCarPlaySetting:", objc_msgSend(v4, "carPlaySetting"));
    -[BBSectionInfoSettings setRemoteNotificationsSetting:](self, "setRemoteNotificationsSetting:", objc_msgSend(v4, "remoteNotificationsSetting"));
    -[BBSectionInfoSettings setCriticalAlertSetting:](self, "setCriticalAlertSetting:", objc_msgSend(v4, "criticalAlertSetting"));
    -[BBSectionInfoSettings setTimeSensitiveSetting:](self, "setTimeSensitiveSetting:", objc_msgSend(v4, "timeSensitiveSetting"));
    -[BBSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](self, "setUserConfiguredTimeSensitiveSetting:", objc_msgSend(v4, "hasUserConfiguredTimeSensitiveSetting"));
    -[BBSectionInfoSettings setBulletinGroupingSetting:](self, "setBulletinGroupingSetting:", objc_msgSend(v4, "bulletinGroupingSetting"));
    v9 = objc_msgSend(v4, "announceSetting");
    if (v9 <= 1)
      v10 = 1;
    else
      v10 = v9;
    -[BBSectionInfoSettings setAnnounceSetting:](self, "setAnnounceSetting:", v10);
    v11 = objc_msgSend(v4, "scheduledDeliverySetting");
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    -[BBSectionInfoSettings setScheduledDeliverySetting:](self, "setScheduledDeliverySetting:", v12);
    -[BBSectionInfoSettings setDirectMessagesSetting:](self, "setDirectMessagesSetting:", objc_msgSend(v4, "directMessagesSetting"));
    -[BBSectionInfoSettings setUserConfiguredDirectMessagesSetting:](self, "setUserConfiguredDirectMessagesSetting:", objc_msgSend(v4, "hasUserConfiguredDirectMessagesSetting"));
    -[BBSectionInfoSettings setAllowsNotifications:](self, "setAllowsNotifications:", objc_msgSend(v4, "allowsNotifications"));
    -[BBSectionInfoSettings setShowsMessagePreview:](self, "setShowsMessagePreview:", objc_msgSend(v4, "showsMessagePreview"));
    -[BBSectionInfoSettings setShowsInNotificationCenter:](self, "setShowsInNotificationCenter:", objc_msgSend(v4, "showsInNotificationCenter"));
    -[BBSectionInfoSettings setShowsInLockScreen:](self, "setShowsInLockScreen:", objc_msgSend(v4, "showsInLockScreen"));
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)toUNCSectionInfoSettings
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = +[BBUNCoreConversion toUNCSectionType:](BBUNCoreConversion, "toUNCSectionType:", -[BBSectionInfoSettings sectionType](self, "sectionType"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF488]), "initWithDefaultsForSectionType:", v3);
  objc_msgSend(v4, "setAuthorizationStatus:", -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus"));
  -[BBSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthorizationExpirationDate:", v5);

  -[BBSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastUserGrantedAuthorizationDate:", v6);

  -[BBSectionInfoSettings muteAssertion](self, "muteAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BBUNCoreConversion toUNCMuteAssertion:](BBUNCoreConversion, "toUNCMuteAssertion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMuteAssertion:", v8);

  objc_msgSend(v4, "setNotificationCenterSetting:", -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"));
  objc_msgSend(v4, "setLockScreenSetting:", -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"));
  objc_msgSend(v4, "setShowsOnExternalDevices:", -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  objc_msgSend(v4, "setShowsCustomSettingsLink:", -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  objc_msgSend(v4, "setContentPreviewSetting:", -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"));
  objc_msgSend(v4, "setAlertType:", -[BBSectionInfoSettings alertType](self, "alertType"));
  objc_msgSend(v4, "setPushSettings:", -[BBSectionInfoSettings pushSettings](self, "pushSettings"));
  objc_msgSend(v4, "setCarPlaySetting:", -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"));
  objc_msgSend(v4, "setRemoteNotificationsSetting:", -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  objc_msgSend(v4, "setCriticalAlertSetting:", -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"));
  objc_msgSend(v4, "setTimeSensitiveSetting:", -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  objc_msgSend(v4, "setUserConfiguredTimeSensitiveSetting:", -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
  objc_msgSend(v4, "setBulletinGroupingSetting:", -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"));
  v9 = -[BBSectionInfoSettings announceSetting](self, "announceSetting");
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  objc_msgSend(v4, "setAnnounceSetting:", v10);
  v11 = -[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting");
  if (v11 <= 1)
    v12 = 1;
  else
    v12 = v11;
  objc_msgSend(v4, "setScheduledDeliverySetting:", v12);
  objc_msgSend(v4, "setDirectMessagesSetting:", -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"));
  objc_msgSend(v4, "setUserConfiguredDirectMessagesSetting:", -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
  objc_msgSend(v4, "setAllowsNotifications:", -[BBSectionInfoSettings allowsNotifications](self, "allowsNotifications"));
  objc_msgSend(v4, "setShowsMessagePreview:", -[BBSectionInfoSettings showsMessagePreview](self, "showsMessagePreview"));
  objc_msgSend(v4, "setShowsInNotificationCenter:", -[BBSectionInfoSettings showsInNotificationCenter](self, "showsInNotificationCenter"));
  objc_msgSend(v4, "setShowsInLockScreen:", -[BBSectionInfoSettings showsInLockScreen](self, "showsInLockScreen"));
  return v4;
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  self->_remoteNotificationsSetting = a3;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (BOOL)showsMessagePreview
{
  return -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting") != 3;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[BBSectionInfoSettings setNotificationCenterSetting:](self, "setNotificationCenterSetting:", v3);
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[BBSectionInfoSettings setLockScreenSetting:](self, "setLockScreenSetting:", v3);
}

- (int64_t)spokenNotificationSetting
{
  int64_t v2;

  v2 = -[BBSectionInfoSettings announceSetting](self, "announceSetting");
  if ((unint64_t)(v2 - 1) > 2)
    return 0;
  else
    return qword_20CD37FC8[v2 - 1];
}

- (void)setSpokenNotificationSetting:(int64_t)a3
{
  uint64_t v4;

  if (a3 == 2)
  {
    if (-[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting") == 2)
      v4 = 2;
    else
      v4 = 3;
  }
  else
  {
    v4 = a3 == 1;
  }
  -[BBSectionInfoSettings setAnnounceSetting:](self, "setAnnounceSetting:", v4);
}

- (void)muteThreadIdentifier:(uint64_t)a3 untilDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CCB9000, a1, a3, "BBSectionInfoSettings: Must provide valid thread identifier in order to mute a thread", a5, a6, a7, a8, 0);
}

- (void)muteThreadIdentifier:(uint64_t)a3 untilDate:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "BBSectionInfoSettings: Cannot mute thread because section is already muted. Thread ID:%@", a5, a6, a7, a8, 2u);
}

- (void)unmuteThreadIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CCB9000, a1, a3, "BBSectionInfoSettings: Must provide valid thread identifier in order to unmute a thread", a5, a6, a7, a8, 0);
}

- (void)unmuteThreadIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "BBSectionInfoSettings: Cannot unmute thread because section is already muted. Thread ID:%@", a5, a6, a7, a8, 2u);
}

@end
