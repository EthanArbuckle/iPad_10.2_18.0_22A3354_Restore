@implementation HDStandardTaskServer

+ (NSString)taskIdentifier
{
  objc_opt_class();
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)CFSTR("<INVALID>");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDStandardTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  HDStandardTaskServer *v12;
  NSObject *v13;
  uint64_t v14;
  NSUUID *taskUUID;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  HDStandardTaskServer *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDStandardTaskServer;
  v12 = -[HDStandardTaskServer init](&v18, sel_init);
  if (v12)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "%{public}@: Initialized for task %{public}@.", buf, 0x16u);
    }
    v14 = objc_msgSend(v9, "copy");
    taskUUID = v12->_taskUUID;
    v12->_taskUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v12->_client, a5);
    objc_msgSend(v10, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_profile, v16);

    objc_storeWeak((id *)&v12->_delegate, v11);
  }

  return v12;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HDStandardTaskServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)exportedInterface
{
  objc_opt_class();
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)remoteInterface
{
  objc_opt_class();
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)remote_unitTesting_createTaskServerNoOpWithCompletion:(id)a3
{
  void (*v3)(void);
  void *v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;

  if (_HDIsUnitTesting)
  {
    v3 = (void (*)(void))*((_QWORD *)a3 + 2);
    v9 = a3;
    v3();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3488];
    v7 = (void (**)(id, _QWORD))a3;
    objc_msgSend(v6, "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDStandardTaskServer.m"), 78, CFSTR("This method can only be called while unit testing"));

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("This method can only be called while unit testing"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0);

  }
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HDTaskServerDelegate)delegate
{
  return (HDTaskServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end
