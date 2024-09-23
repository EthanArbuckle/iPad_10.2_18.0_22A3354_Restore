@implementation CDCoreDataContextPersisting

void __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0C97B50], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(v2, "setIncludesPendingChanges:", 1);
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  v25 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_BYTE *)(a1 + 72))
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0C97B28], "insertNewObjectForEntityForName:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    v15 = *(void **)(a1 + 48);
    v24 = 0;
    v16 = objc_msgSend(v15, "save:", &v24);
    v5 = v24;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v16;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_1((uint64_t)v5, v17, v18, v19, v20, v21, v22, v23);

    }
    objc_msgSend(*(id *)(a1 + 48), "processPendingChanges");
    objc_msgSend(*(id *)(a1 + 48), "refreshAllObjects");

  }
LABEL_15:

}

void __73___CDCoreDataContextPersisting_fromEntityWithName_deleteObjectsMatching___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C97B50], "fetchRequestWithEntityName:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchLimit:", 0);
  objc_msgSend(v2, "setIncludesPendingChanges:", 1);
  objc_msgSend(v2, "setPredicate:", a1[5]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A88]), "initWithFetchRequest:", v2);
  objc_msgSend(v3, "setResultType:", 0);
  v4 = (void *)a1[6];
  v8 = 0;
  objc_msgSend(v4, "executeRequest:error:", v3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  objc_msgSend(v5, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v7, "BOOLValue");

}

uint64_t __51___CDCoreDataContextPersisting_deleteRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

void __51___CDCoreDataContextPersisting_deleteRegistration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "uniqunessPredicateForRegistration:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "withMOFromEntityWithName:andUniqunessPredicate:update:", CFSTR("ContextualChangeRegistration"), v3, &__block_literal_global_8);

  objc_msgSend(*(id *)(a1 + 40), "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "_deleteKeyPaths:", v6);
}

void __96___CDCoreDataContextPersisting_fromEntityWithName_fetchAllObjectsMatchingPredicate_handlingMOs___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C97B50], "fetchRequestWithEntityName:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchLimit:", 0);
  objc_msgSend(v2, "setIncludesPendingChanges:", 1);
  objc_msgSend(v2, "setPredicate:", a1[5]);
  v3 = (void *)a1[6];
  v6 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[7] + 16))();

}

void __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (!objc_msgSend(*(id *)(a1 + 32), "isEphemeral")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "countForObject:", *(_QWORD *)(a1 + 32)))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "uniquenessPredicateForKeyPath:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke_2;
    v4[3] = &unk_1E26D4C18;
    v5 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v2, "withMOFromEntityWithName:andUniqunessPredicate:insertOrUpdate:", CFSTR("ContextualKeyPath"), v3, v4);

  }
}

uint64_t __53___CDCoreDataContextPersisting_saveValue_forKeyPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[_CDContextualKeyPathMO hydrateMO:fromKeyPath:andValue:](_CDContextualKeyPathMO, "hydrateMO:fromKeyPath:andValue:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __49___CDCoreDataContextPersisting_saveRegistration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "uniqunessPredicateForRegistration:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49___CDCoreDataContextPersisting_saveRegistration___block_invoke_2;
  v10[3] = &unk_1E26D4C40;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v8, "withMOFromEntityWithName:andUniqunessPredicate:insertOrUpdate:", CFSTR("ContextualChangeRegistration"), v9, v10);

}

void __49___CDCoreDataContextPersisting_saveRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D158F0];
  v4 = a2;
  objc_msgSend(v3, "contextChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18DD73000, v5, OS_LOG_TYPE_DEFAULT, "Saving registration: %@", (uint8_t *)&v7, 0xCu);
  }

  +[_CDContextualChangeRegistrationMO hydrateMO:fromRegistration:](_CDContextualChangeRegistrationMO, "hydrateMO:fromRegistration:", v4, *(_QWORD *)(a1 + 32));
}

uint64_t __45___CDCoreDataContextPersisting_deleteAllData__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fromEntityWithName:deleteObjectsMatching:", CFSTR("ContextualKeyPath"), 0);
  return objc_msgSend(*(id *)(a1 + 32), "fromEntityWithName:deleteObjectsMatching:", CFSTR("ContextualChangeRegistration"), 0);
}

void __56___CDCoreDataContextPersisting_deleteDataCreatedBefore___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate < %@"), *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fromEntityWithName:deleteObjectsMatching:", CFSTR("ContextualKeyPath"), v2);
  objc_msgSend(*(id *)(a1 + 40), "fromEntityWithName:deleteObjectsMatching:", CFSTR("ContextualChangeRegistration"), v2);

}

void __42___CDCoreDataContextPersisting_loadValues__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42___CDCoreDataContextPersisting_loadValues__block_invoke_2;
  v2[3] = &unk_1E26D4C88;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "fromEntityWithName:fetchAllObjectsMatchingPredicate:handlingMOs:", CFSTR("ContextualKeyPath"), 0, v2);

}

void __42___CDCoreDataContextPersisting_loadValues__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        +[_CDContextualKeyPathMO materializedKeyPathFrom:](_CDContextualKeyPathMO, "materializedKeyPathFrom:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDContextualKeyPathMO materializedContextValueFrom:](_CDContextualKeyPathMO, "materializedContextValueFrom:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  int v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v12 = 0x1500000001;
  v8 = 0;
  v9 = 0;
  v7 = 16;
  if (sysctl(v12, 2u, &v8, &v7, 0, 0) == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_cold_1();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)v9 / 1000000.0 + (double)v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v2;
      _os_log_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Device boot time: %@", buf, 0xCu);
    }
  }
  +[_CDContextualChangeRegistrationMO predicateForActiveRegistrationsInBootSession:](_CDContextualChangeRegistrationMO, "predicateForActiveRegistrationsInBootSession:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_2;
  v5[3] = &unk_1E26D4C88;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "fromEntityWithName:fetchAllObjectsMatchingPredicate:handlingMOs:", CFSTR("ContextualChangeRegistration"), v3, v5);

}

void __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        +[_CDContextualChangeRegistrationMO materializedRegistrationFrom:](_CDContextualChangeRegistrationMO, "materializedRegistrationFrom:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
        }
        else
        {
          if (!v6)
          {
            objc_msgSend(v9, "managedObjectContext");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "deleteObject:", v9);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "save:", 0);

}

void __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, a2, a3, "Error saving MO: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __94___CDCoreDataContextPersisting__withMOFromEntityWithName_andUniqunessPredicate_insert_update___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, a2, a3, "Error fetching MO: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __49___CDCoreDataContextPersisting_loadRegistrations__block_invoke_cold_1()
{
  int *v0;
  char *v1;
  int v2;
  char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = __error();
  v1 = strerror(*v0);
  v2 = 136446210;
  v3 = v1;
  _os_log_fault_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to determine KERN_BOOTTIME: %{public}s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
