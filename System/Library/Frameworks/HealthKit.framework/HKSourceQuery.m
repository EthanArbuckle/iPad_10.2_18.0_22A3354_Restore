@implementation HKSourceQuery

- (HKSourceQuery)initWithSampleType:(HKSampleType *)sampleType samplePredicate:(NSPredicate *)objectPredicate completionHandler:(void *)completionHandler
{
  void *v8;
  HKSourceQuery *v9;
  void *v10;
  id v11;
  objc_super v13;

  v8 = completionHandler;
  v13.receiver = self;
  v13.super_class = (Class)HKSourceQuery;
  v9 = -[HKQuery _initWithObjectType:predicate:](&v13, sel__initWithObjectType_predicate_, sampleType, objectPredicate);
  if (v9)
  {
    v10 = _Block_copy(v8);
    v11 = v9->_completionHandler;
    v9->_completionHandler = v10;

  }
  return v9;
}

- (void)setUpdateHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HKSourceQuery_setUpdateHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(v7, block);

}

void __34__HKSourceQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 176);
  *(_QWORD *)(v3 + 176) = v2;

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  id completionHandler;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v6 = _Block_copy(completionHandler);
    -[HKQuery clientQueue](self, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__HKSourceQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v11 = v6;
    block[4] = self;
    v10 = v4;
    v8 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __36__HKSourceQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3D9B60;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKSourceQuery;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverSources_forQuery_, 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverUpdatedSources_added_forQuery_, 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverUpdatedSources_added_forQuery_, 1, 0);

}

+ (void)configureServerInterface:(id)a3
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKSourceQuery;
  objc_msgSendSuper2(&v3, sel_configureServerInterface_, a3);
}

- (void)queue_validate
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSourceQuery;
  -[HKQuery queue_validate](&v8, sel_queue_validate);
  if (!self->_completionHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ completionHandler cannot be nil"), objc_opt_class());
  -[HKQuery objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be non-nil"), objc_opt_class());
  -[HKQuery objectType](self, "objectType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = objc_opt_class();
    objc_msgSend(v6, "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be of class %@"), v7, objc_opt_class());
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSourceQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler != 0;
}

- (void)client_deliverSources:(id)a3 forQuery:(id)a4
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
  block[2] = __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 168));
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 176);
  *(_BYTE *)(v4 + 152) = 1;
  if (v2)
  {
    v6 = v5 == 0;
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke_2;
    v11[3] = &unk_1E37E6710;
    v9 = v2;
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v9;
    v11[4] = v10;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, v6, v11);

  }
}

uint64_t __48__HKSourceQuery_client_deliverSources_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)client_deliverUpdatedSources:(id)a3 added:(id)a4 forQuery:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKQuery queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke;
  v15[3] = &unk_1E37EBEA8;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 176));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke_2;
  v6[3] = &unk_1E37F3128;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9 = v2;
  v6[4] = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v5 = v2;
  objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, 0, v6);

}

uint64_t __61__HKSourceQuery_client_deliverUpdatedSources_added_forQuery___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

@end
