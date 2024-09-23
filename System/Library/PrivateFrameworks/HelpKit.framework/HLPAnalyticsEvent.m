@implementation HLPAnalyticsEvent

+ (id)event
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)caRepresentation
{
  void *v2;
  void *v3;

  +[HLPAnalyticsEventController sharedInstance](HLPAnalyticsEventController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)log
{
  id v3;

  +[HLPAnalyticsEventController sharedInstance](HLPAnalyticsEventController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logAnalyticsEvent:", self);

}

- (NSString)eventName
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
