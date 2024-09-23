@implementation HMDPreferencesSizeLogEvent

- (HMDPreferencesSizeLogEvent)initWithApplicationID:(id)a3 preferencesKey:(id)a4 preferencesSize:(unint64_t)a5 eventTrigger:(unint64_t)a6
{
  id v11;
  id v12;
  HMDPreferencesSizeLogEvent *v13;
  HMDPreferencesSizeLogEvent *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDPreferencesSizeLogEvent;
  v13 = -[HMMLogEvent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_applicationID, a3);
    objc_storeStrong((id *)&v14->_preferencesKey, a4);
    v14->_preferencesSize = a5;
    v14->_eventTrigger = a6;
  }

  return v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.preferences.size");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPreferencesSizeLogEvent applicationID](self, "applicationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("applicationID"));

  -[HMDPreferencesSizeLogEvent preferencesKey](self, "preferencesKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("preferencesKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDPreferencesSizeLogEvent preferencesSize](self, "preferencesSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("preferencesSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDPreferencesSizeLogEvent eventTrigger](self, "eventTrigger"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eventTrigger"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v8;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)preferencesKey
{
  return self->_preferencesKey;
}

- (unint64_t)preferencesSize
{
  return self->_preferencesSize;
}

- (unint64_t)eventTrigger
{
  return self->_eventTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesKey, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

@end
