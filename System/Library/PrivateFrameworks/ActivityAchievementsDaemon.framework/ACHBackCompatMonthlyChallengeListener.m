@implementation ACHBackCompatMonthlyChallengeListener

- (ACHBackCompatMonthlyChallengeListener)initWithProfile:(id)a3 templateStore:(id)a4
{
  id v6;
  id v7;
  ACHBackCompatMonthlyChallengeListener *v8;
  ACHBackCompatMonthlyChallengeListener *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHBackCompatMonthlyChallengeListener;
  v8 = -[ACHBackCompatMonthlyChallengeListener init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeWeak((id *)&v9->_templateStore, v7);
    objc_msgSend(v6, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerForDaemonReady:", v9);

  }
  return v9;
}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__protectedNanoUserDefaultsDidSyncWithNotification_, *MEMORY[0x24BE408F0], 0);

  -[ACHBackCompatMonthlyChallengeListener profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ACHBackCompatMonthlyChallengeListener_daemonReady___block_invoke;
  v7[3] = &unk_24D13A338;
  v7[4] = self;
  objc_msgSend(v6, "performWhenDataProtectedByFirstUnlockIsAvailable:", v7);

}

void __53__ACHBackCompatMonthlyChallengeListener_daemonReady___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  ACHLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Trying to read dynamic definitions because data protected by first unlock is now available.", buf, 2u);
  }

  v3 = objc_msgSend(*(id *)(a1 + 32), "_readAndSaveBackCompatDefinitions");
  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Dynamic definitions saved, not observing protected data.", v8, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Dynamic definitions read failed, observing protected data changes.", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "profile");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject database](v4, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addProtectedDataObserver:", *(_QWORD *)(a1 + 32));

  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD block[5];
  uint8_t buf[16];

  if (a4)
  {
    ACHLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Protected data available and dynamic definitions never read, trying to read and save.", buf, 2u);
    }

    v6 = -[ACHBackCompatMonthlyChallengeListener _readAndSaveBackCompatDefinitions](self, "_readAndSaveBackCompatDefinitions");
    ACHLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic definitions saved, removing protected data observation.", buf, 2u);
      }

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__ACHBackCompatMonthlyChallengeListener_database_protectedDataDidBecomeAvailable___block_invoke;
      block[3] = &unk_24D13A338;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic definitions read failed, will try again on next protected data availability.", buf, 2u);
      }

    }
  }
}

void __82__ACHBackCompatMonthlyChallengeListener_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeProtectedDataObserver:", *(_QWORD *)(a1 + 32));

}

- (void)_protectedNanoUserDefaultsDidSyncWithNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE408E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "hk_firstObjectPassingTest:", &__block_literal_global_10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      ACHLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic definitions synced, creating and writing templates.", v8, 2u);
      }

      -[ACHBackCompatMonthlyChallengeListener _readAndSaveBackCompatDefinitions](self, "_readAndSaveBackCompatDefinitions");
    }

  }
}

uint64_t __91__ACHBackCompatMonthlyChallengeListener__protectedNanoUserDefaultsDidSyncWithNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("HKAchievementType"));
}

