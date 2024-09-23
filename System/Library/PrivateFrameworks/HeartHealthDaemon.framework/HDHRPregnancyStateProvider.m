@implementation HDHRPregnancyStateProvider

- (HDHRPregnancyStateProvider)initWithPregnancySampleProvider:(id)a3
{
  id v5;
  HDHRPregnancyStateProvider *v6;
  HDHRPregnancyStateProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHRPregnancyStateProvider;
  v6 = -[HDHRPregnancyStateProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pregnancySampleProvider, a3);

  return v7;
}

- (id)latestWashoutEndDateWithError:(id *)a3
{
  HDHRPregnancySampleProviding *pregnancySampleProvider;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  HDHRPregnancyStateProvider *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  pregnancySampleProvider = self->_pregnancySampleProvider;
  v24 = 0;
  -[HDHRPregnancySampleProviding getSamplesWithError:](pregnancySampleProvider, "getSamplesWithError:", &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  if (!v7)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = self;
        _os_log_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] No samples found.", buf, 0xCu);
      }
      goto LABEL_17;
    }
    objc_msgSend(v8, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        v19 = v16;
        HKSensitiveLogItem();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] %@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v9, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14;

      if (v15 >= 12096000.0)
      {
        v22 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v9, "endDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateWithTimeInterval:sinceDate:", v23, 7257600.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
    }
LABEL_17:
    v17 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);
  else
    _HKLogDroppedError();
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
    -[HDHRPregnancyStateProvider latestWashoutEndDateWithError:].cold.1();
  v17 = 0;
LABEL_19:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pregnancySampleProvider, 0);
}

- (void)latestWashoutEndDateWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Failed to get samples with error: %{public}@");
}

@end
