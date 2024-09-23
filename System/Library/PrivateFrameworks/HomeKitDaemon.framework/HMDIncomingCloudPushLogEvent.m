@implementation HMDIncomingCloudPushLogEvent

- (HMDIncomingCloudPushLogEvent)initWithTopic:(id)a3
{
  id v5;
  HMDIncomingCloudPushLogEvent *v6;
  HMDIncomingCloudPushLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDIncomingCloudPushLogEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_topic, a3);

  return v7;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

+ (id)incomingCloudPush:(id)a3
{
  id v3;
  HMDIncomingCloudPushLogEvent *v4;

  v3 = a3;
  v4 = -[HMDIncomingCloudPushLogEvent initWithTopic:]([HMDIncomingCloudPushLogEvent alloc], "initWithTopic:", v3);

  return v4;
}

@end
