@implementation HKFeatureAvailabilityRequirementProfileIsNotFamilySetupPairingProfile

+ (id)requirementIdentifier
{
  return CFSTR("ProfileIsNotFamilySetupPairingProfile");
}

- (id)requirementDescription
{
  void *v2;
  int v3;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  if (v3)
    return CFSTR("This watch must not be part of a Family Setup pairing");
  else
    return CFSTR("The profile must be the primary profile");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  v7 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
  {
    objc_msgSend(v4, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "tinkerModeEnabled") ^ 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "healthDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "profileIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInt:", objc_msgSend(v10, "type") == 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
