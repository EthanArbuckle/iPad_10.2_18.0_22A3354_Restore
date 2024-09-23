@implementation ACHAwardsClient

- (ACHAwardsClient)initWithHealthStore:(id)a3
{
  id v4;
  ACHAwardsClient *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v10;
  HKNanoSyncControl *nanoSyncControl;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHAwardsClient;
  v5 = -[ACHAwardsClient init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD4038]), "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("ActivityAchievementsAwardingTaskServer"), v5, v5->_identifier);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3D80]), "initWithHealthStore:", v4);
    nanoSyncControl = v5->_nanoSyncControl;
    v5->_nanoSyncControl = (HKNanoSyncControl *)v10;

  }
  return v5;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E810);
}

- (BOOL)isProtectedDataAvailable
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = &v6;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke;
  v5[3] = &unk_24D126CD0;
  v5[4] = &v6;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_3;
  v4[3] = &unk_24D126CF8;
  objc_msgSend(v2, "getSynchronousProxyWithHandler:errorHandler:", v5, v4);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_2;
  v3[3] = &unk_24D126CA8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "protectedDataAvailableWithCompletion:", v3);
}

uint64_t __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __43__ACHAwardsClient_isProtectedDataAvailable__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (id)fetchAllTemplatesWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = &v11;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke;
  v10[3] = &unk_24D1271A0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_3;
  v9[3] = &unk_24D126CF8;
  objc_msgSend(v4, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);

  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_2;
  v3[3] = &unk_24D1270D8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchAllTemplatesWithCompletion:", v3);
}

void __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __46__ACHAwardsClient_fetchAllTemplatesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)addTemplates:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__ACHAwardsClient_addTemplates_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __38__ACHAwardsClient_addTemplates_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __38__ACHAwardsClient_addTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__ACHAwardsClient_addTemplates_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_addTemplates:completion:", v2, v4);
}

void __38__ACHAwardsClient_addTemplates_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __38__ACHAwardsClient_addTemplates_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)addTemplates:(id)a3 removingTemplates:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke;
  v19[3] = &unk_24D126D70;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v30;
  v23 = &v24;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_3;
  v18[3] = &unk_24D126CF8;
  v18[4] = &v24;
  objc_msgSend(v10, "getSynchronousProxyWithHandler:errorHandler:", v19, v18);

  v14 = (id)v25[5];
  v15 = v14;
  if (v14)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
  }

  v16 = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

uint64_t __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_2;
  v5[3] = &unk_24D126D20;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_addTemplates:removingTemplates:completion:", v2, v3, v5);
}

void __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __56__ACHAwardsClient_addTemplates_removingTemplates_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeTemplate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__ACHAwardsClient_removeTemplate_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __40__ACHAwardsClient_removeTemplate_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

void __40__ACHAwardsClient_removeTemplate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__ACHAwardsClient_removeTemplate_error___block_invoke_2;
  v6[3] = &unk_24D126D20;
  v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "remote_removeTemplates:completion:", v5, v6);

}

void __40__ACHAwardsClient_removeTemplate_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __40__ACHAwardsClient_removeTemplate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeTemplates:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__ACHAwardsClient_removeTemplates_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __41__ACHAwardsClient_removeTemplates_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __41__ACHAwardsClient_removeTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__ACHAwardsClient_removeTemplates_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeTemplates:completion:", v2, v4);
}

void __41__ACHAwardsClient_removeTemplates_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __41__ACHAwardsClient_removeTemplates_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeAllTemplatesWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = &v11;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke;
  v10[3] = &unk_24D1271A0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_3;
  v9[3] = &unk_24D126CF8;
  objc_msgSend(v4, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);

  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_2;
  v3[3] = &unk_24D126D20;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_removeAllTemplatesWithCompletion:", v3);
}

void __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __47__ACHAwardsClient_removeAllTemplatesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)addEarnedInstances:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __44__ACHAwardsClient_addEarnedInstances_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v19;
  v18 = &v23;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v23;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v24[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

uint64_t __44__ACHAwardsClient_addEarnedInstances_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_addEarnedInstances:completion:", v2, v4);
}

void __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __44__ACHAwardsClient_addEarnedInstances_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeEarnedInstances:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeEarnedInstances:completion:", v2, v4);
}

void __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __47__ACHAwardsClient_removeEarnedInstances_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)addEarnedInstances:(id)a3 removingEarnedInstances:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke;
  v19[3] = &unk_24D126D70;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v30;
  v23 = &v24;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_3;
  v18[3] = &unk_24D126CF8;
  v18[4] = &v24;
  objc_msgSend(v10, "getSynchronousProxyWithHandler:errorHandler:", v19, v18);

  v14 = (id)v25[5];
  v15 = v14;
  if (v14)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
  }

  v16 = (id)v31[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

uint64_t __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_2;
  v5[3] = &unk_24D1270D8;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_addEarnedInstances:removingEarnedInstances:completion:", v2, v3, v5);
}

