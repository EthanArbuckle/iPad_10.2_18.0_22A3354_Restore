@implementation HMDEntryExitLogEvent

- (HMDEntryExitLogEvent)initWithReason:(unint64_t)a3 isFalse:(BOOL)a4 lastFired:(double)a5 isInitial:(BOOL)a6
{
  HMDEntryExitLogEvent *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDEntryExitLogEvent;
  result = -[HMMLogEvent init](&v11, sel_init);
  if (result)
  {
    result->_isEntry = a3 == 0;
    result->_isExit = a3 == 1;
    result->_secondsLastFired = a5;
    result->_isFalse = a4;
    result->_isInitial = a6;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.entryExit");
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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[7];
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  if (-[HMDEntryExitLogEvent isInitial](self, "isInitial"))
  {
    v18[0] = CFSTR("isEntry_INT");
    if (-[HMDEntryExitLogEvent isEntry](self, "isEntry"))
      v3 = &unk_24E96D550;
    else
      v3 = &unk_24E96D568;
    v19[0] = v3;
    v18[1] = CFSTR("isEntry_BOOL");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEntryExitLogEvent isEntry](self, "isEntry"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v4;
    v18[2] = CFSTR("isExit_INT");
    if (-[HMDEntryExitLogEvent isExit](self, "isExit"))
      v5 = &unk_24E96D550;
    else
      v5 = &unk_24E96D568;
    v19[2] = v5;
    v18[3] = CFSTR("isExit_BOOL");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEntryExitLogEvent isExit](self, "isExit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v6;
    v18[4] = CFSTR("isFalse_INT");
    if (-[HMDEntryExitLogEvent isFalse](self, "isFalse"))
      v7 = &unk_24E96D550;
    else
      v7 = &unk_24E96D568;
    v19[4] = v7;
    v18[5] = CFSTR("isFalse_BOOL");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEntryExitLogEvent isFalse](self, "isFalse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16[0] = CFSTR("isEntry_INT");
    if (-[HMDEntryExitLogEvent isEntry](self, "isEntry"))
      v10 = &unk_24E96D550;
    else
      v10 = &unk_24E96D568;
    v17[0] = v10;
    v16[1] = CFSTR("isEntry_BOOL");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEntryExitLogEvent isEntry](self, "isEntry"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v4;
    v16[2] = CFSTR("isExit_INT");
    if (-[HMDEntryExitLogEvent isExit](self, "isExit"))
      v11 = &unk_24E96D550;
    else
      v11 = &unk_24E96D568;
    v17[2] = v11;
    v16[3] = CFSTR("isExit_BOOL");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEntryExitLogEvent isExit](self, "isExit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v6;
    v16[4] = CFSTR("isFalse_INT");
    if (-[HMDEntryExitLogEvent isFalse](self, "isFalse"))
      v12 = &unk_24E96D550;
    else
      v12 = &unk_24E96D568;
    v17[4] = v12;
    v16[5] = CFSTR("isFalse_BOOL");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEntryExitLogEvent isFalse](self, "isFalse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v8;
    v16[6] = CFSTR("secondsLastFired_DOUBLE");
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[HMDEntryExitLogEvent secondsLastFired](self, "secondsLastFired");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDictionary *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)isEntry
{
  return self->_isEntry;
}

- (BOOL)isExit
{
  return self->_isExit;
}

- (BOOL)isFalse
{
  return self->_isFalse;
}

- (BOOL)isInitial
{
  return self->_isInitial;
}

- (double)secondsLastFired
{
  return self->_secondsLastFired;
}

+ (id)entryLogEvent:(double)a3 isFalse:(BOOL)a4 isInitial:(BOOL)a5
{
  return -[HMDEntryExitLogEvent initWithReason:isFalse:lastFired:isInitial:]([HMDEntryExitLogEvent alloc], "initWithReason:isFalse:lastFired:isInitial:", 0, a4, a5, a3);
}

+ (id)exitLogEvent:(double)a3 isFalse:(BOOL)a4 isInitial:(BOOL)a5
{
  return -[HMDEntryExitLogEvent initWithReason:isFalse:lastFired:isInitial:]([HMDEntryExitLogEvent alloc], "initWithReason:isFalse:lastFired:isInitial:", 1, a4, a5, a3);
}

@end
