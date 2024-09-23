@implementation AACAwardsClient

- (AACAwardsClient)init
{
  AACAwardsClient *v2;
  AACXPCClient *v3;
  AACXPCClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AACAwardsClient;
  v2 = -[AACAwardsClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AACXPCClient);
    client = v2->_client;
    v2->_client = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AACXPCClient invalidate](self->_client, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AACAwardsClient;
  -[AACAwardsClient dealloc](&v3, sel_dealloc);
}

- (void)scheduleAwardingWithCompletion:(id)a3
{
  id v4;
  AACXPCClient *client;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__AACAwardsClient_scheduleAwardingWithCompletion___block_invoke;
  v7[3] = &unk_24D15BBD8;
  v8 = v4;
  v6 = v4;
  -[AACXPCClient sendRequest:completion:](client, "sendRequest:completion:", 0, v7);

}

uint64_t __50__AACAwardsClient_scheduleAwardingWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestAwardingWithTriggers:(unint64_t)a3 completion:(id)a4
{
  id v6;
  AACXPCClient *client;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  client = self->_client;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__AACAwardsClient_requestAwardingWithTriggers_completion___block_invoke;
  v10[3] = &unk_24D15BBD8;
  v11 = v6;
  v9 = v6;
  -[AACXPCClient sendRequest:payload:completion:](client, "sendRequest:payload:completion:", 1, v8, v10);

}

void __58__AACAwardsClient_requestAwardingWithTriggers_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)allAchievementsWithCompletion:(id)a3
{
  id v4;
  AACXPCClient *client;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__AACAwardsClient_allAchievementsWithCompletion___block_invoke;
  v7[3] = &unk_24D15BBD8;
  v8 = v4;
  v6 = v4;
  -[AACXPCClient sendRequest:completion:](client, "sendRequest:completion:", 2, v7);

}

void __49__AACAwardsClient_allAchievementsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = v7;
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)objc_msgSend(v7, "copy");
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);

  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017E0]), "initWithData:", v5);
    objc_msgSend(v19, "achievements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithCodable:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15));
          objc_msgSend(v8, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v17 = *(_QWORD *)(a1 + 32);
    v18 = (void *)objc_msgSend(v8, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, 0);

  }
}

- (id)allAchievementsWithError:(id *)a3
{
  NSObject *v5;
  AACXPCClient *client;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[6];
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
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  ACHLogXPC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AACAwardsClient allAchievementsWithError:].cold.1();

  client = self->_client;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__AACAwardsClient_allAchievementsWithError___block_invoke;
  v13[3] = &unk_24D15BC00;
  v13[4] = &v14;
  v13[5] = &v20;
  -[AACXPCClient sendSynchronousRequest:resultHandler:](client, "sendSynchronousRequest:resultHandler:", 2, v13);
  v7 = (id)v15[5];
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  ACHLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend((id)v21[5], "count");
    *(_DWORD *)buf = 134217984;
    v27 = v10;
    _os_log_impl(&dword_21412E000, v9, OS_LOG_TYPE_DEFAULT, "Returning %lu achievements from synchronous allAchievementsWithError", buf, 0xCu);
  }

  v11 = (void *)objc_msgSend((id)v21[5], "copy");
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __44__AACAwardsClient_allAchievementsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ACHLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__AACAwardsClient_allAchievementsWithError___block_invoke_cold_1();

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017E0]), "initWithData:", v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v8, "achievements", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithCodable:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  AACXPCClient *client;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[6];
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
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
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
  ACHLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AACAwardsClient ephemeralAchievementWithTemplateUniqueName:error:].cold.1();

  client = self->_client;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke;
  v15[3] = &unk_24D15BC00;
  v15[4] = &v16;
  v15[5] = &v22;
  -[AACXPCClient sendSynchronousRequest:payload:resultHandler:](client, "sendSynchronousRequest:payload:resultHandler:", 15, v6, v15);
  v9 = (id)v17[5];
  v10 = v9;
  if (v9)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError();
  }

  ACHLogXPC();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v23[5];
    *(_DWORD *)buf = 138412546;
    v29 = v6;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_21412E000, v11, OS_LOG_TYPE_DEFAULT, "Returning ephermeral achievement for template name %@: %@", buf, 0x16u);
  }

  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  ACHLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke_cold_1();

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017D8]), "initWithData:", v5);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithCodable:", v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (void)templatesForSource:(id)a3 completion:(id)a4
{
  id v6;
  AACXPCClient *client;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__AACAwardsClient_templatesForSource_completion___block_invoke;
  v9[3] = &unk_24D15BBD8;
  v10 = v6;
  v8 = v6;
  -[AACXPCClient sendRequest:payload:completion:](client, "sendRequest:payload:completion:", 8, a3, v9);

}

