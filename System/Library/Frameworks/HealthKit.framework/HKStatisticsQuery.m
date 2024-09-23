@implementation HKStatisticsQuery

- (HKStatisticsQuery)initWithQuantityType:(HKQuantityType *)quantityType quantitySamplePredicate:(NSPredicate *)quantitySamplePredicate options:(HKStatisticsOptions)options completionHandler:(void *)handler
{
  HKStatisticsQuery *result;

  result = -[HKStatisticsQuery initWithSampleType:samplePredicate:options:completionHandler:](self, "initWithSampleType:samplePredicate:options:completionHandler:", quantityType, quantitySamplePredicate, options, handler);
  if (result)
    result->_requireQuantityType = 1;
  return result;
}

- (HKStatisticsQuery)initWithSampleType:(id)a3 samplePredicate:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  HKStatisticsQuery *v11;
  HKStatisticsQuery *v12;
  void *v13;
  id completionHandler;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKStatisticsQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v16, sel__initWithObjectType_predicate_, a3, a4);
  v12 = v11;
  if (v11)
  {
    v11->_options = a5;
    v13 = _Block_copy(v10);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = v13;

    v12->_mergeStrategy = 0;
  }

  return v12;
}

- (id)_filterForDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[HKQuery objectType](self, "objectType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKSampleComparisonFilter startDateFilterWithOperatorType:date:dataTypes:](_HKSampleComparisonFilter, "startDateFilterWithOperatorType:date:dataTypes:", 1, v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKSampleComparisonFilter endDateFilterWithOperatorType:date:dataTypes:](_HKSampleComparisonFilter, "endDateFilterWithOperatorType:date:dataTypes:", 3, v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v9;
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (HKProgramSDKAtLeast(0x7E30901FFFFFFFFLL, v13))
    {
      -[HKQuery objectType](self, "objectType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_earliestAllowedStartDateForSampleOverlappingDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        +[_HKComparisonFilter filterForKeyPath:operatorType:value:dataTypes:](_HKSampleComparisonFilter, "filterForKeyPath:operatorType:value:dataTypes:", CFSTR("startDate"), 3, v16, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayByAddingObject:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v18;
      }

    }
    +[_HKCompoundFilter andFilterWithSubfilters:](_HKCompoundFilter, "andFilterWithSubfilters:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_filter
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKStatisticsQuery;
  -[HKQuery _filter](&v7, sel__filter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStatisticsQuery _filterForDateInterval:](self, "_filterForDateInterval:", self->_dateInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKCompoundFilter compoundFilterWithFilter:otherFilter:](_HKCompoundFilter, "compoundFilterWithFilter:otherFilter:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3BE0C8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKStatisticsQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverStatistics_forQuery_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKStatisticsQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setOptions:", self->_options, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setMergeStrategy:", self->_mergeStrategy);
  objc_msgSend(v4, "setDateInterval:", self->_dateInterval);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKStatisticsQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)queue_validate
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t options;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKStatisticsQuery;
  -[HKQuery queue_validate](&v10, sel_queue_validate);
  if (self->_requireQuantityType)
  {
    -[HKQuery objectType](self, "objectType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      v7 = objc_opt_class();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ data type must be of class %@"), v7, objc_opt_class());
    }
  }
  if (!self->_completionHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ completionHandler cannot be nil"), objc_opt_class());
  options = self->_options;
  -[HKQuery objectType](self, "objectType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStatistics _validateOptions:forDataType:](HKStatistics, "_validateOptions:forDataType:", options, v9);

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__HKStatisticsQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __40__HKStatisticsQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)_setDateInterval:(id)a3
{
  NSDateInterval *v4;
  NSDateInterval *dateInterval;

  v4 = (NSDateInterval *)a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", sel__setDateInterval_);
  dateInterval = self->_dateInterval;
  self->_dateInterval = v4;

}

- (void)client_deliverStatistics:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke_2;
    v6[3] = &unk_1E37E8738;
    v7 = *(id *)(a1 + 48);
    v5 = v2;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v6);

  }
}

void __55__HKStatisticsQuery_client_deliverStatistics_forQuery___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  HKStatistics *v5;
  void *v6;
  void *v7;
  void *v8;
  HKStatistics *v9;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (HKProgramSDKTokenAtLeast(objc_msgSend(*(id *)(a1 + 40), "applicationSDKVersionToken"), 0x7E40901FFFFFFFFLL))
    {
      v4 = a1 + 40;
      v2 = *(_QWORD *)(a1 + 40);
      v3 = *(_QWORD *)(v4 + 8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 11, CFSTR("No data available for the specified predicate."));
      v9 = (HKStatistics *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, _QWORD, HKStatistics *))(v3 + 16))(v3, v2, 0, v9);
    }
    else
    {
      v5 = [HKStatistics alloc];
      objc_msgSend(*(id *)(a1 + 40), "objectType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HKStatistics initWithDataType:startDate:endDate:](v5, "initWithDataType:startDate:endDate:", v6, v7, v8);

      (*(void (**)(_QWORD, _QWORD, HKStatistics *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v9, 0);
    }

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void)setMergeStrategy:(unint64_t)a3
{
  self->_mergeStrategy = a3;
}

- (NSDateInterval)_dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
