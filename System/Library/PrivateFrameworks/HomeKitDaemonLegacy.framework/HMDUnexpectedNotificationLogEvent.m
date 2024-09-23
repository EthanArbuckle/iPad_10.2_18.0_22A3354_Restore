@implementation HMDUnexpectedNotificationLogEvent

- (HMDUnexpectedNotificationLogEvent)initWithCount:(int64_t)a3
{
  HMDUnexpectedNotificationLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDUnexpectedNotificationLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_count = a3;
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.unexpectedNotification");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("numUnexpectedNotificationCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDUnexpectedNotificationLogEvent count](self, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (int64_t)count
{
  return self->_count;
}

@end
