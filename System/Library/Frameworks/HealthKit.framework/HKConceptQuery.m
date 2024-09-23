@implementation HKConceptQuery

- (HKConceptQuery)initWithConceptSelection:(id)a3 resultsHandler:(id)a4
{
  id v7;
  id v8;
  id *v9;
  HKConceptQuery *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKConceptQuery;
  v9 = -[HKQuery _initWithObjectType:predicate:](&v14, sel__initWithObjectType_predicate_, 0, 0);
  v10 = (HKConceptQuery *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 19, a3);
    v11 = objc_msgSend(v8, "copy");
    handler = v10->_handler;
    v10->_handler = (id)v11;

  }
  return v10;
}

- (void)client_deliverConcepts:(id)a3 queryUUID:(id)a4
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
  block[2] = __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke_2;
    v5[3] = &unk_1E37E67E8;
    v5[4] = v3;
    v6 = *(id *)(a1 + 48);
    v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v5);

  }
}

uint64_t __51__HKConceptQuery_client_deliverConcepts_queryUUID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateConceptsWithHandler:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_enumerateConceptsWithHandler:(id)a3 handler:(id)a4
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
    v11[2] = __56__HKConceptQuery__enumerateConceptsWithHandler_handler___block_invoke;
    v11[3] = &unk_1E37F4E68;
    v11[4] = self;
    v13 = v9;
    v14 = v8;
    v12 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  }
  else
  {
    (*((void (**)(id, HKConceptQuery *, _QWORD, uint64_t, _QWORD))v6 + 2))(v6, self, 0, 1, 0);
  }

}

void __56__HKConceptQuery__enumerateConceptsWithHandler_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "deactivateCallCount") <= *(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    *a4 = 1;

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
  v5.super_class = (Class)HKConceptQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setSelection:", self->_selection, v5.receiver, v5.super_class);

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3DF418;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKConceptQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverConcepts_queryUUID_, 0, 0);

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
  v10[3] = __Block_byref_object_copy__47;
  v10[4] = __Block_byref_object_dispose__47;
  v11 = _Block_copy(self->_handler);
  -[HKQuery clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HKConceptQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E37E6838;
  v8 = v4;
  v9 = v10;
  block[4] = self;
  v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

uint64_t __37__HKConceptQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
                                                                            + 16))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4], 0, 1, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKConceptQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_handler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ handler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id handler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKConceptQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  handler = self->_handler;
  self->_handler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
