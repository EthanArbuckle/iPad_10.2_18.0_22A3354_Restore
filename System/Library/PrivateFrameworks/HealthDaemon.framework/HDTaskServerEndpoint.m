@implementation HDTaskServerEndpoint

- (HDTaskServerEndpoint)initWithTaskServerClass:(Class)a3 taskConfiguration:(id)a4 healthStoreConfiguration:(id)a5 taskUUID:(id)a6 instanceUUID:(id)a7 profile:(id)a8 databaseAccessibilityAssertions:(id)a9 connectionQueue:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HDTaskServerEndpoint *v22;
  HDTaskServerEndpoint *v23;
  uint64_t v24;
  NSUUID *taskUUID;
  uint64_t v26;
  NSUUID *instanceUUID;
  uint64_t v28;
  HKTaskConfiguration *taskConfiguration;
  uint64_t v30;
  HKHealthStoreConfiguration *healthStoreConfiguration;
  id v32;
  id WeakRetained;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  HDXPCListener *listener;
  id v42;
  id obj;
  objc_super v44;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  obj = a8;
  v20 = a9;
  v21 = a10;
  v44.receiver = self;
  v44.super_class = (Class)HDTaskServerEndpoint;
  v22 = -[HDTaskServerEndpoint init](&v44, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_taskServerClass, a3);
    v24 = objc_msgSend(v18, "copy");
    taskUUID = v23->_taskUUID;
    v23->_taskUUID = (NSUUID *)v24;

    v26 = objc_msgSend(v19, "copy");
    instanceUUID = v23->_instanceUUID;
    v23->_instanceUUID = (NSUUID *)v26;

    v28 = objc_msgSend(v16, "copy");
    taskConfiguration = v23->_taskConfiguration;
    v23->_taskConfiguration = (HKTaskConfiguration *)v28;

    v30 = objc_msgSend(v17, "copy");
    healthStoreConfiguration = v23->_healthStoreConfiguration;
    v23->_healthStoreConfiguration = (HKHealthStoreConfiguration *)v30;

    v42 = v18;
    v32 = v16;
    objc_storeWeak((id *)&v23->_profile, obj);
    objc_storeWeak((id *)&v23->_databaseAccessibilityAssertions, v20);
    WeakRetained = objc_loadWeakRetained((id *)&v23->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "connectionManager");
    v35 = v19;
    v36 = v17;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "createAnonymousListenerWithLabel:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    listener = v23->_listener;
    v23->_listener = (HDXPCListener *)v39;

    v17 = v36;
    v19 = v35;

    v16 = v32;
    v18 = v42;
    -[HDXPCListener setConnectionQueue:](v23->_listener, "setConnectionQueue:", v21);
    -[HDXPCListener setDelegate:](v23->_listener, "setDelegate:", v23);
  }

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  -[HDTaskServerEndpoint invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDTaskServerEndpoint;
  -[HDTaskServerEndpoint dealloc](&v3, sel_dealloc);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return (NSXPCListenerEndpoint *)-[HDXPCListener endpoint](self->_listener, "endpoint");
}

- (void)resume
{
  -[HDXPCListener resume](self->_listener, "resume");
}

