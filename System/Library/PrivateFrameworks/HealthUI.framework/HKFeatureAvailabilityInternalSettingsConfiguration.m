@implementation HKFeatureAvailabilityInternalSettingsConfiguration

- (HKFeatureAvailabilityInternalSettingsConfiguration)initWithFeatureIdentifier:(id)a3 userDefaultsDomain:(id)a4 userDefaultsFeatureEnabledKey:(id)a5 userDefaultsDisabledOverrideKey:(id)a6 options:(unint64_t)a7 samplesTypesToDelete:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKFeatureAvailabilityInternalSettingsConfiguration *v18;
  HKFeatureAvailabilityInternalSettingsConfiguration *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HKFeatureAvailabilityInternalSettingsConfiguration;
  v18 = -[HKFeatureAvailabilityInternalSettingsConfiguration init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_featureIdentifier, a3);
    objc_storeStrong((id *)&v19->_userDefaultsDomain, a4);
    objc_storeStrong((id *)&v19->_userDefaultsFeatureEnabledKey, a5);
    objc_storeStrong((id *)&v19->_userDefaultsDisabledOverrideKey, a6);
    v19->_options = a7;
    objc_storeStrong((id *)&v19->_samplesTypesToDelete, a8);
  }

  return v19;
}

- (BOOL)showFeatureEnable
{
  return -[HKFeatureAvailabilityInternalSettingsConfiguration options](self, "options") & 1;
}

- (BOOL)syncToWatch
{
  return (-[HKFeatureAvailabilityInternalSettingsConfiguration options](self, "options") >> 1) & 1;
}

- (BOOL)requireReboot
{
  return (-[HKFeatureAvailabilityInternalSettingsConfiguration options](self, "options") >> 2) & 1;
}

- (BOOL)showDisabledOverride
{
  return (-[HKFeatureAvailabilityInternalSettingsConfiguration options](self, "options") >> 3) & 1;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)userDefaultsDomain
{
  return self->_userDefaultsDomain;
}

- (void)setUserDefaultsDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)userDefaultsFeatureEnabledKey
{
  return self->_userDefaultsFeatureEnabledKey;
}

- (void)setUserDefaultsFeatureEnabledKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userDefaultsDisabledOverrideKey
{
  return self->_userDefaultsDisabledOverrideKey;
}

- (void)setUserDefaultsDisabledOverrideKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSArray)samplesTypesToDelete
{
  return self->_samplesTypesToDelete;
}

- (void)setSamplesTypesToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplesTypesToDelete, 0);
  objc_storeStrong((id *)&self->_userDefaultsDisabledOverrideKey, 0);
  objc_storeStrong((id *)&self->_userDefaultsFeatureEnabledKey, 0);
  objc_storeStrong((id *)&self->_userDefaultsDomain, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
