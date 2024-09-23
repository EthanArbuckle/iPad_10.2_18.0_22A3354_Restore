@implementation HMDAccessCodeSetupLogEvent

- (HMDAccessCodeSetupLogEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDAccessCodeSetupLogEvent;
  return -[HMMLogEvent init](&v3, sel_init);
}

- (void)submitFailureWithReason:(unint64_t)a3 error:(id)a4
{
  id v5;
  id v6;

  self->_failureReason = a3;
  self->_success = 0;
  v5 = a4;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitLogEvent:error:", self, v5);

}

- (void)submitSuccess
{
  id v3;

  self->_failureReason = 0;
  self->_success = 1;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:", self);

}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homekit.accesscode.setup");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAccessCodeSetupLogEvent success](self, "success"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("success"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessCodeSetupLogEvent failureReason](self, "failureReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("failureReason"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)success
{
  return self->_success;
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

@end
