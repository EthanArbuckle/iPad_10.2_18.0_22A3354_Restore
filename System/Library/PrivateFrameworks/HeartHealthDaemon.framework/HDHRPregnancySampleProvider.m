@implementation HDHRPregnancySampleProvider

- (HDHRPregnancySampleProvider)initWithProfile:(id)a3
{
  id v4;
  HDHRPregnancySampleProvider *v5;
  HDHRPregnancySampleProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHRPregnancySampleProvider;
  v5 = -[HDHRPregnancySampleProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)getSamplesWithError:(id *)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB6978], "pregnancyType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D29578];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v13 = 0;
  objc_msgSend(v6, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v5, WeakRetained, 0, 0, 0, 0, &v13);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      -[HDHRPregnancySampleProvider getSamplesWithError:].cold.1();
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
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v11;
    v10 = v8;
  }

  return v10;
}

BOOL __51__HDHRPregnancySampleProvider_getSamplesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 > v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)getSamplesWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Could not fetch pregnancy samples with error: %{public}@");
}

@end
