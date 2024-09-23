@implementation ACHAwardsServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE01280];
}

- (ACHAwardsServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  ACHAwardsServer *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSCalendar *gregorianCalendar;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ACHAwardsServer;
  v6 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v12, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (v6)
  {
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v9 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v9;

  }
  return v6;
}

- (void)protectedDataAvailableWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ACHAwardsServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ACHAwardsServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ACHAwardsServer_protectedDataAvailableWithCompletion___block_invoke;
  block[3] = &unk_24D13B278;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __56__ACHAwardsServer_protectedDataAvailableWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(v2, "isProtectedDataAvailable"));

}

- (id)_transactionContextForWritingProtectedDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;

  v4 = a3;
  -[HDStandardTaskServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[ACHDatabaseAssertion assertionWithDatabase:identifier:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:error:", v7, v4, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v19;
  if (v9)
  {
    ACHLogXPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHAwardsServer _transactionContextForWritingProtectedDataWithIdentifier:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
  ACHDatabaseContextWithAccessibilityAssertion(v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRequiresWrite:", 1);
  objc_msgSend(v17, "setRequiresProtectedData:", 1);

  return v17;
}

- (id)_transactionContextForReadingProtectedDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v4 = a3;
  -[HDStandardTaskServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  +[ACHDatabaseAssertion assertionWithDatabase:identifier:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:error:", v7, v4, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    ACHLogXPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHAwardsServer _transactionContextForReadingProtectedDataWithIdentifier:].cold.1((uint64_t)v4, (uint64_t)v9, v10);

  }
  ACHDatabaseContextWithAccessibilityAssertion(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequiresWrite:", 0);
  objc_msgSend(v11, "setRequiresProtectedData:", 1);

  return v11;
}

- (void)remote_addTemplates:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ACHAwardsServer_remote_addTemplates_completion___block_invoke;
  block[3] = &unk_24D13B530;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

void __50__ACHAwardsServer_remote_addTemplates_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("AddTemplates"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  +[ACHTemplateEntity insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:](ACHTemplateEntity, "insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v3, 0, 0, v5, v2, &v7);
  v6 = v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)remote_addOrUpdateTemplates:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke;
  v11[3] = &unk_24D13B5C0;
  v11[4] = self;
  v13 = &v21;
  v14 = &v15;
  v10 = v6;
  v12 = v10;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("AddOrUpdateTemplates"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke_2;
  v9[3] = &unk_24D13B558;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[1] = 3221225472;
  v10 = v6;
  v11 = v2;
  v7 = v2;
  v8 = objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, &obj, v9, &__block_literal_global_8);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;

}

BOOL __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHTemplateEntity allTemplatesWithProfile:error:](ACHTemplateEntity, "allTemplatesWithProfile:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a3)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v29 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v14, "uniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
    }

    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = *(id *)(a1 + 40);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "uniqueName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v16, "count")
      && (objc_msgSend(*(id *)(a1 + 32), "profile"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = +[ACHTemplateEntity removeTemplates:profile:error:](ACHTemplateEntity, "removeTemplates:profile:error:", v16, v24, a3), v24, !v25))
    {
      v7 = 0;
    }
    else
    {
      v26 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "profile");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[ACHTemplateEntity insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:](ACHTemplateEntity, "insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v26, 0, 0, v27, *(_QWORD *)(a1 + 48), a3);

    }
    v6 = v29;

  }
  return v7;
}

uint64_t __58__ACHAwardsServer_remote_addOrUpdateTemplates_completion___block_invoke_3(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;

  v4 = a2;
  if (v4)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError();
  }

  return 0;
}

