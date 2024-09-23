@implementation HMDCompositeSettingsControllerFetchLogEvent

- (HMDCompositeSettingsControllerFetchLogEvent)initWithStartTime:(double)a3 keyPath:(id)a4
{
  id v7;
  HMDCompositeSettingsControllerFetchLogEvent *v8;
  HMDCompositeSettingsControllerFetchLogEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDCompositeSettingsControllerFetchLogEvent;
  v8 = -[HMMLogEvent initWithStartTime:](&v11, sel_initWithStartTime_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_keyPath, a4);

  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.CompositeSettingsController.FetchLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsControllerFetchLogEvent keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("keyPath"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("latency"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
