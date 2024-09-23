@implementation IQFMapsPersonalizationLookup

- (IQFMapsPersonalizationLookup)init
{
  IQFMapsPersonalizationLookup *v2;
  uint64_t v3;
  id v4;
  GDEntityResolutionInProcessTextClient *ecrClient;
  uint64_t v6;
  GDKnosisServer *knosisServer;
  IQFMapsPersonalizationLookup *v8;
  NSObject *v9;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IQFMapsPersonalizationLookup;
  v2 = -[IQFMapsPersonalizationLookup init](&v12, sel_init);
  if (!v2)
    goto LABEL_4;
  v11 = 0;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE584D8]), "initWithMode:warmup:error:", 4, 1, &v11);
  v4 = v11;
  ecrClient = v2->_ecrClient;
  v2->_ecrClient = (GDEntityResolutionInProcessTextClient *)v3;

  if (v2->_ecrClient)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE58520]), "initWithEntitySubgraphView");
    knosisServer = v2->_knosisServer;
    v2->_knosisServer = (GDKnosisServer *)v6;

LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }
  IQFLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[IQFMapsPersonalizationLookup init].cold.1();

  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)sharedMapsPersonalizationLookup
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!sharedMapsPersonalizationLookup_personalizationLookup)
  {
    v3 = objc_opt_new();
    v4 = (void *)sharedMapsPersonalizationLookup_personalizationLookup;
    sharedMapsPersonalizationLookup_personalizationLookup = v3;

  }
  objc_sync_exit(v2);

  return (id)sharedMapsPersonalizationLookup_personalizationLookup;
}

- (id)eventsAtLocations:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__IQFMapsPersonalizationLookup_eventsAtLocations___block_invoke;
  v9[3] = &unk_250F8D400;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  -[IQFMapsPersonalizationLookup eventsAtLocations:completionHandler:](self, "eventsAtLocations:completionHandler:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__IQFMapsPersonalizationLookup_eventsAtLocations___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)eventsAtLocations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  IQFMapsPersonalizationLookup *v34;
  id v35;
  os_signpost_id_t v36;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  IQFLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[IQFMapsPersonalizationLookup eventsAtLocations:completionHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  v16 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v21), "muid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v19);
  }

  IQFLogCategoryDefault();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_generate(v23);
  v25 = v23;
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23F081000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "ecrCallForLocations", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v16, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke;
  v31[3] = &unk_250F8D450;
  v35 = v7;
  v36 = v24;
  v32 = v26;
  v33 = v16;
  v34 = self;
  v28 = v16;
  v29 = v7;
  v30 = v26;
  -[IQFMapsPersonalizationLookup _fetchECRResultForLocationMUIDs:completionHandler:](self, "_fetchECRResultForLocationMUIDs:completionHandler:", v27, v31);

}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  os_signpost_id_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[8];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23F081000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ecrCallForLocations", (const char *)&unk_23F089626, buf, 2u);
  }

  IQFLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    v41 = v6;
    if (v11)
      __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_3();

    v12 = (void *)objc_opt_new();
    v47 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v42 = v5;
    objc_msgSend(v5, "rankedResults");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v45)
    {
      v44 = *(_QWORD *)v59;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v59 != v44)
            objc_enumerationMutation(obj);
          v46 = v13;
          v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v13);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v14, "rankedItems", v41);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v55;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v55 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                +[IQFMapsPersonalizationLookup _parseECRRankedItem:locationMUIDs:](IQFMapsPersonalizationLookup, "_parseECRRankedItem:locationMUIDs:", v20, *(_QWORD *)(a1 + 40));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  objc_msgSend(v12, "addObject:", v21);
                  objc_msgSend(v20, "entityID");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "stringValue");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v21, "muid");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setObject:forKeyedSubscript:", v24, v23);

                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
            }
            while (v17);
          }

          v13 = v46 + 1;
        }
        while (v46 + 1 != v45);
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v45);
    }

    IQFLogCategoryDefault();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_2(v25, v26, v27, v28, v29, v30, v31, v32);

    v33 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
    v34 = *(id *)(a1 + 32);
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23F081000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "fetchResultsForEntityIds", (const char *)&unk_23F089626, buf, 2u);
    }

    v36 = *(void **)(a1 + 48);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_36;
    v48[3] = &unk_250F8D428;
    v37 = *(id *)(a1 + 32);
    v53 = v33;
    v49 = v37;
    v50 = v12;
    v52 = *(id *)(a1 + 56);
    v6 = v41;
    v51 = v41;
    v38 = v12;
    v39 = v47;
    objc_msgSend(v36, "_fetchResultsForEntityIds:completionHandler:", v47, v48);

    v5 = v42;
  }
  else
  {
    if (v11)
      __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_1();

    v40 = *(_QWORD *)(a1 + 56);
    v39 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v40 + 16))(v40, v39, v6);
  }

}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_23F081000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fetchResultsForEntityIds", (const char *)&unk_23F089626, v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_fetchECRResultForLocationMUIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a4;
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IQFLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[IQFMapsPersonalizationLookup _fetchECRResultForLocationMUIDs:completionHandler:].cold.2();

  v9 = objc_alloc(MEMORY[0x24BE584E0]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("locationWithMuid([%@])"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithKgq:text:mode:includeFeatures:", v10, 0, 4, 1);

  IQFLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[IQFMapsPersonalizationLookup _fetchECRResultForLocationMUIDs:completionHandler:].cold.1();

  -[GDEntityResolutionInProcessTextClient resolveEntitiesForRequest:completionHandler:](self->_ecrClient, "resolveEntitiesForRequest:completionHandler:", v11, v6);
}

- (void)_fetchResultsForEntityIds:(id)a3 completionHandler:(id)a4
{
  +[IQFMapsPersonalizationLookup _fetchResultsForEntityIds:knosisServer:completionHandler:](IQFMapsPersonalizationLookup, "_fetchResultsForEntityIds:knosisServer:completionHandler:", a3, self->_knosisServer, a4);
}

+ (void)_fetchResultsForEntityIds:(id)a3 knosisServer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = objc_alloc(MEMORY[0x24BE58510]);
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("searchEntityByLocation([%@])"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "initWithKGQ:query:limit:offset:", v15, &stru_250F8DCB0, &unk_250F8EB78, &unk_250F8EB90);

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke;
    v18[3] = &unk_250F8D478;
    v20 = v10;
    v21 = a1;
    v19 = v8;
    objc_msgSend(v9, "executeKGQ:completionHandler:", v16, v18);

  }
  else
  {
    v17 = (void *)objc_opt_new();
    (*((void (**)(id, void *))v10 + 2))(v10, v17);

  }
}

