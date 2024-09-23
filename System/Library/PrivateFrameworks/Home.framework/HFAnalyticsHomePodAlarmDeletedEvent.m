@implementation HFAnalyticsHomePodAlarmDeletedEvent

- (HFAnalyticsHomePodAlarmDeletedEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFAnalyticsHomePodAlarmDeletedEvent *v10;
  HFAnalyticsHomePodAlarmDeletedEvent *v11;
  float v12;
  void *v13;
  uint64_t v14;
  NSString *processName;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homePodAlarmID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsHomePodAlarmID is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alarmDeletedSuccessfully"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("HFAnalyticsHomePodAlarmDeletedSuccessfullyKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMusicAlarm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    NSLog(CFSTR("HFAnalyticsHomePodMusicAlarmKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasCustomVolume"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    NSLog(CFSTR("HFAnalyticsHomePodMusicAlarmCustomVolumeKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customVolumeLevel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    NSLog(CFSTR("HFAnalyticsHomePodMusicAlarmCustomVolumeLevelKey is nil"));
  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsHomePodAlarmDeletedEvent;
  v10 = -[HFAnalyticsEvent initWithEventType:](&v17, sel_initWithEventType_, 17);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homePodAlarmID, v5);
    v11->_alarmDeletedSuccessfully = objc_msgSend(v6, "BOOLValue");
    v11->_isMusicAlarm = objc_msgSend(v7, "BOOLValue");
    v11->_hasCustomVolume = objc_msgSend(v8, "BOOLValue");
    objc_msgSend(v9, "floatValue");
    v11->_customVolumeLevel = v12;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "processName");
    v14 = objc_claimAutoreleasedReturnValue();
    processName = v11->_processName;
    v11->_processName = (NSString *)v14;

  }
  return v11;
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HFAnalyticsHomePodAlarmDeletedEvent;
  -[HFAnalyticsEvent payload](&v13, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsHomePodAlarmDeletedEvent homePodAlarmID](self, "homePodAlarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("homePodAlarmID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsHomePodAlarmDeletedEvent alarmDeletedSuccessfully](self, "alarmDeletedSuccessfully"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("homePodAlarmDeletedSuccessfully"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsHomePodAlarmDeletedEvent isMusicAlarm](self, "isMusicAlarm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("isHomePodMusicAlarm"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsHomePodAlarmDeletedEvent hasCustomVolume](self, "hasCustomVolume"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("homePodMusicAlarmHasCustomVolume"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HFAnalyticsHomePodAlarmDeletedEvent customVolumeLevel](self, "customVolumeLevel");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("homePodMusicAlarmCustomVolumeLevel"));

  -[HFAnalyticsHomePodAlarmDeletedEvent processName](self, "processName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("processName"));

  return v4;
}

- (NSString)homePodAlarmID
{
  return self->_homePodAlarmID;
}

- (void)setHomePodAlarmID:(id)a3
{
  objc_storeStrong((id *)&self->_homePodAlarmID, a3);
}

- (BOOL)alarmDeletedSuccessfully
{
  return self->_alarmDeletedSuccessfully;
}

- (void)setAlarmDeletedSuccessfully:(BOOL)a3
{
  self->_alarmDeletedSuccessfully = a3;
}

- (BOOL)isMusicAlarm
{
  return self->_isMusicAlarm;
}

- (void)setIsMusicAlarm:(BOOL)a3
{
  self->_isMusicAlarm = a3;
}

- (BOOL)hasCustomVolume
{
  return self->_hasCustomVolume;
}

- (void)setHasCustomVolume:(BOOL)a3
{
  self->_hasCustomVolume = a3;
}

- (float)customVolumeLevel
{
  return self->_customVolumeLevel;
}

- (void)setCustomVolumeLevel:(float)a3
{
  self->_customVolumeLevel = a3;
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
  objc_storeStrong((id *)&self->_homePodAlarmID, 0);
}

@end
