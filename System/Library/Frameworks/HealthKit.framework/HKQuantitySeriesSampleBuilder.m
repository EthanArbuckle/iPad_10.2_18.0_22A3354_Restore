@implementation HKQuantitySeriesSampleBuilder

- (HKQuantitySeriesSampleBuilder)init
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

- (HKQuantitySeriesSampleBuilder)initWithHealthStore:(HKHealthStore *)healthStore quantityType:(HKQuantityType *)quantityType startDate:(NSDate *)startDate device:(HKDevice *)device
{
  HKHealthStore *v11;
  HKQuantityType *v12;
  NSDate *v13;
  HKDevice *v14;
  HKQuantitySeriesSampleBuilder *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  NSError *fatalError;
  uint64_t v19;
  HKQuantityType *v20;
  uint64_t v21;
  NSDate *v22;
  uint64_t v23;
  HKDevice *v24;
  uint64_t v25;
  NSUUID *identifier;
  HKQuantitySeriesSampleBuilderTaskServerConfiguration *v27;
  HKTaskServerProxyProvider *v28;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v31;
  objc_super v32;

  v11 = healthStore;
  v12 = quantityType;
  v13 = startDate;
  v14 = device;
  v32.receiver = self;
  v32.super_class = (Class)HKQuantitySeriesSampleBuilder;
  v15 = -[HKQuantitySeriesSampleBuilder init](&v32, sel_init);
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    if (HKProgramSDKTokenAtLeast(-[HKHealthStore applicationSDKVersionToken](v11, "applicationSDKVersionToken"), 0x7E30901FFFFFFFFLL))
    {
      -[NSDate timeIntervalSinceReferenceDate](v13, "timeIntervalSinceReferenceDate");
    }
    else if (-[HKQuantityType aggregationStyle](v12, "aggregationStyle"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A quantityType with aggregationStyle HKQuantityAggregationStyleCumulative is required"), v31);
    }
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
    }
    HKCreateSerialDispatchQueue(v15, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    fatalError = v15->_fatalError;
    v15->_fatalError = 0;
    v15->_state = 0;

    objc_storeStrong((id *)&v15->_healthStore, healthStore);
    v19 = -[HKQuantityType copy](v12, "copy");
    v20 = v15->_quantityType;
    v15->_quantityType = (HKQuantityType *)v19;

    v21 = -[NSDate copy](v13, "copy");
    v22 = v15->_startDate;
    v15->_startDate = (NSDate *)v21;

    v23 = -[HKDevice copy](v14, "copy");
    v24 = v15->_device;
    v15->_device = (HKDevice *)v23;

    v15->_batchSize = 1024;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = objc_claimAutoreleasedReturnValue();
    identifier = v15->_identifier;
    v15->_identifier = (NSUUID *)v25;

    v27 = -[HKQuantitySeriesSampleBuilderTaskServerConfiguration initWithQuantityType:startDate:device:]([HKQuantitySeriesSampleBuilderTaskServerConfiguration alloc], "initWithQuantityType:startDate:device:", v15->_quantityType, v15->_startDate, v15->_device);
    v28 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v15->_healthStore, CFSTR("HKQuantitySeriesSampleBuilderTaskServerIdentifier"), v15, v15->_identifier);
    proxyProvider = v15->_proxyProvider;
    v15->_proxyProvider = v28;

    -[HKProxyProvider setShouldRetryOnInterruption:](v15->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v15->_proxyProvider, "setTaskConfiguration:", v27);

  }
  return v15;
}

- (BOOL)insertQuantity:(HKQuantity *)quantity dateInterval:(NSDateInterval *)dateInterval error:(NSError *)error
{
  HKQuantity *v8;
  NSDateInterval *v9;
  BOOL v10;

  v8 = quantity;
  v9 = dateInterval;
  v10 = -[HKQuantitySeriesSampleBuilder _validateQuantity:error:](self, "_validateQuantity:error:", v8, error)
     && -[HKQuantitySeriesSampleBuilder _validateDateInterval:error:](self, "_validateDateInterval:error:", v9, error)
     && -[HKQuantitySeriesSampleBuilder _changeStateForInsertWithError:](self, "_changeStateForInsertWithError:", error)
     && -[HKQuantitySeriesSampleBuilder _insertQuantity:dateInterval:error:](self, "_insertQuantity:dateInterval:error:", v8, v9, error);

  return v10;
}

