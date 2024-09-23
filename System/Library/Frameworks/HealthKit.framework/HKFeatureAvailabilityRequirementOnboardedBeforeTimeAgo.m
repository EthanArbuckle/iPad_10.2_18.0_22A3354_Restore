@implementation HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo

- (HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo)initWithFeatureIdentifier:(id)a3 daysBeforeCurrentDate:(int64_t)a4
{
  HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo *v5;
  uint64_t v6;
  NSDateComponents *dateComponents;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo;
  v5 = -[HKFeatureAvailabilityOnboardingRecordRequirement initWithFeatureIdentifier:](&v9, sel_initWithFeatureIdentifier_, a3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithDays:", a4);
    v6 = objc_claimAutoreleasedReturnValue();
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v6;

  }
  return v5;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("OnboardedBeforeTimeAgo");
}

- (NSString)requirementDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingRecordRequirement featureIdentifier](self, "featureIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents debugDescription](self->_dateComponents, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Onboarding record for %@ must be before %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "onboardingCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateComponents hk_negativeComponents](self->_dateComponents, "hk_negativeComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "onboardingCompletion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completionDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithBool:", objc_msgSend(v16, "hk_isBeforeDate:", v13));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AAA0];
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSDateComponents isEqual:](self->_dateComponents, "isEqual:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSDateComponents hash](self->_dateComponents, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo;
  v4 = a3;
  -[HKFeatureAvailabilityOnboardingRecordRequirement encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateComponents, CFSTR("DateComponents"), v5.receiver, v5.super_class);

}

- (HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo)initWithCoder:(id)a3
{
  id v4;
  HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo *v5;
  uint64_t v6;
  NSDateComponents *dateComponents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo;
  v5 = -[HKFeatureAvailabilityOnboardingRecordRequirement initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateComponents"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end
