@implementation HKWorkoutTrainingLoadCollectionQuery

- (HKWorkoutTrainingLoadCollectionQuery)initWithPredicate:(id)a3 options:(int64_t)a4 anchorDate:(id)a5 intervalComponents:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  HKWorkoutTrainingLoadCollectionQuery *v15;
  HKWorkoutTrainingLoadCollectionQuery *v16;
  uint64_t v17;
  NSDate *anchorDate;
  uint64_t v19;
  NSDateComponents *intervalComponents;
  uint64_t v21;
  id completionHandler;
  objc_super v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKWorkoutTrainingLoadCollectionQuery;
  v15 = -[HKQuery _initWithObjectType:predicate:](&v24, sel__initWithObjectType_predicate_, 0, a3);
  v16 = v15;
  if (v15)
  {
    v15->_options = a4;
    v17 = objc_msgSend(v12, "copy");
    anchorDate = v16->_anchorDate;
    v16->_anchorDate = (NSDate *)v17;

    v19 = objc_msgSend(v13, "copy");
    intervalComponents = v16->_intervalComponents;
    v16->_intervalComponents = (NSDateComponents *)v19;

    v21 = objc_msgSend(v14, "copy");
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = (id)v21;

  }
  return v16;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3D39B8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKWorkoutTrainingLoadCollectionQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverTrainingLoadCollection_forQuery_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutTrainingLoadCollectionQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setOptions:", self->_options, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate);
  objc_msgSend(v4, "setIntervalComponents:", self->_intervalComponents);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutTrainingLoadCollectionQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)queue_validate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKWorkoutTrainingLoadCollectionQuery;
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
    block[2] = __59__HKWorkoutTrainingLoadCollectionQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __59__HKWorkoutTrainingLoadCollectionQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)client_deliverTrainingLoadCollection:(id)a3 forQuery:(id)a4
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
  block[2] = __86__HKWorkoutTrainingLoadCollectionQuery_client_deliverTrainingLoadCollection_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __86__HKWorkoutTrainingLoadCollectionQuery_client_deliverTrainingLoadCollection_forQuery___block_invoke(uint64_t a1)
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

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 176));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__HKWorkoutTrainingLoadCollectionQuery_client_deliverTrainingLoadCollection_forQuery___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 1, v8);

  }
}

uint64_t __86__HKWorkoutTrainingLoadCollectionQuery_client_deliverTrainingLoadCollection_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (int64_t)options
{
  return self->_options;
}

- (NSDate)anchorDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (NSDateComponents)intervalComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 168, 1);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end