- (BOOL)insertQuantity:(HKQuantity *)quantity date:(NSDate *)date error:(NSError *)error
{
  void *v8;
  HKQuantity *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB3588];
  v9 = quantity;
  objc_msgSend(v8, "hk_instantaneousDateIntervalWithDate:", date);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = -[HKQuantitySeriesSampleBuilder insertQuantity:dateInterval:error:](self, "insertQuantity:dateInterval:error:", v9, v10, error);

  return (char)error;
}

- (void)finishSeriesWithMetadata:(NSDictionary *)metadata endDate:(NSDate *)endDate completion:(void *)completion
{
  NSDictionary *v8;
  NSDate *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;

  v8 = metadata;
  v9 = endDate;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", completion);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (-[HKQuantitySeriesSampleBuilder _changeStateForFinishWithError:](self, "_changeStateForFinishWithError:", &v11))
    -[HKQuantitySeriesSampleBuilder _finishSeriesWithMetadata:endDate:completion:](self, "_finishSeriesWithMetadata:endDate:completion:", v8, v9, v10);
  else
    v10[2](v10, 0, v11);

}

- (void)finishSeriesWithMetadata:(NSDictionary *)metadata completion:(void *)completion
{
  -[HKQuantitySeriesSampleBuilder finishSeriesWithMetadata:endDate:completion:](self, "finishSeriesWithMetadata:endDate:completion:", metadata, 0, completion);
}

- (void)discard
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__HKQuantitySeriesSampleBuilder_discard__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKQuantitySeriesSampleBuilder _discardWithCompletion:](self, "_discardWithCompletion:", v2);
}

void __40__HKQuantitySeriesSampleBuilder_discard__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      __40__HKQuantitySeriesSampleBuilder_discard__block_invoke_cold_1(a1);
  }

}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HKDevice)device
{
  return self->_device;
}

- (BOOL)_insertQuantity:(id)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HKCodableQuantitySeriesDatum *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSObject *queue;
  HKCodableQuantitySeriesDatum *v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD block[5];
  HKCodableQuantitySeriesDatum *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v9 = objc_alloc_init(HKCodableQuantitySeriesDatum);
  -[HKQuantityType canonicalUnit](self->_quantityType, "canonicalUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v10);
  -[HKCodableQuantitySeriesDatum setValue:](v9, "setValue:");

  objc_msgSend(v8, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  -[HKCodableQuantitySeriesDatum setTimeInterval:](v9, "setTimeInterval:");

  if (HKProgramSDKTokenAtLeast(-[HKHealthStore applicationSDKVersionToken](self->_healthStore, "applicationSDKVersionToken"), 0x7E30901FFFFFFFFLL))
  {
    objc_msgSend(v8, "duration");
    *(float *)&v12 = v12;
    -[HKCodableQuantitySeriesDatum setDuration:](v9, "setDuration:", v12);
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12;
  v26 = __Block_byref_object_dispose__12;
  v27 = 0;
  v13 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke;
  block[3] = &unk_1E37EBC00;
  block[4] = self;
  v15 = v9;
  v20 = v15;
  v21 = &v22;
  dispatch_sync(queue, block);
  v16 = v23[5];
  if (v16)
  {
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2;
    v18[3] = &unk_1E37E6BD8;
    v18[4] = self;
    -[HKQuantitySeriesSampleBuilder _taskServer_insertQuantitySeries:completion:](self, "_taskServer_insertQuantitySeries:completion:", v16, v18);
  }

  _Block_object_dispose(&v22, 8);
  return 1;
}

void __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke(_QWORD *a1)
{
  void *v2;
  HKCodableQuantitySeries *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(a1[4] + 64);
  if (!v2)
  {
    v3 = objc_alloc_init(HKCodableQuantitySeries);
    v4 = a1[4];
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v3;

    v2 = *(void **)(a1[4] + 64);
  }
  objc_msgSend(v2, "addValues:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 64), "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = *(_QWORD *)(a1[4] + 32);

  if (v7 >= v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 64));
    v9 = a1[4];
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = 0;

  }
}

void __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG))
      __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2_cold_1(a1);
    objc_msgSend(*(id *)(a1 + 32), "_changeStateForFatalError:", v5);
  }
  v6 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 96));
  v7 = v6;
  if (v6)
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, a2, v5);

}