void __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __68__ACHAwardsClient_addEarnedInstances_removingEarnedInstances_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeEarnedInstancesForTemplateUniqueName:completion:", v2, v4);
}

void __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __68__ACHAwardsClient_removeEarnedInstancesForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeAllEarnedInstancesWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = &v11;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke;
  v10[3] = &unk_24D1271A0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_3;
  v9[3] = &unk_24D126CF8;
  objc_msgSend(v4, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);

  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_2;
  v3[3] = &unk_24D126D20;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_removeAllEarnedInstancesWithCompletion:", v3);
}

void __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __53__ACHAwardsClient_removeAllEarnedInstancesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchAllEarnedInstancesWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = &v11;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke;
  v10[3] = &unk_24D1271A0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_3;
  v9[3] = &unk_24D126CF8;
  objc_msgSend(v4, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);

  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_2;
  v3[3] = &unk_24D1270D8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchAllEarnedInstancesWithCompletion:", v3);
}

void __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __52__ACHAwardsClient_fetchAllEarnedInstancesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_24D1270D8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchEarnedInstancesForTemplateUniqueName:completion:", v2, v4);
}

void __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __67__ACHAwardsClient_fetchEarnedInstancesForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchMostRecentEarnedInstanceForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_24D1271C8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchMostRecentEarnedInstanceForTemplateUniqueName:completion:", v2, v4);
}

void __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __76__ACHAwardsClient_fetchMostRecentEarnedInstanceForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchEarnedInstancesForEarnedDateComponents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ACHYearMonthDayStringFromDateComponents(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__2;
    v27 = __Block_byref_object_dispose__2;
    v28 = 0;
    -[ACHAwardsClient proxyProvider](self, "proxyProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke;
    v19[3] = &unk_24D126D98;
    v20 = v7;
    v21 = &v29;
    v22 = &v23;
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_3;
    v18[3] = &unk_24D126CF8;
    v18[4] = &v23;
    objc_msgSend(v8, "getSynchronousProxyWithHandler:errorHandler:", v19, v18);

    v10 = (id)v24[5];
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v16 = (id)v30[5];
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v36[0] = CFSTR("Unable to parse date components");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), 133, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }

  return v16;
}

uint64_t __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_2;
  v4[3] = &unk_24D1270D8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchEarnedInstancesForEarnedDateComponentsString:completion:", v2, v4);
}

void __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __69__ACHAwardsClient_fetchEarnedInstancesForEarnedDateComponents_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)countOfEarnedInstancesForTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  if (v20[5])
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v26[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_2;
  v4[3] = &unk_24D127100;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_countOfEarnedInstancesForTemplateUniqueName:completion:", v2, v4);
}

void __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __69__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueName_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchMostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  if (v20[5])
    v12 = 0;
  else
    v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_2;
  v4[3] = &unk_24D126DE8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames:completion:", v2, v4);
}

void __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __78__ACHAwardsClient_fetchMostRecentEarnedInstancesForTemplateUniqueNames_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)countOfEarnedInstancesForTemplateUniqueNames:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  -[ACHAwardsClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  if (v20[5])
    v12 = 0;
  else
    v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_2;
  v4[3] = &unk_24D126DE8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_countOfEarnedInstancesForUniqueNames:completion:", v2, v4);
}

void __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __70__ACHAwardsClient_countOfEarnedInstancesForTemplateUniqueNames_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)triggerSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[ACHAwardsClient nanoSyncControl](self, "nanoSyncControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__ACHAwardsClient_triggerSyncWithCompletion___block_invoke;
  v7[3] = &unk_24D1271F0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "forceNanoSyncWithOptions:completion:", 0, v7);

}

uint64_t __45__ACHAwardsClient_triggerSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (ACHAwardsServerInterface)serverProxy
{
  return self->_serverProxy;
}

- (void)setServerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serverProxy, a3);
}

- (HKNanoSyncControl)nanoSyncControl
{
  return self->_nanoSyncControl;
}

- (void)setNanoSyncControl:(id)a3
{
  objc_storeStrong((id *)&self->_nanoSyncControl, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (id)injectedErrorHandler
{
  return self->_injectedErrorHandler;
}

- (void)setInjectedErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_injectedErrorHandler, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_nanoSyncControl, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
