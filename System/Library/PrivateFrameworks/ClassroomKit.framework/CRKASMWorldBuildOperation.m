@implementation CRKASMWorldBuildOperation

- (CRKASMWorldBuildOperation)initWithEnvironment:(id)a3
{
  id v5;
  CRKASMWorldBuildOperation *v6;
  CRKASMWorldBuildOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMWorldBuildOperation;
  v6 = -[CRKASMWorldBuildOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_environment, a3);

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CRKASMWorldBuildOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __33__CRKASMWorldBuildOperation_main__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    CATErrorWithCodeAndUserInfo();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endOperationWithError:", v4);

  }
  else
  {
    objc_msgSend(v3, "checkAccountEligibility");
  }
}

- (void)checkAccountEligibility
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  uint64_t v9;
  __int16 v10;
  uint8_t buf[16];

  -[CRKASMWorldBuildOperation rosterRequirements](self, "rosterRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accountState");

  switch(v4)
  {
    case 2:
      -[CRKASMWorldBuildOperation buildCurrentClassKitUser](self, "buildCurrentClassKitUser");
      return;
    case 1:
      _CRKLogASM_12();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v10 = 0;
        v7 = "ASM World Build: Account is transitioning. Nothing to build right now.";
        v8 = (uint8_t *)&v10;
LABEL_12:
        _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
      }
      break;
    case 0:
      _CRKLogASM_12();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "ASM World Build: No eligible ASM account signed in", buf, 2u);
      }

      -[CRKASMWorldBuildOperation housekeepKeychain](self, "housekeepKeychain");
      goto LABEL_14;
    default:
      _CRKLogASM_12();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        v7 = "ASM World Build: Unknown account state. Doing nothing out of fear.";
        v8 = (uint8_t *)&v9;
        goto LABEL_12;
      }
      break;
  }

LABEL_14:
  -[CRKASMWorldBuildOperation finishWithEmptyResultObject](self, "finishWithEmptyResultObject", v9);
}

- (void)buildCurrentClassKitUser
{
  void *v3;
  _QWORD v4[5];

  -[CRKASMWorldBuildOperation rosterRequirements](self, "rosterRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke;
  v4[3] = &unk_24D9C8B18;
  v4[4] = self;
  objc_msgSend(v3, "currentUserWithCompletion:", v4);

}

void __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke_2;
  block[3] = &unk_24D9C84C0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __53__CRKASMWorldBuildOperation_buildCurrentClassKitUser__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "person");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2 && (objc_msgSend(v2, "objectID"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
      {
        objc_msgSend(*(id *)(a1 + 32), "setClassKitCurrentUser:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 32), "buildClassKitClasses");
      }
      else
      {
        _CRKLogASM_12();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "ASM World Build: Could not find current user", v6, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "finishWithEmptyResultObject");
      }

    }
  }
}

- (void)buildClassKitClasses
{
  void *v3;
  _QWORD v4[5];

  -[CRKASMWorldBuildOperation rosterRequirements](self, "rosterRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke;
  v4[3] = &unk_24D9C84E8;
  v4[4] = self;
  objc_msgSend(v3, "classesWithCompletion:", v4);

}

void __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_2;
  block[3] = &unk_24D9C84C0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      return objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "crk_filterUsingBlock:", &__block_literal_global_55);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setClassKitClasses:", v3);

      return objc_msgSend(*(id *)(a1 + 32), "buildClassKitLocationsByLocationID");
    }
  }
  return result;
}

BOOL __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _CRKLogASM_12();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_3_cold_1(v2);

  }
  return v3 != 0;
}

- (void)buildClassKitLocationsByLocationID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[CRKASMWorldBuildOperation classKitClasses](self, "classKitClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crk_mapUsingBlock:", &__block_literal_global_5_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMWorldBuildOperation rosterRequirements](self, "rosterRequirements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_2;
  v8[3] = &unk_24D9C84E8;
  v8[4] = self;
  objc_msgSend(v7, "locationsWithObjectIDs:completion:", v6, v8);

}

