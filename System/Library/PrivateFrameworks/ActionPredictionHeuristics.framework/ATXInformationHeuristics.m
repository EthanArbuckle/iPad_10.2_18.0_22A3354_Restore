@implementation ATXInformationHeuristics

- (ATXInformationHeuristics)init
{
  ATXInformationHeuristics *v2;
  uint64_t v3;
  NSMutableSet *heuristicRefreshTriggers;
  void *v5;
  uint64_t v6;
  NSMutableSet *heuristicsPendingRefresh;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  id v12;
  OS_dispatch_queue *v13;
  uint64_t v14;
  _PASSimpleCoalescingTimer *coalescedRefreshOperation;
  NSObject *v16;
  uint8_t v18[16];
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ATXInformationHeuristics;
  v2 = -[ATXInformationHeuristics init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    heuristicRefreshTriggers = v2->_heuristicRefreshTriggers;
    v2->_heuristicRefreshTriggers = (NSMutableSet *)v3;

    allInfoHeuristics();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mutableCopy");
    heuristicsPendingRefresh = v2->_heuristicsPendingRefresh;
    v2->_heuristicsPendingRefresh = (NSMutableSet *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("ATXInformationHeuristicsRefresh", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v2);
    v12 = objc_alloc(MEMORY[0x24BE7A638]);
    v13 = v2->_queue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __32__ATXInformationHeuristics_init__block_invoke;
    v19[3] = &unk_24D9B4260;
    objc_copyWeak(&v20, &location);
    v14 = objc_msgSend(v12, "initWithQueue:operation:", v13, v19);
    coalescedRefreshOperation = v2->_coalescedRefreshOperation;
    v2->_coalescedRefreshOperation = (_PASSimpleCoalescingTimer *)v14;

    __atxlog_handle_gi();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_218BE7000, v16, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: initialized", v18, 2u);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __32__ATXInformationHeuristics_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:", 0);
  }
  else
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __32__ATXInformationHeuristics_init__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)_refreshResultsForAllHeuristics:(BOOL)a3 completionHandler:(id)a4
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  BOOL v13;

  v7 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__ATXInformationHeuristics__refreshResultsForAllHeuristics_completionHandler___block_invoke;
  v10[3] = &unk_24D9B4380;
  v11 = v7;
  v12 = a2;
  v13 = a3;
  v10[4] = self;
  v9 = v7;
  dispatch_async(queue, v10);

}

void __78__ATXInformationHeuristics__refreshResultsForAllHeuristics_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  sel_getName(*(SEL *)(a1 + 48));
  v2 = os_transaction_create();
  v3 = *(_QWORD **)(a1 + 32);
  v8 = (id)v2;
  if (*(_BYTE *)(a1 + 56))
  {
    allInfoHeuristics();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "_refreshResultsForHeuristics:", v4);

    if (v5)
    {
LABEL_3:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
      v6 = 1;
      goto LABEL_6;
    }
  }
  else if ((objc_msgSend(v3, "_refreshResultsForHeuristics:", v3[2]) & 1) != 0)
  {
    goto LABEL_3;
  }
  v6 = 0;
LABEL_6:
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);

}

- (void)refreshResultsForAllHeuristicsWithCompletionHandler:(id)a3
{
  -[ATXInformationHeuristics _refreshResultsForAllHeuristics:completionHandler:](self, "_refreshResultsForAllHeuristics:completionHandler:", 1, a3);
}

- (void)refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:(id)a3
{
  -[ATXInformationHeuristics _refreshResultsForAllHeuristics:completionHandler:](self, "_refreshResultsForAllHeuristics:completionHandler:", 0, a3);
}

+ (id)sourceIdentifierForHeuristicWithName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.proactive"), v4);

  return v5;
}

- (void)informationHeuristicRefreshTrigger:(id)a3 didTriggerRefreshForHeuristics:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __94__ATXInformationHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke;
  v8[3] = &unk_24D9B42D8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __94__ATXInformationHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unionSet:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "runAfterDelaySeconds:coalescingBehavior:", 0, 0.5);
}

