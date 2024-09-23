@implementation HFAnalyticsAnnounceHomePodSettingEvent

- (HFAnalyticsAnnounceHomePodSettingEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFAnalyticsAnnounceHomePodSettingEvent *v12;
  HFAnalyticsAnnounceHomePodSettingEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *processName;
  void *v24;
  objc_super v25;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceEnabledForHomePod"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsAnnounceEnabledForHomePodKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedByOwner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedByOwnerKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedByAdmin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedByAdminKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedDuringOnboarding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedDuringOnboardingKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedFromUserSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedFromUserSettingsKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangedFromHomePodSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangedFromHomePodSettingsKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSettingChangeFailed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    NSLog(CFSTR("HFAnalyticsAnnounceSettingChangeFailedKey is nil"));
  v25.receiver = self;
  v25.super_class = (Class)HFAnalyticsAnnounceHomePodSettingEvent;
  v12 = -[HFAnalyticsEvent initWithEventType:](&v25, sel_initWithEventType_, 22);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_announceEnabledForHomePod, v5);
    objc_storeStrong((id *)&v13->_settingChangedByOwner, v6);
    objc_storeStrong((id *)&v13->_settingChangedByAdmin, v7);
    objc_storeStrong((id *)&v13->_settingChangedDuringOnboarding, v8);
    objc_storeStrong((id *)&v13->_settingChangedFromUserSettings, v9);
    objc_storeStrong((id *)&v13->_settingChangedFromHomePodSettings, v10);
    objc_storeStrong((id *)&v13->_announceSettingChangeFailed, v11);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v24 = v11;
    v14 = v10;
    v15 = v9;
    v16 = v8;
    v17 = v7;
    v18 = v6;
    v19 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "processName");
    v21 = objc_claimAutoreleasedReturnValue();
    processName = v13->_processName;
    v13->_processName = (NSString *)v21;

    v5 = v19;
    v6 = v18;
    v7 = v17;
    v8 = v16;
    v9 = v15;
    v10 = v14;
    v11 = v24;
  }

  return v13;
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsAnnounceHomePodSettingEvent;
  -[HFAnalyticsEvent payload](&v14, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsAnnounceHomePodSettingEvent announceEnabledForHomePod](self, "announceEnabledForHomePod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("intercomIsEnabledForHomePod"));

  -[HFAnalyticsAnnounceHomePodSettingEvent settingChangedByOwner](self, "settingChangedByOwner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("intercomSettingChangedByOwner"));

  -[HFAnalyticsAnnounceHomePodSettingEvent settingChangedByAdmin](self, "settingChangedByAdmin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("intercomSettingChangedByAdmin"));

  -[HFAnalyticsAnnounceHomePodSettingEvent settingChangedDuringOnboarding](self, "settingChangedDuringOnboarding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("intercomSettingChangedDuringOnboarding"));

  -[HFAnalyticsAnnounceHomePodSettingEvent settingChangedFromUserSettings](self, "settingChangedFromUserSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("intercomSettingChangedFromUserSettings"));

  -[HFAnalyticsAnnounceHomePodSettingEvent settingChangedFromHomePodSettings](self, "settingChangedFromHomePodSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("intercomSettingChangedFromHomePodSettings"));

  -[HFAnalyticsAnnounceHomePodSettingEvent announceSettingChangeFailed](self, "announceSettingChangeFailed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("intercomSettingChangeFailed"));

  -[HFAnalyticsAnnounceHomePodSettingEvent processName](self, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("processName"));

  return v4;
}

- (NSNumber)announceEnabledForHomePod
{
  return self->_announceEnabledForHomePod;
}

- (void)setAnnounceEnabledForHomePod:(id)a3
{
  objc_storeStrong((id *)&self->_announceEnabledForHomePod, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
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
  objc_storeStrong((id *)&self->_announceEnabledForHomePod, 0);
}

@end