- (void)invalidate
{
  -[HDXPCListener invalidate](self->_listener, "invalidate");
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  HDHealthStoreClient *v10;
  HKHealthStoreConfiguration *healthStoreConfiguration;
  id WeakRetained;
  id v13;
  HDHealthStoreClient *v14;
  char v15;
  Class taskServerClass;
  NSUUID *taskUUID;
  HKTaskConfiguration *taskConfiguration;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  Class v24;
  void *v25;
  id v26;
  void *v27;
  id v29;

  v7 = a4;
  -[HDTaskServerEndpoint delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTaskServerEndpoint taskServerDelegate](self, "taskServerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [HDHealthStoreClient alloc];
  healthStoreConfiguration = self->_healthStoreConfiguration;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v13 = objc_loadWeakRetained((id *)&self->_databaseAccessibilityAssertions);
  v14 = -[HDHealthStoreClient initWithXPCClient:configuration:profile:databaseAccessibilityAssertions:](v10, "initWithXPCClient:configuration:profile:databaseAccessibilityAssertions:", v7, healthStoreConfiguration, WeakRetained, v13);

  v15 = objc_opt_respondsToSelector();
  taskServerClass = self->_taskServerClass;
  if ((v15 & 1) != 0)
  {
    taskUUID = self->_taskUUID;
    taskConfiguration = self->_taskConfiguration;
    v29 = 0;
    -[objc_class createTaskServerWithUUID:configuration:client:delegate:error:](taskServerClass, "createTaskServerWithUUID:configuration:client:delegate:error:", taskUUID, taskConfiguration, v14, v9, &v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v29;
    v21 = v20;
    if (!v19)
    {
      if (v20)
      {
        if (a5)
        {
          v21 = objc_retainAutorelease(v20);
          *a5 = v21;
        }
        else
        {
          _HKLogDroppedError();
        }
LABEL_16:
        objc_msgSend(v8, "taskServerDidFailToInitializeForUUID:", self->_taskUUID);
        v19 = 0;
        goto LABEL_17;
      }
LABEL_10:
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = self->_taskServerClass;
      -[NSUUID UUIDString](self->_taskUUID, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hk_error:format:", 124, CFSTR("Failed to create %@ task server (%@)"), v24, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = v26;
        if (a5)
          *a5 = objc_retainAutorelease(v26);
        else
          _HKLogDroppedError();

      }
      v21 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    if ((-[objc_class instancesRespondToSelector:](taskServerClass, "instancesRespondToSelector:", sel_initWithUUID_configuration_client_delegate_) & 1) == 0)goto LABEL_10;
    v22 = objc_msgSend(objc_alloc(self->_taskServerClass), "initWithUUID:configuration:client:delegate:", self->_taskUUID, self->_taskConfiguration, v14, v9);
    if (!v22)
      goto LABEL_10;
    v19 = (void *)v22;
    v21 = 0;
  }
  objc_storeWeak((id *)&self->_taskServer, v19);
LABEL_17:

  return v19;
}

- (void)connectionConfiguredForListener:(id)a3 client:(id)a4 exportedObject:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a5;
  -[HDTaskServerEndpoint profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTaskServerEndpoint delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(v7, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "taskServerRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didCreateTaskServer:", v12);

  objc_msgSend(v8, "taskServerDidFinishInitialization:", v12);
  objc_msgSend(v7, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unitTest_taskServerDidInit:", v12);

}

- (void)connectionInvalidatedForListener:(id)a3 client:(id)a4 exportedObject:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSUUID *taskUUID;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[HDTaskServerEndpoint profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTaskServerEndpoint delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(v8, "taskServerDidInvalidate:", v9);
  objc_msgSend(v7, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "taskServerRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "taskServerDidInvalidate:", v9);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  taskUUID = self->_taskUUID;
  v15 = CFSTR("HDTaskServerUUIDKey");
  v16[0] = taskUUID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("HDTaskServerDidInvalidateNotification"), 0, v14);

}

- (Class)taskServerClass
{
  return self->_taskServerClass;
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (NSUUID)instanceUUID
{
  return self->_instanceUUID;
}

- (HKTaskConfiguration)taskConfiguration
{
  return self->_taskConfiguration;
}

- (HKHealthStoreConfiguration)healthStoreConfiguration
{
  return self->_healthStoreConfiguration;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)databaseAccessibilityAssertions
{
  return (_TtC12HealthDaemon29HDHealthStoreClientAssertions *)objc_loadWeakRetained((id *)&self->_databaseAccessibilityAssertions);
}

- (HDTaskServer)taskServer
{
  return (HDTaskServer *)objc_loadWeakRetained((id *)&self->_taskServer);
}

- (HDTaskServerEndpointDelegate)delegate
{
  return (HDTaskServerEndpointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HDTaskServerDelegate)taskServerDelegate
{
  return (HDTaskServerDelegate *)objc_loadWeakRetained((id *)&self->_taskServerDelegate);
}

- (void)setTaskServerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_taskServerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_taskServerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_taskServer);
  objc_destroyWeak((id *)&self->_databaseAccessibilityAssertions);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStoreConfiguration, 0);
  objc_storeStrong((id *)&self->_taskConfiguration, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
  objc_storeStrong((id *)&self->_taskServerClass, 0);
}

@end
