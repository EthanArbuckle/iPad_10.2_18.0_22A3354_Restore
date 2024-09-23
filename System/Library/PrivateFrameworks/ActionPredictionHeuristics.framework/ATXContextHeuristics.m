@implementation ATXContextHeuristics

- (ATXContextHeuristics)initWithLocationManager:(id)a3
{
  ATXContextHeuristics *v5;
  ATXContextHeuristics *v6;
  uint64_t v7;
  ATXContextHeuristicCache *resultsCache;
  uint64_t v9;
  NSMutableSet *heuristicRefreshTriggers;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSMutableSet *heuristicsPendingRefresh;
  id v46;
  OS_dispatch_queue *v47;
  uint64_t v48;
  _PASSimpleCoalescingTimer *coalescedRefreshOperation;
  NSObject *v50;
  void *v52;
  void *v53;
  NSObject *attr;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  objc_super v64;
  uint8_t buf[8];
  id location[17];

  location[15] = *(id *)MEMORY[0x24BDAC8D0];
  v61 = a3;
  v64.receiver = self;
  v64.super_class = (Class)ATXContextHeuristics;
  v5 = -[ATXContextHeuristics init](&v64, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_locationManager, a3);
    v7 = objc_opt_new();
    resultsCache = v6->_resultsCache;
    v6->_resultsCache = (ATXContextHeuristicCache *)v7;

    v9 = objc_opt_new();
    heuristicRefreshTriggers = v6->_heuristicRefreshTriggers;
    v6->_heuristicRefreshTriggers = (NSMutableSet *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    attr = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("ATXContextHeuristicsRefresh", attr);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    location[0] = v60;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    location[1] = v59;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    location[2] = v58;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    location[3] = v57;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    location[4] = v56;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    location[5] = v55;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    location[6] = v53;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    location[7] = v52;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    location[8] = v23;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    location[9] = v25;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    location[10] = v27;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    location[11] = v29;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    location[12] = v31;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    location[13] = v33;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    location[14] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", location, 15);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "mutableCopy");

    if (_os_feature_enabled_impl())
    {
      __atxlog_handle_context_heuristic();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218BE7000, v38, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: zkw_commute feature flag ON, making commute suggestions", buf, 2u);
      }

      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v40);

      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v42);

    }
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v37);

    v44 = objc_msgSend(v43, "mutableCopy");
    heuristicsPendingRefresh = v6->_heuristicsPendingRefresh;
    v6->_heuristicsPendingRefresh = (NSMutableSet *)v44;

    objc_initWeak(location, v6);
    v46 = objc_alloc(MEMORY[0x24BE7A638]);
    v47 = v6->_queue;
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __48__ATXContextHeuristics_initWithLocationManager___block_invoke;
    v62[3] = &unk_24D9B4260;
    objc_copyWeak(&v63, location);
    v48 = objc_msgSend(v46, "initWithQueue:operation:", v47, v62);
    coalescedRefreshOperation = v6->_coalescedRefreshOperation;
    v6->_coalescedRefreshOperation = (_PASSimpleCoalescingTimer *)v48;

    __atxlog_handle_context_heuristic();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218BE7000, v50, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: initialized", buf, 2u);
    }

    objc_destroyWeak(&v63);
    objc_destroyWeak(location);

  }
  return v6;
}

void __48__ATXContextHeuristics_initWithLocationManager___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained, "_queue_refreshResultsForAllHeuristicsWithCompletionHandler:", 0);
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__ATXContextHeuristics_initWithLocationManager___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__ATXContextHeuristics_refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D9B4288;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __90__ATXContextHeuristics_refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshResultsForAllHeuristicsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)donateSuggestions:(id)a3 forHeuristic:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  ATXContextHeuristics *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ATXContextHeuristics_donateSuggestions_forHeuristic___block_invoke;
  block[3] = &unk_24D9B42B0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __55__ATXContextHeuristics_donateSuggestions_forHeuristic___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_context_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_218BE7000, v2, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: donating [%lu] to %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "setSuggestions:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "_queue_sendRelevantSuggestionsToBlending");
}

