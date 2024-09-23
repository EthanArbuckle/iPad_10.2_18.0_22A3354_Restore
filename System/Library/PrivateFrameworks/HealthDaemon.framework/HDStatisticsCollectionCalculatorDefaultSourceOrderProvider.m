@implementation HDStatisticsCollectionCalculatorDefaultSourceOrderProvider

- (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider)initWithProfile:(id)a3 quantityType:(id)a4
{
  id v6;
  id v7;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v8;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v9;
  uint64_t v10;
  HKQuantityType *quantityType;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDStatisticsCollectionCalculatorDefaultSourceOrderProvider;
  v8 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    v10 = objc_msgSend(v7, "copy");
    quantityType = v9->_quantityType;
    v9->_quantityType = (HKQuantityType *)v10;

  }
  return v9;
}

- (id)sourceForSourceID:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "clientSourceForPersistentID:error:", v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    v9 = v7;
  }
  else if ((objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 118) & 1) == 0)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v14 = a3;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve source for %lld: %{public}@", buf, 0x16u);
    }
  }

  return v7;
}

- (id)orderedSourceIDsWithUnorderedIDs:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  HKQuantityType *quantityType;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  HKQuantityType *v15;
  id v16;
  uint8_t buf[4];
  HKQuantityType *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceOrderManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  quantityType = self->_quantityType;
  v16 = 0;
  objc_msgSend(v6, "orderedSourceIDsWithUnorderedIDs:objectType:error:", v4, quantityType, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;

  v10 = v8;
  if (!v8)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52B0];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR);
    v10 = v4;
    if (v12)
    {
      v15 = self->_quantityType;
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve ordered source ids for %{public}@: %{public}@", buf, 0x16u);
      v10 = v4;
    }
  }
  v13 = v10;

  return v13;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
