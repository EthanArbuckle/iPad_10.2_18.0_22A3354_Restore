@implementation HKChartQueryDataGenerationOperation

- (HKChartQueryDataGenerationOperation)initWithHealthStore:(id)a3 dataSource:(id)a4 startDate:(id)a5 endDate:(id)a6 statisticsInterval:(id)a7 operationDescription:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  HKChartQueryDataGenerationOperation *v19;
  HKChartQueryDataGenerationOperation *v20;
  void *v21;
  id clientCompletion;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)HKChartQueryDataGenerationOperation;
  v19 = -[HKFetchOperation initWithOperationDescription:](&v27, sel_initWithOperationDescription_, a8);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_healthStore, a3);
    objc_storeStrong((id *)&v20->_dataSource, a4);
    objc_storeStrong((id *)&v20->_startDate, a5);
    objc_storeStrong((id *)&v20->_endDate, a6);
    objc_storeStrong((id *)&v20->_statisticsInterval, a7);
    v21 = _Block_copy(v18);
    clientCompletion = v20->_clientCompletion;
    v20->_clientCompletion = v21;

  }
  return v20;
}

- (void)startOperationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id fetchOperationManager;
  HKHealthQueryChartCacheQueryRequest *v7;
  HKHealthQueryChartCacheDataSource *dataSource;
  HKHealthStore *healthStore;
  void *v10;
  id cancelHandler;
  _QWORD v12[4];
  id v13;
  id v14;
  id from;
  id location;

  v4 = a3;
  v5 = _Block_copy(v4);
  fetchOperationManager = self->_fetchOperationManager;
  self->_fetchOperationManager = v5;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_dataSource);
  v7 = -[HKHealthQueryChartCacheQueryRequest initWithStartDate:endDate:statisticsInterval:]([HKHealthQueryChartCacheQueryRequest alloc], "initWithStartDate:endDate:statisticsInterval:", self->_startDate, self->_endDate, self->_statisticsInterval);
  dataSource = self->_dataSource;
  healthStore = self->_healthStore;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke;
  v12[3] = &unk_1E9C42E20;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  -[HKHealthQueryChartCacheDataSource generateSharableQueryDataForRequest:healthStore:completionHandler:](dataSource, "generateSharableQueryDataForRequest:healthStore:completionHandler:", v7, healthStore, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = v10;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke_2;
  v9[3] = &unk_1E9C42DF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

void __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v2, "chartPointsFromQueryData:dataIsFromRemoteSource:", *(_QWORD *)(a1 + 32), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "completedWithResults:error:", v3, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(WeakRetained, "completedWithResults:error:", 0, *(_QWORD *)(a1 + 40));
  }

}

- (void)stopOperation
{
  void (**cancelHandler)(id, SEL);
  id v4;
  id clientCompletion;
  id fetchOperationManager;

  cancelHandler = (void (**)(id, SEL))self->_cancelHandler;
  if (cancelHandler)
  {
    cancelHandler[2](cancelHandler, a2);
    v4 = self->_cancelHandler;
    self->_cancelHandler = 0;

  }
  clientCompletion = self->_clientCompletion;
  self->_clientCompletion = 0;

  fetchOperationManager = self->_fetchOperationManager;
  self->_fetchOperationManager = 0;

}

- (void)completedWithResults:(id)a3 error:(id)a4
{
  id v6;
  void (**clientCompletion)(id, HKChartQueryDataGenerationOperation *, id, id);
  id v8;
  void (**fetchOperationManager)(id, BOOL, id);
  id v10;
  id cancelHandler;
  id v12;

  v12 = a3;
  v6 = a4;
  clientCompletion = (void (**)(id, HKChartQueryDataGenerationOperation *, id, id))self->_clientCompletion;
  if (clientCompletion)
  {
    clientCompletion[2](clientCompletion, self, v12, v6);
    v8 = self->_clientCompletion;
    self->_clientCompletion = 0;

  }
  fetchOperationManager = (void (**)(id, BOOL, id))self->_fetchOperationManager;
  if (fetchOperationManager)
  {
    fetchOperationManager[2](fetchOperationManager, v6 == 0, v6);
    v10 = self->_fetchOperationManager;
    self->_fetchOperationManager = 0;

  }
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_fetchOperationManager, 0);
  objc_storeStrong(&self->_clientCompletion, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
