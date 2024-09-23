@implementation HDNotificationSyncStoreServer

- (HDNotificationSyncStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDNotificationSyncStoreServer *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *queue;
  HDNotificationSyncClient *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HDNotificationSyncClient *syncClient;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDNotificationSyncStoreServer;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v22, sel_initWithUUID_configuration_client_delegate_, a3, v10, v11, a6);
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    v16 = [HDNotificationSyncClient alloc];
    objc_msgSend(v11, "profile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDNotificationSyncClient initWithProfile:clientIdentifier:queue:](v16, "initWithProfile:clientIdentifier:queue:", v17, v18, v12->_queue);
    syncClient = v12->_syncClient;
    v12->_syncClient = (HDNotificationSyncClient *)v19;

  }
  return v12;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  char isKindOfClass;

  v7 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:invalidArgument:class:selector:", a5, CFSTR("Configuration must be HKNotificationSyncStoreServerConfiguration"), objc_opt_class(), a2);
  return isKindOfClass & 1;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6940], "taskIdentifier");
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB5698];
  v4[0] = *MEMORY[0x1E0CB5140];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)remote_sendNotificationInstruction:(id)a3 completion:(id)a4
{
  HDNotificationSyncClient *syncClient;
  void (**v6)(id, uint64_t, id);
  uint64_t v7;
  id v8;
  id v9;

  syncClient = self->_syncClient;
  v9 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = -[HDNotificationSyncClient sendNotificationInstruction:criteria:error:](syncClient, "sendNotificationInstruction:criteria:error:", a3, 0, &v9);
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (void)remote_sendNotificationInstruction:(id)a3 savingObjectAsExistsCriteria:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, id);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  HDNotificationInstructionObjectNotInDatabaseCriteria *v17;
  void *v18;
  HDNotificationInstructionObjectNotInDatabaseCriteria *v19;
  HDNotificationSyncClient *syncClient;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, id))a5;
  -[HDStandardTaskServer client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v15 = objc_msgSend(v13, "insertDataObjects:error:", v14, &v23);
  v16 = v23;

  if ((v15 & 1) != 0)
  {
    v17 = [HDNotificationInstructionObjectNotInDatabaseCriteria alloc];
    objc_msgSend(v9, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDNotificationInstructionUUIDCriteria initWithUUID:](v17, "initWithUUID:", v18);

    syncClient = self->_syncClient;
    v22 = 0;
    v21 = -[HDNotificationSyncClient sendNotificationInstruction:criteria:error:](syncClient, "sendNotificationInstruction:criteria:error:", v8, v19, &v22);
    v16 = v22;
    v10[2](v10, v21, v16);

  }
  else
  {
    v10[2](v10, 0, v16);
  }

}

- (void)remote_notificationHoldInstructionsWithCompletion:(id)a3
{
  HDNotificationSyncClient *syncClient;
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  syncClient = self->_syncClient;
  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDNotificationSyncClient notificationHoldInstructionsWithError:](syncClient, "notificationHoldInstructionsWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)remote_fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 completion:(id)a5
{
  -[HDNotificationSyncClient fakeReceivedNotificationInstruction:sendingDeviceInfo:criteria:completion:](self->_syncClient, "fakeReceivedNotificationInstruction:sendingDeviceInfo:criteria:completion:", a3, a4, 0, a5);
}

- (void)remote_obliterateNotificationInstructionsWithCompletion:(id)a3
{
  HDNotificationSyncClient *syncClient;
  void (**v4)(id, uint64_t, id);
  uint64_t v5;
  id v6;
  id v7;

  syncClient = self->_syncClient;
  v7 = 0;
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = -[HDNotificationSyncClient obliterateNotificationInstructionsWithError:](syncClient, "obliterateNotificationInstructionsWithError:", &v7);
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)remote_sendNewDeviceNotificationWithMessageKind:(int64_t)a3 completion:(id)a4
{
  HDNotificationSyncClient *syncClient;
  void (**v6)(id, uint64_t, id);
  uint64_t v7;
  id v8;
  id v9;

  syncClient = self->_syncClient;
  v9 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = -[HDNotificationSyncClient sendNewDeviceNotificationWithMessageKind:error:](syncClient, "sendNewDeviceNotificationWithMessageKind:error:", a3, &v9);
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
