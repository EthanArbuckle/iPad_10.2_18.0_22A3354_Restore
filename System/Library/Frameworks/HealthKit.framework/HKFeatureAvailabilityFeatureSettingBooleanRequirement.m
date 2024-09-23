@implementation HKFeatureAvailabilityFeatureSettingBooleanRequirement

- (HKFeatureAvailabilityFeatureSettingBooleanRequirement)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4 settingsValue:(BOOL)a5 isSatisfiedWhenSettingIsAbsent:(BOOL)a6
{
  id v10;
  HKFeatureAvailabilityFeatureSettingBooleanRequirement *v11;
  uint64_t v12;
  NSString *settingsKey;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  v11 = -[HKFeatureAvailabilityOnboardingRecordRequirement initWithFeatureIdentifier:](&v15, sel_initWithFeatureIdentifier_, a3);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    settingsKey = v11->_settingsKey;
    v11->_settingsKey = (NSString *)v12;

    v11->_settingsValue = a5;
    v11->_isSatisfiedWhenSettingIsAbsent = a6;
  }

  return v11;
}

- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "featureSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "featureSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberForKey:", self->_settingsKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_settingsValue == objc_msgSend(v9, "BOOLValue"));
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSatisfiedWhenSettingIsAbsent);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSatisfiedWhenSettingIsAbsent);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  if (-[HKFeatureAvailabilityOnboardingRecordRequirement isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[NSString isEqualToString:](self->_settingsKey, "isEqualToString:", v5[3])
      && self->_settingsValue == *((unsigned __int8 *)v5 + 16)
      && self->_isSatisfiedWhenSettingIsAbsent == *((unsigned __int8 *)v5 + 17);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  v3 = -[HKFeatureAvailabilityOnboardingRecordRequirement hash](&v5, sel_hash);
  return -[NSString hash](self->_settingsKey, "hash") ^ v3 ^ self->_settingsValue ^ self->_isSatisfiedWhenSettingIsAbsent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  v4 = a3;
  -[HKFeatureAvailabilityOnboardingRecordRequirement encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HKFeatureAvailabilityFeatureSettingBooleanRequirement settingsKey](self, "settingsKey", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("settingsKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HKFeatureAvailabilityFeatureSettingBooleanRequirement settingsValue](self, "settingsValue"), CFSTR("settingsValueKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HKFeatureAvailabilityFeatureSettingBooleanRequirement isSatisfiedWhenSettingIsAbsent](self, "isSatisfiedWhenSettingIsAbsent"), CFSTR("isSatisfiedWhenSettingIsAbsent"));

}

- (HKFeatureAvailabilityFeatureSettingBooleanRequirement)initWithCoder:(id)a3
{
  id v4;
  HKFeatureAvailabilityFeatureSettingBooleanRequirement *v5;
  uint64_t v6;
  NSString *settingsKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  v5 = -[HKFeatureAvailabilityOnboardingRecordRequirement initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    settingsKey = v5->_settingsKey;
    v5->_settingsKey = (NSString *)v6;

    v5->_settingsValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("settingsValueKey"));
    v5->_isSatisfiedWhenSettingIsAbsent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSatisfiedWhenSettingIsAbsent"));
  }

  return v5;
}

- (NSString)settingsKey
{
  return self->_settingsKey;
}

- (BOOL)settingsValue
{
  return self->_settingsValue;
}

- (BOOL)isSatisfiedWhenSettingIsAbsent
{
  return self->_isSatisfiedWhenSettingIsAbsent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsKey, 0);
}

@end
