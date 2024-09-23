@implementation HKHealthStore(HKFeatureAvailabilityHealthDataSource)

- (void)featureAvailabilityProvidingForFeatureIdentifier:()HKFeatureAvailabilityHealthDataSource .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_19A0E6000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] HK_TARGET_OS_HAS_SLEEP_DAEMON true but missing getSleepFeatureAvailabilityProviding()", (uint8_t *)&v3, 0xCu);

}

- (void)featureAvailabilityProvidingForFeatureIdentifier:()HKFeatureAvailabilityHealthDataSource .cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<HKFeatureAvailabilityProviding>  _Nullable getSleepFeatureAvailabilityProviding(NSString *__strong, HKHealthStore *__strong, __strong HKFeatureIdentifier)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HKFeatureAvailabilityHealthDataSource.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