- (BOOL)_refreshResultsForHeuristics:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSMutableSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v75;
  id v76;
  NSObject *obj;
  id obja;
  uint64_t v79;
  void *v80;
  id v81;
  NSMutableSet *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint8_t v106[128];
  uint8_t buf[4];
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    -[ATXInformationHeuristics getResultsFromHeuristicInterpreter:](self, "getResultsFromHeuristicInterpreter:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;
    __atxlog_handle_gi();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      v76 = v4;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v108 = -[NSObject count](v6, "count");
        _os_log_impl(&dword_218BE7000, v9, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: received %lu results from HeuristicInterpreter", buf, 0xCu);
      }

      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v75 = v6;
      obj = v6;
      v81 = (id)-[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
      if (v81)
      {
        v79 = *(_QWORD *)v100;
        do
        {
          for (i = 0; i != v81; i = (char *)i + 1)
          {
            if (*(_QWORD *)v100 != v79)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i);
            __atxlog_handle_gi();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "heuristicName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "suggestions");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "count");
              *(_DWORD *)buf = 138412546;
              v108 = (uint64_t)v13;
              v109 = 2048;
              v110 = v15;
              _os_log_impl(&dword_218BE7000, v12, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: update heuristics %@, got %lu new suggestions", buf, 0x16u);

            }
            if (objc_msgSend(v11, "hasFailed"))
            {
              __atxlog_handle_gi();
              v16 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                goto LABEL_17;
              objc_msgSend(v11, "heuristicName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v108 = (uint64_t)v17;
              _os_log_impl(&dword_218BE7000, v16, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristics: updating heuristic %@ has failed in a non-trivial manner; bypassing the suggestions update",
                buf,
                0xCu);
            }
            else
            {
              v16 = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(v11, "suggestions");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "heuristicName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject informationHeuristics:didUpdateSuggestions:forHeuristic:](v16, "informationHeuristics:didUpdateSuggestions:forHeuristic:", self, v17, v18);

            }
LABEL_17:

            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            objc_msgSend(v11, "refreshTriggers");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v96;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v96 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
                  if ((-[NSMutableSet containsObject:](self->_heuristicRefreshTriggers, "containsObject:", v24) & 1) == 0)
                  {
                    objc_msgSend(v24, "setDelegate:", self);
                    -[NSMutableSet addObject:](self->_heuristicRefreshTriggers, "addObject:", v24);
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
              }
              while (v21);
            }

            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            v25 = self->_heuristicRefreshTriggers;
            v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v92;
              do
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v92 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
                  objc_msgSend(v11, "refreshTriggers");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "containsObject:", v30);

                  objc_msgSend(v11, "heuristicName");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                    objc_msgSend(v30, "startTriggeringRefreshForHeuristicIfNotAlready:", v33);
                  else
                    objc_msgSend(v30, "stopTriggeringRefreshForHeuristicIfAlready:", v33);

                }
                v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
              }
              while (v27);
            }

          }
          v81 = (id)-[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
        }
        while (v81);
      }

      v34 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v82 = self->_heuristicRefreshTriggers;
      v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
      if (v36)
      {
        v37 = v36;
        v38 = 0;
        v39 = *(_QWORD *)v88;
        obja = v35;
        do
        {
          for (m = 0; m != v37; ++m)
          {
            if (*(_QWORD *)v88 != v39)
              objc_enumerationMutation(v82);
            v41 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * m);
            objc_msgSend(v41, "registeredHeuristics");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "count");

            if (v43)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v44 = v41;
                objc_msgSend(v44, "fireDate");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "earlierDate:", v35);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46 == v35)
                {
                  if (!v38)
                    goto LABEL_51;
                  objc_msgSend(v38, "fireDate");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "fireDate");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "earlierDate:", v48);
                  v80 = v38;
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "fireDate");
                  v50 = v34;
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  v52 = v49 == v51;
                  v34 = v50;
                  v35 = obja;
                  v38 = v80;
                  if (v52)
                  {
LABEL_51:
                    v53 = v44;

                    v38 = v53;
                  }
                }
                else
                {
                  objc_msgSend(v44, "stopTriggeringRefreshForAllHeuristics");
                  objc_msgSend(v34, "addObject:", v44);
                }

              }
            }
            else
            {
              objc_msgSend(v34, "addObject:", v41);
            }
          }
          v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
        }
        while (v37);
      }
      else
      {
        v38 = 0;
      }

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v9 = v34;
      v67 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v84;
        do
        {
          for (n = 0; n != v68; ++n)
          {
            if (*(_QWORD *)v84 != v69)
              objc_enumerationMutation(v9);
            -[NSMutableSet removeObject:](self->_heuristicRefreshTriggers, "removeObject:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * n));
          }
          v68 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
        }
        while (v68);
      }

      if (v38)
      {
        objc_msgSend(v38, "fireDate");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXInformationHeuristics _criteriaForRefreshJobOnDate:](self, "_criteriaForRefreshJobOnDate:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "registeredHeuristics");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXInformationHeuristics _setRefreshCTSJobForCriteria:forHeuristics:](self, "_setRefreshCTSJobForCriteria:forHeuristics:", v72, v73);

        objc_msgSend(v38, "stopTriggeringRefreshForAllHeuristics");
        -[NSMutableSet removeObject:](self->_heuristicRefreshTriggers, "removeObject:", v38);
      }

      v6 = v75;
      v4 = v76;
      v7 = 1;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[ATXInformationHeuristics _refreshResultsForHeuristics:].cold.2(v9, v60, v61, v62, v63, v64, v65, v66);
    }

  }
  else
  {
    __atxlog_handle_gi();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXInformationHeuristics _refreshResultsForHeuristics:].cold.1((uint64_t)v4, v6, v54, v55, v56, v57, v58, v59);
    v7 = 0;
  }

  return v7;
}

