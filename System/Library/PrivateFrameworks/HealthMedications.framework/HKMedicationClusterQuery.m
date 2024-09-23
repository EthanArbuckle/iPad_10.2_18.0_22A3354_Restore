@implementation HKMedicationClusterQuery

- (HKMedicationClusterQuery)initWithScanResult:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5
{
  id v9;
  id v10;
  HKMedicationClusterQuery *v11;
  HKMedicationClusterQuery *v12;
  uint64_t v13;
  id resultsHandler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationClusterQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v16, sel__initWithObjectType_predicate_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_queryType = 1;
    objc_storeStrong((id *)&v11->_scanResult, a3);
    v12->_limit = a4;
    v13 = objc_msgSend(v10, "copy");
    resultsHandler = v12->_resultsHandler;
    v12->_resultsHandler = (id)v13;

  }
  return v12;
}

- (HKMedicationClusterQuery)initWithMachineReadableCode:(id)a3 codeAttributeType:(int64_t)a4 resultsHandler:(id)a5
{
  id v9;
  id v10;
  HKMedicationClusterQuery *v11;
  HKMedicationClusterQuery *v12;
  uint64_t v13;
  id resultsHandler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationClusterQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v16, sel__initWithObjectType_predicate_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_queryType = 2;
    objc_storeStrong((id *)&v11->_machineReadableCode, a3);
    v12->_codeAttributeType = a4;
    v13 = objc_msgSend(v10, "copy");
    resultsHandler = v12->_resultsHandler;
    v12->_resultsHandler = (id)v13;

  }
  return v12;
}

- (HKMedicationClusterQuery)initWithTextSearchTokens:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5
{
  id v9;
  id v10;
  HKMedicationClusterQuery *v11;
  HKMedicationClusterQuery *v12;
  uint64_t v13;
  id resultsHandler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicationClusterQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v16, sel__initWithObjectType_predicate_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_queryType = 3;
    objc_storeStrong((id *)&v11->_textSearchTokens, a3);
    v12->_limit = a4;
    v13 = objc_msgSend(v10, "copy");
    resultsHandler = v12->_resultsHandler;
    v12->_resultsHandler = (id)v13;

  }
  return v12;
}

- (id)initForCHRImportWithExistingMedications:(id)a3 sinceDate:(id)a4 limit:(int64_t)a5 resultsHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id *v14;
  id *v15;
  uint64_t v16;
  id v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationClusterQuery;
  v14 = -[HKQuery _initWithObjectType:predicate:](&v19, sel__initWithObjectType_predicate_, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14[19] = (id)4;
    objc_storeStrong(v14 + 25, a3);
    objc_storeStrong(v15 + 26, a4);
    v15[20] = (id)a5;
    v16 = objc_msgSend(v13, "copy");
    v17 = v15[27];
    v15[27] = (id)v16;

  }
  return v15;
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
  block[2] = __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke;
  block[3] = &unk_1E6CD5B80;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke(uint64_t a1)
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

  v2 = (void *)MEMORY[0x1BCCAA908](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke_2;
    v8[3] = &unk_1E6CD5B58;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __60__HKMedicationClusterQuery_client_deliverResults_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
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
  v5 = (void *)MEMORY[0x1BCCAA908](self->_resultsHandler);
  -[HKQuery clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HKMedicationClusterQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E6CD5B58;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __47__HKMedicationClusterQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationClusterQuery;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setQueryType:", self->_queryType);
  objc_msgSend(v4, "setLimit:", self->_limit);
  switch(self->_queryType)
  {
    case 1:
      objc_msgSend(v4, "setScanResult:", self->_scanResult);
      break;
    case 2:
      objc_msgSend(v4, "setMachineReadableCode:", self->_machineReadableCode);
      objc_msgSend(v4, "setCodeAttributeType:", self->_codeAttributeType);
      break;
    case 3:
      objc_msgSend(v4, "setTextSearchTokens:", self->_textSearchTokens);
      break;
    case 4:
      objc_msgSend(v4, "setExistingMedications:", self->_existingMedications);
      objc_msgSend(v4, "setSinceDate:", self->_sinceDate);
      break;
    default:
      break;
  }

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EF189DF8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMedicationClusterQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverResults_queryUUID_, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_sinceDate, 0);
  objc_storeStrong((id *)&self->_existingMedications, 0);
  objc_storeStrong((id *)&self->_textSearchTokens, 0);
  objc_storeStrong((id *)&self->_machineReadableCode, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end
