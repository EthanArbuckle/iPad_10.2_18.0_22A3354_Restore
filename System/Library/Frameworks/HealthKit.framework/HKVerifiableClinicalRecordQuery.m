@implementation HKVerifiableClinicalRecordQuery

- (HKVerifiableClinicalRecordQuery)initWithRecordTypes:(NSArray *)recordTypes predicate:(NSPredicate *)predicate resultsHandler:(void *)resultsHandler
{
  NSArray *v8;
  void *v9;
  HKVerifiableClinicalRecordQuery *v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  NSArray *sourceTypes;
  uint64_t v15;
  id v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = recordTypes;
  v9 = resultsHandler;
  v18.receiver = self;
  v18.super_class = (Class)HKVerifiableClinicalRecordQuery;
  v10 = -[HKQuery _initWithObjectType:predicate:](&v18, sel__initWithObjectType_predicate_, 0, predicate);
  if (v10)
  {
    v11 = -[NSArray copy](v8, "copy");
    v12 = v10->_recordTypes;
    v10->_recordTypes = (NSArray *)v11;

    v19[0] = CFSTR("SMARTHealthCard");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    sourceTypes = v10->_sourceTypes;
    v10->_sourceTypes = (NSArray *)v13;

    v15 = objc_msgSend(v9, "copy");
    v16 = v10->_resultsHandler;
    v10->_resultsHandler = (id)v15;

  }
  return v10;
}

- (HKVerifiableClinicalRecordQuery)initWithRecordTypes:(NSArray *)recordTypes sourceTypes:(NSArray *)sourceTypes predicate:(NSPredicate *)predicate resultsHandler:(void *)resultsHandler
{
  NSArray *v10;
  NSArray *v11;
  void *v12;
  HKVerifiableClinicalRecordQuery *v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v10 = recordTypes;
  v11 = sourceTypes;
  v12 = resultsHandler;
  v21.receiver = self;
  v21.super_class = (Class)HKVerifiableClinicalRecordQuery;
  v13 = -[HKQuery _initWithObjectType:predicate:](&v21, sel__initWithObjectType_predicate_, 0, predicate);
  if (v13)
  {
    v14 = -[NSArray copy](v10, "copy");
    v15 = v13->_recordTypes;
    v13->_recordTypes = (NSArray *)v14;

    v16 = -[NSArray copy](v11, "copy");
    v17 = v13->_sourceTypes;
    v13->_sourceTypes = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    v19 = v13->_resultsHandler;
    v13->_resultsHandler = (id)v18;

  }
  return v13;
}

- (void)client_deliverVerifiableClinicalRecords:(id)a3 queryUUID:(id)a4
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
  block[2] = __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke(uint64_t a1)
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

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __85__HKVerifiableClinicalRecordQuery_client_deliverVerifiableClinicalRecords_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
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
    block[2] = __54__HKVerifiableClinicalRecordQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __54__HKVerifiableClinicalRecordQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3D2BC0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKVerifiableClinicalRecordQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverVerifiableClinicalRecords_queryUUID_, 0, 0);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKVerifiableClinicalRecordQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ resultsHandler must be non-nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKVerifiableClinicalRecordQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKVerifiableClinicalRecordQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setRecordTypes:", self->_recordTypes, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setSourceTypes:", self->_sourceTypes);

}

- (NSArray)recordTypes
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSArray)sourceTypes
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTypes, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
