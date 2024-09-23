@implementation MNLPRRuleHelper

- (id)workQueue
{
  return (id)geo_get_global_queue();
}

- (void)prefetchRulesForWaypoints:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke;
  v7[3] = &unk_1E61D7428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updatedVehicleStateWithHandler:", v7);

}

void __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(a2, "licensePlate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke_2;
    v8[3] = &unk_1E61D1D10;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v7;
    dispatch_async(v5, v8);

  }
}

void __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke_2(uint64_t a1)
{
  id v2;

  _regionsFromLatLngs(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_findResourceNamesForRegions:forceUpdate:asyncCompletion:", v2, 0, 0);

}

- (void)fetchRulesForWaypoints:(id)a3 forceUpdateManifest:(BOOL)a4 forceUpdateRules:(BOOL)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  BOOL v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  MNLPRRuleHelper *v26;
  id v27;

  v12 = a6;
  v13 = a7;
  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke;
    v24[3] = &unk_1E61D7478;
    v25 = v12;
    v26 = self;
    v27 = v13;
    v15 = a3;
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E0E364](v24);
    _regionsFromLatLngs(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      -[MNLPRRuleHelper workQueue](self, "workQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_3;
      block[3] = &unk_1E61D74F0;
      v22 = a4;
      v21 = v16;
      block[4] = self;
      v20 = v17;
      v23 = a5;
      dispatch_async(v18, block);

    }
    else
    {
      v16[2](v16, 0, 0);
    }

  }
}

void __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *global_queue;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  global_queue = v7;
  if (!v7)
    global_queue = geo_get_global_queue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_2;
  v12[3] = &unk_1E61D7450;
  v13 = v5;
  v14 = v6;
  v9 = (void *)a1[6];
  v15 = a1[5];
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(global_queue, v12);
  if (!v7)

}

uint64_t __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  BOOL v2;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v2 = *(_QWORD *)(a1 + 40) == 0;
  else
    v2 = 0;
  if (v2)
    return objc_msgSend(*(id *)(a1 + 48), "_loadRules:asyncCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  char v9;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_4;
    v6[3] = &unk_1E61D74C8;
    v3 = *(id *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v8 = v3;
    v6[4] = v4;
    v7 = v5;
    v9 = *(_BYTE *)(a1 + 57);
    objc_msgSend(v2, "updateManifest:completionHandler:", 1, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_findResourceNamesForRegions:forceUpdate:asyncCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
  }
}

void __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_5;
    v5[3] = &unk_1E61D74A0;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v8 = *(_BYTE *)(a1 + 56);
    v7 = *(id *)(a1 + 48);
    dispatch_async(v3, v5);

  }
}

uint64_t __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findResourceNamesForRegions:forceUpdate:asyncCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_findResourceNamesForRegions:(id)a3 forceUpdate:(BOOL)a4 asyncCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D27420];
  v10 = a3;
  objc_msgSend(v9, "modernManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTileGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "regionalResourcesForMapRegions:resourceFilter:attributionFilter:", v10, &__block_literal_global_34, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D27430], "sharedRequester");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLPRRuleHelper workQueue](self, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__MNLPRRuleHelper__findResourceNamesForRegions_forceUpdate_asyncCompletion___block_invoke_2;
  v17[3] = &unk_1E61D7538;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v14, "fetchResources:force:manifestConfiguration:auditToken:queue:handler:", v13, v5, 0, 0, v15, v17);

}

uint64_t __76__MNLPRRuleHelper__findResourceNamesForRegions_forceUpdate_asyncCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v2, "filters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "scenariosCount"))
        {
          v9 = 0;
          while (objc_msgSend(v8, "scenarioAtIndex:", v9) == 4)
          {
            if (++v9 >= (unint64_t)objc_msgSend(v8, "scenariosCount"))
              goto LABEL_10;
          }
          v11 = 0;
          goto LABEL_14;
        }
LABEL_10:
        ;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(v2, "filename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v3, "isEqualToString:", CFSTR("cms-lpr"));
LABEL_14:

  return v11;
}

uint64_t __76__MNLPRRuleHelper__findResourceNamesForRegions_forceUpdate_asyncCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_loadRules:(id)a3 asyncCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  MNLPRRuleHelper *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v23 = self;
    v24 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_group_create();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
          dispatch_group_enter(v10);
          objc_msgSend(v16, "pathExtension");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lowercaseString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "isEqualToString:", CFSTR("cms-lpr")))
          {
            objc_msgSend(MEMORY[0x1E0D27410], "sharedManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke;
            v31[3] = &unk_1E61D7560;
            v32 = v26;
            v33 = v9;
            v34 = v10;
            objc_msgSend(v19, "dataForSignedResourceWithName:fallbackBundle:fallbackNameHandler:resultHandler:", v16, 0, 0, v31);

          }
          else
          {
            dispatch_group_leave(v10);
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v13);
    }

    -[MNLPRRuleHelper workQueue](v23, "workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke_2;
    block[3] = &unk_1E61D2418;
    v28 = v9;
    v8 = v24;
    v29 = v26;
    v30 = v24;
    v21 = v26;
    v22 = v9;
    dispatch_group_notify(v10, v20, block);

    v6 = v25;
  }

}

void __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27120]), "initWithData:", v7);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  }
}

@end
