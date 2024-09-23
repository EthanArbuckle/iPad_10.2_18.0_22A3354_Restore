@implementation HKMCPregnancyModeSetupCompletionRecord

+ (id)currentVersion
{
  return &unk_24D9AA450;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", version, CFSTR("Version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleUUID, CFSTR("SampleUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_educationalStepsReviewDate, CFSTR("EducationalStepsReviewDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configurationStepsReviewDate, CFSTR("ConfigurationStepsReviewDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pregnancyAdjustedFeaturesSet, CFSTR("_PregnancyAdjustedFeaturesSet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postPregnancyFeatureAdjustmentCompletionDate, CFSTR("_PostPregnancyFeatureAdjustmentCompletionDate"));

}

- (HKMCPregnancyModeSetupCompletionRecord)initWithCoder:(id)a3
{
  id v4;
  HKMCPregnancyModeSetupCompletionRecord *v5;
  uint64_t v6;
  NSUUID *sampleUUID;
  uint64_t v8;
  NSDate *educationalStepsReviewDate;
  uint64_t v10;
  NSDate *configurationStepsReviewDate;
  void *v12;
  uint64_t v13;
  NSSet *pregnancyAdjustedFeaturesSet;
  uint64_t v15;
  NSDate *postPregnancyFeatureAdjustmentCompletionDate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMCPregnancyModeSetupCompletionRecord;
  v5 = -[HKMCPregnancyModeSetupCompletionRecord init](&v18, sel_init);
  if (v5)
  {
    v5->_version = (NSNumber *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SampleUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sampleUUID = v5->_sampleUUID;
    v5->_sampleUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EducationalStepsReviewDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    educationalStepsReviewDate = v5->_educationalStepsReviewDate;
    v5->_educationalStepsReviewDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ConfigurationStepsReviewDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    configurationStepsReviewDate = v5->_configurationStepsReviewDate;
    v5->_configurationStepsReviewDate = (NSDate *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForSetOf:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_PregnancyAdjustedFeaturesSet"));
    v13 = objc_claimAutoreleasedReturnValue();
    pregnancyAdjustedFeaturesSet = v5->_pregnancyAdjustedFeaturesSet;
    v5->_pregnancyAdjustedFeaturesSet = (NSSet *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_PostPregnancyFeatureAdjustmentCompletionDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    postPregnancyFeatureAdjustmentCompletionDate = v5->_postPregnancyFeatureAdjustmentCompletionDate;
    v5->_postPregnancyFeatureAdjustmentCompletionDate = (NSDate *)v15;

  }
  return v5;
}

- (HKMCPregnancyModeSetupCompletionRecord)initWithVersion:(id)a3 sampleUUID:(id)a4 educationalStepsReviewDate:(id)a5 configurationStepsReviewDate:(id)a6 pregnancyAdjustedFeaturesSet:(id)a7 postPregnancyFeatureAdjustmentCompletionDate:(id)a8
{
  NSNumber *v14;
  id v15;
  id v16;
  id v17;
  HKMCPregnancyModeSetupCompletionRecord *v18;
  HKMCPregnancyModeSetupCompletionRecord *v19;
  id v21;
  id v22;
  objc_super v23;

  v14 = (NSNumber *)a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HKMCPregnancyModeSetupCompletionRecord;
  v18 = -[HKMCPregnancyModeSetupCompletionRecord init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_version = v14;
    objc_storeStrong((id *)&v18->_sampleUUID, a4);
    objc_storeStrong((id *)&v19->_educationalStepsReviewDate, a5);
    objc_storeStrong((id *)&v19->_configurationStepsReviewDate, a6);
    objc_storeStrong((id *)&v19->_pregnancyAdjustedFeaturesSet, a7);
    objc_storeStrong((id *)&v19->_postPregnancyFeatureAdjustmentCompletionDate, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  HKMCPregnancyModeSetupCompletionRecord *v4;
  HKMCPregnancyModeSetupCompletionRecord *v5;
  NSDate *educationalStepsReviewDate;
  NSDate *v7;
  NSDate *configurationStepsReviewDate;
  NSDate *v9;
  NSSet *pregnancyAdjustedFeaturesSet;
  NSSet *v11;
  NSDate *postPregnancyFeatureAdjustmentCompletionDate;
  NSDate *v13;
  char v14;

  v4 = (HKMCPregnancyModeSetupCompletionRecord *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (!-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", v5->_version))
        goto LABEL_19;
      if (!-[NSUUID isEqual:](self->_sampleUUID, "isEqual:", v5->_sampleUUID))
        goto LABEL_19;
      educationalStepsReviewDate = self->_educationalStepsReviewDate;
      v7 = v5->_educationalStepsReviewDate;
      if (educationalStepsReviewDate != v7
        && (!v7 || !-[NSDate isEqual:](educationalStepsReviewDate, "isEqual:")))
      {
        goto LABEL_19;
      }
      configurationStepsReviewDate = self->_configurationStepsReviewDate;
      v9 = v5->_configurationStepsReviewDate;
      if (configurationStepsReviewDate != v9
        && (!v9 || !-[NSDate isEqual:](configurationStepsReviewDate, "isEqual:")))
      {
        goto LABEL_19;
      }
      pregnancyAdjustedFeaturesSet = self->_pregnancyAdjustedFeaturesSet;
      v11 = v5->_pregnancyAdjustedFeaturesSet;
      if (pregnancyAdjustedFeaturesSet != v11
        && (!v11 || !-[NSSet isEqualToSet:](pregnancyAdjustedFeaturesSet, "isEqualToSet:")))
      {
        goto LABEL_19;
      }
      postPregnancyFeatureAdjustmentCompletionDate = self->_postPregnancyFeatureAdjustmentCompletionDate;
      v13 = v5->_postPregnancyFeatureAdjustmentCompletionDate;
      if (postPregnancyFeatureAdjustmentCompletionDate == v13)
      {
        v14 = 1;
        goto LABEL_20;
      }
      if (v13)
        v14 = -[NSDate isEqual:](postPregnancyFeatureAdjustmentCompletionDate, "isEqual:");
      else
LABEL_19:
        v14 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v14 = 0;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSNumber hash](self->_version, "hash");
  v4 = -[NSUUID hash](self->_sampleUUID, "hash") ^ v3;
  v5 = -[NSDate hash](self->_educationalStepsReviewDate, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_configurationStepsReviewDate, "hash");
  v7 = -[NSSet hash](self->_pregnancyAdjustedFeaturesSet, "hash");
  return v6 ^ v7 ^ -[NSDate hash](self->_postPregnancyFeatureAdjustmentCompletionDate, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSNumber *version;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  version = self->_version;
  -[NSUUID UUIDString](self->_sampleUUID, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p version:%@ sampleUUID:%@ educationalStepsReviewDate:%@ configurationStepsReviewDate:%@pregnancyAdjustedFeaturesSet:%@>postPregnancyFeatureAdjustmentCompletionDate:%@>"), v4, self, version, v6, self->_educationalStepsReviewDate, self->_configurationStepsReviewDate, self->_pregnancyAdjustedFeaturesSet, self->_postPregnancyFeatureAdjustmentCompletionDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSUUID)sampleUUID
{
  return self->_sampleUUID;
}

- (NSDate)educationalStepsReviewDate
{
  return self->_educationalStepsReviewDate;
}

- (NSDate)configurationStepsReviewDate
{
  return self->_configurationStepsReviewDate;
}

- (void)setConfigurationStepsReviewDate:(id)a3
{
  objc_storeStrong((id *)&self->_configurationStepsReviewDate, a3);
}

- (NSSet)pregnancyAdjustedFeaturesSet
{
  return self->_pregnancyAdjustedFeaturesSet;
}

- (void)setPregnancyAdjustedFeaturesSet:(id)a3
{
  objc_storeStrong((id *)&self->_pregnancyAdjustedFeaturesSet, a3);
}

- (NSDate)postPregnancyFeatureAdjustmentCompletionDate
{
  return self->_postPregnancyFeatureAdjustmentCompletionDate;
}

- (void)setPostPregnancyFeatureAdjustmentCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_postPregnancyFeatureAdjustmentCompletionDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postPregnancyFeatureAdjustmentCompletionDate, 0);
  objc_storeStrong((id *)&self->_pregnancyAdjustedFeaturesSet, 0);
  objc_storeStrong((id *)&self->_configurationStepsReviewDate, 0);
  objc_storeStrong((id *)&self->_educationalStepsReviewDate, 0);
  objc_storeStrong((id *)&self->_sampleUUID, 0);
}

@end
