@implementation HKMCExperienceModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCExperienceModel)initWithPregnancyModeSetupCompletionSet:(id)a3
{
  id v4;
  HKMCExperienceModel *v5;
  uint64_t v6;
  NSSet *pregnancyModeSetupCompletionSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCExperienceModel;
  v5 = -[HKMCExperienceModel init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    pregnancyModeSetupCompletionSet = v5->_pregnancyModeSetupCompletionSet;
    v5->_pregnancyModeSetupCompletionSet = (NSSet *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_pregnancyModeSetupCompletionSet, CFSTR("PregnancyModeSetupCompletionSet"));
}

- (HKMCExperienceModel)initWithCoder:(id)a3
{
  id v4;
  HKMCExperienceModel *v5;
  void *v6;
  uint64_t v7;
  NSSet *pregnancyModeSetupCompletionSet;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMCExperienceModel;
  v5 = -[HKMCExperienceModel init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForSetOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("PregnancyModeSetupCompletionSet"));
    v7 = objc_claimAutoreleasedReturnValue();
    pregnancyModeSetupCompletionSet = v5->_pregnancyModeSetupCompletionSet;
    v5->_pregnancyModeSetupCompletionSet = (NSSet *)v7;

  }
  return v5;
}

- (NSSet)pregnancyModeSetupCompletionSet
{
  return self->_pregnancyModeSetupCompletionSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pregnancyModeSetupCompletionSet, 0);
}

@end