- (void)informationHeuristicRefreshTrigger:(id)a3 didTriggerRefreshForHeuristics:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  ATXContextHeuristics *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__ATXContextHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke;
  v8[3] = &unk_24D9B42D8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __90__ATXContextHeuristics_informationHeuristicRefreshTrigger_didTriggerRefreshForHeuristics___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_context_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_218BE7000, v2, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: add refresh for %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "unionSet:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "runAfterDelaySeconds:coalescingBehavior:", 0, 0.5);
}

- (void)_queue_updateHeuristicName:(id)a3 withRefreshTriggers:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  NSMutableSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    v38 = 138412290;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_heuristicRefreshTriggers, "containsObject:", v13, v38) & 1) == 0)
        {
          __atxlog_handle_context_heuristic();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v38;
            v60 = v13;
            _os_log_debug_impl(&dword_218BE7000, v14, OS_LOG_TYPE_DEBUG, "ATXContextHeuristics: new trigger %@", buf, 0xCu);
          }

          objc_msgSend(v13, "setDelegate:", self);
          -[NSMutableSet addObject:](self->_heuristicRefreshTriggers, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    }
    while (v10);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = self->_heuristicRefreshTriggers;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v50;
    v39 = 138412546;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        v21 = objc_msgSend(v8, "containsObject:", v20, v39);
        __atxlog_handle_context_heuristic();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = v39;
            v60 = v6;
            v61 = 2112;
            v62 = v20;
            _os_log_debug_impl(&dword_218BE7000, v22, OS_LOG_TYPE_DEBUG, "ATXContextHeuristics: start %@ for trigger %@", buf, 0x16u);
          }

          objc_msgSend(v20, "startTriggeringRefreshForHeuristicIfNotAlready:", v6);
        }
        else
        {
          if (v23)
          {
            *(_DWORD *)buf = v39;
            v60 = v6;
            v61 = 2112;
            v62 = v20;
            _os_log_debug_impl(&dword_218BE7000, v22, OS_LOG_TYPE_DEBUG, "ATXContextHeuristics: stop %@ for trigger %@", buf, 0x16u);
          }

          objc_msgSend(v20, "stopTriggeringRefreshForHeuristicIfAlready:", v6);
        }
      }
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    }
    while (v17);
  }
  v40 = v6;

  v24 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = self->_heuristicRefreshTriggers;
  v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v30, "registeredHeuristics", v40);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        if (!v32)
          objc_msgSend(v24, "addObject:", v30);
      }
      v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v27);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = v24;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v42;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v33);
        -[NSMutableSet removeObject:](self->_heuristicRefreshTriggers, "removeObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * m), v40);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v35);
  }

}

- (void)_queue_refreshResultsForAllHeuristicsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _BOOL8);
  NSObject *v5;
  NSMutableSet *heuristicsPendingRefresh;
  _BOOL8 v7;
  int v8;
  NSMutableSet *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _BOOL8))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    heuristicsPendingRefresh = self->_heuristicsPendingRefresh;
    v8 = 138412290;
    v9 = heuristicsPendingRefresh;
    _os_log_impl(&dword_218BE7000, v5, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: refresh %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = -[ATXContextHeuristics _queue_refreshResultsForHeuristics:](self, "_queue_refreshResultsForHeuristics:", self->_heuristicsPendingRefresh);
  if (v7)
    -[NSMutableSet removeAllObjects](self->_heuristicsPendingRefresh, "removeAllObjects");
  if (v4)
    v4[2](v4, v7);

}

