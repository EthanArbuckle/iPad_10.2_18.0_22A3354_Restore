@implementation HDHRCardioFitnessAnalyticsSignalSource

- (HDHRCardioFitnessAnalyticsSignalSource)initWithProfile:(id)a3
{
  id v4;
  HDHRCardioFitnessAnalyticsSignalSource *v5;
  HDHRCardioFitnessAnalyticsSignalSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHRCardioFitnessAnalyticsSignalSource;
  v5 = -[HDHRCardioFitnessAnalyticsSignalSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (int64_t)bucketedAgeWithError:(id *)a3
{
  void *v4;
  int64_t v5;
  NSObject *v6;
  int v8;
  HDHRCardioFitnessAnalyticsSignalSource *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HDHRCardioFitnessAnalyticsSignalSource _birthDateComponentsWithError:](self, "_birthDateComponentsWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[HKHRCardioFitnessAnalyticsSignalSource bucketedAgeForDateOfBirthComponents:](self, "bucketedAgeForDateOfBirthComponents:", v4);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No date of birth components, returning invalid value", (uint8_t *)&v8, 0xCu);
    }
    v5 = *MEMORY[0x1E0D2FB00];
  }

  return v5;
}

- (id)biologicalSexStringWithError:(id *)a3
{
  return -[HKHRCardioFitnessAnalyticsSignalSource biologicalSexStringForBiologicalSex:](self, "biologicalSexStringForBiologicalSex:", -[HDHRCardioFitnessAnalyticsSignalSource _biologicalSexWithError:](self, "_biologicalSexWithError:", a3));
}

- (id)latestClassificationWithIsOnboarded:(BOOL)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  int64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  id v36;
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsSignalSource *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v36 = 0;
    -[HDHRCardioFitnessAnalyticsSignalSource _birthDateComponentsWithError:](self, "_birthDateComponentsWithError:", &v36);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v36;
    if (v7)
    {
      v8 = v7;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessAnalyticsSignalSource latestClassificationWithIsOnboarded:error:].cold.3();
      if (a4)
        *a4 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();

      v10 = 0;
    }
    else if (v6)
    {
      v11 = -[HDHRCardioFitnessAnalyticsSignalSource _biologicalSexWithError:](self, "_biologicalSexWithError:", a4);
      v35 = 0;
      -[HDHRCardioFitnessAnalyticsSignalSource _latestCardioFitnessValueWithError:](self, "_latestCardioFitnessValueWithError:", &v35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v35;
      if (v13)
      {
        if (a4)
        {
          v10 = 0;
          *a4 = objc_retainAutorelease(v13);
        }
        else
        {
          _HKLogDroppedError();
          v10 = 0;
        }
      }
      else if (v12)
      {
        objc_msgSend(v12, "startDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v6, "hk_ageWithCurrentDate:", v21);

        objc_msgSend(v12, "quantity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ml/kg*min"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValueForUnit:", v24);
        v26 = v25;

        -[HDHRCardioFitnessAnalyticsSignalSource _classificationStringForCardioFitnessValue:age:biologicalSex:](self, "_classificationStringForCardioFitnessValue:age:biologicalSex:", v22, v11, v26);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E0CB52E8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
          -[HDHRCardioFitnessAnalyticsSignalSource latestClassificationWithIsOnboarded:error:].cold.1((uint64_t)self, v27, v28, v29, v30, v31, v32, v33);
        v10 = CFSTR("no classification");
      }

    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        -[HDHRCardioFitnessAnalyticsSignalSource latestClassificationWithIsOnboarded:error:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
      v10 = CFSTR("no classification");
    }

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v38 = self;
      _os_log_impl(&dword_1CC29C000, v9, OS_LOG_TYPE_INFO, "[%{public}@] User is not onboarded, will not report classifciation", buf, 0xCu);
    }
    v10 = CFSTR("not onboarded");
  }
  return v10;
}

- (id)_latestCardioFitnessValueWithError:(id *)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v12;

  v5 = (void *)MEMORY[0x1E0D29578];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v12 = 0;
  objc_msgSend(v5, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v6, WeakRetained, 0, 0, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HDHRCardioFitnessAnalyticsSignalSource _latestCardioFitnessValueWithError:].cold.1();
    if (a3)
    {
      v10 = 0;
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (id)_classificationStringForCardioFitnessValue:(double)a3 age:(int64_t)a4 biologicalSex:(int64_t)a5
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessLevelForVO2Max:biologicalSex:age:", a5, a4, a3);
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "analyticsStringForLevel:", v5);
}

- (id)_birthDateComponentsWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB6390], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "userCharacteristicForType:error:", v5, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HDHRCardioFitnessAnalyticsSignalSource _birthDateComponentsWithError:].cold.1();
    if (a3)
    {
      v10 = 0;
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (int64_t)_biologicalSexWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  HDHRCardioFitnessAnalyticsSignalSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6390], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "userCharacteristicForType:error:", v5, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (!v9)
  {
    if (v8)
    {
      v10 = objc_msgSend(v8, "integerValue");
      goto LABEL_12;
    }
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1CC29C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No biological sex number, returning not set", buf, 0xCu);
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    -[HDHRCardioFitnessAnalyticsSignalSource _biologicalSexWithError:].cold.1();
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_11;
  }
  v10 = 0;
  *a3 = objc_retainAutorelease(v9);
LABEL_12:

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)latestClassificationWithIsOnboarded:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1CC29C000, a2, a3, "[%{public}@] Date of birth missing, returning no classification", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)latestClassificationWithIsOnboarded:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error encountered when retrieving date of birth: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_latestCardioFitnessValueWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error encountered when retrieving latest cardio fitness sample: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_birthDateComponentsWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@]: Error when retrieving date of birth components: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_biologicalSexWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@]: Error when retrieving biological sex, returning not set: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
