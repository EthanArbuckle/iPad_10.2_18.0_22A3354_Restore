@implementation HMDBackgroundTaskLogEvent

- (HMDBackgroundTaskLogEvent)initWithTask:(id)a3 didFire:(BOOL)a4 now:(id)a5
{
  id v8;
  id v9;
  HMDBackgroundTaskLogEvent *v10;
  HMDBackgroundTaskLogEvent *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackgroundTaskLogEvent;
  v10 = -[HMMLogEvent init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_didFire = a4;
    if (a4)
    {
      objc_msgSend(v8, "expectedFireDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v12);
      v11->_fireDelay = v13;

    }
    else
    {
      v10->_fireDelay = 0.0;
    }
    objc_msgSend(v8, "expectedFireDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduledDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v15);
    v11->_scheduledToExpectedFireInterval = v16;

  }
  return v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.BTMLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("fireDelay");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[HMDBackgroundTaskLogEvent fireDelay](self, "fireDelay");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("scheduledToExpectedFireInterval");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDBackgroundTaskLogEvent scheduledToExpectedFireInterval](self, "scheduledToExpectedFireInterval");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("didFire");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDBackgroundTaskLogEvent didFire](self, "didFire"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBackgroundTaskLogEvent fireDelay](self, "fireDelay");
  v5 = v4;
  -[HMDBackgroundTaskLogEvent scheduledToExpectedFireInterval](self, "scheduledToExpectedFireInterval");
  v7 = v6;
  -[HMDBackgroundTaskLogEvent didFire](self, "didFire");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDBackgroundTaskLogEvent fireDelay: %fs scheduledToExpectedFireInterval: %fs didFire: %@>"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (double)fireDelay
{
  return self->_fireDelay;
}

- (double)scheduledToExpectedFireInterval
{
  return self->_scheduledToExpectedFireInterval;
}

- (BOOL)didFire
{
  return self->_didFire;
}

@end
