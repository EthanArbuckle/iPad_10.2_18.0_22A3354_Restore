@implementation HMDEventRouterEventSizeLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.eventrouter.event.size");
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
  -[HMDEventRouterEventSizeLogEvent topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("eventTopic"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDEventRouterEventSizeLogEvent size](self, "size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEventRouterEventSizeLogEvent isCached](self, "isCached"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isCached_BOOL"));

  if (-[HMDEventRouterEventSizeLogEvent isCached](self, "isCached"))
    v7 = &unk_24E96B378;
  else
    v7 = &unk_24E96B390;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isCached_INT"));
  return (NSDictionary *)v3;
}

- (HMDEventRouterEventSizeLogEvent)initWithTopic:(id)a3 eventSize:(unint64_t)a4 isCached:(BOOL)a5
{
  id v9;
  HMDEventRouterEventSizeLogEvent *v10;
  HMDEventRouterEventSizeLogEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDEventRouterEventSizeLogEvent;
  v10 = -[HMMLogEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_topic, a3);
    v11->_size = a4;
    v11->_isCached = a5;
  }

  return v11;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
