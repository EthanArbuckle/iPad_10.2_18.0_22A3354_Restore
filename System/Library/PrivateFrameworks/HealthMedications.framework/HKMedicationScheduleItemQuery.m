@implementation HKMedicationScheduleItemQuery

- (HKMedicationScheduleItemQuery)initWithFromDate:(id)a3 toDate:(id)a4 identifier:(id)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKMedicationScheduleItemQuery *v17;
  uint64_t v18;
  NSDate *fromDate;
  uint64_t v20;
  NSDate *toDate;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSArray *sortDescriptors;
  uint64_t v26;
  id resultsHandler;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKMedicationScheduleItemQuery;
  v17 = -[HKQuery _initWithObjectType:predicate:](&v29, sel__initWithObjectType_predicate_, 0, 0);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    fromDate = v17->_fromDate;
    v17->_fromDate = (NSDate *)v18;

    v20 = objc_msgSend(v13, "copy");
    toDate = v17->_toDate;
    v17->_toDate = (NSDate *)v20;

    v22 = objc_msgSend(v14, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    sortDescriptors = v17->_sortDescriptors;
    v17->_sortDescriptors = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    resultsHandler = v17->_resultsHandler;
    v17->_resultsHandler = (id)v26;

  }
  return v17;
}

- (void)client_deliverScheduleItems:(id)a3 queryUUID:(id)a4
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
  block[2] = __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke;
  block[3] = &unk_1E6CD5B80;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke(uint64_t a1)
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
    v8[2] = __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke_2;
    v8[3] = &unk_1E6CD5B58;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __71__HKMedicationScheduleItemQuery_client_deliverScheduleItems_queryUUID___block_invoke_2(_QWORD *a1)
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
  v5.super_class = (Class)HKMedicationScheduleItemQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setFromDate:", self->_fromDate, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setToDate:", self->_toDate);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EF187340;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMedicationScheduleItemQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverScheduleItems_queryUUID_, 0, 0);

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
  block[2] = __52__HKMedicationScheduleItemQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E6CD5B58;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __52__HKMedicationScheduleItemQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicationScheduleItemQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB73A8], CFSTR("%@ resultsHandler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicationScheduleItemQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
