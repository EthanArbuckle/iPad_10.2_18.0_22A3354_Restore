@implementation ATXAppLaunchSequenceManager

void __46___ATXAppLaunchSequenceManager_sharedInstance__block_invoke()
{
  void *v0;
  _ATXAppLaunchSequenceManager *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_alloc_init(_ATXAppLaunchSequenceManager);
  v2 = (void *)sharedInstance__pasExprOnceResult_28;
  sharedInstance__pasExprOnceResult_28 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __50___ATXAppLaunchSequenceManager_initWithDataStore___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "deleteAllLaunchesForBundles:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "deleteAllLaunchesForAppActions:", v3);

}

void __56___ATXAppLaunchSequenceManager_launchSequenceForBundle___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _ATXAppLaunchSequence *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = -[_ATXAppLaunchSequence initWithPreviousLaunch:dataStore:]([_ATXAppLaunchSequence alloc], "initWithPreviousLaunch:dataStore:", a1[5], *(_QWORD *)(a1[4] + 8));
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  }
}

void __59___ATXAppLaunchSequenceManager_launchSequenceForAppAction___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _ATXAppLaunchSequence *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = -[_ATXAppLaunchSequence initWithPreviousAppActionLaunch:dataStore:]([_ATXAppLaunchSequence alloc], "initWithPreviousAppActionLaunch:dataStore:", a1[5], *(_QWORD *)(a1[4] + 8));
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  }
}

void __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _ATXAppLaunchSequence *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke_2;
  v17[3] = &unk_1E82E3180;
  v5 = v3;
  v18 = v5;
  objc_msgSend(v4, "enumerateAppInfoBundlesExecutingBlock:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v11, (_QWORD)v13);
        v12 = (_ATXAppLaunchSequence *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          v12 = -[_ATXAppLaunchSequence initWithPreviousLaunch:dataStore:]([_ATXAppLaunchSequence alloc], "initWithPreviousLaunch:dataStore:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        -[_ATXAppLaunchSequence decayWithHalfLifeInDays:](v12, "decayWithHalfLifeInDays:", *(double *)(a1 + 40));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _ATXAppLaunchSequence *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke_2;
  v17[3] = &unk_1E82E3180;
  v5 = v3;
  v18 = v5;
  objc_msgSend(v4, "enumerateAppInfoAppActionsExecutingBlock:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v11, (_QWORD)v13);
        v12 = (_ATXAppLaunchSequence *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          v12 = -[_ATXAppLaunchSequence initWithPreviousAppActionLaunch:dataStore:]([_ATXAppLaunchSequence alloc], "initWithPreviousAppActionLaunch:dataStore:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        -[_ATXAppLaunchSequence decayWithHalfLifeInDays:](v12, "decayWithHalfLifeInDays:", *(double *)(a1 + 40));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _ATXAppLaunchSequence *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke_2;
  v30[3] = &unk_1E82E4F20;
  v31 = v4;
  v6 = v3;
  v32 = v6;
  objc_msgSend(v5, "enumerateAppInfoBundlesExecutingBlock:", v30);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v12);
        v13 = (_ATXAppLaunchSequence *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          v13 = -[_ATXAppLaunchSequence initWithPreviousLaunch:dataStore:]([_ATXAppLaunchSequence alloc], "initWithPreviousLaunch:dataStore:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        -[_ATXAppLaunchSequence deleteDataForLaunches:](v13, "deleteDataForLaunches:", *(_QWORD *)(a1 + 40));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = *(id *)(a1 + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v19, (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "deleteAllInformation");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v19);
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteLaunchesFollowingBundle:", v19);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(v2);
}

void __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _ATXAppLaunchSequence *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke_2;
  v30[3] = &unk_1E82E4F20;
  v31 = v4;
  v6 = v3;
  v32 = v6;
  objc_msgSend(v5, "enumerateAppInfoAppActionsExecutingBlock:", v30);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v12);
        v13 = (_ATXAppLaunchSequence *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          v13 = -[_ATXAppLaunchSequence initWithPreviousAppActionLaunch:dataStore:]([_ATXAppLaunchSequence alloc], "initWithPreviousAppActionLaunch:dataStore:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        -[_ATXAppLaunchSequence deleteDataForLaunches:](v13, "deleteDataForLaunches:", *(_QWORD *)(a1 + 40));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = *(id *)(a1 + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v19, (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "deleteAllInformation");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v19);
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteLaunchesFollowingAppAction:", v19);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(v2);
}

void __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __46___ATXAppLaunchSequenceManager_launchSequence__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appLaunchSequence");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __65___ATXAppLaunchSequenceManager_addBundleIdToLaunchSequence_date___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "addAppLaunchForAppLaunchSequence:date:", a1[5], a1[6]);
}

@end
