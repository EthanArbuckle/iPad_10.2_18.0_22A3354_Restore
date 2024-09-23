@implementation HMDEventRouterPostedEventLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.eventrouter.topic.eventadded");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("eventTopic");
  -[HMDEventRouterPostedEventLogEvent topic](self, "topic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDEventRouterPostedEventLogEvent)initWithTopic:(id)a3
{
  id v4;
  HMDEventRouterPostedEventLogEvent *v5;
  uint64_t v6;
  NSString *topic;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDEventRouterPostedEventLogEvent;
  v5 = -[HMMLogEvent init](&v9, sel_init);
  if (v5)
  {
    +[HMDEventRouterLogEventUtilities sanitizedTopicFromTopic:](HMDEventRouterLogEventUtilities, "sanitizedTopicFromTopic:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    topic = v5->_topic;
    v5->_topic = (NSString *)v6;

  }
  return v5;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
