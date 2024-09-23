@implementation HKFeatureAvailabilityRequirementNotInStoreDemoMode

+ (id)requirementIdentifier
{
  return CFSTR("NotInStoreDemoMode");
}

- (id)requirementDescription
{
  return CFSTR("This device must not be running in store demo mode.");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRunningStoreDemoMode");
  if (v6)
  {
    if (!v9)
    {
      objc_msgSend(v4, "behavior");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithInt:", objc_msgSend(v13, "runningInStoreDemoModeF201") ^ 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v10 = v7;
    v11 = 0;
  }
  else
  {
    v11 = v9 ^ 1u;
    v10 = v7;
  }
  objc_msgSend(v10, "numberWithInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
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
