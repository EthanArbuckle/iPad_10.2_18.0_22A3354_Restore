@implementation HKUserDomainConceptQuery

- (HKUserDomainConceptQuery)initWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v12;
  id v13;
  HKUserDomainConceptQuery *v14;
  _QWORD v16[4];
  id v17;

  v12 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HKUserDomainConceptQuery_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler___block_invoke;
  v16[3] = &unk_1E37ED508;
  v17 = v12;
  v13 = v12;
  v14 = -[HKUserDomainConceptQuery initWithPredicate:anchor:limit:sortDescriptors:batchHandler:](self, "initWithPredicate:anchor:limit:sortDescriptors:batchHandler:", a3, a4, a5, a6, v16);

  return v14;
}

uint64_t __90__HKUserDomainConceptQuery_initWithPredicate_anchor_limit_sortDescriptors_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  if (a3)
    return objc_msgSend(a2, "_enumerateResultsWithHandler:handler:", a3, v5);
  else
    return (*(uint64_t (**)(_QWORD, void *, _QWORD, _QWORD, uint64_t, uint64_t))(v5 + 16))(*(_QWORD *)(a1 + 32), a2, 0, 0, 1, a5);
}

- (HKUserDomainConceptQuery)initWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 sortDescriptors:(id)a6 batchHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  HKUserDomainConceptQuery *v15;
  uint64_t v16;
  HKQueryAnchor *anchor;
  uint64_t v18;
  NSArray *sortDescriptors;
  uint64_t v20;
  id batchHandler;
  objc_super v23;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HKUserDomainConceptQuery;
  v15 = -[HKQuery _initWithObjectType:predicate:](&v23, sel__initWithObjectType_predicate_, 0, a3);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    anchor = v15->_anchor;
    v15->_anchor = (HKQueryAnchor *)v16;

    v18 = objc_msgSend(v13, "copy");
    sortDescriptors = v15->_sortDescriptors;
    v15->_sortDescriptors = (NSArray *)v18;

    v15->_limit = a5;
    v20 = objc_msgSend(v14, "copy");
    batchHandler = v15->_batchHandler;
    v15->_batchHandler = (id)v20;

  }
  return v15;
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
  v5.super_class = (Class)HKUserDomainConceptQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setAnchor:", self->_anchor, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);
  objc_msgSend(v4, "setLimit:", self->_limit);

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3BF7A0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKUserDomainConceptQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverResults_queryUUID_, 0, 0);

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__17;
  v10[4] = __Block_byref_object_dispose__17;
  v11 = _Block_copy(self->_batchHandler);
  -[HKQuery clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HKUserDomainConceptQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E37E6838;
  v8 = v4;
  v9 = v10;
  block[4] = self;
  v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

uint64_t __47__HKUserDomainConceptQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
                                                                            + 16))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4], 0, 1, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKUserDomainConceptQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_batchHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ handler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id batchHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  batchHandler = self->_batchHandler;
  self->_batchHandler = 0;

}

- (void)client_deliverResults:(id)a3 queryUUID:(id)a4
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
  block[2] = __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke(uint64_t a1)
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

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 176));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __60__HKUserDomainConceptQuery_client_deliverResults_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 1, 0);
}

- (void)_enumerateResultsWithHandler:(id)a3 handler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  uint64_t v14;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "count");
  if (v7)
  {
    v8 = v7;
    v9 = -[HKQuery deactivateCallCount](self, "deactivateCallCount");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__HKUserDomainConceptQuery__enumerateResultsWithHandler_handler___block_invoke;
    v11[3] = &unk_1E37ED530;
    v11[4] = self;
    v13 = v9;
    v14 = v8;
    v12 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  }
  else
  {
    (*((void (**)(id, HKUserDomainConceptQuery *, _QWORD, _QWORD, uint64_t, _QWORD))v6 + 2))(v6, self, 0, 0, 1, 0);
  }

}

void __65__HKUserDomainConceptQuery__enumerateResultsWithHandler_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = (void *)MEMORY[0x19AEC7968]();
  if (objc_msgSend(*(id *)(a1 + 32), "deactivateCallCount") <= *(_QWORD *)(a1 + 48))
  {
    v8 = *(_QWORD *)(a1 + 56) - 1 == a3;
    v11 = a1 + 32;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(v11 + 8);
    objc_msgSend(v14, "userConcept");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, void *, _BOOL8, _QWORD))(v10 + 16))(v10, v9, v12, v13, v8, 0);

  }
  else
  {
    *a4 = 1;
  }
  objc_autoreleasePoolPop(v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchHandler, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
