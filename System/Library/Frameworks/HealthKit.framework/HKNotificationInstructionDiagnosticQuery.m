@implementation HKNotificationInstructionDiagnosticQuery

- (HKNotificationInstructionDiagnosticQuery)initWithResultsHandler:(id)a3
{
  id v4;
  HKNotificationInstructionDiagnosticQuery *v5;
  uint64_t v6;
  id queue_resultsHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKNotificationInstructionDiagnosticQuery;
  v5 = -[HKQuery _initWithObjectType:predicate:](&v9, sel__initWithObjectType_predicate_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    queue_resultsHandler = v5->_queue_resultsHandler;
    v5->_queue_resultsHandler = (id)v6;

  }
  return v5;
}

- (void)client_deliverNotificationInstructions:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
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
  v15[2] = __119__HKNotificationInstructionDiagnosticQuery_client_deliverNotificationInstructions_clearPending_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E37EA5D0;
  v18 = a4;
  v15[4] = self;
  v16 = v10;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

void __119__HKNotificationInstructionDiagnosticQuery_client_deliverNotificationInstructions_clearPending_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  if (v2 && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = v3;

  }
  if (*(_BYTE *)(a1 + 57))
    -[HKNotificationInstructionDiagnosticQuery _queue_deliverResultsForQueryUUID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
}

- (void)_queue_deliverResultsForQueryUUID:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = (void *)objc_msgSend(*(id *)(a1 + 160), "copy");
    v6 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;

    v7 = _Block_copy(*(const void **)(a1 + 152));
    v8 = v7;
    if (v7)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __78__HKNotificationInstructionDiagnosticQuery__queue_deliverResultsForQueryUUID___block_invoke;
      v9[3] = &unk_1E37E6710;
      v11 = v7;
      v9[4] = a1;
      v10 = v5;
      objc_msgSend((id)a1, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, 1, v9);

    }
  }

}

uint64_t __78__HKNotificationInstructionDiagnosticQuery__queue_deliverResultsForQueryUUID___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
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
  v5 = (void *)objc_msgSend(self->_queue_resultsHandler, "copy");
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HKNotificationInstructionDiagnosticQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __63__HKNotificationInstructionDiagnosticQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id queue_resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKNotificationInstructionDiagnosticQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  queue_resultsHandler = self->_queue_resultsHandler;
  self->_queue_resultsHandler = 0;

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3D2B00;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKNotificationInstructionDiagnosticQuery;
  v3 = a3;
  objc_msgSendSuper2(&v5, sel_configureClientInterface_, v3);
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class(), v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_client_deliverNotificationInstructions_clearPending_isFinalBatch_queryUUID_, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_resultsPendingDelivery, 0);
  objc_storeStrong(&self->_queue_resultsHandler, 0);
}

@end
