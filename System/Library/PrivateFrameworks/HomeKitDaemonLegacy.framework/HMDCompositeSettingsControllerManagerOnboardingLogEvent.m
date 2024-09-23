@implementation HMDCompositeSettingsControllerManagerOnboardingLogEvent

- (HMDCompositeSettingsControllerManagerOnboardingLogEvent)initWithError:(id)a3 siriEndpointCertificationReason:(int64_t)a4
{
  id v6;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v7;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v8;
  objc_super v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCompositeSettingsControllerManagerOnboardingLogEvent;
  v7 = -[HMMLogEvent init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v10.receiver = v7;
    v10.super_class = (Class)HMDCompositeSettingsControllerManagerOnboardingLogEvent;
    -[HMMLogEvent setError:](&v10, sel_setError_, v6);
    v8->_siriEndpointCertificationReason = a4;
  }

  return v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.CompositeSettings.ControllerManager.OnboardingLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("siriEndpointCertificationReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCompositeSettingsControllerManagerOnboardingLogEvent siriEndpointCertificationReason](self, "siriEndpointCertificationReason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (int64_t)siriEndpointCertificationReason
{
  return self->_siriEndpointCertificationReason;
}

@end
