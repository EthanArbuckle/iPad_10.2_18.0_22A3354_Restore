@implementation HKFeatureAvailabilityHealthDataRequirement

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "healthDataRequirementDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isRequirementSatisfied:error:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
