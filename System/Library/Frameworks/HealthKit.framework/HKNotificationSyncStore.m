@implementation HKNotificationSyncStore

- (HKNotificationSyncStore)initWithClientIdentifier:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  HKNotificationSyncStore *v8;
  uint64_t v9;
  NSString *clientIdentifier;
  HKTaskServerProxyProvider *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HKTaskServerProxyProvider *proxyProvider;
  HKNotificationSyncStoreServerConfiguration *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKNotificationSyncStore;
  v8 = -[HKNotificationSyncStore init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    v11 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v11, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v7, v12, v8, v13);
    proxyProvider = v8->_proxyProvider;
    v8->_proxyProvider = (HKTaskServerProxyProvider *)v14;

    -[HKProxyProvider setShouldRetryOnInterruption:](v8->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v16 = -[HKNotificationSyncStoreServerConfiguration initWithClientIdentifier:]([HKNotificationSyncStoreServerConfiguration alloc], "initWithClientIdentifier:", v6);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v8->_proxyProvider, "setTaskConfiguration:", v16);

  }
  return v8;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)sendNotificationInstruction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke;
  v14[3] = &unk_1E37EC810;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNotificationInstruction:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__HKNotificationSyncStore_sendNotificationInstruction_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendNotificationInstruction:(id)a3 savingObjectAsExistsCriteria:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke;
  v18[3] = &unk_1E37EC838;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNotificationInstruction:savingObjectAsExistsCriteria:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __95__HKNotificationSyncStore_sendNotificationInstruction_savingObjectAsExistsCriteria_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getNotificationHoldInstructionsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke;
  v10[3] = &unk_1E37EC860;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_notificationHoldInstructionsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__HKNotificationSyncStore_getNotificationHoldInstructionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke;
  v18[3] = &unk_1E37EC838;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fakeReceivedNotificationInstruction:sendingDeviceInfo:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __92__HKNotificationSyncStore_fakeReceivedNotificationInstruction_sendingDeviceInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)obliterateNotificationInstructionsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke;
  v10[3] = &unk_1E37EC860;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_obliterateNotificationInstructionsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__HKNotificationSyncStore_obliterateNotificationInstructionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke;
  v12[3] = &unk_1E37EC888;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNewDeviceNotificationWithMessageKind:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __79__HKNotificationSyncStore_sendNewDeviceNotificationWithMessageKind_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
