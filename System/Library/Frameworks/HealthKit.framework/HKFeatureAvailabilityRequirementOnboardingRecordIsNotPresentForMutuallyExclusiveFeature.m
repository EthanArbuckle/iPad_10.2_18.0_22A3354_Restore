@implementation HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("OnboardingRecordIsNotPresentForMutuallyExclusiveFeature");
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "featureAvailabilityProvidingDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityOnboardingRecordRequirement featureIdentifier](self, "featureIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __122__HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature_registerObserver_forDataSource___block_invoke;
  v12[3] = &unk_1E37EA6D0;
  v13 = v7;
  v14 = a2;
  v12[4] = self;
  v11 = v7;
  objc_msgSend(v9, "registerObserver:forKey:newValueHandler:", v8, v10, v12);

}

void __122__HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature.m"), 29, CFSTR("[%@] Onboarding record should never be nil"), objc_opt_class());

  }
  objc_msgSend(*(id *)(a1 + 32), "isSatisfiedWithOnboardingRecord:dataSource:error:", v5, *(_QWORD *)(a1 + 40), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature.m"), 33, CFSTR("Checking satisfaction using known onboarding record should never fail"));

  }
  objc_msgSend(v9, "featureAvailabilityRequirement:didUpdateSatisfaction:", *(_QWORD *)(a1 + 32), objc_msgSend(v6, "BOOLValue"));

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a4, "featureAvailabilityProvidingDataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityOnboardingRecordRequirement featureIdentifier](self, "featureIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterObserver:forKey:", v6, v7);

}

@end