uint64_t __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationID");
}

void __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_3;
  block[3] = &unk_24D9C84C0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      return objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_7_0, &__block_literal_global_9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setClassKitLocationsByLocationID:", v3);

      return objc_msgSend(*(id *)(a1 + 32), "buildManageableLocationIDs");
    }
  }
  return result;
}

uint64_t __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

id __63__CRKASMWorldBuildOperation_buildClassKitLocationsByLocationID__block_invoke_5(uint64_t a1, void *a2)
{
  return a2;
}

- (void)buildManageableLocationIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[CRKASMWorldBuildOperation rosterRequirements](self, "rosterRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMWorldBuildOperation classKitCurrentUser](self, "classKitCurrentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke;
  v7[3] = &unk_24D9C84E8;
  v7[4] = self;
  objc_msgSend(v3, "locationsWithManagePermissionsForUserWithObjectID:completion:", v6, v7);

}

void __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_2;
  block[3] = &unk_24D9C84C0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_10_0, &__block_literal_global_11);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "classKitLocationsByLocationID");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "crk_dictionaryByAddingEntriesFromDictionary:", v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setClassKitLocationsByLocationID:", v3);

      v4 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(*(id *)(a1 + 48), "crk_mapUsingBlock:", &__block_literal_global_12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWithArray:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setManageableLocationIDs:", v6);

      objc_msgSend(*(id *)(a1 + 32), "buildAllClassKitPersonsByClassID");
    }
  }
}

uint64_t __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

id __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_4(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __55__CRKASMWorldBuildOperation_buildManageableLocationIDs__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

- (void)buildAllClassKitPersonsByClassID
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id obj;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v20 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  v3 = dispatch_group_create();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[CRKASMWorldBuildOperation classKitClasses](self, "classKitClasses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v21)
  {
    v17 = *(_QWORD *)v37;
    v4 = MEMORY[0x24BDAC760];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v5);
        dispatch_group_enter(v3);
        -[CRKASMWorldBuildOperation rosterRequirements](self, "rosterRequirements");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v4;
        v31[1] = 3221225472;
        v31[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke;
        v31[3] = &unk_24D9C8CC8;
        v9 = v20;
        v32 = v9;
        v33 = v6;
        v34 = v18;
        v10 = v3;
        v35 = v10;
        objc_msgSend(v7, "trustedPersonsInClassWithObjectID:completion:", v8, v31);

        dispatch_group_enter(v10);
        -[CRKASMWorldBuildOperation rosterRequirements](self, "rosterRequirements");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v4;
        v26[1] = 3221225472;
        v26[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_3;
        v26[3] = &unk_24D9C8CC8;
        v27 = v9;
        v28 = v6;
        v29 = v19;
        v30 = v10;
        objc_msgSend(v11, "personsInClassWithObjectID:completion:", v12, v26);

        ++v5;
      }
      while (v21 != v5);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v21);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_5;
  block[3] = &unk_24D9C7280;
  block[4] = self;
  v23 = v20;
  v24 = v18;
  v25 = v19;
  v13 = v19;
  v14 = v18;
  v15 = v20;
  dispatch_group_notify(v3, MEMORY[0x24BDAC9B8], block);

}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_2;
  v12[3] = &unk_24D9C8CA0;
  v13 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v17 = v5;
  v18 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = *(void **)(a1 + 56);
    if (*(_QWORD *)(a1 + 64))
      v2 = *(_QWORD *)(a1 + 64);
    else
      v2 = MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(*(id *)(a1 + 48), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_4;
  v12[3] = &unk_24D9C8CA0;
  v13 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v17 = v5;
  v18 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = *(void **)(a1 + 56);
    if (*(_QWORD *)(a1 + 64))
      v2 = *(_QWORD *)(a1 + 64);
    else
      v2 = MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(*(id *)(a1 + 48), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __61__CRKASMWorldBuildOperation_buildAllClassKitPersonsByClassID__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend((id)objc_opt_class(), "makeErrorWithErrorsByObjectID:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v5 = (id)v2;
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v2);
    }
    else
    {
      v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      objc_msgSend(*(id *)(a1 + 32), "setTrustedClassKitPersonsByClassID:", v3);

      v4 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
      objc_msgSend(*(id *)(a1 + 32), "setClassKitPersonsByClassID:", v4);

      objc_msgSend(*(id *)(a1 + 32), "finish");
    }

  }
}

