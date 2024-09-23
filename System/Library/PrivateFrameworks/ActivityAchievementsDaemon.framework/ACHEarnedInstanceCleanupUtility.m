@implementation ACHEarnedInstanceCleanupUtility

- (ACHEarnedInstanceCleanupUtility)initWithHealthStore:(id)a3 keyValueClient:(id)a4 earnedInstanceStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACHEarnedInstanceCleanupUtility *v12;
  ACHEarnedInstanceCleanupUtility *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACHEarnedInstanceCleanupUtility;
  v12 = -[ACHEarnedInstanceCleanupUtility init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_keyValueClient, a4);
    objc_storeStrong((id *)&v13->_earnedInstanceStore, a5);
  }

  return v13;
}

- (ACHEarnedInstanceCleanupUtility)initWithEarnedInstanceStore:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  ACHEarnedInstanceCleanupUtility *v9;
  ACHEarnedInstanceCleanupUtility *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHEarnedInstanceCleanupUtility;
  v9 = -[ACHEarnedInstanceCleanupUtility init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_earnedInstanceStore, a3);
    objc_storeStrong((id *)&v10->_profile, a4);
  }

  return v10;
}

- (void)performCleanup
{
  OUTLINED_FUNCTION_4(&dword_21407B000, a1, a3, "Performing earned instances cleanup phase.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (id)_firstWorkoutAchievementsToRemoveFromEarnedInstances:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_191_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "templateUniqueName", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "addObject:", v14);
        }
        else
        {
          objc_msgSend(v14, "templateUniqueName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

uint64_t __88__ACHEarnedInstanceCleanupUtility__firstWorkoutAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "templateUniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("FirstWorkout"));

  return v3;
}

uint64_t __88__ACHEarnedInstanceCleanupUtility__firstWorkoutAchievementsToRemoveFromEarnedInstances___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "earnedDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earnedDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = ACHCompareYearMonthDayDateComponents();
  return v7;
}

- (id)_largestValueActivityAndWorkoutAchievementsToRemoveFromEarnedInstances:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24D15B900);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v10, "templateUniqueName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "containsObject:", v11) & 1) != 0
          || objc_msgSend(v11, "containsString:", CFSTR("BestWorkout")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
          }
          objc_msgSend(v12, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v7);
  }
  v29 = v4;

  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = v5;
  objc_msgSend(v5, "allValues");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v40;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(v30);
        v34 = v14;
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
        objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_208_0);
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v17)
        {
          v18 = v17;
          v19 = 0;
          v20 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v36 != v20)
                objc_enumerationMutation(v16);
              v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
              if (!v19
                || (objc_msgSend(v19, "value"),
                    v23 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v22, "value"),
                    v24 = (void *)objc_claimAutoreleasedReturnValue(),
                    v25 = objc_msgSend(v23, "compare:", v24),
                    v24,
                    v23,
                    v25 == -1))
              {
                v26 = v22;

                v19 = v26;
              }
              else
              {
                objc_msgSend(v13, "addObject:", v22);
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          }
          while (v18);
        }
        else
        {
          v19 = 0;
        }

        v14 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v33);
  }

  return v13;
}

uint64_t __106__ACHEarnedInstanceCleanupUtility__largestValueActivityAndWorkoutAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "earnedDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ACHCompareYearMonthDayDateComponents();

  if (!v8)
  {
    objc_msgSend(v4, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

- (id)_fastestRunAchievementsToRemoveFromEarnedInstances:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24D15B918);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v11, "templateUniqueName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v12))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);
          }
          objc_msgSend(v13, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v8);
  }
  v31 = v4;
  v29 = v6;

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v30 = v5;
  objc_msgSend(v5, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v41;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(obj);
        v35 = v15;
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v15);
        objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_227);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v18)
        {
          v19 = v18;
          v20 = 0;
          v21 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v37 != v21)
                objc_enumerationMutation(v17);
              v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              if (v20
                && (objc_msgSend(v20, "value"),
                    v24 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v23, "value"),
                    v25 = (void *)objc_claimAutoreleasedReturnValue(),
                    v26 = objc_msgSend(v24, "compare:", v25),
                    v25,
                    v24,
                    v26 != 1))
              {
                objc_msgSend(v14, "addObject:", v23);
              }
              else
              {
                v27 = v23;

                v20 = v27;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v19);
        }
        else
        {
          v20 = 0;
        }

        v15 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v34);
  }

  return v14;
}

