@implementation HMDEventRouterMessageFragmentationLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.eventrouter.message.fragmentation");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEventRouterMessageFragmentationLogEvent isCachedEventQueue](self, "isCachedEventQueue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isCachedEventQueue_BOOL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEventRouterMessageFragmentationLogEvent isFragmented](self, "isFragmented"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isFragmented_BOOL"));

  if (-[HMDEventRouterMessageFragmentationLogEvent isCachedEventQueue](self, "isCachedEventQueue"))
    v6 = &unk_1E8B32D30;
  else
    v6 = &unk_1E8B32D48;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isCachedEventQueue_INT"));
  if (-[HMDEventRouterMessageFragmentationLogEvent isFragmented](self, "isFragmented"))
    v7 = &unk_1E8B32D30;
  else
    v7 = &unk_1E8B32D48;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isFragmented_INT"));
  return (NSDictionary *)v3;
}

- (HMDEventRouterMessageFragmentationLogEvent)initWithIsCachedEventQueue:(BOOL)a3 isFragmented:(BOOL)a4
{
  HMDEventRouterMessageFragmentationLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDEventRouterMessageFragmentationLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_isCachedEventQueue = a3;
    result->_isFragmented = a4;
  }
  return result;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)isCachedEventQueue
{
  return self->_isCachedEventQueue;
}

- (BOOL)isFragmented
{
  return self->_isFragmented;
}

@end