void __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "status") == 1)
  {
    IQFLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_2(v4, v5);

    v6 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "answers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 48), "_parseKnosisAnswer:entityIDToMuid:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), *(_QWORD *)(a1 + 32));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 48), "_aggregateLifeEvents:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    IQFLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_1(v4, v14);

    v15 = *(_QWORD *)(a1 + 40);
    v6 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v6);
  }

}

+ (id)_parseECRRankedItem:(id)a3 locationMUIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  IQFMapsPersonalizationResult *v13;
  IQFMapsPersonalizationResult *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sourceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length") && (objc_msgSend(v6, "containsObject:", v8) & 1) != 0)
  {
    IQFLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[IQFMapsPersonalizationLookup _parseECRRankedItem:locationMUIDs:].cold.3();

    objc_msgSend(v5, "features");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "locationLastExecutionAge");

    if (v11)
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)-v11);
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = [IQFMapsPersonalizationResult alloc];
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "features");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locationTrendingPopularity");
    objc_msgSend(v15, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "features");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "locationPopularityGivenSpecificGeoHash");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "entityRelevance");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[IQFMapsPersonalizationResult initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:](v14, "initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:", v8, 10, 0, 0, 0, 0, 0, 0, v17, v20, v12, v22, 0);

    IQFLogCategoryDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      +[IQFMapsPersonalizationLookup _parseECRRankedItem:locationMUIDs:].cold.2();

  }
  else
  {
    IQFLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[IQFMapsPersonalizationLookup _parseECRRankedItem:locationMUIDs:].cold.1();
    v13 = 0;
  }

  return v13;
}