- (id)getResultsFromHeuristicInterpreter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.proactive.HeuristicInterpreter"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500A410);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_resultsForInformationHeuristics_bundlePath_now_dataSourcesEndpoint_reply_, 0, 1);

  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  objc_msgSend(v5, "resume");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01160]), "initWithLocationManager:", 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01158]), "initWithDevice:", v10);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ATXHeuristicsBundlePath();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listenerEndpoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_44;
  v18[3] = &unk_24D9B43E8;
  v18[4] = &v19;
  objc_msgSend(v12, "resultsForInformationHeuristics:bundlePath:now:dataSourcesEndpoint:reply:", v4, v13, v14, v15, v18);

  objc_msgSend(v5, "invalidate");
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!v5)
  {
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_44_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)_setRefreshCTSJobForCriteria:(id)a3 forHeuristics:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke;
  v8[3] = &unk_24D9B4410;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  xpc_activity_register("com.apple.duetexpertd.info-heuristic-refresh", a3, v8);

}

void __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  if (xpc_activity_get_state(activity) == 2 && (objc_msgSend(MEMORY[0x24BE7A5D0], "isClassCLocked") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(v3 + 24);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke_2;
    v6[3] = &unk_24D9B42D8;
    v6[4] = v3;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __71__ATXInformationHeuristics__setRefreshCTSJobForCriteria_forHeuristics___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unionSet:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "runAfterDelaySeconds:coalescingBehavior:", 0, 0.5);
}

- (id)_criteriaForRefreshJobOnDate:(id)a3
{
  double v3;
  double v4;
  xpc_object_t v5;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v4 = v3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x24BDAC5B8], (uint64_t)v4);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x24BDAC5D8], 300);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC6D0], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC6B8], 0);
  return v5;
}

- (ATXInformationHeuristicsDelegate)delegate
{
  return (ATXInformationHeuristicsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coalescedRefreshOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heuristicsPendingRefresh, 0);
  objc_storeStrong((id *)&self->_heuristicRefreshTriggers, 0);
}

void __32__ATXInformationHeuristics_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218BE7000, a1, a3, "ATXInformationHeuristics: couldn't perform refresh operation because swelf is nil", a5, a6, a7, a8, 0);
}

- (void)_refreshResultsForHeuristics:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_218BE7000, a2, a3, "ATXInformationHeuristics: not refreshing results for heuristics %@, because my delegate is not yet setup.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_refreshResultsForHeuristics:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218BE7000, a1, a3, "ATXInformationHeuristics: received nil results from HeuristicInterpreter", a5, a6, a7, a8, 0);
}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_218BE7000, a2, a3, "ATXInformationHeuristics: Error getting heuristic results - unable to establish XPC connection: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __63__ATXInformationHeuristics_getResultsFromHeuristicInterpreter___block_invoke_44_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_218BE7000, a2, a3, "ATXInformationHeuristics: Error getting heuristic results - failed to compute actions and expirers for heuristics: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