uint64_t __86__ACHEarnedInstanceCleanupUtility__fastestRunAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "earnedDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ACHCompareYearMonthDayDateComponents();

  if (!v8)
  {
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

- (id)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id obj;
  NSObject *v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t v66[4];
  uint64_t v67;
  uint8_t v68[128];
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  int64_t v72;
  __int16 v73;
  int64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_228);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_231_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstanceCleanupUtility profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ACHEarnedInstanceCleanupUtility profile](self, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0;
      v10 = (id *)&v65;
      +[ACHDataStoreSyncEntity dataStoreValueForKey:domain:profile:error:](ACHDataStoreSyncEntity, "dataStoreValueForKey:domain:profile:error:", CFSTR("totalMoveGoalsMade"), CFSTR("ActivityAwardingSource"), v9, &v65);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ACHEarnedInstanceCleanupUtility keyValueClient](self, "keyValueClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0;
      v10 = (id *)&v64;
      objc_msgSend(v9, "valueForKey:domain:error:", CFSTR("totalMoveGoalsMade"), CFSTR("ActivityAwardingSource"), &v64);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v11;
    v14 = *v10;

    if (v13)
    {
      if (!v14)
      {
        v28 = objc_msgSend(v13, "unsignedIntegerValue");
        v29 = -[ACHEarnedInstanceCleanupUtility _historicalEvaluationAdjustment](self, "_historicalEvaluationAdjustment");
        v59 = v29 + v28;
        ACHLogCleanup();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          v70 = v28;
          v71 = 2048;
          v72 = v29;
          v73 = 2048;
          v74 = v29 + v28;
          _os_log_debug_impl(&dword_21407B000, v30, OS_LOG_TYPE_DEBUG, "Total move goals completed so far: %ld, adjustment: %ld, adjustedTotal, %ld", buf, 0x20u);
        }

        v58 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        obj = v7;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        if (v32)
        {
          v33 = v32;
          v52 = 0;
          v53 = v13;
          v54 = v7;
          v55 = v6;
          v34 = 0;
          v35 = *(_QWORD *)v61;
          v56 = v4;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              v37 = v34;
              if (*(_QWORD *)v61 != v35)
                objc_enumerationMutation(obj);
              v38 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              objc_msgSend(v38, "templateUniqueName", v52, v53, v54, v55, v56);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MoveGoals"), &stru_24D13EA68);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "integerValue");

              ACHLogCleanup();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v38, "templateUniqueName");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v41);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v70 = (uint64_t)v46;
                v71 = 2112;
                v72 = (int64_t)v47;
                _os_log_debug_impl(&dword_21407B000, v42, OS_LOG_TYPE_DEBUG, "%@ count: %@", buf, 0x16u);

              }
              if (v41 > v59)
              {
                ACHLogCleanup();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v38, "templateUniqueName");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v41);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v70 = (uint64_t)v48;
                  v71 = 2112;
                  v72 = (int64_t)v49;
                  _os_log_debug_impl(&dword_21407B000, v43, OS_LOG_TYPE_DEBUG, "Found a candidate! %@ count: %@", buf, 0x16u);

                }
                -[NSObject addObject:](v58, "addObject:", v38);
              }
              objc_msgSend(v38, "earnedDateComponents");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "dateFromComponents:", v44);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37 && objc_msgSend(v34, "compare:", v37) == -1)
              {
                ACHLogCleanup();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                  -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:].cold.3(v66, v38, &v67, v45);

                -[NSObject addObject:](v58, "addObject:", v38);
              }

            }
            v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          }
          while (v33);

          v6 = v55;
          v4 = v56;
          v13 = v53;
          v7 = v54;
          v14 = v52;
        }

        ACHLogCleanup();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:].cold.2(v58, v50);

        -[NSObject allObjects](v58, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      }
      ACHLogCleanup();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:].cold.4((uint64_t)v14, v58, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      ACHLogCleanup();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:].cold.1(v58, v21, v22, v23, v24, v25, v26, v27);
    }
    v12 = (void *)MEMORY[0x24BDBD1A8];
LABEL_37:

    goto LABEL_38;
  }
  v12 = (void *)MEMORY[0x24BDBD1A8];
LABEL_38:

  return v12;
}

uint64_t __92__ACHEarnedInstanceCleanupUtility__lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "templateUniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("MoveGoals"));

  return v3;
}

uint64_t __92__ACHEarnedInstanceCleanupUtility__lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "templateUniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MoveGoals"), &stru_24D13EA68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "templateUniqueName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MoveGoals"), &stru_24D13EA68);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v7 >= v10)
    v11 = 0;
  else
    v11 = -1;
  if (v7 > v10)
    return 1;
  else
    return v11;
}

