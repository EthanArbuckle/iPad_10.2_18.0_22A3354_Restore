@implementation ACHAwardsKeyValueServer

- (ACHAwardsKeyValueServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  ACHAwardsKeyValueServer *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *domainsByName;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  HDKeyValueDomain *legacyDomain;
  objc_super v20;

  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ACHAwardsKeyValueServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v20, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    domainsByName = v11->_domainsByName;
    v11->_domainsByName = v12;

    v11->_domainLock._os_unfair_lock_opaque = 0;
    v14 = objc_alloc(MEMORY[0x24BE40AD0]);
    v15 = *MEMORY[0x24BE408C0];
    objc_msgSend(v10, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithCategory:domainName:profile:", 106, v15, v16);
    legacyDomain = v11->_legacyDomain;
    v11->_legacyDomain = (HDKeyValueDomain *)v17;

  }
  return v11;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE01270];
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
      -[ACHAwardsKeyValueServer _transactionContextForWritingProtectedDataWithIdentifier:].cold.1((uint64_t)v9, v10);

  }
  ACHDatabaseContextWithAccessibilityAssertion(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequiresWrite:", 1);
  objc_msgSend(v11, "setRequiresProtectedData:", 1);

  return v11;
}

- (id)_domainForName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_domainLock;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  p_domainLock = &self->_domainLock;
  os_unfair_lock_lock(&self->_domainLock);
  -[ACHAwardsKeyValueServer domainsByName](self, "domainsByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x24BE40AD0]);
    -[HDStandardTaskServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithCategory:domainName:profile:", 107, v4, v9);

    -[ACHAwardsKeyValueServer domainsByName](self, "domainsByName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v4);

  }
  os_unfair_lock_unlock(p_domainLock);

  return v7;
}

- (void)remote_protectedDataAvailableWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, objc_msgSend(v6, "isProtectedDataAvailable"));

}

- (void)remote_removeValuesForKeys:(id)a3 domain:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v8 = (void (**)(id, uint64_t, id))a5;
  v9 = a3;
  -[ACHAwardsKeyValueServer _domainForName:](self, "_domainForName:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v9);

  v14 = 0;
  v12 = objc_msgSend(v10, "removeValuesForKeys:error:", v11, &v14);
  v13 = v14;

  v8[2](v8, v12, v13);
}

- (void)remote_removeValuesForKeysInDomains:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ACHAwardsKeyValueServer *v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  -[ACHAwardsKeyValueServer _transactionContextForWritingProtectedDataWithIdentifier:](self, "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("RemoveValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__ACHAwardsKeyValueServer_remote_removeValuesForKeysInDomains_completion___block_invoke;
  v14[3] = &unk_24D13C458;
  v15 = v6;
  v16 = self;
  v11 = v6;
  v12 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, &v17, v14, 0);
  v13 = v17;

  v7[2](v7, v12, v13);
}

uint64_t __74__ACHAwardsKeyValueServer_remote_removeValuesForKeysInDomains_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    LOBYTE(v9) = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_domainForName:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v9 & 1) != 0)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v12);
          v9 = objc_msgSend(v13, "removeValuesForKeys:error:", v14, a3);

        }
        else
        {
          v9 = 0;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)remote_setLegacyValuesWithDictionary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  -[ACHAwardsKeyValueServer _transactionContextForWritingProtectedDataWithIdentifier:](self, "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("SetLegacyValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__ACHAwardsKeyValueServer_remote_setLegacyValuesWithDictionary_completion___block_invoke;
  v14[3] = &unk_24D13C458;
  v14[4] = self;
  v15 = v6;
  v11 = v6;
  v12 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, &v16, v14, 0);
  v13 = v16;

  v7[2](v7, v12, v13);
}

uint64_t __75__ACHAwardsKeyValueServer_remote_setLegacyValuesWithDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "legacyDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setValuesWithDictionary:error:", *(_QWORD *)(a1 + 40), a3);

  return v6;
}

