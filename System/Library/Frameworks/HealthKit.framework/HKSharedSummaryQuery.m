@implementation HKSharedSummaryQuery

- (HKSharedSummaryQuery)initWithTransaction:(id)a3 package:(id)a4 includedIdentifiers:(id)a5 includedObjectTypes:(id)a6 resultsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKSharedSummaryQuery *v17;
  uint64_t v18;
  id resultsHandler;
  uint64_t v20;
  HKSharedSummaryTransaction *transaction;
  uint64_t v22;
  NSString *package;
  uint64_t v24;
  NSSet *includedIdentifiers;
  uint64_t v26;
  NSSet *includedObjectTypes;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKSharedSummaryQuery;
  v17 = -[HKQuery _initWithObjectType:predicate:](&v29, sel__initWithObjectType_predicate_, 0, 0);
  if (v17)
  {
    v18 = objc_msgSend(v16, "copy");
    resultsHandler = v17->_resultsHandler;
    v17->_resultsHandler = (id)v18;

    v20 = objc_msgSend(v12, "copy");
    transaction = v17->_transaction;
    v17->_transaction = (HKSharedSummaryTransaction *)v20;

    v22 = objc_msgSend(v13, "copy");
    package = v17->_package;
    v17->_package = (NSString *)v22;

    v24 = objc_msgSend(v14, "copy");
    includedIdentifiers = v17->_includedIdentifiers;
    v17->_includedIdentifiers = (NSSet *)v24;

    v26 = objc_msgSend(v15, "copy");
    includedObjectTypes = v17->_includedObjectTypes;
    v17->_includedObjectTypes = (NSSet *)v26;

  }
  return v17;
}

- (HKSharedSummaryQuery)initWithTransaction:(id)a3 package:(id)a4 resultsHandler:(id)a5
{
  return -[HKSharedSummaryQuery initWithTransaction:package:includedIdentifiers:includedObjectTypes:resultsHandler:](self, "initWithTransaction:package:includedIdentifiers:includedObjectTypes:resultsHandler:", a3, a4, 0, 0, a5);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3D7498;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSharedSummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSummaries_query_, 0, 0);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSharedSummaryQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

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
  v5.super_class = (Class)HKSharedSummaryQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setTransaction:", self->_transaction, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setPackage:", self->_package);
  objc_msgSend(v4, "setIncludedIdentifiers:", self->_includedIdentifiers);
  objc_msgSend(v4, "setIncludedObjectTypes:", self->_includedObjectTypes);

}

- (void)client_deliverSummaries:(id)a3 query:(id)a4
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
  block[2] = __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  v3 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke_2;
    v9[3] = &unk_1E37E6710;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v9[4] = v8;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, v2, v9);

  }
}

uint64_t __54__HKSharedSummaryQuery_client_deliverSummaries_query___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 1, 0);
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
  v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__HKSharedSummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __43__HKSharedSummaryQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_includedIdentifiers, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
