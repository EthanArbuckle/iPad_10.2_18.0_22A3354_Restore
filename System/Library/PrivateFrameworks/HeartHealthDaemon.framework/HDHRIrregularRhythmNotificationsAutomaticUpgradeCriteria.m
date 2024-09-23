@implementation HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria

- (HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria)initWithV1FeatureAvailabilityManager:(id)a3
{
  id v5;
  HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria *v6;
  HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria;
  v6 = -[HDHRIrregularRhythmNotificationsAutomaticUpgradeCriteria init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_v1FeatureAvailabilityManager, a3);

  return v7;
}

- (int64_t)isBackgroundDeliverySupportedWithError:(id *)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HDFeatureAvailabilityExtension onboardedCountryCodeSupportedStateWithError:](self->_v1FeatureAvailabilityManager, "onboardedCountryCodeSupportedStateWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "integerValue") == 1)
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager
{
  return self->_v1FeatureAvailabilityManager;
}

- (void)setV1FeatureAvailabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
}

@end
