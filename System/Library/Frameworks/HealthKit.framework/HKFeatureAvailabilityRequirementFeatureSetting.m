@implementation HKFeatureAvailabilityRequirementFeatureSetting

- (HKFeatureAvailabilityRequirementFeatureSetting)initWithFeatureIdentifier:(id)a3 isOnWhenSettingIsAbsent:(BOOL)a4
{
  return -[HKFeatureAvailabilityRequirementFeatureSetting initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:](self, "initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:", a3, CFSTR("Enabled"), a4);
}

- (HKFeatureAvailabilityRequirementFeatureSetting)initWithFeatureIdentifier:(id)a3 settingsOnKey:(id)a4 isOnWhenSettingIsAbsent:(BOOL)a5
{
  id v9;
  id v10;
  HKFeatureAvailabilityRequirementFeatureSetting *v11;
  HKFeatureAvailabilityRequirementFeatureSetting *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureAvailabilityRequirementFeatureSetting;
  v11 = -[HKFeatureAvailabilityRequirementFeatureSetting init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_featureIdentifier, a3);
    objc_storeStrong((id *)&v12->_settingsOnKey, a4);
    v12->_isOnWhenSettingIsAbsent = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", v5[2])
      && -[NSString isEqualToString:](self->_settingsOnKey, "isEqualToString:", v5[3])
      && self->_isOnWhenSettingIsAbsent == *((unsigned __int8 *)v5 + 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_featureIdentifier, "hash");
  return -[NSString hash](self->_settingsOnKey, "hash") ^ v3 ^ self->_isOnWhenSettingIsAbsent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *featureIdentifier;
  id v5;

  featureIdentifier = self->_featureIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", featureIdentifier, CFSTR("featureIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_settingsOnKey, CFSTR("settingsOnKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isOnWhenSettingIsAbsent, CFSTR("isOnWhenSettingIsAbsent"));

}

- (HKFeatureAvailabilityRequirementFeatureSetting)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HKFeatureAvailabilityRequirementFeatureSetting *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsOnKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOnWhenSettingIsAbsent"));

  v8 = -[HKFeatureAvailabilityRequirementFeatureSetting initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:](self, "initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:", v5, v6, v7);
  return v8;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)settingsOnKey
{
  return self->_settingsOnKey;
}

- (BOOL)isOnWhenSettingIsAbsent
{
  return self->_isOnWhenSettingIsAbsent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsOnKey, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
