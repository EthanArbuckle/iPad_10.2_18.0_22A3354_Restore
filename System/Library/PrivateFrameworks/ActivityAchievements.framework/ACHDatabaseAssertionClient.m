@implementation ACHDatabaseAssertionClient

- (ACHDatabaseAssertionClient)initWithHealthStore:(id)a3
{
  id v4;
  ACHDatabaseAssertionClient *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHDatabaseAssertionClient;
  v5 = -[ACHDatabaseAssertionClient init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD4038]), "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("ActivityAchievementsDatabaseAssertionTaskServer"), v5, v5->_identifier);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v8;

  }
  return v5;
}

- (id)acquireDatabaseAssertionWithIdentifier:(id)a3 error:(id *)a4
{
  return -[ACHDatabaseAssertionClient acquireDatabaseAssertionWithIdentifier:duration:error:](self, "acquireDatabaseAssertionWithIdentifier:duration:error:", a3, a4, 60.0);
}

- (id)acquireDatabaseAssertionWithIdentifier:(id)a3 duration:(double)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  -[ACHDatabaseAssertionClient proxyProvider](self, "proxyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke;
  v17[3] = &unk_24D1270B0;
  v11 = v8;
  v21 = a4;
  v18 = v11;
  v19 = &v28;
  v20 = &v22;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_3;
  v16[3] = &unk_24D126CF8;
  v16[4] = &v22;
  objc_msgSend(v9, "getSynchronousProxyWithHandler:errorHandler:", v17, v16);

  v12 = (id)v23[5];
  v13 = v12;
  if (v12)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v14 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

uint64_t __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_2;
  v5[3] = &unk_24D127088;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_acquireDatabaseAssertionWithIdentifier:duration:completion:", v2, v5, v3);
}

void __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __84__ACHDatabaseAssertionClient_acquireDatabaseAssertionWithIdentifier_duration_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)invalidateAssertionWithToken:(id)a3 error:(id *)a4
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
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  -[ACHDatabaseAssertionClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_3;
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

uint64_t __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_2;
  v4[3] = &unk_24D126D20;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_invalidateAssertionWithToken:completion:", v2, v4);
}

void __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __65__ACHDatabaseAssertionClient_invalidateAssertionWithToken_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E6F0);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E750);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
