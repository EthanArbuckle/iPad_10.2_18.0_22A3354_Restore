@implementation ACHAchievementProgressEngine

void __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "processAchievementProgressUpdates:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    ACHLogProgress();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke_cold_1(v3);

  }
}

void __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[6];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "providers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v38;
    v5 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v4 = 138412546;
    v26 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v3);
        v30 = v6;
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x24BDBCEF0];
        v36[0] = v5;
        v36[1] = 3221225472;
        v36[2] = __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_2;
        v36[3] = &unk_24D13C998;
        v10 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(a1 + 40);
        v29 = v7;
        v36[4] = v7;
        v36[5] = v10;
        objc_msgSend(v9, "hk_filter:", v36, v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              v20 = *(void **)(a1 + 40);
              v31[0] = v5;
              v31[1] = 3221225472;
              v31[2] = __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_3;
              v31[3] = &unk_24D13BAB8;
              v31[4] = v19;
              objc_msgSend(v20, "hk_firstObjectPassingTest:", v31);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v13, "addObject:", v21);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
          }
          while (v16);
        }

        objc_msgSend(v14, "unionSet:", v13);
        objc_msgSend(v14, "hk_map:", &__block_literal_global_23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
        {
          ACHLogProgress();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(v22, "count");
            *(_DWORD *)buf = v26;
            v42 = v29;
            v43 = 2048;
            v44 = v24;
            _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "Request Progress, provider to %@ for %lu templates", buf, 0x16u);
          }

          objc_msgSend(v22, "allObjects");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "requestAchievementProgressUpdatesForTemplates:", v25);

        }
        v6 = v30 + 1;
      }
      while (v30 + 1 != v28);
      v28 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v28);
  }

}

- (void)populateProgressAndGoalForAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ACHLogProgress();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "populateProgressAndGoalForAchievements: %lu", buf, 0xCu);
  }

  -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke;
  v8[3] = &unk_24D13A360;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)processAchievementProgressUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSHashTable)providers
{
  NSObject *v3;

  -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_providers;
}

- (OS_dispatch_queue)providerQueue
{
  return self->_providerQueue;
}

uint64_t __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "providesProgressForTemplate:", v5))
    v6 = objc_msgSend(*(id *)(a1 + 40), "shouldPopulateProgressForAchievement:", v3);
  else
    v6 = 0;

  return v6;
}

- (BOOL)shouldPopulateProgressForAchievement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unsigned int v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  char v32;
  int v33;
  _BOOL4 v35;
  void *v36;

  v3 = a3;
  objc_msgSend(v3, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "template");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "graceProgressExpression");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;

LABEL_4:
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length") == 0;

    goto LABEL_5;
  }
  objc_msgSend(v3, "template");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "progressExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_4;
  v13 = 1;
LABEL_5:
  objc_msgSend(v3, "template");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "earnLimit"))
  {
    objc_msgSend(v3, "template");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "earnLimit");
    v17 = objc_msgSend(v3, "earnedInstanceCount") >= (unint64_t)v16;

  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v4, "visibilityStart");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18
    && (v19 = (void *)v18,
        objc_msgSend(v4, "visibilityEnd"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibilityStart");
    v36 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateFromComponents:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "visibilityEnd");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateFromComponents:", v25);
    v35 = v17;
    v26 = v13;
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "hk_startOfDateByAddingDays:toDate:", 1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v24, v28);
    v30 = objc_msgSend(v29, "containsDate:", v22);

    v6 = v36;
    v13 = v26;
    v17 = v35;

    v31 = v30 ^ 1;
  }
  else
  {
    v31 = 0;
  }
  v32 = 0;
  if (v6)
    v33 = v13;
  else
    v33 = 1;
  if (((v33 | v17) & 1) == 0 && (v31 & 1) == 0)
    v32 = objc_msgSend(v3, "prerequisiteMet");

  return v32;
}

uint64_t __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prerequisiteTemplateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

uint64_t __71__ACHAchievementProgressEngine_populateProgressAndGoalForAchievements___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "template");
}

- (ACHAchievementProgressEngine)init
{
  ACHAchievementProgressEngine *v2;
  uint64_t v3;
  NSHashTable *providers;
  uint64_t v5;
  OS_dispatch_queue *providerQueue;
  uint64_t v7;
  NSMapTable *providerDelayedOperations;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ACHAchievementProgressEngine;
  v2 = -[ACHAchievementProgressEngine init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    providers = v2->_providers;
    v2->_providers = (NSHashTable *)v3;

    HKCreateSerialDispatchQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    providerQueue = v2->_providerQueue;
    v2->_providerQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    providerDelayedOperations = v2->_providerDelayedOperations;
    v2->_providerDelayedOperations = (NSMapTable *)v7;

  }
  return v2;
}