- (BOOL)_readAndSaveBackCompatDefinitions
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  char v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD);
  void *v35;
  void (**v36)(_QWORD, _QWORD);
  NSObject *v37;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _BYTE *v47;
  _QWORD v48[5];
  id v49;
  uint8_t v50[4];
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE40AD0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = (void *)objc_msgSend(v3, "initWithCategory:domainName:profile:", 105, CFSTR("DynamicAchievements"), WeakRetained);

  v49 = 0;
  objc_msgSend(v5, "allValuesWithError:", &v49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v49;
  -[ACHBackCompatMonthlyChallengeListener injectedKeyValuePairs](self, "injectedKeyValuePairs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (!v9)
  {
    -[ACHBackCompatMonthlyChallengeListener injectedKeyValuePairs](self, "injectedKeyValuePairs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
      v12 = (id)objc_msgSend(v6, "hk_dictionaryByAddingEntriesFromDictionary:", v10);
    else
      v6 = (void *)objc_msgSend(v10, "copy");

  }
  if (!v7)
  {
    -[ACHBackCompatMonthlyChallengeListener _definitionsFromKeyValuePairs:](self, "_definitionsFromKeyValuePairs:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    ACHLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[NSObject count](v13, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Read %lu back-compat dynamic definitions from the key-value store: %@", buf, 0x16u);
    }

    -[NSObject hk_map:](v13, "hk_map:", &__block_literal_global_196);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v40, "count"))
    {
      -[ACHBackCompatMonthlyChallengeListener readTemplatesBlock](self, "readTemplatesBlock");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        -[ACHBackCompatMonthlyChallengeListener readTemplatesBlock](self, "readTemplatesBlock");
        v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v36[2](v36, MEMORY[0x24BDBD1A8]);

      }
      ACHLogDefault();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v37, OS_LOG_TYPE_DEFAULT, "No templates were created from back-compat dynamic definitions.", buf, 2u);
      }

      v7 = 0;
      goto LABEL_32;
    }
    ACHLogDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v40, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v40;
      _os_log_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEFAULT, "Created %lu templates from back-compat dynamic definitions: %@", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v53 = __Block_byref_object_copy__9;
    v54 = __Block_byref_object_dispose__9;
    v19 = MEMORY[0x24BDAC760];
    v55 = (id)MEMORY[0x24BDBD1A8];
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_197;
    v48[3] = &unk_24D13B920;
    v48[4] = buf;
    objc_msgSend(v40, "hk_map:", v48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ACHBackCompatMonthlyChallengeListener templateStore](self, "templateStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allTemplates");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v19;
    v44[1] = 3221225472;
    v44[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_2;
    v44[3] = &unk_24D13B970;
    v39 = v20;
    v45 = v39;
    v47 = buf;
    v24 = v21;
    v46 = v24;
    objc_msgSend(v23, "hk_map:", v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BDD1758];
    v42[0] = v19;
    v42[1] = 3221225472;
    v42[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_4;
    v42[3] = &unk_24D13AD08;
    v27 = v24;
    v43 = v27;
    objc_msgSend(v26, "predicateWithBlock:", v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "filteredArrayUsingPredicate:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "count")
      && (-[ACHBackCompatMonthlyChallengeListener templateStore](self, "templateStore"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v41 = 0,
          objc_msgSend(v30, "removeTemplates:error:", v25, &v41),
          v7 = v41,
          v30,
          v7))
    {
      ACHLogDefault();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v50 = 138412290;
        v51 = v7;
        _os_log_impl(&dword_21407B000, v31, OS_LOG_TYPE_DEFAULT, "Back compat monthly challenge listener failed to remove existing templates: %@", v50, 0xCu);
      }
      v32 = 0;
    }
    else
    {
      -[ACHBackCompatMonthlyChallengeListener readTemplatesBlock](self, "readTemplatesBlock");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[ACHBackCompatMonthlyChallengeListener readTemplatesBlock](self, "readTemplatesBlock");
        v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v34)[2](v34, v29);

      }
      if (!objc_msgSend(v29, "count"))
      {
        v7 = 0;
        v32 = 1;
LABEL_31:

        _Block_object_dispose(buf, 8);
        if ((v32 & 1) == 0)
        {
          v14 = 0;
          goto LABEL_34;
        }
LABEL_32:
        v14 = 1;
LABEL_34:

        goto LABEL_35;
      }
      -[ACHBackCompatMonthlyChallengeListener templateStore](self, "templateStore");
      v31 = objc_claimAutoreleasedReturnValue();
      -[NSObject addTemplates:](v31, "addTemplates:", v29);
      v7 = 0;
      v32 = 1;
    }

    goto LABEL_31;
  }
  ACHLogDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ACHBackCompatMonthlyChallengeListener _readAndSaveBackCompatDefinitions].cold.1((uint64_t)v7, v13);
  v14 = 0;
LABEL_35:

  return v14;
}

uint64_t __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "template");
}

id __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_197(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 3)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v3, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  if (ACHTemplateIsMonthlyChallenge())
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__9;
    v17 = __Block_byref_object_dispose__9;
    v18 = 0;
    v4 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_3;
    v9[3] = &unk_24D13B948;
    v10 = v3;
    v12 = &v13;
    v8 = *(_OWORD *)(a1 + 40);
    v5 = (id)v8;
    v11 = v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v6 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "uniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", v6);

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v10 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    else
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));

  }
}

uint64_t __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  return v2 ^ 1;
}

- (id)_definitionsFromKeyValuePairs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_filter:", &__block_literal_global_208_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__ACHBackCompatMonthlyChallengeListener__definitionsFromKeyValuePairs___block_invoke_2;
  v9[3] = &unk_24D13B9B8;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __71__ACHBackCompatMonthlyChallengeListener__definitionsFromKeyValuePairs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("HKAchievementType"));
}

id __71__ACHBackCompatMonthlyChallengeListener__definitionsFromKeyValuePairs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE017C8], "definitionFromData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHTemplateStore)templateStore
{
  return (ACHTemplateStore *)objc_loadWeakRetained((id *)&self->_templateStore);
}

- (void)setTemplateStore:(id)a3
{
  objc_storeWeak((id *)&self->_templateStore, a3);
}

- (id)readTemplatesBlock
{
  return self->_readTemplatesBlock;
}

- (void)setReadTemplatesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)injectedKeyValuePairs
{
  return self->_injectedKeyValuePairs;
}

- (void)setInjectedKeyValuePairs:(id)a3
{
  objc_storeStrong((id *)&self->_injectedKeyValuePairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedKeyValuePairs, 0);
  objc_storeStrong(&self->_readTemplatesBlock, 0);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_readAndSaveBackCompatDefinitions
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21407B000, a2, OS_LOG_TYPE_ERROR, "Failed to read legacy dynamic definitions from key value domain with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
