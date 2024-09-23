@implementation HKActivitySummaryQuery

- (HKActivitySummaryQuery)initWithPredicate:(NSPredicate *)predicate resultsHandler:(void *)handler
{
  void *v6;
  NSPredicate *v7;
  void *v8;
  HKActivitySummaryQuery *v9;
  uint64_t v10;
  id completionHandler;
  void *v12;
  objc_super v14;

  v6 = handler;
  v7 = predicate;
  +[HKObjectType activitySummaryType](HKObjectType, "activitySummaryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HKActivitySummaryQuery;
  v9 = -[HKQuery _initWithObjectType:predicate:](&v14, sel__initWithObjectType_predicate_, v8, v7);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    completionHandler = v9->_completionHandler;
    v9->_completionHandler = (id)v10;

    v9->_initialHandlerCalled = 0;
    +[_HKEntitlements entitlementsForCurrentTaskWithError:](_HKEntitlements, "entitlementsForCurrentTaskWithError:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_shouldIncludeActivitySummaryPrivateProperties = objc_msgSend(v12, "hasEntitlement:", CFSTR("com.apple.private.healthkit"));

    v9->_shouldIncludeActivitySummaryStatistics = 0;
    v9->_orderByDateAscending = 1;
    v9->_limit = 0;
  }

  return v9;
}

- (void)setUpdateHandler:(void *)updateHandler
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = updateHandler;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HKActivitySummaryQuery_setUpdateHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __43__HKActivitySummaryQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 184);
  *(_QWORD *)(v3 + 184) = v2;

}

- (void)setShouldIncludePrivateActivitySummaryProperties:(BOOL)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_shouldIncludeActivitySummaryPrivateProperties = a3;
}

- (void)setShouldIncludeActivitySummaryStatistics:(BOOL)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_shouldIncludeActivitySummaryStatistics = a3;
}

- (void)setOrderByDateAscending:(BOOL)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_orderByDateAscending = a3;
}

- (void)setLimit:(unint64_t)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_limit = a3;
}

- (id)completionHandler
{
  return _Block_copy(self->_completionHandler);
}

- (void)client_deliverActivitySummaries:(id)a3 isFinalBatch:(BOOL)a4 clearPendingBatches:(BOOL)a5 queryUUID:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[HKQuery queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke;
  v15[3] = &unk_1E37EA5D0;
  v18 = a5;
  v15[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

void __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  char v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 152);
  v4 = _Block_copy(*(const void **)(v2 + 184));
  v5 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  v6 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (v7 && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 168);
    *(_QWORD *)(v9 + 168) = v8;

  }
  if (*(_BYTE *)(a1 + 57))
  {
    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 168);
    *(_QWORD *)(v12 + 168) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 1;
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke_2;
    v17[3] = &unk_1E37EE900;
    v21 = v3;
    v18 = v11;
    v19 = v4;
    v17[4] = *(_QWORD *)(a1 + 32);
    v20 = v5;
    v16 = v11;
    objc_msgSend(v14, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v15, v6, v17);

  }
}

uint64_t __101__HKActivitySummaryQuery_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 64))
  {
    v1 = *(_QWORD *)(result + 48);
    if (!v1)
      return result;
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, *(_QWORD *)(result + 32), *(_QWORD *)(result + 40), 0);
  }
  v1 = *(_QWORD *)(result + 56);
  if (v1)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, *(_QWORD *)(result + 32), *(_QWORD *)(result + 40), 0);
  return result;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3C60F8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKActivitySummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverActivitySummaries_isFinalBatch_clearPendingBatches_queryUUID_, 0, 0);

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
  v5.super_class = (Class)HKActivitySummaryQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setShouldIncludeActivitySummaryPrivateProperties:", -[HKActivitySummaryQuery shouldIncludeActivitySummaryPrivateProperties](self, "shouldIncludeActivitySummaryPrivateProperties", v5.receiver, v5.super_class));
  objc_msgSend(v4, "setShouldIncludeActivitySummaryStatistics:", -[HKActivitySummaryQuery shouldIncludeActivitySummaryStatistics](self, "shouldIncludeActivitySummaryStatistics"));
  objc_msgSend(v4, "setOrderByDateAscending:", -[HKActivitySummaryQuery orderByDateAscending](self, "orderByDateAscending"));
  objc_msgSend(v4, "setLimit:", -[HKActivitySummaryQuery limit](self, "limit"));

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  id updateHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKActivitySummaryQuery;
  -[HKQuery queue_queryDidDeactivate:](&v6, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKActivitySummaryQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_completionHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ completionHandler cannot be nil"), objc_opt_class());
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL initialHandlerCalled;
  NSObject *v9;
  id *v10;
  id *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  NSObject *v19;
  BOOL v20;

  v4 = a3;
  v5 = _Block_copy(self->_updateHandler);
  v6 = _Block_copy(self->_completionHandler);
  if (HKProgramSDKAtLeast(0x7E10901FFFFFFFFLL, v7))
  {
    initialHandlerCalled = self->_initialHandlerCalled;
    self->_initialHandlerCalled = 1;
    -[HKQuery clientQueue](self, "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HKActivitySummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37EE900;
    v20 = initialHandlerCalled;
    v10 = &v18;
    v18 = v5;
    block[4] = self;
    v11 = &v17;
    v17 = v4;
    v19 = v6;
    dispatch_async(v9, block);

    v12 = v19;
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__HKActivitySummaryQuery_queue_deliverError___block_invoke_2;
    v13[3] = &unk_1E37E6710;
    v10 = &v15;
    v15 = v6;
    v13[4] = self;
    v11 = &v14;
    v14 = v4;
    dispatch_async(v12, v13);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __45__HKActivitySummaryQuery_queue_deliverError___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 64))
  {
    v1 = *(_QWORD *)(result + 48);
    if (!v1)
      return result;
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, *(_QWORD *)(result + 32), 0, *(_QWORD *)(result + 40));
  }
  v1 = *(_QWORD *)(result + 56);
  if (v1)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, *(_QWORD *)(result + 32), 0, *(_QWORD *)(result + 40));
  return result;
}

uint64_t __45__HKActivitySummaryQuery_queue_deliverError___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
}

- (void)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)shouldIncludeActivitySummaryPrivateProperties
{
  return self->_shouldIncludeActivitySummaryPrivateProperties;
}

- (void)setShouldIncludeActivitySummaryPrivateProperties:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryPrivateProperties = a3;
}

- (BOOL)shouldIncludeActivitySummaryStatistics
{
  return self->_shouldIncludeActivitySummaryStatistics;
}

- (BOOL)orderByDateAscending
{
  return self->_orderByDateAscending;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pendingActivitySummaries, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