- (void)remote_addTemplates:(id)a3 removingTemplates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  -[ACHAwardsServer queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v11);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke;
  block[3] = &unk_24D13B670;
  block[4] = self;
  v18 = &v26;
  v19 = &v20;
  v13 = v9;
  v16 = v13;
  v14 = v8;
  v17 = v14;
  dispatch_sync(v12, block);

  v10[2](v10, *((unsigned __int8 *)v27 + 24), v21[5]);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("TemplateUpdate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = MEMORY[0x24BDAC760];
  v21 = *(id *)(v5 + 40);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2;
  v16[3] = &unk_24D13ABC8;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v17 = v7;
  v18 = v8;
  v19 = *(id *)(a1 + 48);
  v20 = v2;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_200;
  v12[3] = &unk_24D13B648;
  v13 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v10;
  v11 = v2;
  LOBYTE(v6) = objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, &v21, v16, v12);
  objc_storeStrong((id *)(v5 + 40), v21);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

BOOL __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (objc_msgSend(*(id *)(a1 + 32), "count")
    && (v5 = *(_QWORD *)(a1 + 32),
        objc_msgSend(*(id *)(a1 + 40), "profile"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = +[ACHTemplateEntity removeTemplates:profile:error:](ACHTemplateEntity, "removeTemplates:profile:error:", v5, v6, a3), v6, !v7))
  {
    ACHLogTemplates();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __90__ACHTemplateStore__queue_daemon_addTemplatesToDatabase_provenance_databaseContext_error___block_invoke_cold_1(a3, v12, v13, v14, v15, v16, v17, v18);

    return 0;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[ACHTemplateEntity insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:](ACHTemplateEntity, "insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v8, 0, 0, v9, *(_QWORD *)(a1 + 56), a3);

    return v10;
  }
}

uint64_t __68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_200(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1[4], "hk_map:", &__block_literal_global_203);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "hk_map:", &__block_literal_global_205_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "addJournalEntries:error:", v7, a3);

  return v10;
}

ACHTemplateJournalEntry *__68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_2_201(uint64_t a1, void *a2)
{
  id v2;
  ACHTemplateJournalEntry *v3;

  v2 = a2;
  v3 = -[ACHTemplateJournalEntry initWithTemplate:provenance:useLegacySyncIdentity:action:]([ACHTemplateJournalEntry alloc], "initWithTemplate:provenance:useLegacySyncIdentity:action:", v2, 0, 0, 0);

  return v3;
}

ACHTemplateJournalEntry *__68__ACHAwardsServer_remote_addTemplates_removingTemplates_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  ACHTemplateJournalEntry *v3;

  v2 = a2;
  v3 = -[ACHTemplateJournalEntry initWithTemplate:provenance:useLegacySyncIdentity:action:]([ACHTemplateJournalEntry alloc], "initWithTemplate:provenance:useLegacySyncIdentity:action:", v2, 0, 0, 1);

  return v3;
}