void __49__AACAwardsClient_templatesForSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01818]), "initWithData:", v5);
    objc_msgSend(v14, "templates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01850]), "initWithCodable:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)addTemplates:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  AACXPCClient *client;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        ACHCodableFromTemplate();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init(MEMORY[0x24BE01818]);
  objc_msgSend(v15, "setTemplates:", v8);
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__AACAwardsClient_addTemplates_completion___block_invoke;
  v19[3] = &unk_24D15BBD8;
  v20 = v7;
  v18 = v7;
  -[AACXPCClient sendRequest:payloadData:completion:](client, "sendRequest:payloadData:completion:", 9, v16, v19);

}

void __43__AACAwardsClient_addTemplates_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)removeTemplates:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  AACXPCClient *client;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        ACHCodableFromTemplate();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init(MEMORY[0x24BE01818]);
  objc_msgSend(v15, "setTemplates:", v8);
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__AACAwardsClient_removeTemplates_completion___block_invoke;
  v19[3] = &unk_24D15BBD8;
  v20 = v7;
  v18 = v7;
  -[AACXPCClient sendRequest:payloadData:completion:](client, "sendRequest:payloadData:completion:", 10, v16, v19);

}

void __46__AACAwardsClient_removeTemplates_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)removeTemplatesForSource:(id)a3 completion:(id)a4
{
  id v6;
  AACXPCClient *client;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__AACAwardsClient_removeTemplatesForSource_completion___block_invoke;
  v9[3] = &unk_24D15BBD8;
  v10 = v6;
  v8 = v6;
  -[AACXPCClient sendRequest:payload:completion:](client, "sendRequest:payload:completion:", 11, a3, v9);

}

void __55__AACAwardsClient_removeTemplatesForSource_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)removeTemplatesWithUniqueNames:(id)a3 completion:(id)a4
{
  id v6;
  AACXPCClient *client;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__AACAwardsClient_removeTemplatesWithUniqueNames_completion___block_invoke;
  v9[3] = &unk_24D15BBD8;
  v10 = v6;
  v8 = v6;
  -[AACXPCClient sendRequest:payload:completion:](client, "sendRequest:payload:completion:", 12, a3, v9);

}

void __61__AACAwardsClient_removeTemplatesWithUniqueNames_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)addEarnedInstances:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  AACXPCClient *client;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        ACHCodableFromEarnedInstance();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init(MEMORY[0x24BE017F8]);
  objc_msgSend(v15, "setEarnedInstances:", v8);
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__AACAwardsClient_addEarnedInstances_completion___block_invoke;
  v19[3] = &unk_24D15BBD8;
  v20 = v7;
  v18 = v7;
  -[AACXPCClient sendRequest:payloadData:completion:](client, "sendRequest:payloadData:completion:", 13, v16, v19);

}

void __49__AACAwardsClient_addEarnedInstances_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)removeEarnedInstances:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  AACXPCClient *client;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        ACHCodableFromEarnedInstance();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init(MEMORY[0x24BE017F8]);
  objc_msgSend(v15, "setEarnedInstances:", v8);
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__AACAwardsClient_removeEarnedInstances_completion___block_invoke;
  v19[3] = &unk_24D15BBD8;
  v20 = v7;
  v18 = v7;
  -[AACXPCClient sendRequest:payloadData:completion:](client, "sendRequest:payloadData:completion:", 14, v16, v19);

}

void __52__AACAwardsClient_removeEarnedInstances_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)requestProgressUpdateForProgressProviderIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  AACXPCClient *client;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__AACAwardsClient_requestProgressUpdateForProgressProviderIdentifier_completion___block_invoke;
  v9[3] = &unk_24D15BBD8;
  v10 = v6;
  v8 = v6;
  -[AACXPCClient sendRequest:payload:completion:](client, "sendRequest:payload:completion:", 17, a3, v9);

}

void __81__AACAwardsClient_requestProgressUpdateForProgressProviderIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)provideAchievementProgressUpdates:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  AACXPCClient *client;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        ACHCodableFromAchievementProgressUpdate();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init(MEMORY[0x24BE017E8]);
  objc_msgSend(v15, "setAchievementProgressUpdates:", v8);
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__AACAwardsClient_provideAchievementProgressUpdates_completion___block_invoke;
  v19[3] = &unk_24D15BBD8;
  v20 = v7;
  v18 = v7;
  -[AACXPCClient sendRequest:payloadData:completion:](client, "sendRequest:payloadData:completion:", 16, v16, v19);

}

void __64__AACAwardsClient_provideAchievementProgressUpdates_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 4, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "BOOLValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (AACXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)allAchievementsWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21412E000, v0, v1, "Calling sendSynchronousRequest from client for allAchievementsWithError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__AACAwardsClient_allAchievementsWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21412E000, v0, v1, "Got result back from sending sendSynchronousRequest from client for allAchievementsWithError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ephemeralAchievementWithTemplateUniqueName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21412E000, v0, v1, "Calling sendSynchronousRequest from client for ephemeralAchievementWithTemplateUniqueName", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21412E000, v0, v1, "Got result back from sending sendSynchronousRequest from client for ephemeralAchievementWithTemplateUniqueName", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