- (int64_t)_historicalEvaluationAdjustment
{
  void *v3;

  -[ACHEarnedInstanceCleanupUtility healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[ACHEarnedInstanceCleanupUtility _client_historicalEvaluationAdjustment](self, "_client_historicalEvaluationAdjustment");
  else
    return -[ACHEarnedInstanceCleanupUtility _daemon_historicalEvaluationAdjustment](self, "_daemon_historicalEvaluationAdjustment");
}

- (int64_t)_client_historicalEvaluationAdjustment
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  intptr_t v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  void (**v14)(_QWORD, _QWORD);
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5;
  v35 = __Block_byref_object_dispose__5;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  dispatch_group_enter(v3);
  v4 = objc_alloc(MEMORY[0x24BE01820]);
  v5 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke;
  v21[3] = &unk_24D13B468;
  v23 = &v31;
  v6 = v3;
  v22 = v6;
  v24 = &v25;
  v7 = (void *)objc_msgSend(v4, "initWithUpdateHandler:", v21);
  -[ACHEarnedInstanceCleanupUtility healthStore](self, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeQuery:", v7);

  v9 = dispatch_time(0, 10000000000);
  v10 = dispatch_group_wait(v6, v9);
  -[ACHEarnedInstanceCleanupUtility healthStore](self, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopQuery:", v7);

  if (v10)
  {
    ACHLogCleanup();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceCleanupUtility _client_historicalEvaluationAdjustment].cold.1(v12);

    v13 = 2;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke_243;
    v16[3] = &unk_24D13B490;
    v16[4] = &v17;
    v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199C9184](v16);
    v14[2](v14, v32[5]);
    v14[2](v14, v26[5]);
    v13 = v18[3];

    _Block_object_dispose(&v17, 8);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v13;
}

void __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (v12 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    ACHLogAwardEngine();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Received today summary in cleanup utility", buf, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  if (v13 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    ACHLogAwardEngine();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21407B000, v16, OS_LOG_TYPE_DEFAULT, "Received yesterday summary in cleanup utility", v17, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke_243(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v12 = v3;
    v4 = objc_msgSend(v3, "activityMoveMode");
    if (v4 == 2)
    {
      objc_msgSend(v12, "appleMoveTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appleMoveTimeGoal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "compare:", v10);

      v3 = v12;
      if (v11 == -1)
        goto LABEL_9;
    }
    else
    {
      v5 = v4 == 1;
      v3 = v12;
      if (!v5)
        goto LABEL_9;
      objc_msgSend(v12, "activeEnergyBurned");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeEnergyBurnedGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "compare:", v7);

      v3 = v12;
      if (v8 == -1)
        goto LABEL_9;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
LABEL_9:

}

- (int64_t)_daemon_historicalEvaluationAdjustment
{
  void *v3;
  int v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  -[HDProfile currentActivitySummaryHelper](self->_profile, "currentActivitySummaryHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLoadedActivitySummaries");

  if (!v4)
    return 2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__ACHEarnedInstanceCleanupUtility__daemon_historicalEvaluationAdjustment__block_invoke;
  v12[3] = &unk_24D13B490;
  v12[4] = &v13;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199C9184](v12);
  -[HDProfile currentActivitySummaryHelper](self->_profile, "currentActivitySummaryHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yesterdayActivitySummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v5)[2](v5, v7);
  -[HDProfile currentActivitySummaryHelper](self->_profile, "currentActivitySummaryHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "todayActivitySummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v5)[2](v5, v9);
  v10 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __73__ACHEarnedInstanceCleanupUtility__daemon_historicalEvaluationAdjustment__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v12 = v3;
    v4 = objc_msgSend(v3, "activityMoveMode");
    if (v4 == 2)
    {
      objc_msgSend(v12, "appleMoveTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appleMoveTimeGoal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "compare:", v10);

      v3 = v12;
      if (v11 == -1)
        goto LABEL_9;
    }
    else
    {
      v5 = v4 == 1;
      v3 = v12;
      if (!v5)
        goto LABEL_9;
      objc_msgSend(v12, "activeEnergyBurned");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeEnergyBurnedGoal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "compare:", v7);

      v3 = v12;
      if (v8 == -1)
        goto LABEL_9;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
LABEL_9:

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (ACHAwardsKeyValueClient)keyValueClient
{
  return self->_keyValueClient;
}

- (void)setKeyValueClient:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueClient, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceStore, a3);
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_keyValueClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21407B000, a1, a3, "Unable to obtain the total move goals completed so far. Reason: the value retrieved is nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21407B000, a2, OS_LOG_TYPE_DEBUG, "Move goals earned instances to be removed: %@", (uint8_t *)&v4, 0xCu);

}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(_QWORD *)a3 .cold.3(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "templateUniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_21407B000, a4, OS_LOG_TYPE_DEBUG, "Found a candidate out of date!: %@", a1, 0xCu);

}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Unable to obtain the total move goals completed so far. Reason: %@", a5, a6, a7, a8, 2u);
}

- (void)_client_historicalEvaluationAdjustment
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for group to complete fetching activity summaries", v1, 2u);
  OUTLINED_FUNCTION_5();
}

@end
