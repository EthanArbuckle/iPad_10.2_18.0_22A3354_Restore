@implementation HMDAudioAnalysisNotificationSentLogEvent

- (HMDAudioAnalysisNotificationSentLogEvent)initWithDate:(id)a3 reason:(unint64_t)a4 state:(unint64_t)a5
{
  id v9;
  HMDAudioAnalysisNotificationSentLogEvent *v10;
  HMDAudioAnalysisNotificationSentLogEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisNotificationSentLogEvent;
  v10 = -[HMMLogEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dateOfOccurrence, a3);
    v11->_reason = a4;
    v11->_state = a5;
  }

  return v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.audio.analysis.notification.sent.log-event");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationSentLogEvent reason](self, "reason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("state");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisNotificationSentLogEvent state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDate)dateOfOccurrence
{
  return self->_dateOfOccurrence;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
