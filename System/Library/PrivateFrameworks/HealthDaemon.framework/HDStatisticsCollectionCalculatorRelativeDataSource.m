@implementation HDStatisticsCollectionCalculatorRelativeDataSource

- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6 configuration:(id)a7 currentDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HDStatisticsCollectionCalculatorRelativeDataSource *v20;
  HDStatisticsCollectionCalculatorRelativeDataSource *v21;
  HDStatisticsCollectionCalculatorDefaultDataSource *v22;
  HDStatisticsCollectionCalculatorDefaultDataSource *defaultDataSource;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HDStatisticsCollectionCalculatorRelativeDataSource;
  v20 = -[HDStatisticsCollectionCalculatorRelativeDataSource init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_profile, v14);
    objc_storeStrong((id *)&v21->_configuration, a7);
    objc_storeStrong((id *)&v21->_currentDate, a8);
    v22 = -[HDStatisticsCollectionCalculatorDefaultDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:]([HDStatisticsCollectionCalculatorDefaultDataSource alloc], "initForProfile:quantityType:predicate:restrictedSourceEntities:", v14, v15, v16, v17);
    defaultDataSource = v21->_defaultDataSource;
    v21->_defaultDataSource = v22;

  }
  return v21;
}

- (id)restrictedSourceEntities
{
  return -[HDStatisticsCollectionCalculatorDefaultDataSource restrictedSourceEntities](self->_defaultDataSource, "restrictedSourceEntities");
}

- (void)setRestrictedSourceEntities:(id)a3
{
  -[HDStatisticsCollectionCalculatorDefaultDataSource setRestrictedSourceEntities:](self->_defaultDataSource, "setRestrictedSourceEntities:", a3);
}

- (id)maxRowID
{
  return -[HDStatisticsCollectionCalculatorDefaultDataSource maxRowID](self->_defaultDataSource, "maxRowID");
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  HDRollingBaselineRelativeDataSource *v20;
  id WeakRetained;
  void *v22;
  HDRollingBaselineRelativeDataSource *v23;
  HDStatisticsCollectionCalculatorDefaultDataSource *defaultDataSource;
  uint64_t v25;
  HDRollingBaselineRelativeDataSource *v26;
  id v27;
  id v28;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  HDRollingBaselineRelativeDataSource *v34;
  HDStatisticsCollectionCalculatorRelativeDataSource *v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v30 = a7;
  v15 = v14;
  -[HDStatisticsCollectionCalculatorDefaultDataSource quantityType](self->_defaultDataSource, "quantityType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStatisticsCollectionCalculatorRelativeDataSource _queryPrefetchWindowForQuantityTypeIdentifier:](self, "_queryPrefetchWindowForQuantityTypeIdentifier:", v17);
  v19 = v18;

  v20 = [HDRollingBaselineRelativeDataSource alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDStatisticsCollectionCalculatorDefaultDataSource quantityType](self->_defaultDataSource, "quantityType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HDRollingBaselineRelativeDataSource initWithProfile:quantityType:configuration:queryPrefetchWindow:currentDate:](v20, "initWithProfile:quantityType:configuration:queryPrefetchWindow:currentDate:", WeakRetained, v22, self->_configuration, self->_currentDate, v19);

  -[HDRollingBaselineRelativeDataSource setShouldContinueHandler:](v23, "setShouldContinueHandler:", self->_shouldContinueHandler);
  defaultDataSource = self->_defaultDataSource;
  v25 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
  v33[3] = &unk_1E6CFC298;
  v26 = v23;
  v34 = v26;
  v27 = v15;
  v35 = self;
  v36 = v27;
  v31[0] = v25;
  v31[1] = 3221225472;
  v31[2] = __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2;
  v31[3] = &unk_1E6CFC2C0;
  v28 = v30;
  v32 = v28;
  LOBYTE(a5) = -[HDStatisticsCollectionCalculatorDefaultDataSource collectionCalculator:queryForInterval:error:sampleHandler:mergeHandler:](defaultDataSource, "collectionCalculator:queryForInterval:error:sampleHandler:mergeHandler:", v12, v13, a5, v33, v31);

  return (char)a5;
}

uint64_t __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  __int16 v18;

  v11 = *(void **)(a1 + 32);
  *(double *)v17 = a5;
  *(double *)&v17[1] = a6;
  *(double *)&v17[2] = a7;
  v17[3] = a2;
  v18 = 1;
  objc_msgSend(v11, "computeRelativeValueForSample:error:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12
    && (v14 = *(_QWORD *)(a1 + 48),
        objc_msgSend(v12, "doubleValue"),
        (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, a2, a3, a4)))
  {
    v15 = objc_msgSend(*(id *)(a1 + 40), "_shouldContinueWithError:", a4);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)_queryPrefetchWindowForQuantityTypeIdentifier:(id)a3
{
  return 2592000.0;
}

- (BOOL)_shouldContinueWithError:(id *)a3
{
  uint64_t (**shouldContinueHandler)(id, id *);

  shouldContinueHandler = (uint64_t (**)(id, id *))self->_shouldContinueHandler;
  if (shouldContinueHandler)
    return shouldContinueHandler[2](shouldContinueHandler, a3);
  else
    return 1;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKRollingBaselineConfiguration)configuration
{
  return self->_configuration;
}

- (id)shouldContinueHandler
{
  return self->_shouldContinueHandler;
}

- (void)setShouldContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldContinueHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_defaultDataSource, 0);
}

@end
