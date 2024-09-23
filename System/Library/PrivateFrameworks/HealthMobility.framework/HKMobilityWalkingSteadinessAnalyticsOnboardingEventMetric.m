@implementation HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric

- (HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric)initWithImproveHealthAndActivityAllowed:(BOOL)a3
{
  HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric;
  result = -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric init](&v5, sel_init);
  if (result)
    result->_improveHealthAndActivityAllowed = a3;
  return result;
}

+ (BOOL)requiresImproveHealthAndActivityAllowed
{
  return 0;
}

- (id)eventName
{
  return CFSTR("com.apple.health.walkingsteadiness.onboarding");
}

- (id)eventPayload
{
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric isImproveHealthAndActivityAllowed](self, "isImproveHealthAndActivityAllowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isImproveHealthAndActivityAllowed"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric step](self, "step");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("step"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric featureVersion](self, "featureVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("featureVersion"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric provenance](self, "provenance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("provenance"));

  +[HKMobilityAnalyticsUtilities activeWatchProductType](HKMobilityAnalyticsUtilities, "activeWatchProductType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("activeWatchProductType"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric hasDefaultHeight](self, "hasDefaultHeight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasDefaultHeight"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric hasDefaultWeight](self, "hasDefaultWeight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasDefaultWeight"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric acceptDefaultHeight](self, "acceptDefaultHeight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("acceptDefaultHeight"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric acceptDefaultWeight](self, "acceptDefaultWeight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("acceptDefaultWeight"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric acceptDefaultNotifications](self, "acceptDefaultNotifications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("acceptDefaultNotifications"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric age](self, "age");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMobilityAnalyticsUtilities payloadValueForAge:](HKMobilityAnalyticsUtilities, "payloadValueForAge:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("age"));

  -[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric biologicalSex](self, "biologicalSex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:](HKMobilityAnalyticsUtilities, "payloadStringForBiologicalSex:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("sex"));

  v18 = (void *)objc_msgSend(v3, "copy");
  return v18;
}

- (BOOL)isImproveHealthAndActivityAllowed
{
  return self->_improveHealthAndActivityAllowed;
}

- (void)setImproveHealthAndActivityAllowed:(BOOL)a3
{
  self->_improveHealthAndActivityAllowed = a3;
}

- (NSString)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (void)setFeatureVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)activeWatchProductType
{
  return self->_activeWatchProductType;
}

- (void)setActiveWatchProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)hasDefaultHeight
{
  return self->_hasDefaultHeight;
}

- (void)setHasDefaultHeight:(id)a3
{
  objc_storeStrong((id *)&self->_hasDefaultHeight, a3);
}

- (NSNumber)hasDefaultWeight
{
  return self->_hasDefaultWeight;
}

- (void)setHasDefaultWeight:(id)a3
{
  objc_storeStrong((id *)&self->_hasDefaultWeight, a3);
}

- (NSNumber)acceptDefaultHeight
{
  return self->_acceptDefaultHeight;
}

- (void)setAcceptDefaultHeight:(id)a3
{
  objc_storeStrong((id *)&self->_acceptDefaultHeight, a3);
}

- (NSNumber)acceptDefaultWeight
{
  return self->_acceptDefaultWeight;
}

- (void)setAcceptDefaultWeight:(id)a3
{
  objc_storeStrong((id *)&self->_acceptDefaultWeight, a3);
}

- (NSNumber)acceptDefaultNotifications
{
  return self->_acceptDefaultNotifications;
}

- (void)setAcceptDefaultNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_acceptDefaultNotifications, a3);
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
  objc_storeStrong((id *)&self->_age, a3);
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
  objc_storeStrong((id *)&self->_biologicalSex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_acceptDefaultNotifications, 0);
  objc_storeStrong((id *)&self->_acceptDefaultWeight, 0);
  objc_storeStrong((id *)&self->_acceptDefaultHeight, 0);
  objc_storeStrong((id *)&self->_hasDefaultWeight, 0);
  objc_storeStrong((id *)&self->_hasDefaultHeight, 0);
  objc_storeStrong((id *)&self->_activeWatchProductType, 0);
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

@end
