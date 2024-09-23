@implementation ACHAwardsKeyValueClient

- (ACHAwardsKeyValueClient)initWithHealthStore:(id)a3
{
  id v4;
  ACHAwardsKeyValueClient *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  OS_dispatch_queue *serverQueue;
  uint64_t v10;
  OS_dispatch_queue *clientQueue;
  uint64_t v12;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACHAwardsKeyValueClient;
  v5 = -[ACHAwardsKeyValueClient init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    HKCreateSerialDispatchQueueWithQOSClass();
    v8 = objc_claimAutoreleasedReturnValue();
    serverQueue = v5->_serverQueue;
    v5->_serverQueue = (OS_dispatch_queue *)v8;

    HKCreateSerialDispatchQueueWithQOSClass();
    v10 = objc_claimAutoreleasedReturnValue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD4038]), "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("ActivityAchievementsAwardingKeyValueTaskServer"), v5, v5->_identifier);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v12;

  }
  return v5;
}

- (BOOL)protectedDataAvailable
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
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = &v6;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke;
  v5[3] = &unk_24D126CD0;
  v5[4] = &v6;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_3;
  v4[3] = &unk_24D126CF8;
  objc_msgSend(v2, "getSynchronousProxyWithHandler:errorHandler:", v5, v4);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_2;
  v3[3] = &unk_24D126CA8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_protectedDataAvailableWithCompletion:", v3);
}

uint64_t __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __49__ACHAwardsKeyValueClient_protectedDataAvailable__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 domain:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke;
  v23[3] = &unk_24D126D48;
  v15 = v10;
  v24 = v15;
  v16 = v11;
  v25 = v16;
  v17 = v12;
  v26 = v17;
  v27 = &v29;
  v28 = &v33;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_3;
  v22[3] = &unk_24D126CF8;
  v22[4] = &v33;
  objc_msgSend(v13, "getSynchronousProxyWithHandler:errorHandler:", v23, v22);

  v18 = (id)v34[5];
  v19 = v18;
  if (v18)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }

  v20 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

uint64_t __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_2;
  v6[3] = &unk_24D126D20;
  v7 = *(_OWORD *)(a1 + 56);
  return objc_msgSend(a2, "remote_setValue:forKey:domain:completion:", v2, v3, v4, v6);
}

void __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __56__ACHAwardsKeyValueClient_setValue_forKey_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)setValuesWithDictionary:(id)a3 domain:(id)a4 error:(id *)a5
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
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke;
  v19[3] = &unk_24D126D70;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v24;
  v23 = &v28;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_3;
  v18[3] = &unk_24D126CF8;
  v18[4] = &v28;
  objc_msgSend(v10, "getSynchronousProxyWithHandler:errorHandler:", v19, v18);

  v14 = (id)v29[5];
  v15 = v14;
  if (v14)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
  }

  v16 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

uint64_t __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_2;
  v5[3] = &unk_24D126D20;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setValuesWithDictionary:domain:completion:", v2, v3, v5);
}

void __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __64__ACHAwardsKeyValueClient_setValuesWithDictionary_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)setValuesWithDomainDictionary:(id)a3 error:(id *)a4
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
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v19;
  v18 = &v23;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_3;
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

uint64_t __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_setValuesWithDomainDictionary:completion:", v2, v4);
}

void __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __63__ACHAwardsKeyValueClient_setValuesWithDomainDictionary_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)setLegacyValuesWithDictionary:(id)a3 error:(id *)a4
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
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v19;
  v18 = &v23;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_3;
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

uint64_t __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_setLegacyValuesWithDictionary:completion:", v2, v4);
}

void __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __63__ACHAwardsKeyValueClient_setLegacyValuesWithDictionary_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)valueForKey:(id)a3 domain:(id)a4 error:(id *)a5
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
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke;
  v19[3] = &unk_24D126D70;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v30;
  v23 = &v24;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_3;
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

uint64_t __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_2;
  v5[3] = &unk_24D126DC0;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_valueForKey:domain:completion:", v2, v3, v5);
}

void __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __52__ACHAwardsKeyValueClient_valueForKey_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)valuesForKeys:(id)a3 domain:(id)a4 error:(id *)a5
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
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke;
  v19[3] = &unk_24D126D70;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v30;
  v23 = &v24;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_3;
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

uint64_t __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_2;
  v5[3] = &unk_24D126DE8;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_valuesForKeys:domain:completion:", v2, v3, v5);
}

void __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __54__ACHAwardsKeyValueClient_valuesForKeys_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeValuesForKeys:(id)a3 domain:(id)a4 error:(id *)a5
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
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke;
  v19[3] = &unk_24D126D70;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v24;
  v23 = &v28;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_3;
  v18[3] = &unk_24D126CF8;
  v18[4] = &v28;
  objc_msgSend(v10, "getSynchronousProxyWithHandler:errorHandler:", v19, v18);

  v14 = (id)v29[5];
  v15 = v14;
  if (v14)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
  }

  v16 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

uint64_t __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_2;
  v5[3] = &unk_24D126D20;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_removeValuesForKeys:domain:completion:", v2, v3, v5);
}

void __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __60__ACHAwardsKeyValueClient_removeValuesForKeys_domain_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeValuesForKeysInDomains:(id)a3 error:(id *)a4
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
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ACHAwardsKeyValueClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v19;
  v18 = &v23;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_3;
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

uint64_t __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_removeValuesForKeysInDomains:completion:", v2, v4);
}

void __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __62__ACHAwardsKeyValueClient_removeValuesForKeysInDomains_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D67CF8);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E690);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverQueue, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (ACHAwardsKeyValueServerInterface)serverProxy
{
  return self->_serverProxy;
}

- (void)setServerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serverProxy, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_injectedErrorHandler, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
