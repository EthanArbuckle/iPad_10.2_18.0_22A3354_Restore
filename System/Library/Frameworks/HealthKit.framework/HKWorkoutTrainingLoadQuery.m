@implementation HKWorkoutTrainingLoadQuery

- (HKWorkoutTrainingLoadQuery)initWithPredicate:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  HKWorkoutTrainingLoadQuery *v9;
  HKWorkoutTrainingLoadQuery *v10;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoadQuery;
  v9 = -[HKQuery _initWithObjectType:predicate:](&v14, sel__initWithObjectType_predicate_, 0, a3);
  v10 = v9;
  if (v9)
  {
    v9->_options = a4;
    v11 = objc_msgSend(v8, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

  }
  return v10;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3B4E40;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKWorkoutTrainingLoadQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverTrainingLoadResults_forQuery_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutTrainingLoadQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setOptions:", self->_options, v5.receiver, v5.super_class);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutTrainingLoadQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)queue_validate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKWorkoutTrainingLoadQuery;
  -[HKQuery queue_validate](&v2, sel_queue_validate);
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
  v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__HKWorkoutTrainingLoadQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __49__HKWorkoutTrainingLoadQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)client_deliverTrainingLoadResults:(id)a3 forQuery:(id)a4
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
  block[2] = __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke(uint64_t a1)
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
    v8[2] = __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __73__HKWorkoutTrainingLoadQuery_client_deliverTrainingLoadResults_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (int64_t)options
{
  return self->_options;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
