@implementation HKDocumentQuery

- (HKDocumentQuery)initWithDocumentType:(HKDocumentType *)documentType predicate:(NSPredicate *)predicate limit:(NSUInteger)limit sortDescriptors:(NSArray *)sortDescriptors includeDocumentData:(BOOL)includeDocumentData resultsHandler:(void *)resultsHandler
{
  NSArray *v14;
  void *v15;
  HKDocumentQuery *v16;
  HKDocumentQuery *v17;
  uint64_t v18;
  NSArray *v19;
  void *v20;
  id v21;
  objc_super v23;

  v14 = sortDescriptors;
  v15 = resultsHandler;
  v23.receiver = self;
  v23.super_class = (Class)HKDocumentQuery;
  v16 = -[HKQuery _initWithObjectType:predicate:](&v23, sel__initWithObjectType_predicate_, documentType, predicate);
  v17 = v16;
  if (v16)
  {
    v16->_limit = limit;
    v18 = -[NSArray copy](v14, "copy");
    v19 = v17->_sortDescriptors;
    v17->_sortDescriptors = (NSArray *)v18;

    v17->_includeDocumentData = includeDocumentData;
    v20 = _Block_copy(v15);
    v21 = v17->_resultsHandler;
    v17->_resultsHandler = v20;

  }
  return v17;
}

- (void)client_deliverDocument:(id)a3 query:(id)a4
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
  block[2] = __48__HKDocumentQuery_client_deliverDocument_query___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __48__HKDocumentQuery_client_deliverDocument_query___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v2 = _Block_copy(*(const void **)(a1[4] + 176));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)a1[4];
    v5 = a1[5] == 0;
    v6 = a1[6];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__HKDocumentQuery_client_deliverDocument_query___block_invoke_2;
    v10[3] = &unk_1E37EA9C8;
    v13 = v5;
    v7 = v2;
    v8 = a1[4];
    v9 = (void *)a1[5];
    v12 = v7;
    v10[4] = v8;
    v11 = v9;
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, v5, v10);

  }
}

void __48__HKDocumentQuery_client_deliverDocument_query___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60], 1, 0);
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    v8 = 0;
    v3 = objc_msgSend(v2, "prepareForDelivery:", &v8);
    v4 = v8;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v9[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(v5 + 16))(v5, v6, v7, 0, 0);

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, id))(v5 + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 0, 0, v4);
    }

  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3EEC20;
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDocumentQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setIncludeDocumentData:", self->_includeDocumentData);

}

- (void)queue_validate
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKDocumentQuery;
  -[HKQuery queue_validate](&v8, sel_queue_validate);
  -[HKQuery objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    -[HKQuery objectType](self, "objectType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ is not an instance of %@"), v7, objc_opt_class());

  }
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ resultsHandler cannot be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDocumentQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

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
    block[2] = __38__HKDocumentQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __38__HKDocumentQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 1, a1[5]);
}

- (NSUInteger)limit
{
  return self->_limit;
}

- (NSArray)sortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)includeDocumentData
{
  return self->_includeDocumentData;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
