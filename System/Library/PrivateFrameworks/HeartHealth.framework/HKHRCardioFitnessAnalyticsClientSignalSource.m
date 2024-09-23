@implementation HKHRCardioFitnessAnalyticsClientSignalSource

- (HKHRCardioFitnessAnalyticsClientSignalSource)initWithHealthStore:(id)a3
{
  id v5;
  HKHRCardioFitnessAnalyticsClientSignalSource *v6;
  HKHRCardioFitnessAnalyticsClientSignalSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRCardioFitnessAnalyticsClientSignalSource;
  v6 = -[HKHRCardioFitnessAnalyticsClientSignalSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_healthStore, a3);

  return v7;
}

- (int64_t)bucketedAgeWithError:(id *)a3
{
  HKHealthStore *healthStore;
  void *v6;
  id v7;
  int64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  HKHRCardioFitnessAnalyticsClientSignalSource *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  healthStore = self->_healthStore;
  v11 = 0;
  -[HKHealthStore dateOfBirthComponentsWithError:](healthStore, "dateOfBirthComponentsWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HKHRCardioFitnessAnalyticsClientSignalSource bucketedAgeWithError:].cold.1();
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
LABEL_11:
    v8 = HKHRCardioFitnessAnalyticsBoundedIntegerErrorSentinel;
    goto LABEL_12;
  }
  if (!v6)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1D7781000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No date of birth components, returning invalid value", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v8 = -[HKHRCardioFitnessAnalyticsSignalSource bucketedAgeForDateOfBirthComponents:](self, "bucketedAgeForDateOfBirthComponents:", v6);
LABEL_12:

  return v8;
}

- (id)biologicalSexStringWithError:(id *)a3
{
  HKHealthStore *healthStore;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  HKHRCardioFitnessAnalyticsClientSignalSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  healthStore = self->_healthStore;
  v13 = 0;
  -[HKHealthStore biologicalSexWithError:](healthStore, "biologicalSexWithError:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v7)
  {
    if (v6)
    {
      v9 = objc_msgSend(v6, "biologicalSex");
      goto LABEL_12;
    }
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1D7781000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No biological sex object, returning value for not set", buf, 0xCu);
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    -[HKHRCardioFitnessAnalyticsClientSignalSource biologicalSexStringWithError:].cold.1();
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_11;
  }
  v8 = objc_retainAutorelease(v7);
  v9 = 0;
  *a3 = v8;
LABEL_12:
  -[HKHRCardioFitnessAnalyticsSignalSource biologicalSexStringForBiologicalSex:](self, "biologicalSexStringForBiologicalSex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)bucketedAgeWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%{public}@]: Error when retrieving date of birth components: %{public}@");
}

- (void)biologicalSexStringWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%{public}@]: Error when retrieving biological sex, returning not set: %{public}@");
}

@end
