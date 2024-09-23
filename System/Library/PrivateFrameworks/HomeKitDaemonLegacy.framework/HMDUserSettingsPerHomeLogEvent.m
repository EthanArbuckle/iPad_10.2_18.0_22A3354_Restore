@implementation HMDUserSettingsPerHomeLogEvent

- (HMDUserSettingsPerHomeLogEvent)initWithUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDUserSettingsPerHomeLogEvent *v8;

  v4 = a3;
  objc_msgSend(v4, "userDataController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDUserSettingsPerHomeLogEvent initWithUser:userDataController:homeUUID:](self, "initWithUser:userDataController:homeUUID:", v4, v5, v7);

  return v8;
}

- (HMDUserSettingsPerHomeLogEvent)initWithUser:(id)a3 userDataController:(id)a4 homeUUID:(id)a5
{
  id v8;
  id v9;
  HMDUserSettingsPerHomeLogEvent *v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserSettingsPerHomeLogEvent;
  v10 = -[HMMHomeLogEvent initWithHomeUUID:](&v12, sel_initWithHomeUUID_, a5);
  if (v10)
  {
    v10->_isOwner = objc_msgSend(v8, "isOwner");
    v10->_isAdmin = objc_msgSend(v8, "isAdministrator");
    v10->_isRemoteAccessAllowed = objc_msgSend(v8, "isRemoteAccessAllowed");
    v10->_isRecognizeMyVoiceEnabled = objc_msgSend(v9, "isRecognizeMyVoiceEnabled");
    v10->_isPersonalRequestsEnabled = objc_msgSend(v9, "assistantAccessControlActivityNotificationsEnabledForPersonalRequests");
    v10->_isAnnounceAccessAllowed = objc_msgSend(v8, "isAnnounceAccessAllowed");
    v10->_camerasAccessLevel = objc_msgSend(v8, "camerasAccessLevel");
  }

  return v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.userSettings");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isOwner](self, "isOwner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isOwner"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isAdmin](self, "isAdmin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isAdmin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isRemoteAccessAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isRecognizeMyVoiceEnabled](self, "isRecognizeMyVoiceEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isRecognizeMyVoiceEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isPersonalRequestsEnabled](self, "isPersonalRequestsEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isPersonalRequestsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isAnnounceAccessAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserSettingsPerHomeLogEvent camerasAccessLevel](self, "camerasAccessLevel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("camerasAccessLevel"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v11;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (BOOL)isAdmin
{
  return self->_isAdmin;
}

- (BOOL)isRemoteAccessAllowed
{
  return self->_isRemoteAccessAllowed;
}

- (BOOL)isRecognizeMyVoiceEnabled
{
  return self->_isRecognizeMyVoiceEnabled;
}

- (BOOL)isPersonalRequestsEnabled
{
  return self->_isPersonalRequestsEnabled;
}

- (BOOL)isAnnounceAccessAllowed
{
  return self->_isAnnounceAccessAllowed;
}

- (unint64_t)camerasAccessLevel
{
  return self->_camerasAccessLevel;
}

@end