- (void)remote_fetchAllTemplatesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  NSObject *v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[ACHAwardsServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ACHAwardsServer_remote_fetchAllTemplatesWithCompletion___block_invoke;
  block[3] = &unk_24D13B698;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __58__ACHAwardsServer_remote_fetchAllTemplatesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  +[ACHTemplateEntity allTemplatesWithProfile:error:](ACHTemplateEntity, "allTemplatesWithProfile:error:", v2, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)remote_removeAllTemplatesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  NSObject *v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[ACHAwardsServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ACHAwardsServer_remote_removeAllTemplatesWithCompletion___block_invoke;
  block[3] = &unk_24D13B6C0;
  block[4] = self;
  block[5] = &v8;
  block[6] = &v14;
  dispatch_sync(v6, block);

  v4[2](v4, *((unsigned __int8 *)v15 + 24), v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __59__ACHAwardsServer_remote_removeAllTemplatesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  +[ACHTemplateEntity allTemplatesWithProfile:error:](ACHTemplateEntity, "allTemplatesWithProfile:error:", v2, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) || v4 && !objc_msgSend(v4, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(id *)(v6 + 40);
    v7 = +[ACHTemplateEntity removeTemplates:profile:error:](ACHTemplateEntity, "removeTemplates:profile:error:", v4, v5, &v8);
    objc_storeStrong((id *)(v6 + 40), v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  }
}

- (void)remote_removeTemplates:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACHAwardsServer *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__ACHAwardsServer_remote_removeTemplates_completion___block_invoke;
  v11[3] = &unk_24D13B4B8;
  v14 = &v22;
  v10 = v6;
  v12 = v10;
  v13 = self;
  v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __53__ACHAwardsServer_remote_removeTemplates_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  v5 = +[ACHTemplateEntity removeTemplates:profile:error:](ACHTemplateEntity, "removeTemplates:profile:error:", v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

}

- (void)remote_addEarnedInstances:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__ACHAwardsServer_remote_addEarnedInstances_completion___block_invoke;
  v11[3] = &unk_24D13B6E8;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v13 = &v15;
  v14 = &v21;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __56__ACHAwardsServer_remote_addEarnedInstances_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("AddEarnedInstances"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  +[ACHEarnedInstanceEntity insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:](ACHEarnedInstanceEntity, "insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v3, 0, 0, v4, v2, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);

  v7 = 0;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    v7 = objc_msgSend(v6, "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;

}

- (void)remote_removeEarnedInstances:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACHAwardsServer *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__ACHAwardsServer_remote_removeEarnedInstances_completion___block_invoke;
  v11[3] = &unk_24D13B4B8;
  v14 = &v22;
  v10 = v6;
  v12 = v10;
  v13 = self;
  v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __59__ACHAwardsServer_remote_removeEarnedInstances_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  v5 = +[ACHEarnedInstanceEntity removeEarnedInstances:profile:error:](ACHEarnedInstanceEntity, "removeEarnedInstances:profile:error:", v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

}

- (void)remote_addEarnedInstances:(id)a3 removingEarnedInstances:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t);
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  -[ACHAwardsServer queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v11);

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  v30 = __Block_byref_object_dispose__7;
  v31 = (id)MEMORY[0x24BDBD1A8];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke;
  block[3] = &unk_24D13B798;
  block[4] = self;
  v18 = &v20;
  v13 = v9;
  v16 = v13;
  v14 = v8;
  v17 = v14;
  v19 = &v26;
  dispatch_sync(v12, block);

  v10[2](v10, v27[5], v21[5]);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("AddEarnedInstancesAndRemove"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = MEMORY[0x24BDAC760];
  v22 = *(id *)(v5 + 40);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_2;
  v16[3] = &unk_24D13B710;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v17 = v7;
  v18 = v8;
  v19 = *(id *)(a1 + 48);
  v20 = v2;
  v21 = *(_QWORD *)(a1 + 64);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_3;
  v12[3] = &unk_24D13B648;
  v13 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v10;
  v11 = v2;
  objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, &v22, v16, v12);
  objc_storeStrong((id *)(v5 + 40), v22);

}

BOOL __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;

  if (!objc_msgSend(*(id *)(a1 + 32), "count")
    || (v5 = *(_QWORD *)(a1 + 32),
        objc_msgSend(*(id *)(a1 + 40), "profile"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = +[ACHEarnedInstanceEntity removeEarnedInstances:profile:error:](ACHEarnedInstanceEntity, "removeEarnedInstances:profile:error:", v5, v6, a3), v6, v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACHEarnedInstanceEntity insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:](ACHEarnedInstanceEntity, "insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v8, 0, 0, v9, *(_QWORD *)(a1 + 56), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v10 != 0;
    if (v10)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v10);

  }
  return v7;
}

uint64_t __80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_3(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1[4], "hk_map:", &__block_literal_global_213_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "hk_map:", &__block_literal_global_215);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "addJournalEntries:error:", v7, a3);

  return v10;
}

ACHEarnedInstanceJournalEntry *__80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  ACHEarnedInstanceJournalEntry *v3;

  v2 = a2;
  v3 = -[ACHEarnedInstanceJournalEntry initWithEarnedInstance:provenance:useLegacySyncIdentity:action:]([ACHEarnedInstanceJournalEntry alloc], "initWithEarnedInstance:provenance:useLegacySyncIdentity:action:", v2, 0, 0, 0);

  return v3;
}

