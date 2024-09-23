@implementation HKValueHistogramCollectionQuery

- (HKValueHistogramCollectionQuery)initWithQuantityType:(id)a3 quantitySamplePredicate:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6 quantityRanges:(id)a7 resultsHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id *v18;
  HKValueHistogramCollectionQuery *v19;
  void *v20;
  id resultsHandler;
  id v23;
  id v24;
  objc_super v25;

  v15 = a3;
  v24 = a5;
  v23 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKValueHistogramCollectionQuery;
  v18 = -[HKQuery _initWithObjectType:predicate:](&v25, sel__initWithObjectType_predicate_, v15, a4);
  v19 = (HKValueHistogramCollectionQuery *)v18;
  if (v18)
  {
    objc_storeStrong(v18 + 19, a3);
    objc_storeStrong((id *)&v19->_anchorDate, a5);
    objc_storeStrong((id *)&v19->_intervalComponents, a6);
    objc_storeStrong((id *)&v19->_quantityRanges, a7);
    v20 = _Block_copy(v17);
    resultsHandler = v19->_resultsHandler;
    v19->_resultsHandler = v20;

  }
  return v19;
}

- (void)client_deliverValueHistogramCollection:(id)a3 forQuery:(id)a4
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
  block[2] = __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 184));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __83__HKValueHistogramCollectionQuery_client_deliverValueHistogramCollection_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKValueHistogramCollectionQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setIntervalComponents:", self->_intervalComponents);
  objc_msgSend(v4, "setQuantityRanges:", self->_quantityRanges);

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3E59B0;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKValueHistogramCollectionQuery;
  v3 = a3;
  objc_msgSendSuper2(&v5, sel_configureClientInterface_, v3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_client_deliverValueHistogramCollection_forQuery_, 0, 0);

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = _Block_copy(self->_resultsHandler);
  -[HKQuery clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HKValueHistogramCollectionQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E37E6710;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __54__HKValueHistogramCollectionQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKValueHistogramCollectionQuery;
  -[HKQuery queue_validate](&v4, sel_queue_validate);
  if (-[NSDateComponents hk_maxComponentValue](self->_intervalComponents, "hk_maxComponentValue") < 1
    || (-[NSDateComponents hk_approximateDuration](self->_intervalComponents, "hk_approximateDuration"), v3 <= 0.0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ interval components must be greater than zero: %@"), objc_opt_class(), self->_intervalComponents);
  }
  if (!+[HKQuantityRange areRangesDisjoint:](HKQuantityRange, "areRangesDisjoint:", self->_quantityRanges))objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ quantity ranges must be disjoint: %@"), objc_opt_class(), self->_quantityRanges);
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ resultsHandler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKValueHistogramCollectionQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_quantityRanges, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end
