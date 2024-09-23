@implementation HKFeatureAvailabilityRequirementHealthAppIsNotHidden

+ (id)requirementIdentifier
{
  return CFSTR("HealthAppIsNotHidden");
}

- (id)requirementDescription
{
  return CFSTR("The Health app must not be hidden using Screen Time or other restrictions");
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "healthAppHidden") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
