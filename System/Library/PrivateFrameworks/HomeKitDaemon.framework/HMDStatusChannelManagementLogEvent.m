@implementation HMDStatusChannelManagementLogEvent

- (HMDStatusChannelManagementLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 action:(int64_t)a5
{
  return -[HMDStatusChannelManagementLogEvent initWithChannelPrefix:isRetry:action:count:](self, "initWithChannelPrefix:isRetry:action:count:", a3, a4, a5, 1);
}

- (HMDStatusChannelManagementLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 action:(int64_t)a5 count:(int64_t)a6
{
  id v11;
  HMDStatusChannelManagementLogEvent *v12;
  HMDStatusChannelManagementLogEvent *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDStatusChannelManagementLogEvent;
  v12 = -[HMMLogEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_channelPrefix, a3);
    v13->_isRetry = a4;
    v13->_action = a5;
    v13->_count = a6;
  }

  return v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.statuskit.channel.management");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDStatusChannelManagementLogEvent count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("managementActionCountAny"));

  if (-[HMDStatusChannelManagementLogEvent count](self, "count"))
  {
    -[HMDStatusChannelManagementLogEvent channelPrefix](self, "channelPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("channelPrefix"));

    if (-[HMDStatusChannelManagementLogEvent isRetry](self, "isRetry"))
      v6 = &unk_24E96D730;
    else
      v6 = &unk_24E96D718;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("operationCount"));
    if (-[HMDStatusChannelManagementLogEvent isRetry](self, "isRetry"))
      v7 = &unk_24E96D718;
    else
      v7 = &unk_24E96D730;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("operationRetryCount"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDStatusChannelManagementLogEvent isRetry](self, "isRetry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("operationRetryBool"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDStatusChannelManagementLogEvent action](self, "action"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("managementAction"));

    if (-[HMDStatusChannelManagementLogEvent action](self, "action"))
      v10 = &unk_24E96D730;
    else
      v10 = &unk_24E96D718;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("managementActionCountUnknown"));
    if (-[HMDStatusChannelManagementLogEvent action](self, "action") == 1)
      v11 = &unk_24E96D718;
    else
      v11 = &unk_24E96D730;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("managementActionCountSubscribe"));
    if (-[HMDStatusChannelManagementLogEvent action](self, "action") == 3)
      v12 = &unk_24E96D718;
    else
      v12 = &unk_24E96D730;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("managementActionCountInvite"));
    if (-[HMDStatusChannelManagementLogEvent action](self, "action") == 4)
      v13 = &unk_24E96D718;
    else
      v13 = &unk_24E96D730;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("managementActionCountRemove"));
  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v14;
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

- (int64_t)action
{
  return self->_action;
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChannelPrefix:isRetry:action:count:", 0, 0, 0, 0);
}

@end