+ (id)_parseKnosisAnswer:(id)a3 entityIDToMuid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  IQFMapsPersonalizationResult *v61;
  NSObject *v62;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_muidForKnosisAnswer:entityIDToMuid:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v61 = 0;
    goto LABEL_67;
  }
  v64 = v7;
  v65 = (uint64_t)v8;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v6, "facts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (!v10)
  {

    v58 = 0;
    v13 = 0;
    v12 = 0;
    v71 = 0;
LABEL_63:
    IQFLogCategoryDefault();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      +[IQFMapsPersonalizationLookup _parseKnosisAnswer:entityIDToMuid:].cold.1(v65, v58);
    goto LABEL_65;
  }
  v11 = v10;
  v71 = 0;
  v72 = 0;
  v12 = 0;
  v13 = 0;
  v69 = *(_QWORD *)v82;
  v66 = v9;
  do
  {
    v14 = 0;
    v67 = v11;
    do
    {
      if (*(_QWORD *)v82 != v69)
        objc_enumerationMutation(v9);
      v70 = v14;
      v15 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v14);
      objc_msgSend(v15, "predicateId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PS33")))
      {
        objc_msgSend(v15, "objectID");
        v17 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v17;
        goto LABEL_36;
      }
      v18 = v16;
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("nm_hasDate")))
      {
        v68 = v13;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        objc_msgSend(v15, "qualifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
        if (!v20)
          goto LABEL_35;
        v21 = v20;
        v22 = *(_QWORD *)v78;
        while (1)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v78 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            objc_msgSend(v24, "predicateId");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("nm_imputedStartTime"));

            if (v26)
            {
              v27 = (void *)MEMORY[0x24BDBCE60];
              objc_msgSend(v24, "objectID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "doubleValue");
              objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = v12;
              v12 = (void *)v29;
            }
            else
            {
              objc_msgSend(v24, "predicateId");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("nm_imputedEndTime"));

              if (!v32)
                goto LABEL_20;
              v33 = (void *)MEMORY[0x24BDBCE60];
              objc_msgSend(v24, "objectID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "doubleValue");
              objc_msgSend(v33, "dateWithTimeIntervalSinceReferenceDate:");
              v34 = objc_claimAutoreleasedReturnValue();
              v30 = v71;
              v71 = (void *)v34;
            }

LABEL_20:
            v16 = v18;
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
          if (!v21)
            goto LABEL_35;
        }
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PS72")))
      {
        v68 = v13;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v15, "qualifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v74;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v74 != v37)
                objc_enumerationMutation(v19);
              v39 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
              objc_msgSend(v39, "predicateId");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("PS396"));

              if (v41)
              {
                objc_msgSend(v39, "objectID");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "isEqual:", CFSTR("EKCalendarItemIdentifier"));

                v44 = v72;
                if (v43)
                  v44 = 9;
                v72 = v44;
              }
              v16 = v18;
            }
            v36 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
          }
          while (v36);
        }
LABEL_35:

        v11 = v67;
        v13 = v68;
        v9 = v66;
      }
      else
      {
        if (!objc_msgSend(v16, "isEqual:", CFSTR("nm_sgEventType")))
        {
          if (!objc_msgSend(v16, "isEqualToString:", CFSTR("PS1")))
            goto LABEL_36;
          objc_msgSend(v15, "objectID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("SB764"));

          v47 = v72;
          if (v49)
            v47 = 1;
          goto LABEL_49;
        }
        objc_msgSend(v15, "objectID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("FlightReservation"));

        if ((v46 & 1) != 0)
        {
          v47 = 2;
LABEL_49:
          v72 = v47;
          goto LABEL_36;
        }
        objc_msgSend(v15, "objectID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("FoodEstablishmentReservation"));

        if ((v51 & 1) != 0)
        {
          v47 = 4;
          goto LABEL_49;
        }
        objc_msgSend(v15, "objectID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("LodgingReservation"));

        if ((v53 & 1) != 0)
        {
          v47 = 5;
          goto LABEL_49;
        }
        objc_msgSend(v15, "objectID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("RentalCarReservation"));

        v56 = v72;
        if (v55)
          v56 = 6;
        v72 = v56;
      }
LABEL_36:

      v14 = v70 + 1;
    }
    while (v70 + 1 != v11);
    v57 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    v11 = v57;
  }
  while (v57);

  v58 = v72;
  if (!v72)
    goto LABEL_63;
  if (isCalendarBasedPersonalizationResultType(v72) && (!v12 || (objc_msgSend(v12, "isDateInTodayOrFuture") & 1) == 0))
  {
    IQFLogCategoryDefault();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      +[IQFMapsPersonalizationLookup _parseKnosisAnswer:entityIDToMuid:].cold.2(v65, v72);
LABEL_65:

    v61 = 0;
    v60 = v71;
    goto LABEL_66;
  }
  IQFLogCategoryDefault();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    +[IQFMapsPersonalizationLookup _parseKnosisAnswer:entityIDToMuid:].cold.3(v65, v72);

  v60 = v71;
  v61 = -[IQFMapsPersonalizationResult initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:]([IQFMapsPersonalizationResult alloc], "initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:", v65, v72, v13, v12, v71, 0, 0, 0, 0, 0, 0, &unk_250F8EB90, 0);
LABEL_66:

  v7 = v64;
  v8 = (void *)v65;
LABEL_67:

  return v61;
}

+ (id)_aggregateLifeEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  IQFMapsPersonalizationResult *v24;
  void *v25;
  void *v26;
  IQFMapsPersonalizationResult *v27;
  id v29;
  id obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v31 = (id)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v10, "resultType") == 1)
        {
          objc_msgSend(v10, "muid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = v12;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "intValue") + 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v14 = &unk_250F8EBA8;
          }
          objc_msgSend(v4, "setValue:forKey:", v14, v11);
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "endEventDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v15)
          {
            objc_msgSend(v16, "laterDate:", v15);
            v18 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v18;
          }
          objc_msgSend(v5, "setValue:forKey:", v17, v11);

        }
        else
        {
          objc_msgSend(v31, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v7);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v4, "allKeys");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v29);
        v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        v24 = [IQFMapsPersonalizationResult alloc];
        objc_msgSend(v4, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[IQFMapsPersonalizationResult initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:](v24, "initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:", v23, 1, 0, 0, 0, 0, 0, 0, v25, 0, v26, 0, 0);

        objc_msgSend(v31, "addObject:", v27);
      }
      v20 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v20);
  }

  return v31;
}