- (void)remote_setValue:(id)a3 forKey:(id)a4 domain:(id)a5 completion:(id)a6
{
  void (**v10)(id, uint64_t, id);
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v10 = (void (**)(id, uint64_t, id))a6;
  v11 = a4;
  v12 = a3;
  -[ACHAwardsKeyValueServer _domainForName:](self, "_domainForName:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v14 = objc_msgSend(v13, "setNumber:forKey:error:", v12, v11, &v16);

  v15 = v16;
  v10[2](v10, v14, v15);

}

- (void)remote_setValuesWithDictionary:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, id);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, id))a5;
  v10 = a4;
  -[ACHAwardsKeyValueServer _transactionContextForWritingProtectedDataWithIdentifier:](self, "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("SetValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAwardsKeyValueServer _domainForName:](self, "_domainForName:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__ACHAwardsKeyValueServer_remote_setValuesWithDictionary_domain_completion___block_invoke;
  v19[3] = &unk_24D13C458;
  v20 = v12;
  v21 = v8;
  v15 = v8;
  v16 = v12;
  v17 = objc_msgSend(v14, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, &v22, v19, 0);
  v18 = v22;

  v9[2](v9, v17, v18);
}

uint64_t __76__ACHAwardsKeyValueServer_remote_setValuesWithDictionary_domain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValuesWithDictionary:error:", *(_QWORD *)(a1 + 40), a3);
}

- (void)remote_setValuesWithDomainDictionary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ACHAwardsKeyValueServer *v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  -[ACHAwardsKeyValueServer _transactionContextForWritingProtectedDataWithIdentifier:](self, "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("SetValuesWithDomainDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__ACHAwardsKeyValueServer_remote_setValuesWithDomainDictionary_completion___block_invoke;
  v14[3] = &unk_24D13C458;
  v15 = v6;
  v16 = self;
  v11 = v6;
  v12 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, &v17, v14, 0);
  v13 = v17;

  v7[2](v7, v12, v13);
}

uint64_t __75__ACHAwardsKeyValueServer_remote_setValuesWithDomainDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    LOBYTE(v9) = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_domainForName:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v9 & 1) != 0)
          v9 = objc_msgSend(v13, "setValuesWithDictionary:error:", v12, a3);
        else
          v9 = 0;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)remote_valueForKey:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__25;
  v26 = __Block_byref_object_dispose__25;
  v27 = 0;
  -[ACHAwardsKeyValueServer _domainForName:](self, "_domainForName:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __64__ACHAwardsKeyValueServer_remote_valueForKey_domain_completion___block_invoke;
  v17[3] = &unk_24D13C920;
  v20 = &v22;
  v14 = v11;
  v18 = v14;
  v15 = v8;
  v19 = v15;
  objc_msgSend(v13, "performHighPriorityTransactionsWithError:block:", &v21, v17);
  v16 = v21;

  v10[2](v10, v23[5], v16);
  _Block_object_dispose(&v22, 8);

}

BOOL __64__ACHAwardsKeyValueServer_remote_valueForKey_domain_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "numberForKey:error:", *(_QWORD *)(a1 + 40), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

- (void)remote_valuesForKeys:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  -[ACHAwardsKeyValueServer _transactionContextForWritingProtectedDataWithIdentifier:](self, "_transactionContextForWritingProtectedDataWithIdentifier:", CFSTR("FetchValuesForKeys"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHighPriority:", 1);
  objc_msgSend(v11, "setRequiresWrite:", 0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__25;
  v27 = __Block_byref_object_dispose__25;
  v28 = 0;
  -[ACHAwardsKeyValueServer _domainForName:](self, "_domainForName:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__ACHAwardsKeyValueServer_remote_valuesForKeys_domain_completion___block_invoke;
  v18[3] = &unk_24D13B7C0;
  v15 = v8;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  v21 = &v23;
  objc_msgSend(v14, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, &v22, v18, 0);
  v17 = v22;

  v10[2](v10, v24[5], v17);
  _Block_object_dispose(&v23, 8);

}

uint64_t __66__ACHAwardsKeyValueServer_remote_valuesForKeys_domain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "numberForKey:error:", v11, a3, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v5);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  return 1;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D79E68);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D82D10);
}

- (NSMutableDictionary)domainsByName
{
  return self->_domainsByName;
}

- (void)setDomainsByName:(id)a3
{
  objc_storeStrong((id *)&self->_domainsByName, a3);
}

- (HDKeyValueDomain)legacyDomain
{
  return self->_legacyDomain;
}

- (void)setLegacyDomain:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyDomain, 0);
  objc_storeStrong((id *)&self->_domainsByName, 0);
}

- (void)_transactionContextForWritingProtectedDataWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21407B000, a2, OS_LOG_TYPE_ERROR, "Unable to acquire database assertion: %@", (uint8_t *)&v2, 0xCu);
}

@end
