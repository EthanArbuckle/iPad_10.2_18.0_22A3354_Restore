@implementation ATXRSRelevanceMonitor

- (ATXRSRelevanceMonitor)init
{
  ATXRSRelevanceMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  id v6;
  OS_dispatch_queue *v7;
  uint64_t v8;
  _PASSimpleCoalescingTimer *coalescedRefreshCurrentlyRelevantCandidatesOperation;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXRSRelevanceMonitor;
  v2 = -[ATXRSRelevanceMonitor init](&v14, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("ATXRSRelevanceMonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D81618]);
    v7 = v2->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __29__ATXRSRelevanceMonitor_init__block_invoke;
    v11[3] = &unk_1E82DB988;
    objc_copyWeak(&v12, &location);
    v8 = objc_msgSend(v6, "initWithQueue:operation:", v7, v11);
    coalescedRefreshCurrentlyRelevantCandidatesOperation = v2->_coalescedRefreshCurrentlyRelevantCandidatesOperation;
    v2->_coalescedRefreshCurrentlyRelevantCandidatesOperation = (_PASSimpleCoalescingTimer *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__ATXRSRelevanceMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_queue_refreshCurrentlyRelevantCandidates");
  }
  else
  {
    __atxlog_handle_relevant_shortcut();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __29__ATXRSRelevanceMonitor_init__block_invoke_cold_1(v3);

  }
}

- (void)_coalescedRefreshCurrentlyRelevantCandidates
{
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedRefreshCurrentlyRelevantCandidatesOperation, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
}

- (void)_queue_refreshCurrentlyRelevantCandidates
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t i;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  Class v58;
  id v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSArray *obj;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  _BOOL4 v81;
  uint64_t v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  id v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_relevant_shortcut();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Refreshing currently relevant candidates...", buf, 2u);
  }

  __atxlog_handle_relevant_shortcut();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: fetching current mode", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D80E48], "currentModeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "starting");

  if (v6)
  {
    objc_msgSend(v4, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "atx_dndModeSemanticType");

    DNDModeSemanticTypeToATXActivityType();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ATXModeFromActivityType());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v4, "timestamp");
    v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    __atxlog_handle_relevant_shortcut();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: using last computed mode", buf, 2u);
    }

  }
  else
  {
    v10 = 0;
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D80E50], "currentModeEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isStart");

  if (v14)
  {
    objc_msgSend(v12, "eventBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "modeType");
    BMUserFocusInferredModeTypeToActivity();

    v16 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v12, "timestamp");
    v17 = (void *)objc_msgSend(v16, "initWithTimeIntervalSinceReferenceDate:");
    v18 = v17;
    if (v8 && v10 && objc_msgSend(v17, "compare:", v10) != 1)
      goto LABEL_21;
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ATXModeFromActivityType());
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v19, "compare:", v19);
    __atxlog_handle_relevant_shortcut();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21 == 1)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        v24 = "ATXRSRelevanceMonitor: overriding computed mode with more recent inferred mode";
LABEL_19:
        _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "ATXRSRelevanceMonitor: using last inferred mode";
      goto LABEL_19;
    }

    v10 = v19;
    v8 = (void *)v20;
LABEL_21:

  }
  if (objc_msgSend(v8, "isEqualToNumber:", &unk_1E83CD450))
  {
    __atxlog_handle_relevant_shortcut();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "ATXRSRelevanceMonitor: current mode is custom, returning nil mode";
LABEL_32:
      _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  __atxlog_handle_relevant_shortcut();
  v25 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (!v8 || !v10)
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      v26 = "ATXRSRelevanceMonitor: no current mode";
      goto LABEL_32;
    }
LABEL_33:

    v29 = 0;
    goto LABEL_34;
  }
  if (v27)
  {
    objc_msgSend(v8, "unsignedIntegerValue");
    ATXModeToString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v93 = (uint64_t)v28;
    _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: current mode is %@", buf, 0xCu);

  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v8, v10);
