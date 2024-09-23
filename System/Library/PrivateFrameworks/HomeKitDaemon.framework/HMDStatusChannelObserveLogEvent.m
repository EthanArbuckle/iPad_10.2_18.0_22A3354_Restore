@implementation HMDStatusChannelObserveLogEvent

- (HMDStatusChannelObserveLogEvent)initWithChannelPrefix:(id)a3
{
  return -[HMDStatusChannelObserveLogEvent initWithChannelPrefix:count:](self, "initWithChannelPrefix:count:", a3, 1);
}

- (HMDStatusChannelObserveLogEvent)initWithChannelPrefix:(id)a3 count:(int64_t)a4
{
  id v7;
  HMDStatusChannelObserveLogEvent *v8;
  HMDStatusChannelObserveLogEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDStatusChannelObserveLogEvent;
  v8 = -[HMMLogEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_channelPrefix, a3);
    v9->_count = a4;
  }

  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.statuskit.channel.observe");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDStatusChannelObserveLogEvent count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("observeCount"));

  if (-[HMDStatusChannelObserveLogEvent count](self, "count"))
  {
    -[HMDStatusChannelObserveLogEvent channelPrefix](self, "channelPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("channelPrefix"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)channelPrefix
{
  return self->_channelPrefix;
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChannelPrefix:count:", 0, 0);
}

@end
