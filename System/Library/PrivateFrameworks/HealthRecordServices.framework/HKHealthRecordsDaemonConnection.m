@implementation HKHealthRecordsDaemonConnection

+ (id)sharedConnection
{
  HKHealthRecordsDaemonConnection *WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&sharedConnection_lock);
  WeakRetained = (HKHealthRecordsDaemonConnection *)objc_loadWeakRetained(&sharedConnection_sharedConnection);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(HKHealthRecordsDaemonConnection);
    objc_storeWeak(&sharedConnection_sharedConnection, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedConnection_lock);
  return WeakRetained;
}

- (HKHealthRecordsDaemonConnection)init
{
  return -[HKHealthRecordsDaemonConnection initWithListenerEndpoint:](self, "initWithListenerEndpoint:", 0);
}

- (HKHealthRecordsDaemonConnection)initWithListenerEndpoint:(id)a3
{
  id v4;
  HKHealthRecordsDaemonConnection *v5;
  uint64_t v6;
  OS_dispatch_queue *clientQueue;
  id v8;
  uint64_t v9;
  _HKXPCConnection *connection;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKHealthRecordsDaemonConnection;
  v5 = -[HKHealthRecordsDaemonConnection init](&v12, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc(MEMORY[0x24BDD4260]);
    if (v4)
      v9 = objc_msgSend(v8, "initWithListenerEndpoint:", v4);
    else
      v9 = objc_msgSend(v8, "initWithMachServiceName:options:", CFSTR("com.apple.healthrecordsd"), 4096);
    connection = v5->_connection;
    v5->_connection = (_HKXPCConnection *)v9;

    -[_HKXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
    -[_HKXPCConnection resume](v5->_connection, "resume");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_HKXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HKHealthRecordsDaemonConnection;
  -[HKHealthRecordsDaemonConnection dealloc](&v3, sel_dealloc);
}

- (void)fetchEndpointForServiceIdentifier:(id)a3 endpointHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  _HKXPCConnection *connection;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  connection = self->_connection;
  v11 = a3;
  -[_HKXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __98__HKHealthRecordsDaemonConnection_fetchEndpointForServiceIdentifier_endpointHandler_errorHandler___block_invoke;
  v15[3] = &unk_24D5491C8;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "remote_fetchEndpointForServiceIdentifier:completion:", v11, v15);

}

uint64_t __98__HKHealthRecordsDaemonConnection_fetchEndpointForServiceIdentifier_endpointHandler_errorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)endpointForServiceIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  _HKXPCConnection *connection;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v7 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke;
  v15[3] = &unk_24D5491F0;
  v15[4] = &v16;
  -[_HKXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke_2;
  v14[3] = &unk_24D549218;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v9, "remote_fetchEndpointForServiceIdentifier:completion:", v6, v14);
  v10 = (id)v17[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__HKHealthRecordsDaemonConnection_endpointForServiceIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSString)daemonLaunchDarwinNotificationName
{
  return (NSString *)CFSTR("com.apple.healthrecordsd.launch");
}

- (id)exportedInterface
{
  return objc_alloc_init(MEMORY[0x24BDD1990]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