- (void)_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke;
  block[3] = &unk_1E37E6810;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(queue, block);
  v13 = v20[5];
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke_2;
  v15[3] = &unk_1E37EBC28;
  v17 = &v19;
  v15[4] = self;
  v14 = v10;
  v16 = v14;
  -[HKQuantitySeriesSampleBuilder _taskServer_finishSeriesWithMetadata:endDate:finalSeries:completion:](self, "_taskServer_finishSeriesWithMetadata:endDate:finalSeries:completion:", v8, v9, v13, v15);

  _Block_object_dispose(&v19, 8);
}

void __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

}

void __78__HKQuantitySeriesSampleBuilder__finishSeriesWithMetadata_endDate_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(void *, BOOL, id);
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v6 = (void (**)(void *, BOOL, id))_Block_copy(*(const void **)(a1[4] + 96));
    if (v6)
      v6[2](v6, v7 != 0, v5);

  }
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)_discardWithCompletion:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  BOOL v5;
  id v6;
  id v7;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = -[HKQuantitySeriesSampleBuilder _changeStateForDiscardWithError:](self, "_changeStateForDiscardWithError:", &v7);
  v6 = v7;
  if (v5)
  {
    -[HKQuantitySeriesSampleBuilder _taskServer_discardWithCompletion:](self, "_taskServer_discardWithCompletion:", v4);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      -[HKQuantitySeriesSampleBuilder _discardWithCompletion:].cold.1((uint64_t)self);
    ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, 0, v6);
  }

}

