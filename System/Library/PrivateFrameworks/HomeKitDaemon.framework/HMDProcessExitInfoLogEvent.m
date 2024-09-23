@implementation HMDProcessExitInfoLogEvent

- (HMDProcessExitInfoLogEvent)initWithExitType:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  HMDProcessExitInfoLogEvent *v9;
  HMDProcessExitInfoLogEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDProcessExitInfoLogEvent;
  v9 = -[HMMLogEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exitType, a3);
    objc_storeStrong((id *)&v10->_exitReason, a4);
  }

  return v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.processLaunch.exitInfo");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("exitType");
  -[HMDProcessExitInfoLogEvent exitType](self, "exitType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[HMDProcessExitInfoLogEvent exitType](self, "exitType");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("exitReason");
  -[HMDProcessExitInfoLogEvent exitReason](self, "exitReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[HMDProcessExitInfoLogEvent exitReason](self, "exitReason");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("exitCount");
  v10[1] = v6;
  v10[2] = &unk_24E96A688;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)exitType
{
  return self->_exitType;
}

- (NSString)exitReason
{
  return self->_exitReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReason, 0);
  objc_storeStrong((id *)&self->_exitType, 0);
}

@end
