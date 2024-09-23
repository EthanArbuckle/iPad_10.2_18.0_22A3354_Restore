@implementation HDHearingProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  return 0;
}

- (HDHearingProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDHearingProfileExtension *v5;
  HDAudioAnalyticsManager *v6;
  HDAudioAnalyticsManager *analyticsManager;
  HDHeadphoneDoseManager *v8;
  HDHeadphoneDoseManager *headphoneDoseManager;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  HDHearingProfileExtension *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDHearingProfileExtension;
  v5 = -[HDHearingProfileExtension init](&v16, sel_init);
  if (v5)
  {
    v6 = -[HDAudioAnalyticsManager initWithProfile:]([HDAudioAnalyticsManager alloc], "initWithProfile:", v4);
    analyticsManager = v5->_analyticsManager;
    v5->_analyticsManager = v6;

    v8 = -[HDHeadphoneDoseManager initWithProfile:]([HDHeadphoneDoseManager alloc], "initWithProfile:", v4);
    headphoneDoseManager = v5->_headphoneDoseManager;
    v5->_headphoneDoseManager = v8;

    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = objc_opt_class();
      v13 = objc_msgSend(v4, "profileType");
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2048;
      v20 = v13;
      _os_log_impl(&dword_21A0AA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Plugin loaded for profileType %ld", buf, 0x16u);

    }
    v14 = v5;
  }

  return v5;
}

- (HDHeadphoneDoseManager)headphoneDoseManager
{
  return self->_headphoneDoseManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headphoneDoseManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end