- (void)registerProgressProvider:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  ACHAchievementProgressEngine *v15;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254D67550))
  {
    -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke;
    v13[3] = &unk_24D13A360;
    v14 = v4;
    v15 = self;
    dispatch_sync(v5, v13);

  }
  else
  {
    ACHLogProgress();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHAchievementProgressEngine registerProgressProvider:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
}

void __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ACHLogProgress();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Progress Engine added provider %@.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "providers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "overrideDelay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "overrideDelay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

  }
  else
  {
    v8 = 60.0;
  }

  v9 = objc_alloc(MEMORY[0x24BDD41D0]);
  objc_msgSend(*(id *)(a1 + 40), "providerQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke_234;
  v12[3] = &unk_24D13C948;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, (id *)buf);
  v11 = (void *)objc_msgSend(v9, "initWithMode:queue:delay:block:", 0, v10, v12, v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __57__ACHAchievementProgressEngine_registerProgressProvider___block_invoke_234(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ACHLogProgress();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 138412290;
    v8 = WeakRetained;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Execute delayed task for provider: %@.", (uint8_t *)&v7, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "achievementStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "requestUpdateProgressValuesForProgressProvider:", v6);

}

- (void)deregisterProgressProvider:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254D67550))
  {
    -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke;
    v13[3] = &unk_24D13A360;
    v13[4] = self;
    v14 = v4;
    dispatch_sync(v5, v13);

  }
  else
  {
    ACHLogProgress();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHAchievementProgressEngine deregisterProgressProvider:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
}

void __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "providers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  ACHLogProgress();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Progress Engine removed provider %@.", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "providers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidate](v5, "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke_cold_1(a1 + 40, v5, v8, v9, v10, v11, v12, v13);
  }

}

- (void)requestProgressUpdateForProgressProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__ACHAchievementProgressEngine_requestProgressUpdateForProgressProvider___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __73__ACHAchievementProgressEngine_requestProgressUpdateForProgressProvider___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "execute");

}

- (id)_queue_providerForTemplate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ACHAchievementProgressEngine providers](self, "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__ACHAchievementProgressEngine__queue_providerForTemplate___block_invoke;
  v11[3] = &unk_24D13C970;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "hk_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __59__ACHAchievementProgressEngine__queue_providerForTemplate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "providesProgressForTemplate:", *(_QWORD *)(a1 + 32));
}

- (id)providerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSHashTable allObjects](self->_providers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__ACHAchievementProgressEngine_providerWithIdentifier___block_invoke;
  v9[3] = &unk_24D13C970;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__ACHAchievementProgressEngine_providerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "providerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (unint64_t)providerCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ACHAchievementProgressEngine providerQueue](self, "providerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__ACHAchievementProgressEngine_providerCount__block_invoke;
  v6[3] = &unk_24D13AC40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__ACHAchievementProgressEngine_providerCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "providers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (ACHAchievementStoring)achievementStore
{
  return (ACHAchievementStoring *)objc_loadWeakRetained((id *)&self->_achievementStore);
}

- (void)setAchievementStore:(id)a3
{
  objc_storeWeak((id *)&self->_achievementStore, a3);
}

- (NSMapTable)providerDelayedOperations
{
  return self->_providerDelayedOperations;
}

- (void)setProviderDelayedOperations:(id)a3
{
  objc_storeStrong((id *)&self->_providerDelayedOperations, a3);
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (void)setProviderQueue:(id)a3
{
  objc_storeStrong((id *)&self->_providerQueue, a3);
}

- (NSNumber)overrideDelay
{
  return self->_overrideDelay;
}

- (void)setOverrideDelay:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDelay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDelay, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_providerDelayedOperations, 0);
  objc_destroyWeak((id *)&self->_achievementStore);
}

- (void)registerProgressProvider:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Progress Engine did not add provider %@ since it doesn't conform to the provider protocol.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deregisterProgressProvider:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Progress Engine did not remove provider %@ since it doesn't conform to the provider protocol.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__ACHAchievementProgressEngine_deregisterProgressProvider___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Progress Engine did not remove provider %@ since it was not previously registered.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __66__ACHAchievementProgressEngine_processAchievementProgressUpdates___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "processAchievementProgressUpdates called but achievementStore is not set!!", v1, 2u);
}

@end
