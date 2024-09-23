@implementation HMDHomeKeySetupWalletLogEvent

- (HMDHomeKeySetupWalletLogEvent)initWithQueue:(id)a3
{
  id v3;
  HMDHomeKeySetupWalletLogEvent *v4;
  id v5;
  uint64_t v6;
  HMFTimer *timer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDHomeKeySetupWalletLogEvent;
  v3 = a3;
  v4 = -[HMMLogEvent init](&v9, sel_init);
  v5 = objc_alloc(MEMORY[0x24BE3F298]);
  v6 = objc_msgSend(v5, "initWithTimeInterval:options:", 0, 60.0, v9.receiver, v9.super_class);
  timer = v4->_timer;
  v4->_timer = (HMFTimer *)v6;

  -[HMFTimer setDelegate:](v4->_timer, "setDelegate:", v4);
  -[HMFTimer setDelegateQueue:](v4->_timer, "setDelegateQueue:", v3);

  return v4;
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
  return (NSString *)CFSTR("com.apple.homekit.homekey.wallet.setup");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHomeKeySetupWalletLogEvent success](self, "success"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("success"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
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
  -[HMDHomeKeySetupWalletLogEvent timer](self, "timer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDHomeKeySetupWalletLogEvent timeout](self, "timeout");
}

- (BOOL)success
{
  return self->_success;
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
}

@end