- (BOOL)_queue_refreshResultsForHeuristics:(id)a3
{
  id v5;
  void *v6;
  ATXHeuristicDevice *v7;
  ATXHeuristicDevice *heuristicDevice;
  ATXHeuristicDevice *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v5, "count"))
  {
    sel_getName(a2);
    v6 = (void *)os_transaction_create();
    v7 = (ATXHeuristicDevice *)objc_msgSend(objc_alloc(MEMORY[0x24BE01160]), "initWithLocationManager:", self->_locationManager);
    heuristicDevice = self->_heuristicDevice;
    self->_heuristicDevice = v7;

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke;
    v19[3] = &unk_24D9B4300;
    v19[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    -[ATXContextHeuristics _queue_sendRelevantSuggestionsToBlending](self, "_queue_sendRelevantSuggestionsToBlending");
    v9 = self->_heuristicDevice;
    self->_heuristicDevice = 0;

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXContextHeuristics _queue_refreshResultsForHeuristics:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  return 1;
}

void __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke(uint64_t a1, void *a2)
{
  NSString *v3;
  NSObject *v4;
  Class v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (-[NSString isEqual:](v3, "isEqual:", CFSTR("kRecomputeRelevant")))
  {
    __atxlog_handle_context_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_218BE7000, v4, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: asked to recompute relevant suggestions", (uint8_t *)&v24, 2u);
    }
  }
  else
  {
    v5 = NSClassFromString(v3);
    v6 = -[objc_class conformsToProtocol:](v5, "conformsToProtocol:", &unk_25500A3B0);
    __atxlog_handle_context_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412290;
        v25 = v3;
        _os_log_impl(&dword_218BE7000, v4, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: _refreshResultsForHeuristics class %@", (uint8_t *)&v24, 0xCu);
      }

      v4 = objc_alloc_init(v5);
      v8 = (void *)MEMORY[0x219A209D8]();
      -[NSObject heuristicResultWithEnvironment:](v4, "heuristicResultWithEnvironment:", *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v9, "suggestions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_context_heuristic();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v10, "count");
        v24 = 138412546;
        v25 = v3;
        v26 = 2048;
        v27 = v12;
        _os_log_impl(&dword_218BE7000, v11, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristics: %@ produced %lu suggestions", (uint8_t *)&v24, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setSuggestions:forKey:", v10, v3);
      -[NSObject permanentRefreshTriggers](v4, "permanentRefreshTriggers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "additionalRefreshTriggers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v13, "setByAddingObjectsFromSet:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_queue_updateHeuristicName:withRefreshTriggers:", v3, v16);

    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke_cold_1(v4, v17, v18, v19, v20, v21, v22, v23);
    }
  }

}

