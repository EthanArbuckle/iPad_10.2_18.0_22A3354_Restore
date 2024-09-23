@implementation HMDAppleMediaAccessoryRemovalLogEvent

- (HMDAppleMediaAccessoryRemovalLogEvent)initWithIsLocalRemoval:(BOOL)a3 isLocalFallback:(BOOL)a4 isDuplicate:(BOOL)a5 duplicateCount:(int64_t)a6
{
  HMDAppleMediaAccessoryRemovalLogEvent *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessoryRemovalLogEvent;
  result = -[HMMLogEvent init](&v11, sel_init);
  if (result)
  {
    result->_isLocalRemoval = a3;
    result->_isLocalFallback = a4;
    result->_isDuplicate = a5;
    result->_duplicateCount = a6;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.homepod.removal.metric.event");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAppleMediaAccessoryRemovalLogEvent isLocalRemoval](self, "isLocalRemoval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isLocalRemoval"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAppleMediaAccessoryRemovalLogEvent isLocalFallback](self, "isLocalFallback"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isLocalFallback"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAppleMediaAccessoryRemovalLogEvent isDuplicate](self, "isDuplicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isDuplicate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDAppleMediaAccessoryRemovalLogEvent duplicateCount](self, "duplicateCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("duplicateCount"));

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (BOOL)isLocalRemoval
{
  return self->_isLocalRemoval;
}

- (BOOL)isLocalFallback
{
  return self->_isLocalFallback;
}

- (BOOL)isDuplicate
{
  return self->_isDuplicate;
}

- (int64_t)duplicateCount
{
  return self->_duplicateCount;
}

@end
