@implementation HMDCompositeSettingsControllerUpdateLogEvent

- (HMDCompositeSettingsControllerUpdateLogEvent)initWithStartTime:(double)a3 keyPath:(id)a4
{
  id v7;
  HMDCompositeSettingsControllerUpdateLogEvent *v8;
  HMDCompositeSettingsControllerUpdateLogEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDCompositeSettingsControllerUpdateLogEvent;
  v8 = -[HMMLogEvent initWithStartTime:](&v11, sel_initWithStartTime_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_keyPath, a4);

  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.CompositeSettingsController.UpdateLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  const char *v3;
  void *v4;
  id Property;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v3, 40, 1);
  else
    Property = 0;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", Property, CFSTR("keyPath"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("latency"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