ACHEarnedInstanceJournalEntry *__80__ACHAwardsServer_remote_addEarnedInstances_removingEarnedInstances_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  ACHEarnedInstanceJournalEntry *v3;

  v2 = a2;
  v3 = -[ACHEarnedInstanceJournalEntry initWithEarnedInstance:provenance:useLegacySyncIdentity:action:]([ACHEarnedInstanceJournalEntry alloc], "initWithEarnedInstance:provenance:useLegacySyncIdentity:action:", v2, 0, 0, 1);

  return v3;
}

- (void)remote_removeEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACHAwardsServer *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__ACHAwardsServer_remote_removeEarnedInstancesForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_24D13B4B8;
  v14 = &v22;
  v10 = v6;
  v12 = v10;
  v13 = self;
  v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, *((unsigned __int8 *)v23 + 24), v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __80__ACHAwardsServer_remote_removeEarnedInstancesForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  v5 = +[ACHEarnedInstanceEntity removeEarnedInstancesForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "removeEarnedInstancesForTemplateUniqueName:profile:error:", v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

}

- (void)remote_removeAllEarnedInstancesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  NSObject *v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[ACHAwardsServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ACHAwardsServer_remote_removeAllEarnedInstancesWithCompletion___block_invoke;
  block[3] = &unk_24D13B698;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, *((unsigned __int8 *)v15 + 24), v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __65__ACHAwardsServer_remote_removeAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = +[ACHEarnedInstanceEntity removeAllEarnedInstancesWithProfile:error:](ACHEarnedInstanceEntity, "removeAllEarnedInstancesWithProfile:error:", v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

- (void)remote_fetchAllEarnedInstancesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  NSObject *v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[ACHAwardsServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ACHAwardsServer_remote_fetchAllEarnedInstancesWithCompletion___block_invoke;
  block[3] = &unk_24D13B698;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __64__ACHAwardsServer_remote_fetchAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  +[ACHEarnedInstanceEntity allEarnedInstancesWithProfile:error:](ACHEarnedInstanceEntity, "allEarnedInstancesWithProfile:error:", v2, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)remote_fetchEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACHAwardsServer *v13;
  uint64_t *v14;
  uint64_t *v15;
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
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__ACHAwardsServer_remote_fetchEarnedInstancesForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_24D13B4B8;
  v14 = &v22;
  v10 = v6;
  v12 = v10;
  v13 = self;
  v15 = &v16;
  dispatch_sync(v9, v11);

  v7[2](v7, v23[5], v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __79__ACHAwardsServer_remote_fetchEarnedInstancesForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  +[ACHEarnedInstanceEntity earnedInstancesForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "earnedInstancesForTemplateUniqueName:profile:error:", v2, v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)remote_fetchMostRecentEarnedInstanceForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_24D13B5C0;
  v11[4] = self;
  v13 = &v15;
  v14 = &v21;
  v10 = v6;
  v12 = v10;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[5], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForReadingProtectedDataWithIdentifier:", CFSTR("Fetch Most Recent Instnace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke_2;
  v9[3] = &unk_24D13A4F0;
  v12 = *(_QWORD *)(a1 + 56);
  v9[1] = 3221225472;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v2, &obj, v9, 0);
  objc_storeStrong((id *)(v6 + 40), obj);

}

BOOL __88__ACHAwardsServer_remote_fetchMostRecentEarnedInstanceForTemplateUniqueName_completion___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHEarnedInstanceEntity mostRecentEarnedInstanceForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "mostRecentEarnedInstanceForTemplateUniqueName:profile:error:", v5, v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *a3 == 0;
}

- (void)remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke;
  v11[3] = &unk_24D13AE30;
  v11[4] = self;
  v13 = &v15;
  v10 = v6;
  v12 = v10;
  v14 = &v21;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[5], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForReadingProtectedDataWithIdentifier:", CFSTR("Fetch Most Recent Instnace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke_2;
  v9[3] = &unk_24D13B7C0;
  v9[1] = 3221225472;
  v10 = v6;
  v11 = v2;
  v12 = *(_QWORD *)(a1 + 56);
  v8 = v2;
  objc_msgSend(v5, "performTransactionWithContext:error:block:inaccessibilityHandler:", v3, &obj, v9, 0);
  objc_storeStrong((id *)(v7 + 40), obj);

}