+ (id)_muidForKnosisAnswer:(id)a3 entityIDToMuid:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
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
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(a3, "parents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    v31 = v6;
    v27 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v11, "facts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v32)
        {
          v13 = *(_QWORD *)v39;
          v28 = i;
          v29 = v8;
          v33 = v12;
          v30 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v39 != v13)
                objc_enumerationMutation(v12);
              v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              objc_msgSend(v15, "qualifiers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v35;
                while (2)
                {
                  for (k = 0; k != v18; ++k)
                  {
                    if (*(_QWORD *)v35 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
                    objc_msgSend(v21, "predicateId");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v22, "isEqual:", CFSTR("PS107"));

                    if (v23)
                    {
                      objc_msgSend(v21, "objectID");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "objectForKey:", v24);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v25)
                      {

                        v6 = v31;
                        goto LABEL_27;
                      }
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              v12 = v33;
              v13 = v30;
            }
            v6 = v31;
            v9 = v27;
            i = v28;
            v8 = v29;
            v32 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v32);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      v25 = 0;
    }
    while (v8);
  }
  else
  {
    v25 = 0;
  }
LABEL_27:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knosisServer, 0);
  objc_storeStrong((id *)&self->_ecrClient, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: Unable to initialize GDEntityResolutionInProcessTextClient with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)eventsAtLocations:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_23F081000, a1, a3, "IQFMapsPersonalizationLookup: ECR & Knosis lookup for locations", a5, a6, a7, a8, 0);
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: ECR returned error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_23F081000, a1, a3, "IQFMapsPersonalizationLookup: making Knosis call for results", a5, a6, a7, a8, 0);
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: ECR returned result %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchECRResultForLocationMUIDs:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: ECR request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchECRResultForLocationMUIDs:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: ECR muid lookup string %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "status");
  objc_msgSend(a1, "errorMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_23F081000, a2, v6, "IQFMapsPersonalizationLookup: Knosis returned status: %tu, error: %@", (uint8_t *)&v7);

}

void __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "answers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_23F081000, a2, OS_LOG_TYPE_DEBUG, "IQFMapsPersonalizationLookup: Knosis returned result with %tu answers", v4, 0xCu);

}

+ (void)_parseECRRankedItem:locationMUIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: no sourceID for ECR item or sourceID does not match location MUIDs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_parseECRRankedItem:locationMUIDs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = 1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: Found personalization result of type %tu for muid: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_parseECRRankedItem:locationMUIDs:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_23F081000, v0, v1, "IQFMapsPersonalizationLookup: source muid for ranked item %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_parseKnosisAnswer:(uint64_t)a1 entityIDToMuid:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_23F081000, v2, v3, "IQFMapsPersonalizationLookup: Skipping personalization result of type %tu for muid: %@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

+ (void)_parseKnosisAnswer:(uint64_t)a1 entityIDToMuid:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_23F081000, v2, v3, "IQFMapsPersonalizationLookup: Skipping personalization result of type %tu for muid: %@ because start date is missing or in the past", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

+ (void)_parseKnosisAnswer:(uint64_t)a1 entityIDToMuid:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_23F081000, v2, v3, "IQFMapsPersonalizationLookup: Found personalization result of type %tu for muid: %@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

@end