LABEL_34:

  objc_msgSend(v29, "first");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v30, "unsignedIntegerValue");

  objc_msgSend(v29, "second");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  buf[0] = 0;
  v33 = 0.0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("ATXModeRelevanceDelayDisabled"), (CFStringRef)*MEMORY[0x1E0CF9510], buf))
  {
    objc_msgSend(v32, "behavioralModeRelevanceDelay");
    v33 = v34;
  }
  objc_msgSend(v32, "behavioralModeRelevanceDuration");
  v36 = v35;
  objc_msgSend(v31, "dateByAddingTimeInterval:", v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dateByAddingTimeInterval:", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "timeIntervalSinceNow");
  v72 = v29;
  if (v39 >= 0.0)
  {
    v81 = 0;
  }
  else
  {
    objc_msgSend(v38, "timeIntervalSinceNow");
    v81 = v40 > 0.0;
  }

  v79 = (void *)objc_opt_new();
  v78 = (void *)objc_opt_new();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = self->_queue_candidates;
  v82 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
  if (v82)
  {
    v80 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v89 != v80)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        if (v81
          && (objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "relevantContexts"),
              v43 = (void *)objc_claimAutoreleasedReturnValue(),
              v44 = objc_msgSend(v43, "count"),
              v43,
              !v44)
          && -[ATXRSRelevanceMonitor _isBehavioralRelevanceSatisfiedForCandidate:currentMode:](self, "_isBehavioralRelevanceSatisfiedForCandidate:currentMode:", v42, v73))
        {
          objc_msgSend(v79, "addObject:", v42);
          __atxlog_handle_relevant_shortcut();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v42, "widgetDescriptor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "extensionBundleIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "widgetDescriptor");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "kind");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "intent");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "intentDescription");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            ATXModeToString();
            v52 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v93 = (uint64_t)v47;
            v94 = 2112;
            v95 = v49;
            v96 = 2112;
            v97 = v51;
            v98 = 2112;
            v99 = v52;
            _os_log_impl(&dword_1C9A3B000, v45, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Candidate (%@ - %@ - %@) with no providers satisfied behavioral relevance for mode: %@", buf, 0x2Au);

LABEL_67:
          }
        }
        else
        {
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v42, "relevantContexts");
          v45 = objc_claimAutoreleasedReturnValue();
          v53 = -[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v85;
            while (2)
            {
              for (j = 0; j != v54; ++j)
              {
                if (*(_QWORD *)v85 != v55)
                  objc_enumerationMutation(v45);
                v57 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
                v58 = NSClassFromString(CFSTR("ATXDateRelevantContext"));
                v59 = v57;
                if (v58)
                {
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v60 = v59;
                  else
                    v60 = 0;
                }
                else
                {
                  v60 = 0;
                }
                v52 = v60;

                if (v52
                  && -[ATXRSRelevanceMonitor _isDateRelevantContextSatisfied:](self, "_isDateRelevantContextSatisfied:", v52))
                {
                  objc_msgSend(v79, "addObject:", v42);
                  objc_msgSend(v78, "setObject:forKeyedSubscript:", v52, v42);
                  __atxlog_handle_relevant_shortcut();
                  v61 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v42, "widgetDescriptor");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "extensionBundleIdentifier");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "widgetDescriptor");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "kind");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "intent");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "intentDescription");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "startDate");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "endDate");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413314;
                    v93 = (uint64_t)v62;
                    v94 = 2112;
                    v95 = v63;
                    v96 = 2112;
                    v97 = v64;
                    v98 = 2114;
                    v99 = v65;
                    v100 = 2114;
                    v101 = v66;
                    _os_log_impl(&dword_1C9A3B000, v61, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Candidate (%@ - %@ - %@) has active date relevant context (start %{public}@, end %{public}@)", buf, 0x34u);

                  }
                  goto LABEL_67;
                }

              }
              v54 = -[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
              if (v54)
                continue;
              break;
            }
          }
        }

      }
      v82 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    }
    while (v82);
  }

  __atxlog_handle_relevant_shortcut();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = objc_msgSend(v79, "count");
    *(_DWORD *)buf = 134217984;
    v93 = v68;
    _os_log_impl(&dword_1C9A3B000, v67, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: %lu candidates are currently relevant", buf, 0xCu);
  }

  -[ATXRSRelevanceMonitor delegate](self, "delegate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v79, "copy");
  v71 = (void *)objc_msgSend(v78, "copy");
  objc_msgSend(v69, "relevanceMonitorDidUpdateCurrentlyRelevantCandidates:relevantContexts:", v70, v71);

}

