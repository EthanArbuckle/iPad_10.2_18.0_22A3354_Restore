@implementation HDWorkoutBuilderStatisticsDataSource

- (HDWorkoutBuilderStatisticsDataSource)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDWorkoutBuilderStatisticsDataSource)initWithProfile:(id)a3 quantityType:(id)a4 builderEntity:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDWorkoutBuilderStatisticsDataSource *v11;
  HDWorkoutBuilderStatisticsDataSource *v12;
  uint64_t v13;
  HKQuantityType *quantityType;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDWorkoutBuilderStatisticsDataSource;
  v11 = -[HDWorkoutBuilderStatisticsDataSource init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    v13 = objc_msgSend(v9, "copy");
    quantityType = v12->_quantityType;
    v12->_quantityType = (HKQuantityType *)v13;

    objc_storeStrong((id *)&v12->_builderEntity, a5);
    v12->_enabled = 1;
  }

  return v12;
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  id v10;
  id v11;
  HDWorkoutBuilderEntity *builderEntity;
  HKQuantityType *quantityType;
  id WeakRetained;
  BOOL v15;
  _QWORD v17[4];
  id v18;

  v10 = a4;
  v11 = a6;
  if (self->_enabled)
  {
    quantityType = self->_quantityType;
    builderEntity = self->_builderEntity;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __111__HDWorkoutBuilderStatisticsDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
    v17[3] = &unk_1E6CEF778;
    v18 = v11;
    v15 = -[HDWorkoutBuilderEntity enumerateAssociatedSampleValuesOfType:interval:profile:error:sampleHandler:](builderEntity, "enumerateAssociatedSampleValuesOfType:interval:profile:error:sampleHandler:", quantityType, v10, WeakRetained, a5, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("Data source is disabled."));
    v15 = 0;
  }

  return v15;
}

uint64_t __111__HDWorkoutBuilderStatisticsDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  return (*(uint64_t (**)(double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a4, a5, a6);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HDWorkoutBuilderEntity)builderEntity
{
  return self->_builderEntity;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builderEntity, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
