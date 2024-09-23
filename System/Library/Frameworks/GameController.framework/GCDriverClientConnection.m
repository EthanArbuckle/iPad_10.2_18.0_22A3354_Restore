@implementation GCDriverClientConnection

id __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
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
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)a1[4];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_58;
  v13[3] = &unk_24D2B4290;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[5];
  v9 = (void *)a1[6];
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_2;
  v12[3] = &unk_24D2B42B8;
  v12[4] = &v20;
  v12[5] = &v14;
  ConnectToDriverService(v8, v7, v9, v12);
  *a3 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_58(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_3(_QWORD *a1, void *a2)
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
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_4;
  v13[3] = &unk_24D2B4308;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "remoteProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[5];
  v8 = (void *)a1[6];
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_5;
  v11[3] = &unk_24D2B4330;
  v12 = v6;
  v10 = v6;
  ConnectToDriverService(v9, v7, v8, v11);

}

uint64_t __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", a2);
}

uint64_t __63___GCDriverClientConnection_connectToDeviceService_withClient___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "succeedWithResult:", a2);
  else
    return objc_msgSend(v2, "failWithError:");
}

@end
