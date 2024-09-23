@implementation HKCurrentActivityCacheQuery

- (HKCurrentActivityCacheQuery)initWithStatisticsIntervalComponents:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKCurrentActivityCacheQuery *v9;
  uint64_t v10;
  id updateHandler;
  uint64_t v12;
  NSDateComponents *statisticsIntervalComponents;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  +[HKObjectType activityCacheType](HKObjectType, "activityCacheType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HKCurrentActivityCacheQuery;
  v9 = -[HKQuery _initWithObjectType:predicate:](&v15, sel__initWithObjectType_predicate_, v8, 0);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    updateHandler = v9->_updateHandler;
    v9->_updateHandler = (id)v10;

    v12 = objc_msgSend(v6, "copy");
    statisticsIntervalComponents = v9->_statisticsIntervalComponents;
    v9->_statisticsIntervalComponents = (NSDateComponents *)v12;

  }
  return v9;
}

- (void)client_deliverQueryResult:(id)a3 queryUUID:(id)a4
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
  block[2] = __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke(uint64_t a1)
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

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);

  }
}

uint64_t __67__HKCurrentActivityCacheQuery_client_deliverQueryResult_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3B42D0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKCurrentActivityCacheQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverQueryResult_queryUUID_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKCurrentActivityCacheQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setStatisticsIntervalComponents:", self->_statisticsIntervalComponents, v5.receiver, v5.super_class);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKCurrentActivityCacheQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
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
    block[2] = __50__HKCurrentActivityCacheQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __50__HKCurrentActivityCacheQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_statisticsIntervalComponents, 0);
}

@end
