@implementation HKSignedClinicalDataSubject(HealthRecordServices)

- (id)dataForUniquenessChecksumCalculation
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    {
      v9 = v6;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v4;
      _os_log_error_impl(&dword_2163C4000, v9, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@: unexpectedly failed to archive to data, returning zero-length data. Error: %{public}@", buf, 0x20u);

    }
    v5 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  }
  v7 = v5;

  return v7;
}

@end
