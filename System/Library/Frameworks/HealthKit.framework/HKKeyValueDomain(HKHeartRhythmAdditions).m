@implementation HKKeyValueDomain(HKHeartRhythmAdditions)

- (void)hkhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:()HKHeartRhythmAdditions .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error reading first ECG onboarding completion date: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