- (BOOL)_validateQuantity:(id)a3 error:(id *)a4
{
  id v6;
  HKQuantityType *quantityType;
  void *v8;
  BOOL v9;

  v6 = a3;
  quantityType = self->_quantityType;
  objc_msgSend(v6, "_unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKQuantityType isCompatibleWithUnit:](quantityType, "isCompatibleWithUnit:", v8);

  if (!v9)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Quantity (%@) does not have a unit compatible with quantity series builder quantity type %@"), v6, self->_quantityType);

  return v9;
}

- (BOOL)_validateDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  BOOL v24;
  uint64_t v26;

  v6 = a3;
  if (HKProgramSDKTokenAtLeast(-[HKHealthStore applicationSDKVersionToken](self->_healthStore, "applicationSDKVersionToken"), 0x7E30901FFFFFFFFLL))
  {
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");

    if (-[HKSampleType isMaximumDurationRestricted](self->_quantityType, "isMaximumDurationRestricted"))
    {
      objc_msgSend(v6, "duration");
      v10 = v9;
      -[HKSampleType maximumAllowedDuration](self->_quantityType, "maximumAllowedDuration");
      if (v10 > v11)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("dateInterval (%@) exceeds the maximum allowed duration for sample type (%@)"), v6, self->_quantityType, v26);
        goto LABEL_13;
      }
    }
    if (-[HKSampleType isMaximumDurationRestricted](self->_quantityType, "isMaximumDurationRestricted"))
    {
      objc_msgSend(v6, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;
      -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
      v16 = v14 - v15;
      -[HKSampleType maximumAllowedDuration](self->_quantityType, "maximumAllowedDuration");
      v18 = v17;

      if (v16 > v18)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("startDate (%@) and dateInterval (%@) exceed the maximum allowed duration for sample type (%@)"), self->_startDate, v6, self->_quantityType);
        goto LABEL_13;
      }
    }
    if (-[HKSampleType isMinimumDurationRestricted](self->_quantityType, "isMinimumDurationRestricted"))
    {
      objc_msgSend(v6, "duration");
      v20 = v19;
      -[HKSampleType minimumAllowedDuration](self->_quantityType, "minimumAllowedDuration");
      if (v20 < v21)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("dateInterval (%@) is below the minimum allowed duration for sample type (%@)"), v6, self->_quantityType, v26);
        goto LABEL_13;
      }
    }
  }
  objc_msgSend(v6, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hk_isBeforeDate:", self->_startDate);

  if (!v23)
  {
    v24 = 1;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Date interval (%@) is before builder's start date %@"), v6, self->_startDate, v26);
LABEL_13:
  v24 = 0;
LABEL_15:

  return v24;
}

- (BOOL)_changeStateForInsertWithError:(id *)a3
{
  NSObject *queue;
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HKQuantitySeriesSampleBuilder__changeStateForInsertWithError___block_invoke;
  v11[3] = &unk_1E37E8A30;
  v11[4] = self;
  v11[5] = &v24;
  v11[6] = &v18;
  v11[7] = &v12;
  dispatch_sync(queue, v11);
  if (!*((_BYTE *)v25 + 24))
  {
    v6 = (id)v19[5];
    v7 = v6;
    if (v6)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError(v6);
    }

  }
  v8 = (void *)v13[5];
  if (v8)
    objc_msgSend(v8, "raise");
  v9 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v9;
}

void __64__HKQuantitySeriesSampleBuilder__changeStateForInsertWithError___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (_QWORD *)a1[4];
  switch(v2[7])
  {
    case 0:
      v2[7] = 1;
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      return;
    case 1:
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      return;
    case 2:
      objc_msgSend(v2, "_queue_clientErrorForFatalError");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend((id)objc_opt_class(), "_clientErrorForFinishedSeries");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = a1[6];
      goto LABEL_9;
    case 4:
      objc_msgSend((id)objc_opt_class(), "_exceptionForPreviouslyDiscardedBuilder");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = a1[7];
LABEL_9:
      v5 = *(_QWORD *)(v4 + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v3;

      break;
    default:
      return;
  }
}

- (BOOL)_changeStateForFinishWithError:(id *)a3
{
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD block[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HKQuantitySeriesSampleBuilder__changeStateForFinishWithError___block_invoke;
  block[3] = &unk_1E37EBC50;
  block[4] = self;
  block[5] = &v19;
  block[7] = &v13;
  block[8] = a2;
  block[6] = &v25;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v26 + 24))
  {
    v7 = (id)v20[5];
    v8 = v7;
    if (v7)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError(v7);
    }

  }
  v9 = (void *)v14[5];
  if (v9)
    objc_msgSend(v9, "raise");
  v10 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v10;
}

void __64__HKQuantitySeriesSampleBuilder__changeStateForFinishWithError___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (_QWORD *)a1[4];
  switch(v2[7])
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[8], CFSTR("No quantities were added to quantity series sample builder."));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1[5] + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      *(_QWORD *)(a1[4] + 56) = 3;
      return;
    case 1:
      v2[7] = 3;
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      return;
    case 2:
      objc_msgSend(v2, "_queue_clientErrorForFatalError");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend((id)objc_opt_class(), "_clientErrorForFinishedSeries");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = a1[5];
      goto LABEL_9;
    case 4:
      objc_msgSend((id)objc_opt_class(), "_exceptionForPreviouslyDiscardedBuilder");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = a1[7];
LABEL_9:
      v8 = *(_QWORD *)(v7 + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v6;

      break;
    default:
      return;
  }
}