- (void)_queue_cleanupTimeTriggers
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  ATXInformationHeuristicRefreshTimeTrigger *earliestCacheRefreshTimeTrigger;
  NSObject *v7;
  _BOOL4 v8;
  ATXInformationHeuristicRefreshTimeTrigger *v9;
  ATXInformationHeuristicRefreshTimeTrigger *v10;
  ATXInformationHeuristicRefreshTimeTrigger *v11;
  NSMutableSet *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ATXInformationHeuristicRefreshTimeTrigger *v24;
  void *v25;
  void *v26;
  BOOL v27;
  ATXInformationHeuristicRefreshTimeTrigger *v28;
  ATXInformationHeuristicRefreshTimeTrigger *v29;
  ATXInformationHeuristicRefreshTimeTrigger *v30;
  id v31;
  uint64_t v32;
  id *p_isa;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  NSObject *v37;
  _BOOL4 v38;
  ATXInformationHeuristicRefreshTimeTrigger *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  ATXContextHeuristics *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_opt_new();
  __atxlog_handle_context_heuristic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218BE7000, v4, OS_LOG_TYPE_DEFAULT, "[Cache] Get date for next change", buf, 2u);
  }

  v48 = (void *)v3;
  -[ATXContextHeuristicCache nextChangeAfterDate:](self->_resultsCache, "nextChangeAfterDate:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  -[ATXInformationHeuristicRefreshTimeTrigger stopTriggeringRefreshForAllHeuristics](self->_earliestCacheRefreshTimeTrigger, "stopTriggeringRefreshForAllHeuristics");
  earliestCacheRefreshTimeTrigger = self->_earliestCacheRefreshTimeTrigger;
  self->_earliestCacheRefreshTimeTrigger = 0;

  __atxlog_handle_context_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v59 = v5;
      _os_log_impl(&dword_218BE7000, v7, OS_LOG_TYPE_DEFAULT, "[Cache] Create time trigger for date: %@", buf, 0xCu);
    }

    v9 = (ATXInformationHeuristicRefreshTimeTrigger *)objc_msgSend(objc_alloc(MEMORY[0x24BE011D8]), "initWithFireDate:", v5);
    v10 = self->_earliestCacheRefreshTimeTrigger;
    self->_earliestCacheRefreshTimeTrigger = v9;

    -[ATXInformationHeuristicRefreshTimeTrigger setDelegate:](self->_earliestCacheRefreshTimeTrigger, "setDelegate:", self);
    -[ATXInformationHeuristicRefreshTimeTrigger startTriggeringRefreshForHeuristicIfNotAlready:](self->_earliestCacheRefreshTimeTrigger, "startTriggeringRefreshForHeuristicIfNotAlready:", CFSTR("kRecomputeRelevant"));
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218BE7000, v7, OS_LOG_TYPE_DEFAULT, "[Cache] No time trigger", buf, 2u);
    }

  }
  v47 = (void *)v5;
  v11 = self->_earliestCacheRefreshTimeTrigger;
  v49 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v46 = self;
  v12 = self->_heuristicRefreshTriggers;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  v14 = v48;
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
          objc_msgSend(v19, "fireDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "earlierDate:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 == v14)
          {
            if (!v11)
              goto LABEL_21;
            -[ATXInformationHeuristicRefreshTimeTrigger fireDate](v11, "fireDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "fireDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "earlierDate:", v23);
            v24 = v11;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "fireDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = v25 == v26;
            v11 = v24;
            v14 = v48;
            if (v27)
            {
LABEL_21:
              v28 = (ATXInformationHeuristicRefreshTimeTrigger *)v19;
              v29 = v11;
              v11 = v28;

            }
          }
          else
          {
            objc_msgSend(v19, "stopTriggeringRefreshForAllHeuristics");
            objc_msgSend(v49, "addObject:", v19);
          }

        }
      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v15);
  }
  v30 = v11;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v31 = v49;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  p_isa = (id *)&v46->super.isa;
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(v31);
        objc_msgSend(p_isa[2], "removeObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j), v46);
      }
      v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v34);
  }

  __atxlog_handle_context_heuristic();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
  v39 = v30;
  if (v30)
  {
    if (v38)
    {
      -[ATXInformationHeuristicRefreshTimeTrigger fireDate](v30, "fireDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXInformationHeuristicRefreshTimeTrigger registeredHeuristics](v30, "registeredHeuristics");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = (uint64_t)v40;
      v60 = 2112;
      v61 = v41;
      _os_log_impl(&dword_218BE7000, v37, OS_LOG_TYPE_DEFAULT, "[CTS] Schedule refresh at %@ for [%@]", buf, 0x16u);

      v39 = v30;
    }

    -[ATXInformationHeuristicRefreshTimeTrigger fireDate](v39, "fireDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "_criteriaForRefreshJobOnDate:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationHeuristicRefreshTimeTrigger fireDate](v30, "fireDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationHeuristicRefreshTimeTrigger registeredHeuristics](v30, "registeredHeuristics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "_setRefreshCTSJobForCriteria:fireDate:forHeuristics:", v43, v44, v45);

    v39 = v30;
    v14 = v48;
  }
  else
  {
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218BE7000, v37, OS_LOG_TYPE_DEFAULT, "[CTS] Remove refresh if exists", buf, 2u);
    }

    objc_msgSend(p_isa, "_removeRefreshCTSJob");
  }

}

