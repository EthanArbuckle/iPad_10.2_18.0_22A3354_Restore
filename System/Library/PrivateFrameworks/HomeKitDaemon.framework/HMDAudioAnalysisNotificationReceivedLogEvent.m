@implementation HMDAudioAnalysisNotificationReceivedLogEvent

- (HMDAudioAnalysisNotificationReceivedLogEvent)initWithReason:(unint64_t)a3 state:(unint64_t)a4 notificationSentDate:(id)a5
{
  id v9;
  HMDAudioAnalysisNotificationReceivedLogEvent *v10;
  HMDAudioAnalysisNotificationReceivedLogEvent *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisNotificationReceivedLogEvent;
  v10 = -[HMMLogEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_state = a4;
    v10->_reason = a3;
    objc_storeStrong((id *)&v10->_notificationSentDate, a5);
  }

  return v11;
}

- (void)markEndTime
{
  NSDate *v3;
  NSDate *endDate;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDAudioAnalysisNotificationReceivedLogEvent;
  -[HMMLogEvent markEndTime](&v5, sel_markEndTime);
  os_unfair_lock_lock_with_options();
  if (!self->_endDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v3;

  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)endDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_endDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)latency
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!-[HMMLogEvent isSubmitted](self, "isSubmitted"))
    return 0.0;
  -[HMDAudioAnalysisNotificationReceivedLogEvent endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisNotificationReceivedLogEvent notificationSentDate](self, "notificationSentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.audio.analysis.notification.received.log-event");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("latency");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAudioAnalysisNotificationReceivedLogEvent latency](self, "latency");
  objc_msgSend(v3, "numberWithInteger:", (uint64_t)(v4 * 1000.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("reason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationReceivedLogEvent reason](self, "reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("state");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationReceivedLogEvent state](self, "state"));
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

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDate)notificationSentDate
{
  return self->_notificationSentDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSentDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end
