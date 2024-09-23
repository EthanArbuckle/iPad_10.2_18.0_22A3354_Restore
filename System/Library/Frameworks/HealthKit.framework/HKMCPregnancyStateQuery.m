@implementation HKMCPregnancyStateQuery

- (HKMCPregnancyStateQuery)initWithUpdateHandler:(id)a3
{
  return -[HKMCPregnancyStateQuery initWithIsRunningForMaintenance:updateHandler:](self, "initWithIsRunningForMaintenance:updateHandler:", 0, a3);
}

- (HKMCPregnancyStateQuery)initWithIsRunningForMaintenance:(BOOL)a3 updateHandler:(id)a4
{
  id v6;
  HKMCPregnancyStateQuery *v7;
  uint64_t v8;
  id updateHandler;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKMCPregnancyStateQuery;
  v7 = -[HKQuery _initWithObjectType:predicate:](&v11, sel__initWithObjectType_predicate_, 0, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    updateHandler = v7->_updateHandler;
    v7->_updateHandler = (id)v8;

    v7->_isRunningForMaintenance = a3;
  }

  return v7;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE410068;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HKMCPregnancyStateQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v11, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setIsRunningForMaintenance:", self->_isRunningForMaintenance, v11.receiver, v11.super_class);

  _HKInitializeLogging();
  v5 = (void *)HKLogMenstrualCycles;
  if (os_log_type_enabled((os_log_t)HKLogMenstrualCycles, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[HKQuery debugIdentifier](self, "debugIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRunningForMaintenance);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Configured to run as maintenance: %{public}@", buf, 0x20u);

  }
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
  v5 = _Block_copy(self->_updateHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HKMCPregnancyStateQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __46__HKMCPregnancyStateQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMCPregnancyStateQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___HKMCPregnancyStateQuery;
  v3 = a3;
  objc_msgSendSuper2(&v10, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_client_deliverPregnancyModel_queryUUID_, 0, 0);

}

- (void)client_deliverPregnancyModel:(id)a3 queryUUID:(id)a4
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
  block[2] = __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke_2;
    v5[3] = &unk_1E37E67E8;
    v5[4] = v3;
    v6 = *(id *)(a1 + 48);
    v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v5);

  }
}

uint64_t __66__HKMCPregnancyStateQuery_client_deliverPregnancyModel_queryUUID___block_invoke_2(_QWORD *a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSensitiveLogItems");

  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)HKLogMenstrualCycles;
    if (os_log_type_enabled((os_log_t)HKLogMenstrualCycles, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (void *)objc_opt_class();
      v7 = a1[5];
      v10 = 138543618;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v8 = v6;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering updated pregnancy model: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)isRunningForMaintenance
{
  return self->_isRunningForMaintenance;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