- (void)finish
{
  id v3;

  -[CRKASMWorldBuildOperation compileResult](self, "compileResult");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKASMWorldBuildOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v3);

}

- (void)finishWithEmptyResultObject
{
  id v3;

  v3 = (id)objc_opt_new();
  -[CRKASMWorldBuildOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v3);

}

- (void)housekeepKeychain
{
  -[CRKASMWorldBuildOperation housekeepKeychainWithRoster:](self, "housekeepKeychainWithRoster:", 0);
}

- (void)housekeepKeychainWithRoster:(id)a3
{
  id v3;

  -[CRKASMWorldBuildOperation makeHousekeeperWithRoster:](self, "makeHousekeeperWithRoster:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "housekeep");

}

- (id)makeHousekeeperWithRoster:(id)a3
{
  id v4;
  CRKASMCredentialHousekeeper *v5;
  void *v6;
  void *v7;
  void *v8;
  CRKASMCredentialHousekeeper *v9;

  v4 = a3;
  v5 = [CRKASMCredentialHousekeeper alloc];
  -[CRKASMWorldBuildOperation environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "credentialStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRKASMCredentialHousekeeper initWithRoster:credentialStore:](v5, "initWithRoster:credentialStore:", v4, v8);

  return v9;
}

- (id)compileResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRKASMConcreteOrganization *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CRKASMConcreteOrganization *v23;
  CRKASMConcreteRoster *v24;
  void *v25;
  void *v26;
  void *v27;
  CRKASMWorldBuildResultObject *v28;
  void *v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;

  -[CRKASMWorldBuildOperation environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "certificateVendor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMWorldBuildOperation environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMWorldBuildOperation classKitCurrentUser](self, "classKitCurrentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityVendorForUserIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMWorldBuildOperation classKitClasses](self, "classKitClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __42__CRKASMWorldBuildOperation_compileResult__block_invoke;
  v33[3] = &unk_24D9C8CF0;
  v33[4] = self;
  v34 = v8;
  v31 = v8;
  objc_msgSend(v9, "crk_mapUsingBlock:", v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRKASMCollidingCourseFilter coursesByFilteringCollidingCoursesFromArray:](CRKASMCollidingCourseFilter, "coursesByFilteringCollidingCoursesFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMWorldBuildOperation environment](self, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMWorldBuildOperation classKitCurrentUser](self, "classKitCurrentUser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "person");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userForPerson:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [CRKASMConcreteOrganization alloc];
  -[CRKASMWorldBuildOperation classKitCurrentUser](self, "classKitCurrentUser");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "person");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "orgID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMWorldBuildOperation classKitCurrentUser](self, "classKitCurrentUser");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "organizationName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CRKASMConcreteOrganization initWithIdentifier:name:](v17, "initWithIdentifier:name:", v20, v22);

  v24 = -[CRKASMConcreteRoster initWithOrganization:user:courses:certificateVendor:]([CRKASMConcreteRoster alloc], "initWithOrganization:user:courses:certificateVendor:", v23, v16, v11, v30);
  -[CRKASMWorldBuildOperation manageableLocationIDs](self, "manageableLocationIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __42__CRKASMWorldBuildOperation_compileResult__block_invoke_21;
  v32[3] = &unk_24D9C8D18;
  v32[4] = self;
  objc_msgSend(v26, "crk_mapUsingBlock:", v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMWorldBuildOperation housekeepKeychainWithRoster:](self, "housekeepKeychainWithRoster:", v24);
  v28 = -[CRKASMWorldBuildResultObject initWithRoster:manageableLocations:]([CRKASMWorldBuildResultObject alloc], "initWithRoster:manageableLocations:", v24, v27);

  return v28;
}

CRKASMConcreteCourse *__42__CRKASMWorldBuildOperation_compileResult__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CRKASMConcreteCourse *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CRKASMConcreteCourse *v17;
  NSObject *v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "classKitLocationsByLocationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "classKitPersonsByClassID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "trustedClassKitPersonsByClassID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = [CRKASMConcreteCourse alloc];
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "manageableLocationIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CRKASMConcreteCourse initWithBackingClass:location:persons:trustedPersons:identityVendor:manageableLocationIDs:environment:](v13, "initWithBackingClass:location:persons:trustedPersons:identityVendor:manageableLocationIDs:environment:", v3, v6, v9, v12, v14, v15, v16);

  }
  else
  {
    _CRKLogASM_12();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __42__CRKASMWorldBuildOperation_compileResult__block_invoke_cold_1(v3);

    v17 = 0;
  }

  return v17;
}

