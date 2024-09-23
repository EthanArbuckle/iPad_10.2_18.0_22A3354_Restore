@implementation HFAnalyticsAnnounceUserSettingEvent

- (HFAnalyticsAnnounceUserSettingEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HFAnalyticsAnnounceUserSettingEvent *v13;
  HFAnalyticsAnnounceUserSettingEvent *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *processName;
  void *v25;
  id obj;
  objc_super v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceIsEnabledForUser"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!obj)
    NSLog(CFSTR("HFAnalyticsAnnounceEnabledForUserKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedForCurrentUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedForCurrentUserKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedEnabledForAdminUser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedForAdminUserKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedByOwner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedByOwnerKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedByAdmin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedByAdminKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedDuringOnboarding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedDuringOnboardingKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedFromUserSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedFromUserSettingsKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedFromHomePodSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedFromHomePodSettingsKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangeFailed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangeFailedKey is nil"));
  v27.receiver = self;
  v27.super_class = (Class)HFAnalyticsAnnounceUserSettingEvent;
  v13 = -[HFAnalyticsEvent initWithEventType:](&v27, sel_initWithEventType_, 21);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_announceEnabledForUser, obj);
    objc_storeStrong((id *)&v14->_settingChangedForCurrentUser, v5);
    objc_storeStrong((id *)&v14->_settingChangedForAdminUser, v6);
    objc_storeStrong((id *)&v14->_settingChangedByOwner, v7);
    objc_storeStrong((id *)&v14->_settingChangedByAdmin, v8);
    objc_storeStrong((id *)&v14->_settingChangedDuringOnboarding, v9);
    objc_storeStrong((id *)&v14->_settingChangedFromUserSettings, v10);
    objc_storeStrong((id *)&v14->_settingChangedFromHomePodSettings, v11);
    objc_storeStrong((id *)&v14->_announceSettingChangeFailed, v12);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v25 = v10;
    v15 = v9;
    v16 = v8;
    v17 = v7;
    v18 = v6;
    v19 = v5;
    v20 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "processName");
    v22 = objc_claimAutoreleasedReturnValue();
    processName = v14->_processName;
    v14->_processName = (NSString *)v22;

    v12 = v20;
    v5 = v19;
    v6 = v18;
    v7 = v17;
    v8 = v16;
    v9 = v15;
    v10 = v25;
  }

  return v14;
}

- (id)payload
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
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HFAnalyticsAnnounceUserSettingEvent;
  -[HFAnalyticsEvent payload](&v16, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsAnnounceUserSettingEvent announceEnabledForUser](self, "announceEnabledForUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("intercomIsEnabledForUser"));

  -[HFAnalyticsAnnounceUserSettingEvent settingChangedForCurrentUser](self, "settingChangedForCurrentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("intercomSettingChangedForCurrentUser"));

  -[HFAnalyticsAnnounceUserSettingEvent settingChangedForAdminUser](self, "settingChangedForAdminUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("intercomSettingChangedForAdminUser"));

  -[HFAnalyticsAnnounceUserSettingEvent settingChangedByOwner](self, "settingChangedByOwner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("intercomSettingChangedByOwner"));

  -[HFAnalyticsAnnounceUserSettingEvent settingChangedByAdmin](self, "settingChangedByAdmin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("intercomSettingChangedByAdmin"));

  -[HFAnalyticsAnnounceUserSettingEvent settingChangedDuringOnboarding](self, "settingChangedDuringOnboarding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("intercomSettingChangedDuringOnboarding"));

  -[HFAnalyticsAnnounceUserSettingEvent settingChangedFromUserSettings](self, "settingChangedFromUserSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("intercomSettingChangedFromUserSettings"));

  -[HFAnalyticsAnnounceUserSettingEvent settingChangedFromHomePodSettings](self, "settingChangedFromHomePodSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("intercomSettingChangedFromHomePodSettings"));

  -[HFAnalyticsAnnounceUserSettingEvent announceSettingChangeFailed](self, "announceSettingChangeFailed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("intercomSettingChangeFailed"));

  -[HFAnalyticsAnnounceUserSettingEvent processName](self, "processName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("processName"));

  return v4;
}

- (NSNumber)announceEnabledForUser
{
  return self->_announceEnabledForUser;
}

- (void)setAnnounceEnabledForUser:(id)a3
{
  objc_storeStrong((id *)&self->_announceEnabledForUser, a3);
}

- (NSNumber)settingChangedForCurrentUser
{
  return self->_settingChangedForCurrentUser;
}

- (void)setSettingChangedForCurrentUser:(id)a3
{
  objc_storeStrong((id *)&self->_settingChangedForCurrentUser, a3);
}

- (NSNumber)settingChangedForAdminUser
{
  return self->_settingChangedForAdminUser;
}

- (void)setSettingChangedForAdminUser:(id)a3
{
  objc_storeStrong((id *)&self->_settingChangedForAdminUser, a3);
}

- (NSNumber)settingChangedByOwner
{
  return self->_settingChangedByOwner;
}

- (void)setSettingChangedByOwner:(id)a3
{
  objc_storeStrong((id *)&self->_settingChangedByOwner, a3);
}

- (NSNumber)settingChangedByAdmin
{
  return self->_settingChangedByAdmin;
}

- (void)setSettingChangedByAdmin:(id)a3
{
  objc_storeStrong((id *)&self->_settingChangedByAdmin, a3);
}

- (NSNumber)settingChangedDuringOnboarding
{
  return self->_settingChangedDuringOnboarding;
}

- (void)setSettingChangedDuringOnboarding:(id)a3
{
  objc_storeStrong((id *)&self->_settingChangedDuringOnboarding, a3);
}

- (NSNumber)settingChangedFromUserSettings
{
  return self->_settingChangedFromUserSettings;
}

- (void)setSettingChangedFromUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settingChangedFromUserSettings, a3);
}

- (NSNumber)settingChangedFromHomePodSettings
{
  return self->_settingChangedFromHomePodSettings;
}

- (void)setSettingChangedFromHomePodSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settingChangedFromHomePodSettings, a3);
}

- (NSNumber)announceSettingChangeFailed
{
  return self->_announceSettingChangeFailed;
}

- (void)setAnnounceSettingChangeFailed:(id)a3
{
  objc_storeStrong((id *)&self->_announceSettingChangeFailed, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_announceSettingChangeFailed, 0);
  objc_storeStrong((id *)&self->_settingChangedFromHomePodSettings, 0);
  objc_storeStrong((id *)&self->_settingChangedFromUserSettings, 0);
  objc_storeStrong((id *)&self->_settingChangedDuringOnboarding, 0);
  objc_storeStrong((id *)&self->_settingChangedByAdmin, 0);
  objc_storeStrong((id *)&self->_settingChangedByOwner, 0);
  objc_storeStrong((id *)&self->_settingChangedForAdminUser, 0);
  objc_storeStrong((id *)&self->_settingChangedForCurrentUser, 0);
  objc_storeStrong((id *)&self->_announceEnabledForUser, 0);
}

@end
