@implementation GCConfigXPCServiceConnection

- (GCConfigXPCServiceConnection)init
{
  void *v3;
  void *v4;
  void *v5;
  GCConfigXPCServiceConnection *v6;
  objc_super v8;

  v3 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03ABFA0), "initWithServiceName:", CFSTR("com.apple.gamecontroller.ConfigService"));
  GCConfigXPCServiceClientInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v4);

  GCConfigXPCServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v5);

  v8.receiver = self;
  v8.super_class = (Class)GCConfigXPCServiceConnection;
  v6 = -[GCIPCRemoteOutgoingConnection initWithConnection:](&v8, sel_initWithConnection_, v3);

  return v6;
}

- (GCConfigXPCServiceClientInterface)client
{
  void *v2;
  void *v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCConfigXPCServiceClientInterface *)v3;
}

- (void)setClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v4);

}

- (id)connectToService:(id)a3 withClient:(id)a4
{
  Protocol *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  Protocol *v12;
  id v13;
  id v14;
  Protocol *v15;
  void *v16;
  _QWORD v18[5];
  Protocol *v19;
  id v20;
  _QWORD v21[5];
  Protocol *v22;
  id v23;

  v6 = (Protocol *)a3;
  v7 = a4;
  v8 = -[GCOperation initOnQueue:withOptions:]([GCOperation alloc], "initOnQueue:withOptions:", 0, 0);
  NSStringFromProtocol(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Connect to '%@'."), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabel:", v10);

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke;
  v21[3] = &unk_1EA4D4018;
  v21[4] = self;
  v12 = v6;
  v22 = v12;
  v13 = v7;
  v23 = v13;
  objc_msgSend(v8, "setSyncBlock:", v21);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_3;
  v18[3] = &unk_1EA4D4040;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v8, "setAsyncBlock:", v18);
  objc_msgSend(v8, "activate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)a1[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_11;
  v13[3] = &unk_1EA4D3430;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[5];
  v9 = (void *)a1[6];
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_2;
  v12[3] = &unk_1EA4D3458;
  v12[4] = &v20;
  v12[5] = &v14;
  ConnectToDriverService(v8, v7, v9, v12);
  *a3 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_11(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_4;
  v13[3] = &unk_1EA4D34A8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "remoteProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[5];
  v8 = (void *)a1[6];
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_5;
  v11[3] = &unk_1EA4D34D0;
  v12 = v6;
  v10 = v6;
  ConnectToDriverService(v9, v7, v8, v11);

}

uint64_t __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __60__GCConfigXPCServiceConnection_connectToService_withClient___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "succeedWithResult:", a2);
  else
    return objc_msgSend(v2, "failWithError:");
}

@end