BOOL __90__ACHAwardsServer_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        +[ACHEarnedInstanceEntity mostRecentEarnedInstanceForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "mostRecentEarnedInstanceForTemplateUniqueName:profile:error:", v10, *(_QWORD *)(a1 + 40), a3, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return *a3 == 0;
}

- (void)remote_fetchEarnedInstancesForEarnedDateComponentsString:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ACHAwardsServer *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v23 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke;
  block[3] = &unk_24D13B7E8;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = self;
  v15 = v11;
  v16 = &v18;
  v17 = &v24;
  dispatch_sync(v9, block);

  (*((void (**)(id, uint64_t, uint64_t))v11 + 2))(v11, v25[5], v19[5]);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  ACHYearMonthDayDateComponentsFromString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_transactionContextForReadingProtectedDataWithIdentifier:", CFSTR("Fetch Most Recent Instnace"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    v16 = *(_QWORD *)(a1 + 64);
    obj = v7;
    v13[0] = MEMORY[0x24BDAC760];
    v13[2] = __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke_2;
    v13[3] = &unk_24D13A4F0;
    v13[1] = 3221225472;
    v8 = v2;
    v9 = *(_QWORD *)(a1 + 40);
    v14 = v8;
    v15 = v9;
    objc_msgSend(v5, "performTransactionWithContext:error:block:inaccessibilityHandler:", v3, &obj, v13, 0);
    objc_storeStrong((id *)(v6 + 40), obj);

    v10 = v14;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = CFSTR("Unable to parse date components");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), 133, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, MEMORY[0x24BDBD1A8], v10);
  }

}

BOOL __87__ACHAwardsServer_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACHEarnedInstanceEntity earnedInstancesForDateComponents:profile:error:](ACHEarnedInstanceEntity, "earnedInstancesForDateComponents:profile:error:", v5, v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *a3 == 0;
}

- (void)remote_countOfEarnedInstancesForTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke;
  v11[3] = &unk_24D13B5C0;
  v11[4] = self;
  v13 = &v15;
  v14 = &v21;
  v10 = v6;
  v12 = v10;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[3], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForReadingProtectedDataWithIdentifier:", CFSTR("Fetch Most Recent Instnace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke_2;
  v9[3] = &unk_24D13A4F0;
  v12 = *(_QWORD *)(a1 + 56);
  v9[1] = 3221225472;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v2, &obj, v9, 0);
  objc_storeStrong((id *)(v6 + 40), obj);

}

BOOL __81__ACHAwardsServer_remote_countOfEarnedInstancesForTemplateUniqueName_completion___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[ACHEarnedInstanceEntity countOfEarnedInstancesForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "countOfEarnedInstancesForTemplateUniqueName:profile:error:", v5, v6, a3);

  return *a3 == 0;
}

- (void)remote_countOfEarnedInstancesForUniqueNames:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  -[ACHAwardsServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  -[ACHAwardsServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke;
  v11[3] = &unk_24D13AE30;
  v11[4] = self;
  v13 = &v15;
  v10 = v6;
  v12 = v10;
  v14 = &v21;
  dispatch_sync(v9, v11);

  v7[2](v7, v22[5], v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_transactionContextForReadingProtectedDataWithIdentifier:", CFSTR("Fetch Most Recent Instnace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke_2;
  v9[3] = &unk_24D13B7C0;
  v9[1] = 3221225472;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v2, &obj, v9, 0);
  objc_storeStrong((id *)(v6 + 40), obj);

}

BOOL __74__ACHAwardsServer_remote_countOfEarnedInstancesForUniqueNames_completion___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 40), "profile");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = +[ACHEarnedInstanceEntity countOfEarnedInstancesForTemplateUniqueName:profile:error:](ACHEarnedInstanceEntity, "countOfEarnedInstancesForTemplateUniqueName:profile:error:", v9, v10, a3);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return *a3 == 0;
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D82BB8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_transactionContextForWritingProtectedDataWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Unable to acquire database assertion: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_transactionContextForReadingProtectedDataWithIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "Unable to acquire database assertion with identifier %@: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