- (BOOL)_changeStateForDiscardWithError:(id *)a3
{
  NSObject *queue;
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__HKQuantitySeriesSampleBuilder__changeStateForDiscardWithError___block_invoke;
  v11[3] = &unk_1E37E8A30;
  v11[4] = self;
  v11[5] = &v24;
  v11[6] = &v18;
  v11[7] = &v12;
  dispatch_sync(queue, v11);
  if (!*((_BYTE *)v25 + 24))
  {
    v6 = (id)v19[5];
    v7 = v6;
    if (v6)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError(v6);
    }

  }
  v8 = (void *)v13[5];
  if (v8)
    objc_msgSend(v8, "raise");
  v9 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v9;
}

void __65__HKQuantitySeriesSampleBuilder__changeStateForDiscardWithError___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (_QWORD *)a1[4];
  switch(v2[7])
  {
    case 0:
    case 1:
      v2[7] = 4;
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      return;
    case 2:
      objc_msgSend(v2, "_queue_clientErrorForFatalError");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3:
      objc_msgSend((id)objc_opt_class(), "_clientErrorForFinishedSeries");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v4 = a1[6];
      goto LABEL_7;
    case 4:
      objc_msgSend((id)objc_opt_class(), "_exceptionForPreviouslyDiscardedBuilder");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = a1[7];
LABEL_7:
      v5 = *(_QWORD *)(v4 + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v3;

      break;
    default:
      return;
  }
}

- (void)_changeStateForFatalError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HKQuantitySeriesSampleBuilder__changeStateForFatalError___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __59__HKQuantitySeriesSampleBuilder__changeStateForFatalError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 56) == 1)
  {
    *(_QWORD *)(v1 + 56) = 2;
    v3 = *(void **)(a1 + 40);
    v4 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unknown internal fatal error"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v4);
    if (!v3)

  }
}

+ (id)_clientErrorForFinishedSeries
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Quantity series sample builder already finished"));
}

+ (id)_exceptionForPreviouslyDiscardedBuilder
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ already discarded."), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_queue_clientErrorForFatalError
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 3, CFSTR("Quantity series sample builder experienced a fatal error"), self->_fatalError);
}

- (void)_taskServer_insertQuantitySeries:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke;
  v14[3] = &unk_1E37EBC78;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertQuantitySeries:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __77__HKQuantitySeriesSampleBuilder__taskServer_insertQuantitySeries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_taskServer_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 finalSeries:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  proxyProvider = self->_proxyProvider;
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke;
  v22[3] = &unk_1E37EBCA0;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2;
  v20[3] = &unk_1E37E6B38;
  v21 = v26;
  v16 = v26;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_finishSeriesWithMetadata:endDate:finalSeries:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __101__HKQuantitySeriesSampleBuilder__taskServer_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_taskServer_discardWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke;
  v10[3] = &unk_1E37EBCC8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_discardWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__HKQuantitySeriesSampleBuilder__taskServer_discardWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EAA8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_finishSeriesWithMetadata_endDate_finalSeries_completion_, 0, 0);

  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_finishSeriesWithMetadata_endDate_finalSeries_completion_, 0, 1);
  return v2;
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return +[HKQuantitySeriesSampleBuilder serverInterface](HKQuantitySeriesSampleBuilder, "serverInterface");
}

- (int64_t)unitTest_state
{
  return self->_state;
}

- (void)unitTest_setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (id)unitTest_insertQuantityCompletion
{
  return self->_unitTest_insertQuantityCompletion;
}

- (void)setUnitTest_insertQuantityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_insertQuantityCompletion, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_quantitySeries, 0);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

void __40__HKQuantitySeriesSampleBuilder_discard__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "%{public}@: error discarding quantity sample series builder: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __68__HKQuantitySeriesSampleBuilder__insertQuantity_dateInterval_error___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138543618;
  v4 = v1;
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: error inserting quantity: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_discardWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "%{public}@: cannot discard quantity sample series builder: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

@end
