@implementation HMDHomeKeySetupLockLogEvent

- (HMDHomeKeySetupLockLogEvent)initWithAccessoryUUID:(id)a3 withKeyType:(unint64_t)a4 expectedCount:(int64_t)a5 queue:(id)a6
{
  NSUUID *v10;
  id v11;
  HMDHomeKeySetupLockLogEvent *v12;
  NSUUID *accessoryUUID;
  NSUUID *v14;
  id v15;
  uint64_t v16;
  HMFTimer *timer;
  objc_super v19;

  v10 = (NSUUID *)a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDHomeKeySetupLockLogEvent;
  v11 = a6;
  v12 = -[HMMLogEvent init](&v19, sel_init);
  accessoryUUID = v12->_accessoryUUID;
  v12->_accessoryUUID = v10;
  v14 = v10;

  v12->_keyType = a4;
  v12->_expectedCount = a5;
  v12->_completedCount = 0;
  v15 = objc_alloc(MEMORY[0x24BE3F298]);
  v16 = objc_msgSend(v15, "initWithTimeInterval:options:", 0, 60.0, v19.receiver, v19.super_class);
  timer = v12->_timer;
  v12->_timer = (HMFTimer *)v16;

  -[HMFTimer setDelegate:](v12->_timer, "setDelegate:", v12);
  -[HMFTimer setDelegateQueue:](v12->_timer, "setDelegateQueue:", v11);

  return v12;
}

- (BOOL)incrementCompleted
{
  int64_t v3;
  int64_t v4;

  -[HMDHomeKeySetupLockLogEvent setCompletedCount:](self, "setCompletedCount:", -[HMDHomeKeySetupLockLogEvent completedCount](self, "completedCount") + 1);
  v3 = -[HMDHomeKeySetupLockLogEvent completedCount](self, "completedCount");
  v4 = -[HMDHomeKeySetupLockLogEvent expectedCount](self, "expectedCount");
  if (v3 == v4)
    -[HMDHomeKeySetupLockLogEvent submitSuccess](self, "submitSuccess");
  return v3 == v4;
}

- (void)submitSuccess
{
  id v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_timeout, 0);
  self->_success = 1;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:", self);

}

- (void)timeout
{
  void *v3;
  id v4;

  self->_success = 0;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:error:", self, v3);

}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homekit.homekey.lock.setup");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomeKeySetupLockLogEvent success](self, "success"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("success"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomeKeySetupLockLogEvent expectedCount](self, "expectedCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("expectedCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomeKeySetupLockLogEvent completedCount](self, "completedCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("completedCount"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v8;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHomeKeySetupLockLogEvent timer](self, "timer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDHomeKeySetupLockLogEvent timeout](self, "timeout");
}

- (BOOL)success
{
  return self->_success;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)keyType
{
  return self->_keyType;
}

- (int64_t)expectedCount
{
  return self->_expectedCount;
}

- (void)setExpectedCount:(int64_t)a3
{
  self->_expectedCount = a3;
}

- (int64_t)completedCount
{
  return self->_completedCount;
}

- (void)setCompletedCount:(int64_t)a3
{
  self->_completedCount = a3;
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
