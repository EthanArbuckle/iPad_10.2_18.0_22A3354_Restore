@implementation MTSXPCServerProxy

- (MTSXPCServerProxy)init
{
  return -[MTSXPCServerProxy initWithConnectionFactory:](self, "initWithConnectionFactory:", &__block_literal_global_2203);
}

- (MTSXPCServerProxy)initWithConnectionFactory:(id)a3
{
  id v4;
  void *v5;
  MTSXPCServerProxy *v6;
  MTSXPCServerProxy *v7;
  uint64_t v8;
  NSUUID *UUID;
  void *v10;
  id connectionFactory;
  MTSXPCServerProxy *result;
  MTSXPCServerProxy *v13;
  SEL v14;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)MTSXPCServerProxy;
    v6 = -[MTSXPCServerProxy init](&v15, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v8 = objc_claimAutoreleasedReturnValue();
      UUID = v7->_UUID;
      v7->_UUID = (NSUUID *)v8;

      v10 = _Block_copy(v5);
      connectionFactory = v7->_connectionFactory;
      v7->_connectionFactory = v10;

    }
    return v7;
  }
  else
  {
    v13 = (MTSXPCServerProxy *)_HMFPreconditionFailure();
    -[MTSXPCServerProxy dealloc](v13, v14);
  }
  return result;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[MTSXPCConnection invalidate](self->_connection, "invalidate");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)MTSXPCServerProxy;
  -[MTSXPCServerProxy dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[MTSXPCConnection invalidate](self->_connection, "invalidate");
  os_unfair_lock_unlock(p_lock);
}

- (MTSXPCConnection)connection
{
  os_unfair_lock_s *p_lock;
  MTSXPCConnection *connection;
  MTSXPCConnection *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  connection = self->_connection;
  if (connection)
  {
    v5 = connection;
  }
  else
  {
    -[MTSXPCServerProxy connectionFactory](self, "connectionFactory");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v5 = (MTSXPCConnection *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1990], "mts_clientInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v7);

    -[MTSXPCConnection setExportedObject:](v5, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x24BDD1990], "mts_serverInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __31__MTSXPCServerProxy_connection__block_invoke;
    v13[3] = &unk_250599F70;
    objc_copyWeak(&v14, &location);
    -[MTSXPCConnection setInterruptionHandler:](v5, "setInterruptionHandler:", v13);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __31__MTSXPCServerProxy_connection__block_invoke_8;
    v11[3] = &unk_250599F70;
    objc_copyWeak(&v12, &location);
    -[MTSXPCConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v11);
    objc_storeStrong((id *)&self->_connection, v5);
    -[MTSXPCConnection resume](v5, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MTSXPCServerProxy *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __91__MTSXPCServerProxy_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v14 = &unk_250599F98;
  v15 = self;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  MTSXPCServerProxy *v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __100__MTSXPCServerProxy_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v17 = &unk_250599F98;
  v18 = self;
  v19 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeDevicePairingWithUUID:forSystemCommissionerPairingUUID:completionHandler:", v10, v9, v12, v14, v15, v16, v17, v18);
}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MTSXPCServerProxy *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __95__MTSXPCServerProxy_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v14 = &unk_250599F98;
  v15 = self;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeAllDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  MTSXPCServerProxy *v17;
  id v18;

  v8 = a5;
  v9 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __104__MTSXPCServerProxy_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke;
  v16 = &unk_250599F98;
  v17 = self;
  v18 = v8;
  v11 = v8;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "openCommissioningWindowForSystemCommissionerPairingUUID:duration:completionHandler:", v9, v11, a4, v13, v14, v15, v16, v17);
}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MTSXPCServerProxy *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __101__MTSXPCServerProxy_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v14 = &unk_250599F98;
  v15 = self;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "readCommissioningWindowStatusForSystemCommissionerPairingUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MTSXPCServerProxy *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __70__MTSXPCServerProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke;
  v14 = &unk_250599F98;
  v15 = self;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "performDeviceSetupUsingRequest:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  MTSXPCServerProxy *v12;
  id v13;

  v4 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __74__MTSXPCServerProxy_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke;
  v11 = &unk_250599F98;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchSystemCommissionerPairingsWithCompletionHandler:", v6, v8, v9, v10, v11, v12);
}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MTSXPCServerProxy *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __79__MTSXPCServerProxy_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke;
  v14 = &unk_250599F98;
  v15 = self;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeSystemCommissionerPairingWithUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  MTSXPCServerProxy *v12;
  id v13;

  v4 = a3;
  -[MTSXPCServerProxy connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __86__MTSXPCServerProxy_checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler___block_invoke;
  v11 = &unk_250599F98;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:", v6, v8, v9, v10, v11, v12);
}

- (void)showRestrictedCharacteristicsAccessWarningAlert
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[MTSXPCServerProxy connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__MTSXPCServerProxy_showRestrictedCharacteristicsAccessWarningAlert__block_invoke;
  v5[3] = &unk_250599FC0;
  v5[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "showRestrictedCharacteristicsAccessWarningAlert");
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[MTSXPCServerProxy UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)connectionFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __68__MTSXPCServerProxy_showRestrictedCharacteristicsAccessWarningAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for showing warning: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __86__MTSXPCServerProxy_checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for checking allows restricted characteristics access: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__MTSXPCServerProxy_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for remove system commissioner pairing: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__MTSXPCServerProxy_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for fetch system commissioner pairings: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __70__MTSXPCServerProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for performDeviceSetupUsingRequest: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __101__MTSXPCServerProxy_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for reading commissioning window status: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __104__MTSXPCServerProxy_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for opening commissioning window: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __95__MTSXPCServerProxy_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for remove all device pairings: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __100__MTSXPCServerProxy_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for remove device pairing: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __91__MTSXPCServerProxy_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for fetch device pairings: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __31__MTSXPCServerProxy_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x23493F978]();
    v3 = WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_2344FE000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was interrupted", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }

}

void __31__MTSXPCServerProxy_connection__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  os_unfair_lock_s *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x23493F978]();
    v3 = (os_unfair_lock_s *)WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_2344FE000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was invalidated", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s setConnection:](v3, "setConnection:", 0);
    os_unfair_lock_unlock(v3 + 2);
  }

}

MTSXPCConnection *__25__MTSXPCServerProxy_init__block_invoke()
{
  void *v0;
  MTSXPCConnection *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.matter.support.xpc"), 0);
  v1 = -[MTSXPCConnection initWithXPCConnection:]([MTSXPCConnection alloc], "initWithXPCConnection:", v0);

  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1)
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_10);
  return (id)logCategory__hmf_once_v17;
}

void __32__MTSXPCServerProxy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17;
  logCategory__hmf_once_v17 = v0;

}

@end