CRKASMConcreteLocation *__42__CRKASMWorldBuildOperation_compileResult__block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  CRKASMConcreteLocation *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "classKitLocationsByLocationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[CRKASMConcreteLocation initWithBackingLocation:]([CRKASMConcreteLocation alloc], "initWithBackingLocation:", v5);
  else
    v6 = 0;

  return v6;
}

+ (id)makeErrorWithErrorsByObjectID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "allValues");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("CRKPartialErrorsByItemIdentifier");
      v9[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(29, v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)rosterRequirements
{
  void *v2;
  void *v3;
  void *v4;

  -[CRKASMWorldBuildOperation environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rosterRequirements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CRKASMRosterProviderEnvironment)environment
{
  return self->_environment;
}

- (CRKClassKitCurrentUser)classKitCurrentUser
{
  return self->_classKitCurrentUser;
}

- (void)setClassKitCurrentUser:(id)a3
{
  objc_storeStrong((id *)&self->_classKitCurrentUser, a3);
}

- (NSArray)classKitClasses
{
  return self->_classKitClasses;
}

- (void)setClassKitClasses:(id)a3
{
  objc_storeStrong((id *)&self->_classKitClasses, a3);
}

- (NSDictionary)classKitLocationsByLocationID
{
  return self->_classKitLocationsByLocationID;
}

- (void)setClassKitLocationsByLocationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSSet)manageableLocationIDs
{
  return self->_manageableLocationIDs;
}

- (void)setManageableLocationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSDictionary)classKitPersonsByClassID
{
  return self->_classKitPersonsByClassID;
}

- (void)setClassKitPersonsByClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSDictionary)trustedClassKitPersonsByClassID
{
  return self->_trustedClassKitPersonsByClassID;
}

- (void)setTrustedClassKitPersonsByClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedClassKitPersonsByClassID, 0);
  objc_storeStrong((id *)&self->_classKitPersonsByClassID, 0);
  objc_storeStrong((id *)&self->_manageableLocationIDs, 0);
  objc_storeStrong((id *)&self->_classKitLocationsByLocationID, 0);
  objc_storeStrong((id *)&self->_classKitClasses, 0);
  objc_storeStrong((id *)&self->_classKitCurrentUser, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

void __49__CRKASMWorldBuildOperation_buildClassKitClasses__block_invoke_3_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "className");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Not vending class with name %@ because it has a nil object ID", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

void __42__CRKASMWorldBuildOperation_compileResult__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "className");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Not vending class with name %@ because it is missing a location", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