- (void)resetToMonitorForRelevantShortcutCandidates:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  ATXRSRelevanceMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ATXRSRelevanceMonitor_resetToMonitorForRelevantShortcutCandidates___block_invoke;
  block[3] = &unk_1E82DACB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __69__ATXRSRelevanceMonitor_resetToMonitorForRelevantShortcutCandidates___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  Class v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_relevant_shortcut();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v36 = v3;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Reset to monitor for %lu candidates", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_clearAllCurrentMonitoring");
  v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

  v7 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = a1;
  obj = *(id *)(a1 + 32);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v24 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v11, "relevantContexts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
              v18 = NSClassFromString(CFSTR("ATXDateRelevantContext"));
              v19 = v17;
              if (v18)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v20 = v19;
                else
                  v20 = 0;
              }
              else
              {
                v20 = 0;
              }
              v21 = v20;

              if (v21)
                objc_msgSend(v7, "addObject:", v21);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(v22 + 40), "_queue_startMonitoringDateRelevantContexts:", v7);
  objc_msgSend(*(id *)(v22 + 40), "_queue_startMonitoringModeChanges");
  objc_msgSend(*(id *)(v22 + 40), "_coalescedRefreshCurrentlyRelevantCandidates");

}

- (void)_queue_clearAllCurrentMonitoring
{
  xpc_activity_unregister("com.apple.duetexpertd.INDateRelevance");
  -[BPSSink cancel](self->_computedModeSink, "cancel");
  -[BPSSink cancel](self->_inferredModeSink, "cancel");
}

- (void)_queue_startMonitoringDateRelevantContexts:(id)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  double v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ATXRSRelevanceMonitor _earliestFutureDateAmongDateRelevantContexts:](self, "_earliestFutureDateAmongDateRelevantContexts:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_relevant_shortcut();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: scheduling refresh at %{public}@", buf, 0xCu);
    }

    v5 = xpc_dictionary_create(0, 0, 0);
    v7 = (const char *)*MEMORY[0x1E0C80760];
    objc_msgSend(v4, "timeIntervalSinceNow");
    xpc_dictionary_set_int64(v5, v7, (uint64_t)v8);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80790], 300);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808B8], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__ATXRSRelevanceMonitor__queue_startMonitoringDateRelevantContexts___block_invoke;
    v9[3] = &unk_1E82DA770;
    v9[4] = self;
    atxRegisterCTSJobHandler("com.apple.duetexpertd.INDateRelevance", v5, v9);
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: not scheduling refresh because all date relevance providers are expired", buf, 2u);
  }

}

uint64_t __68__ATXRSRelevanceMonitor__queue_startMonitoringDateRelevantContexts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coalescedRefreshCurrentlyRelevantCandidates");
}

- (void)_queue_startMonitoringModeChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BMBiomeScheduler *v7;
  BMBiomeScheduler *computedModeScheduler;
  void *v9;
  uint64_t v10;
  BPSSink *v11;
  BPSSink *computedModeSink;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BMBiomeScheduler *v17;
  BMBiomeScheduler *inferredModeScheduler;
  void *v19;
  BPSSink *v20;
  BPSSink *inferredModeSink;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  objc_initWeak(&location, self);
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UserFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ComputedMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "atx_DSLPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.proactive.ATXRSRelevanceMonitor.ComputedMode"), self->_queue);
  computedModeScheduler = self->_computedModeScheduler;
  self->_computedModeScheduler = v7;

  objc_msgSend(v6, "subscribeOn:", self->_computedModeScheduler);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_24;
  v24[3] = &unk_1E82DE280;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_149, v24);
  v11 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  computedModeSink = self->_computedModeSink;
  self->_computedModeSink = v11;

  BiomeLibrary();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UserFocus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "InferredMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "atx_DSLPublisher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.proactive.ATXRSRelevanceMonitor.InferredMode"), self->_queue);
  inferredModeScheduler = self->_inferredModeScheduler;
  self->_inferredModeScheduler = v17;

  objc_msgSend(v16, "subscribeOn:", self->_inferredModeScheduler);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_30;
  v22[3] = &unk_1E82DE280;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v19, "sinkWithCompletion:receiveInput:", &__block_literal_global_29_2, v22);
  v20 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  inferredModeSink = self->_inferredModeSink;
  self->_inferredModeSink = v20;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&location);
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_relevant_shortcut();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_cold_1(v2);

  }
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  __atxlog_handle_relevant_shortcut();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: new event in computed mode stream, refreshing candidates", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_coalescedRefreshCurrentlyRelevantCandidates");

}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_relevant_shortcut();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_28_cold_1(v2);

  }
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  __atxlog_handle_relevant_shortcut();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: new event in inferred mode stream, refreshing candidates", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_coalescedRefreshCurrentlyRelevantCandidates");

}

