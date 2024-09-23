@implementation HKSharedSummaryTransactionQuery

- (HKSharedSummaryTransactionQuery)initWithCommittedTransactions:(BOOL)a3 handler:(id)a4
{
  id v6;
  HKSharedSummaryTransactionQuery *v7;
  uint64_t v8;
  id initialHandler;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKSharedSummaryTransactionQuery;
  v7 = -[HKQuery _initWithObjectType:predicate:](&v11, sel__initWithObjectType_predicate_, 0, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    initialHandler = v7->_initialHandler;
    v7->_initialHandler = (id)v8;

    v7->_committedTransactions = a3;
  }

  return v7;
}

- (HKSharedSummaryTransactionQuery)initWithHandler:(id)a3
{
  return -[HKSharedSummaryTransactionQuery initWithCommittedTransactions:handler:](self, "initWithCommittedTransactions:handler:", 1, a3);
}

- (void)setUpdateHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  if (!self->_committedTransactions)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ does not support updates for non-committed transactions"), objc_opt_class());
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKSharedSummaryTransactionQuery_setUpdateHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __52__HKSharedSummaryTransactionQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 168);
  *(_QWORD *)(v3 + 168) = v2;

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3A67B0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSharedSummaryTransactionQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverTransactions_query_, 0, 0);

}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id initialHandler;
  id updateHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSharedSummaryTransactionQuery;
  -[HKQuery queue_queryDidDeactivate:](&v6, sel_queue_queryDidDeactivate_, a3);
  initialHandler = self->_initialHandler;
  self->_initialHandler = 0;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

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
  v5.super_class = (Class)HKSharedSummaryTransactionQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setCommittedTransactions:", self->_committedTransactions, v5.receiver, v5.super_class);

}

- (void)client_deliverTransactions:(id)a3 query:(id)a4
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
  block[2] = __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 160))
    v4 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__updateHandler;
  else
    v4 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__initialHandler;
  v5 = _Block_copy(*(const void **)(v3 + *v4));
  v6 = v5;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 1;
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke_2;
    v11[3] = &unk_1E37E6710;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v9;
    v11[4] = v10;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, v2, v11);

  }
}

uint64_t __68__HKSharedSummaryTransactionQuery_client_deliverTransactions_query___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  int *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  if (self->_initialHandlerCalled)
    v5 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__updateHandler;
  else
    v5 = &OBJC_IVAR___HKSharedSummaryTransactionQuery__initialHandler;
  v6 = _Block_copy(*(const void **)((char *)&self->super.super.isa + *v5));
  if (v6)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HKSharedSummaryTransactionQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v10 = v6;
    block[4] = self;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

uint64_t __54__HKSharedSummaryTransactionQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_initialHandler, 0);
}

@end
