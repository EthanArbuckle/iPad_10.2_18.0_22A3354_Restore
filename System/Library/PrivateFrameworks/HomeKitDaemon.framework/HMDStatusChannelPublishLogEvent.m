@implementation HMDStatusChannelPublishLogEvent

- (HMDStatusChannelPublishLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4
{
  return -[HMDStatusChannelPublishLogEvent initWithChannelPrefix:isRetry:count:](self, "initWithChannelPrefix:isRetry:count:", a3, a4, 1);
}

- (HMDStatusChannelPublishLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 count:(int64_t)a5
{
  id v9;
  HMDStatusChannelPublishLogEvent *v10;
  HMDStatusChannelPublishLogEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDStatusChannelPublishLogEvent;
  v10 = -[HMMLogEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_channelPrefix, a3);
    v11->_isRetry = a4;
    v11->_count = a5;
  }

  return v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.statuskit.channel.publish");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDStatusChannelPublishLogEvent count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("publishCount"));

  if (-[HMDStatusChannelPublishLogEvent count](self, "count"))
  {
    -[HMDStatusChannelPublishLogEvent channelPrefix](self, "channelPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("channelPrefix"));

    if (-[HMDStatusChannelPublishLogEvent isRetry](self, "isRetry"))
      v6 = &unk_24E96D730;
    else
      v6 = &unk_24E96D718;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("publishCount"));
    if (-[HMDStatusChannelPublishLogEvent isRetry](self, "isRetry"))
      v7 = &unk_24E96D718;
    else
      v7 = &unk_24E96D730;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("publishRetryCount"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDStatusChannelPublishLogEvent isRetry](self, "isRetry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("publishRetryBool"));

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)channelPrefix
{
  return self->_channelPrefix;
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelPrefix, 0);
}

+ (id)denominatorEvent
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChannelPrefix:isRetry:count:", 0, 0, 0);
}

@end
