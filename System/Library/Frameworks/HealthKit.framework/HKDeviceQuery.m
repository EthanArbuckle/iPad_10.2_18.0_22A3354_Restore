@implementation HKDeviceQuery

- (HKDeviceQuery)initWithObjectType:(id)a3 predicate:(id)a4 resultsHandler:(id)a5
{
  id v8;
  HKDeviceQuery *v9;
  uint64_t v10;
  id resultsHandler;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HKDeviceQuery;
  v9 = -[HKQuery _initWithObjectType:predicate:](&v13, sel__initWithObjectType_predicate_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    resultsHandler = v9->_resultsHandler;
    v9->_resultsHandler = (id)v10;

    -[HKQuery setShouldSuppressDataCollection:](v9, "setShouldSuppressDataCollection:", 1);
  }

  return v9;
}

- (void)clientRemote_deliverDevices:(id)a3 done:(BOOL)a4 reset:(BOOL)a5 query:(id)a6
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
  v15[2] = __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke;
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

void __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  if (!v2 || *(_BYTE *)(a1 + 56))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(_QWORD *)(v4 + 152) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  }
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 57))
  {
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 152);
    *(_QWORD *)(v7 + 152) = 0;

    v9 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
    v10 = v9;
    if (v9)
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke_2;
      v15[3] = &unk_1E37E6710;
      v13 = v9;
      v14 = *(_QWORD *)(a1 + 32);
      v17 = v13;
      v15[4] = v14;
      v16 = v6;
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v15);

    }
  }
}

uint64_t __62__HKDeviceQuery_clientRemote_deliverDevices_done_reset_query___block_invoke_2(_QWORD *a1)
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
  v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__HKDeviceQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __36__HKDeviceQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;

  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3EDB20;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKDeviceQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_deliverDevices_done_reset_query_, 0, 0);

}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_resultDevices, 0);
}

@end
