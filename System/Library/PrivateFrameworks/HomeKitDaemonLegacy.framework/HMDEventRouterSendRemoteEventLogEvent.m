@implementation HMDEventRouterSendRemoteEventLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.eventrouter.topic.remote.event.send");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("eventTopic");
  -[HMDEventRouterSendRemoteEventLogEvent topic](self, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("sourceDeviceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDEventRouterSendRemoteEventLogEvent sourceDeviceType](self, "sourceDeviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("destinationDeviceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDEventRouterSendRemoteEventLogEvent destinationDeviceType](self, "destinationDeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("isCachedEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEventRouterSendRemoteEventLogEvent isCachedEvent](self, "isCachedEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("responseMessageType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDEventRouterSendRemoteEventLogEvent responseMessageType](self, "responseMessageType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (HMDEventRouterSendRemoteEventLogEvent)initWithTopic:(id)a3 sourceDeviceType:(unint64_t)a4 destinationDeviceType:(unint64_t)a5 isCachedEvent:(BOOL)a6 responseMessageType:(unint64_t)a7
{
  id v12;
  HMDEventRouterSendRemoteEventLogEvent *v13;
  uint64_t v14;
  NSString *topic;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDEventRouterSendRemoteEventLogEvent;
  v13 = -[HMMLogEvent init](&v17, sel_init);
  if (v13)
  {
    +[HMDEventRouterLogEventUtilities sanitizedTopicFromTopic:](HMDEventRouterLogEventUtilities, "sanitizedTopicFromTopic:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    topic = v13->_topic;
    v13->_topic = (NSString *)v14;

    v13->_sourceDeviceType = a4;
    v13->_destinationDeviceType = a5;
    v13->_isCachedEvent = a6;
    v13->_responseMessageType = a7;
  }

  return v13;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (unint64_t)destinationDeviceType
{
  return self->_destinationDeviceType;
}

- (BOOL)isCachedEvent
{
  return self->_isCachedEvent;
}

- (unint64_t)responseMessageType
{
  return self->_responseMessageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
