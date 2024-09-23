@implementation HKMedicationScheduleQuery

- (HKMedicationScheduleQuery)initWithPredicate:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 resultsHandler:(id)a6
{
  id v9;
  id v10;
  HKMedicationScheduleQuery *v11;
  HKMedicationScheduleQuery *v12;
  uint64_t v13;
  NSArray *sortDescriptors;
  uint64_t v15;
  id resultsHandler;
  objc_super v18;

  v9 = a5;
  v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationScheduleQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v18, sel__initWithObjectType_predicate_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_limit = a4;
    v13 = objc_msgSend(v9, "copy");
    sortDescriptors = v12->_sortDescriptors;
    v12->_sortDescriptors = (NSArray *)v13;

    v15 = objc_msgSend(v10, "copy");
    resultsHandler = v12->_resultsHandler;
    v12->_resultsHandler = (id)v15;

  }
  return v12;
}

- (void)client_deliverSchedules:(id)a3 queryUUID:(id)a4
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
  block[2] = __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke;
  block[3] = &unk_1E6CD5B80;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke(uint64_t a1)
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

  v2 = (void *)MEMORY[0x1BCCAA908](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke_2;
    v8[3] = &unk_1E6CD5B58;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __63__HKMedicationScheduleQuery_client_deliverSchedules_queryUUID___block_invoke_2(_QWORD *a1)
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
  v5.super_class = (Class)HKMedicationScheduleQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setLimit:", self->_limit, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EF189D00;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKMedicationScheduleQuery;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverSchedules_queryUUID_, 0, 0);

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
  block[2] = __48__HKMedicationScheduleQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E6CD5B58;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __48__HKMedicationScheduleQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicationScheduleQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB73A8], CFSTR("%@ resultsHandler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