- (void)_queue_sendRelevantSuggestionsToBlending
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXContextHeuristics _queue_cleanupTimeTriggers](self, "_queue_cleanupTimeTriggers");
  v3 = (void *)objc_opt_new();
  __atxlog_handle_context_heuristic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = (uint64_t)v3;
    _os_log_impl(&dword_218BE7000, v4, OS_LOG_TYPE_DEFAULT, "[Cache] Get relevant suggestions for date: %@", (uint8_t *)&v10, 0xCu);
  }

  -[ATXContextHeuristicCache allRelevantSuggestionsForDate:](self->_resultsCache, "allRelevantSuggestionsForDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    v10 = 134217984;
    v11 = v7;
    _os_log_impl(&dword_218BE7000, v6, OS_LOG_TYPE_DEFAULT, "[Cache] Received %lu suggestions", (uint8_t *)&v10, 0xCu);
  }

  __atxlog_handle_context_heuristic();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_218BE7000, v8, OS_LOG_TYPE_DEFAULT, "[Cache] Evict past suggestions", (uint8_t *)&v10, 2u);
  }

  -[ATXContextHeuristicCache evictBefore:](self->_resultsCache, "evictBefore:", v3);
  -[ATXContextHeuristics delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextHeuristics:didUpdateSuggestions:", self, v5);

}

- (void)_setRefreshCTSJobForCriteria:(id)a3 fireDate:(id)a4 forHeuristics:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD handler[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke;
  handler[3] = &unk_24D9B4328;
  handler[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  xpc_activity_register("com.apple.duetexpertd.context-heuristic-refresh", a3, handler);

}

void __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  if (xpc_activity_get_state(activity) == 2 && (objc_msgSend(MEMORY[0x24BE7A5D0], "isClassCLocked") & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke_2;
    block[3] = &unk_24D9B42B0;
    v8 = v3;
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    dispatch_async(v4, block);

  }
}

void __76__ATXContextHeuristics__setRefreshCTSJobForCriteria_fireDate_forHeuristics___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "timeIntervalSinceDate:", a1[4]);
  v4 = v3;
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[5];
    v7 = 134218242;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_218BE7000, v5, OS_LOG_TYPE_DEFAULT, "[CTS] Running refresh %0.1fs after date for [%@].", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1[6] + 24), "unionSet:", a1[5]);
  objc_msgSend(*(id *)(a1[6] + 48), "runAfterDelaySeconds:coalescingBehavior:", 0, 0.5);

}

- (void)_removeRefreshCTSJob
{
  xpc_activity_unregister("com.apple.duetexpertd.context-heuristic-refresh");
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
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x24BDAC5D8], *MEMORY[0x24BDAC610]);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC6D0], 1);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC6B8], 0);
  return v5;
}

- (ATXHeuristicDevice)heuristicDevice
{
  return self->_heuristicDevice;
}

- (ATXContextHeuristicsDelegate)delegate
{
  return (ATXContextHeuristicsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heuristicDevice, 0);
  objc_storeStrong((id *)&self->_earliestCacheRefreshTimeTrigger, 0);
  objc_storeStrong((id *)&self->_coalescedRefreshOperation, 0);
  objc_storeStrong((id *)&self->_resultsCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heuristicsPendingRefresh, 0);
  objc_storeStrong((id *)&self->_heuristicRefreshTriggers, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __48__ATXContextHeuristics_initWithLocationManager___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218BE7000, a1, a3, "ATXContextHeuristics: couldn't perform refresh operation because swelf is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_refreshResultsForHeuristics:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218BE7000, a1, a3, "ATXContextHeuristics: heuristics to refresh is empty", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __59__ATXContextHeuristics__queue_refreshResultsForHeuristics___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218BE7000, a1, a3, "ATXContextHeuristics: heuristic does not conform to ATXContextHeuristicProtocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