- (id)_earliestFutureDateAmongDateRelevantContexts:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v7)
  {

LABEL_15:
    v22 = 0;
    v21 = v5;
    goto LABEL_16;
  }
  v8 = v7;
  v9 = *(_QWORD *)v25;
  v10 = v5;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v12, "startDate", (_QWORD)v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      v15 = v14;

      if (v15 > 0.0)
      {
        objc_msgSend(v12, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "earlierDate:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v17;
      }
      -[ATXRSRelevanceMonitor _nonnullEndDateOfDateRelevantContext:](self, "_nonnullEndDateOfDateRelevantContext:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceNow");
      if (v19 > 0.0)
      {
        objc_msgSend(v10, "earlierDate:", v18);
        v20 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v20;
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v8);

  if (v10 == v5)
    goto LABEL_15;
  v21 = v10;
  v22 = v21;
LABEL_16:

  return v22;
}

- (id)_nonnullEndDateOfDateRelevantContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dateByAddingTimeInterval:", 1800.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6;
  }

  return v5;
}

- (BOOL)_isDateRelevantContextSatisfied:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  void *v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  if (v7 <= 0.0)
  {
    -[ATXRSRelevanceMonitor _nonnullEndDateOfDateRelevantContext:](self, "_nonnullEndDateOfDateRelevantContext:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v8 = v10 > 0.0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isBehavioralRelevanceSatisfiedForCandidate:(id)a3 currentMode:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  BOOL v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "donationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:](ATXRSWidgetSuggestionProducer, "replacementContainerBundleIdForDonationBundleId:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v11 = (void *)objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v11, "doubleForKey:", CFSTR("ATXModeRelevanceScoreThresholdOverride"));
  v40 = v11;
  if (v12 == 0.0)
  {
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scoreThresholdForBehavioralModeRelevance");
    v15 = v14;

  }
  else
  {
    v15 = v12;
  }
  v16 = objc_alloc(MEMORY[0x1E0CF8F58]);
  +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithModeEntityScorerClient:", v17);

  objc_msgSend(v18, "rankedAppsForMode:", a4);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
LABEL_9:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v23);
      objc_msgSend(v24, "bundleId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v9);

      if (v26)
        break;
      if (v21 == ++v23)
      {
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v21)
          goto LABEL_9;
        goto LABEL_15;
      }
    }
    objc_msgSend(v24, "scoreMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "score");
    v32 = v31;

    __atxlog_handle_relevant_shortcut();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    v28 = v32 > v15;
    if (v32 <= v15)
    {
      v29 = v40;
      if (v34)
      {
        objc_msgSend(v24, "scoreMetadata");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "score");
        *(_DWORD *)buf = 134218242;
        v46 = v38;
        v47 = 2112;
        v48 = v9;
        v37 = "ATXRSRelevanceMonitor: score of %f is below threshold for candidate bundleId %@";
        goto LABEL_23;
      }
    }
    else
    {
      v29 = v40;
      if (v34)
      {
        objc_msgSend(v24, "scoreMetadata");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "score");
        *(_DWORD *)buf = 134218242;
        v46 = v36;
        v47 = 2112;
        v48 = v9;
        v37 = "ATXRSRelevanceMonitor: score of %f is above threshold for candidate bundleId %@";
LABEL_23:
        _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, v37, buf, 0x16u);

      }
    }

    v27 = v19;
    goto LABEL_25;
  }
LABEL_15:

  __atxlog_handle_relevant_shortcut();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v9;
    _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: candidate bundleId was not found in ranked entities list: %@", buf, 0xCu);
  }
  v28 = 0;
  v29 = v40;
LABEL_25:

  return v28;
}

- (ATXRSRelevanceMonitorDelegate)delegate
{
  return (ATXRSRelevanceMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inferredModeSink, 0);
  objc_storeStrong((id *)&self->_inferredModeScheduler, 0);
  objc_storeStrong((id *)&self->_computedModeSink, 0);
  objc_storeStrong((id *)&self->_computedModeScheduler, 0);
  objc_storeStrong((id *)&self->_coalescedRefreshCurrentlyRelevantCandidatesOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_candidates, 0);
}

void __29__ATXRSRelevanceMonitor_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXRSRelevanceMonitor: couldn't perform update operation because swelf is nil", v1, 2u);
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXRSRelevanceMonitor: error subscribing to computed mode stream: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_28_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "ATXRSRelevanceMonitor: error subscribing to inferred mode stream: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
