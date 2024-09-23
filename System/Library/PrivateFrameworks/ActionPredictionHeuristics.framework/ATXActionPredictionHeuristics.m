@implementation ATXActionPredictionHeuristics

+ (id)actionsWithLocationManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *context;
  id v49;
  void *v50;
  id obj;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t i;
  uint64_t m;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  context = (void *)MEMORY[0x219A209D8]();
  objc_msgSend(MEMORY[0x24BE011B0], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "heuristicsCached");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__0;
  v82 = __Block_byref_object_dispose__0;
  v83 = 0;
  v3 = (void *)MEMORY[0x219A209D8]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.proactive.HeuristicInterpreter"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500A410);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_actionsAndExpirersForHeuristicsExcept_bundlePath_now_dataSourcesEndpoint_reply_, 0, 1);

  objc_msgSend(v4, "setRemoteObjectInterface:", v5);
  objc_msgSend(v4, "resume");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01160]), "initWithLocationManager:", v49);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01158]), "initWithDevice:", v10);
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ATXHeuristicsBundlePath();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listenerEndpoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke_27;
  v77[3] = &unk_24D9B49B8;
  v77[4] = &v78;
  objc_msgSend(v12, "actionsAndExpirersForHeuristicsExcept:bundlePath:now:dataSourcesEndpoint:reply:", v50, v13, v14, v15, v77);

  objc_msgSend(v4, "invalidate");
  objc_autoreleasePoolPop(v3);
  if (v79[5])
  {
    __atxlog_handle_heuristic();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v79[5], "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v93 = v17;
      _os_log_impl(&dword_218BE7000, v16, OS_LOG_TYPE_DEFAULT, "Received results from HeuristicInterpreter: %@", buf, 0xCu);

    }
    __atxlog_handle_heuristic();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v50;
      _os_log_impl(&dword_218BE7000, v18, OS_LOG_TYPE_DEFAULT, "Using cached results: %@", buf, 0xCu);
    }

    v19 = (void *)objc_opt_new();
    v20 = (void *)objc_opt_new();
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = (id)v79[5];
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    if (v54)
    {
      v52 = *(id *)v74;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(id *)v74 != v52)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend((id)v79[5], "objectForKeyedSubscript:", v21);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "actionMakers");
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v22, "count"));
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          v24 = v22;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v85;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v85 != v26)
                  objc_enumerationMutation(v24);
                objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "action");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                  objc_msgSend(v23, "addObject:", v28);

              }
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
            }
            while (v25);
          }

          objc_msgSend(v57, "expirers");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:expirers:forKey:", v23, v29, v21);

          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v30 = v23;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
          if (v31)
          {
            v32 = *(_QWORD *)v70;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v70 != v32)
                  objc_enumerationMutation(v30);
                v34 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
                objc_msgSend(v34, "criteria");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "isRelevant:", v20);

                if (v36)
                {
                  objc_msgSend(v19, "addObject:", v34);
                }
                else
                {
                  __atxlog_handle_heuristic();
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v93 = v34;
                    _os_log_impl(&dword_218BE7000, v37, OS_LOG_TYPE_DEFAULT, "Action is not relevant: %@", buf, 0xCu);
                  }

                }
              }
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
            }
            while (v31);
          }

        }
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
      }
      while (v54);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v53 = v50;
    v58 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
    if (v58)
    {
      v55 = *(_QWORD *)v66;
      do
      {
        for (m = 0; m != v58; ++m)
        {
          if (*(_QWORD *)v66 != v55)
            objc_enumerationMutation(v53);
          objc_msgSend(v56, "objectForKey:found:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * m), 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v39 = v38;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v88, 16);
          if (v40)
          {
            v41 = *(_QWORD *)v62;
            do
            {
              for (n = 0; n != v40; ++n)
              {
                if (*(_QWORD *)v62 != v41)
                  objc_enumerationMutation(v39);
                v43 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * n);
                objc_msgSend(v43, "criteria");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "isRelevant:", v20);

                if (v45)
                {
                  objc_msgSend(v19, "addObject:", v43);
                }
                else
                {
                  __atxlog_handle_heuristic();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v93 = v43;
                    _os_log_impl(&dword_218BE7000, v46, OS_LOG_TYPE_DEFAULT, "Action is no longer relevant: %@", buf, 0xCu);
                  }

                }
              }
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v88, 16);
            }
            while (v40);
          }

        }
        v58 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
      }
      while (v58);
    }

    objc_msgSend(v19, "sortWithOptions:usingComparator:", 16, &__block_literal_global_33);
  }
  else
  {
    v19 = 0;
  }
  _Block_object_dispose(&v78, 8);

  objc_autoreleasePoolPop(context);
  return v19;
}

void __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  __atxlog_handle_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_218BE7000, v3, OS_LOG_TYPE_DEFAULT, "Error getting heuristic results - unable to establish XPC connection: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!v5)
  {
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_218BE7000, v9, OS_LOG_TYPE_DEFAULT, "Error getting heuristic results - failed to compute actions and expirers for heuristics: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

uint64_t __60__ATXActionPredictionHeuristics_actionsWithLocationManager___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "heuristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heuristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)addCacheExpirerNotification:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE011B0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.duetexpertd.heuristic.cache-expired"), v6, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)nextCacheExpirationDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE011B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
