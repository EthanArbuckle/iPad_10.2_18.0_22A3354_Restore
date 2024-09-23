@implementation _CDPeopleSuggester

+ (id)peopleSuggesterWithDirectDBAccess
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  _CDPeopleSuggester *v9;

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[_CDPeopleSuggester peopleSuggesterWithDirectDBAccess].cold.3();

  +[_CDInteractionStore defaultDatabaseDirectory](_CDInteractionStore, "defaultDatabaseDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "openAndCheckIfReadable");
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      +[_CDPeopleSuggester peopleSuggesterWithDirectDBAccess].cold.1();
  }
  else if (v7)
  {
    +[_CDPeopleSuggester peopleSuggesterWithDirectDBAccess].cold.2();
  }

  +[_CDInteractionAdviceEngine interactionAdviceEngineWithStore:](_CDInteractionAdviceEngine, "interactionAdviceEngineWithStore:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_CDPeopleSuggester initWithAdvisor:]([_CDPeopleSuggester alloc], "initWithAdvisor:", v8);

  return v9;
}

+ (id)peopleSuggesterUsingDaemon
{
  NSObject *v2;

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[_CDPeopleSuggester peopleSuggesterUsingDaemon].cold.1();

  return objc_alloc_init(_CDPeopleSuggester);
}

- (_CDPeopleSuggester)init
{
  void *v3;
  _CDPeopleSuggester *v4;

  +[_CDInteractionAdvisor sharedInteractionAdvisor](_CDInteractionAdvisor, "sharedInteractionAdvisor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_CDPeopleSuggester initWithAdvisor:](self, "initWithAdvisor:", v3);

  return v4;
}

- (_CDPeopleSuggester)initWithAdvisor:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_CDPeopleSuggester;
  v6 = -[_CDPeopleSuggester init](&v23, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.coreduet.people.suggest", v7);
    v9 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v8;

    objc_storeStrong((id *)v6 + 1, a3);
    +[_CDPeopleSuggesterContext currentContext](_CDPeopleSuggesterContext, "currentContext");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v10;

    +[_CDPeopleSuggesterSettings defaultSettings](_CDPeopleSuggesterSettings, "defaultSettings");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v12;

    v14 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = 0;

    *((_BYTE *)v6 + 44) = 1;
    *((_QWORD *)v6 + 8) = 0x403E000000000000;
    v15 = objc_opt_new();
    v16 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v15;

    objc_msgSend(v6, "updateSettings");
    objc_initWeak(&location, v6);
    v17 = (const char *)objc_msgSend(CFSTR("com.apple.coreduet.CDPeopleSettingsDidChange"), "UTF8String");
    v18 = *((_QWORD *)v6 + 2);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __38___CDPeopleSuggester_initWithAdvisor___block_invoke;
    v20[3] = &unk_1E26E4DC0;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v17, (int *)v6 + 10, v18, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return (_CDPeopleSuggester *)v6;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_settingsNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_CDPeopleSuggester;
  -[_CDPeopleSuggester dealloc](&v3, sel_dealloc);
}

- (void)invalidateCache
{
  _CDCachedPeopleSuggestion *cache;
  _CDPeopleSuggester *obj;

  obj = self;
  objc_sync_enter(obj);
  cache = obj->_cache;
  obj->_cache = 0;

  objc_sync_exit(obj);
}

- (BOOL)enableCaching
{
  _CDPeopleSuggester *v2;
  BOOL enableCaching;

  v2 = self;
  objc_sync_enter(v2);
  enableCaching = v2->_enableCaching;
  objc_sync_exit(v2);

  return enableCaching;
}

- (void)setEnableCaching:(BOOL)a3
{
  _CDPeopleSuggester *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_enableCaching = a3;
  if (!a3)
    -[_CDPeopleSuggester invalidateCache](obj, "invalidateCache");
  objc_sync_exit(obj);

}

- (void)updateSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  objc_msgSend(v9, "valueForKey:", CFSTR("com.apple.coreduet.peoplePrediction.heuristic.nearbyPeople"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) == 0)
  {
    -[_CDPeopleSuggester context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNearbyPeople:", 0);

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("com.apple.coreduet.peoplePrediction.heuristic.activeInteraction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {
    -[_CDPeopleSuggester context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveInteraction:", 0);

  }
}

- (void)suggestPeopleWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  os_activity_scope_state_s state;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    v5 = _os_activity_create(&dword_18DDBE000, "Duet: suggestPeople async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);

    +[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SuggestPeopleAsync", " enableTelemetry=YES ", (uint8_t *)&state, 2u);
    }

    v7 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57___CDPeopleSuggester_suggestPeopleWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E26E2FC0;
    v13[4] = self;
    v14 = v4;
    v9 = v13;
    v10 = queue;
    v11 = (void *)os_transaction_create();
    state.opaque[0] = v7;
    state.opaque[1] = 3221225472;
    v16 = __cd_dispatch_async_capture_tx_block_invoke_5;
    v17 = &unk_1E26E3380;
    v18 = v11;
    v19 = v9;
    v12 = v11;
    dispatch_async(v10, &state);

  }
}

- (id)suggestPeopleWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  _CDPeopleSuggester *v6;
  _CDCachedPeopleSuggestion *cache;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _CDAdvisedInteraction *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  char v33;
  _CDSuggestedPerson *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  double v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  uint64_t v67;
  _CDSuggestedPerson *v68;
  _CDAdvisedInteraction *v69;
  void *v70;
  void *v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  _CDCachedPeopleSuggestion *v83;
  _CDCachedPeopleSuggestion *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  void *v91;
  void *v92;
  void *v93;
  _CDPeopleSuggester *v94;
  void *v95;
  void *v96;
  id obj;
  void *v98;
  void *v99;
  void *v100;
  unint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _CDAdvisedInteraction *v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  void *v127;
  _BYTE v128[128];
  os_activity_scope_state_s state;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18DDBE000, "Duet: suggestPeople sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_CDPeopleSuggester suggestPeopleWithError:].cold.4(self, v5);

  v6 = self;
  objc_sync_enter(v6);
  v94 = v6;
  if (v6->_enableCaching)
  {
    cache = v6->_cache;
    if (cache)
    {
      if (-[_CDCachedPeopleSuggestion isValidForContext:settings:timeoutSeconds:](cache, "isValidForContext:settings:timeoutSeconds:", v6->_context, v6->_settings, v6->_cacheTimeoutSeconds))
      {
        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[_CDPeopleSuggester suggestPeopleWithError:].cold.2();

        +[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          LOWORD(state.opaque[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_18DDBE000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PeopleSuggester", "Early-out: Cache hit enableTelemetry=YES ", (uint8_t *)&state, 2u);
        }

        -[_CDCachedPeopleSuggestion suggestions](v94->_cache, "suggestions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_87;
      }
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_CDPeopleSuggester suggestPeopleWithError:].cold.3();

      +[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v12))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_18DDBE000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PeopleSuggester", "Cache miss enableTelemetry=YES ", (uint8_t *)&state, 2u);
      }

    }
  }
  +[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SuggestPeople", " enableTelemetry=YES ", (uint8_t *)&state, 2u);
  }

  -[_CDPeopleSuggester context](v94, "context");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPeopleSuggester settings](v94, "settings");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "createAdvisorSettingsFromContext:settings:", v93, v96);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvising adviseInteractionsUsingSettings:](v94->_advisor, "adviseInteractionsUsingSettings:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v16 = objc_opt_new();
  v99 = (void *)objc_opt_new();
  v98 = (void *)v16;
  -[_CDPeopleSuggester context](v94, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activeInteraction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_alloc_init(_CDAdvisedInteraction);
    -[_CDPeopleSuggester context](v94, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activeInteraction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "recipients");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDAdvisedInteraction setContact:](v19, "setContact:", v23);

    objc_msgSend(v21, "account");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDAdvisedInteraction setAccount:](v19, "setAccount:", v24);

    objc_msgSend(v21, "bundleId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDAdvisedInteraction setBundleId:](v19, "setBundleId:", v25);

    -[_CDAdvisedInteraction setMechanism:](v19, "setMechanism:", objc_msgSend(v21, "mechanism"));
    -[_CDAdvisedInteraction setScore:](v19, "setScore:", INFINITY);
    -[_CDAdvisedInteraction addReason:](v19, "addReason:", 9);
    objc_msgSend(v15, "insertObject:atIndex:", v19, 0);
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[_CDPeopleSuggester suggestPeopleWithError:].cold.1();

    v101 = 1;
  }
  else
  {
    v101 = 0;
  }
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = v15;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v128, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v119;
    v29 = 1;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v119 != v28)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        objc_msgSend(v31, "contact");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v99, "containsObject:", v32);

        if ((v33 & 1) == 0)
        {
          v34 = objc_alloc_init(_CDSuggestedPerson);
          objc_msgSend(v31, "score");
          -[_CDSuggestedPerson setScore:](v34, "setScore:");
          -[_CDSuggestedPerson setRank:](v34, "setRank:", (double)v29);
          v127 = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDSuggestedPerson setInteractions:](v34, "setInteractions:", v35);

          objc_msgSend(v31, "contact");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDSuggestedPerson setContact:](v34, "setContact:", v36);

          objc_msgSend(v31, "bundleId");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDSuggestedPerson setInteractionBundleID:](v34, "setInteractionBundleID:", v37);

          objc_msgSend(v98, "addObject:", v34);
          -[_CDSuggestedPerson contact](v34, "contact");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addObject:", v38);

          v39 = objc_msgSend(v98, "count");
          LOBYTE(v39) = v39 == objc_msgSend(v96, "maxNumberOfPeopleSuggested");

          if ((v39 & 1) != 0)
            goto LABEL_33;
          ++v29;
        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v128, 16);
    }
    while (v27);
  }
LABEL_33:

  v100 = (void *)objc_opt_new();
  -[_CDPeopleSuggester context](v94, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "nearbyPeople");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  if (v42)
  {
    -[_CDPeopleSuggester context](v94, "context");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "nearbyPeople");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)objc_msgSend(v44, "mutableCopy");

    v95 = (void *)objc_msgSend(v92, "mutableCopy");
    v45 = v98;
    objc_msgSend(v95, "intersectSet:", v99);
    if (objc_msgSend(v95, "count"))
    {
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v46 = v98;
      v47 = 0;
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v115;
        while (2)
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v115 != v49)
              objc_enumerationMutation(v46);
            v51 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
            objc_msgSend(v51, "contact");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v95, "containsObject:", v52);

            if (!v53)
              goto LABEL_50;
            objc_msgSend(v51, "contact");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "removeObject:", v54);

            v112 = 0u;
            v113 = 0u;
            v110 = 0u;
            v111 = 0u;
            objc_msgSend(v51, "interactions");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
            if (v56)
            {
              v57 = *(_QWORD *)v111;
              do
              {
                for (k = 0; k != v56; ++k)
                {
                  if (*(_QWORD *)v111 != v57)
                    objc_enumerationMutation(v55);
                  objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * k), "addReason:", 10);
                }
                v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
              }
              while (v56);
            }

            objc_msgSend(v51, "rank");
            if (v59 > (double)v101)
            {
              objc_msgSend(v100, "insertObject:atIndex:", v51, v101++);
              v47 = 1;
            }
            else
            {
LABEL_50:
              objc_msgSend(v100, "addObject:", v51);
            }
            if (!objc_msgSend(v95, "count"))
            {
              v60 = objc_msgSend(v46, "indexOfObject:", v51);
              objc_msgSend(v46, "subarrayWithRange:", v60 + 1, objc_msgSend(v46, "count") - (v60 + 1));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "addObjectsFromArray:", v61);

              goto LABEL_57;
            }
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
          if (v48)
            continue;
          break;
        }
      }
LABEL_57:

      v45 = v98;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v92, "minusSet:", v99);
    if (objc_msgSend(v92, "count"))
    {
      if ((v47 & 1) == 0)
      {
        v62 = v45;

        v100 = v62;
      }
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v63 = v92;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
      if (v64)
      {
        v65 = *(_QWORD *)v107;
        do
        {
          for (m = 0; m != v64; ++m)
          {
            if (*(_QWORD *)v107 != v65)
              objc_enumerationMutation(v63);
            v67 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * m);
            v68 = objc_alloc_init(_CDSuggestedPerson);
            -[_CDSuggestedPerson setContact:](v68, "setContact:", v67);
            -[_CDSuggestedPerson setInteractionBundleID:](v68, "setInteractionBundleID:", 0);
            v69 = objc_alloc_init(_CDAdvisedInteraction);
            -[_CDAdvisedInteraction setContact:](v69, "setContact:", v67);
            -[_CDSuggestedPerson interactionBundleID](v68, "interactionBundleID");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDAdvisedInteraction setBundleId:](v69, "setBundleId:", v70);

            -[_CDSuggestedPerson score](v68, "score");
            -[_CDAdvisedInteraction setScore:](v69, "setScore:");
            -[_CDAdvisedInteraction addReason:](v69, "addReason:", 10);
            v123 = v69;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDSuggestedPerson setInteractions:](v68, "setInteractions:", v71);

            objc_msgSend(v100, "insertObject:atIndex:", v68, v101 + m);
          }
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
          v101 += m;
        }
        while (v64);
      }

      goto LABEL_71;
    }

    if ((v47 & 1) != 0)
    {
LABEL_71:
      v73 = objc_msgSend(v100, "count");
      v74 = objc_msgSend(v96, "maxNumberOfPeopleSuggested");
      if (v73 >= v74)
        v75 = v74;
      else
        v75 = v73;
      objc_msgSend(v100, "subarrayWithRange:", 0, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)objc_msgSend(v76, "mutableCopy");

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v78 = v77;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v102, v122, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v103;
        v81 = 1;
        do
        {
          for (n = 0; n != v79; ++n)
          {
            if (*(_QWORD *)v103 != v80)
              objc_enumerationMutation(v78);
            objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * n), "setRank:", (double)(unint64_t)(v81 + n));
          }
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v102, v122, 16);
          v81 += n;
        }
        while (v79);
      }
      v72 = v78;

      goto LABEL_82;
    }
  }
  v72 = v98;
LABEL_82:
  v10 = (void *)objc_msgSend(v72, "copy");

  if (v94->_enableCaching)
  {
    v83 = objc_alloc_init(_CDCachedPeopleSuggestion);
    v84 = v94->_cache;
    v94->_cache = v83;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDCachedPeopleSuggestion setDate:](v94->_cache, "setDate:", v85);

    v86 = (void *)objc_msgSend(v93, "copy");
    -[_CDCachedPeopleSuggestion setContext:](v94->_cache, "setContext:", v86);

    v87 = (void *)objc_msgSend(v96, "copy");
    -[_CDCachedPeopleSuggestion setSettings:](v94->_cache, "setSettings:", v87);

    -[_CDCachedPeopleSuggestion setSuggestions:](v94->_cache, "setSuggestions:", v10);
  }
  +[_CDLogging interactionSignpost](_CDLogging, "interactionSignpost");
  v88 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v88))
  {
    v89 = objc_msgSend(v10, "count");
    LODWORD(state.opaque[0]) = 134349056;
    *(uint64_t *)((char *)state.opaque + 4) = v89;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v88, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SuggestPeople", "SuggestionsCount=%{signpost.telemetry:number1,public}lu", (uint8_t *)&state, 0xCu);
  }

LABEL_87:
  objc_sync_exit(v94);

  return v10;
}

+ (id)restrictedPrefixForPrefix:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") != 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createAdvisorSettingsFromContext:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault](_CDInteractionAdvisorSettings, "interactionAdvisorSettingsDefault");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInteractionDate:", v9);

  objc_msgSend(v6, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInteractionTitle:", v10);

  objc_msgSend(v6, "seedContactIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSeedIdentifiers:", v11);

  objc_msgSend(v6, "locationUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInteractionLocationUUID:", v12);

  objc_msgSend(v6, "contactPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "restrictedPrefixForPrefix:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContactPrefix:", v14);

  objc_msgSend(v7, "constrainMechanisms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstrainMechanisms:", v15);

  objc_msgSend(v7, "constrainAccounts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstrainAccounts:", v16);

  objc_msgSend(v7, "constrainBundleIds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstrainBundleIds:", v17);

  objc_msgSend(v7, "constrainDomainIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstrainDomainIdentifiers:", v18);

  objc_msgSend(v8, "setResultLimit:", objc_msgSend(v7, "maxNumberOfPeopleSuggested"));
  objc_msgSend(v7, "constrainIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstrainIdentifiers:", v19);

  objc_msgSend(v7, "constrainPersonIds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstrainPersonIds:", v20);

  objc_msgSend(v7, "constrainPersonIdType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstrainPersonIdType:", v21);

  objc_msgSend(v7, "ignoreContactIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIgnoreContactIdentifiers:", v22);

  objc_msgSend(v8, "setUseFuture:", objc_msgSend(v7, "useFuture"));
  objc_msgSend(v8, "setAggregateByIdentifier:", objc_msgSend(v7, "aggregateByIdentifier"));
  objc_msgSend(v8, "setRequireOutgoingInteraction:", objc_msgSend(v7, "requireOutgoingInteraction"));
  objc_msgSend(v8, "setConstrainMaxRecipientCount:", objc_msgSend(v7, "constrainMaxRecipientCount"));
  objc_msgSend(v6, "consumerIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConsumerIdentifier:", v23);

  LODWORD(v23) = objc_msgSend(v7, "useTitleToContrainKeywords");
  if ((_DWORD)v23)
  {
    objc_msgSend(v6, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v6, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDStringTokenizer extractNormalizedKeywords:](_CDStringTokenizer, "extractNormalizedKeywords:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setConstrainKeywords:", v26);

    }
  }

  return v8;
}

+ (id)loggingTagForAutocompleteFeedback
{
  return CFSTR("Model0");
}

- (_CDPeopleSuggesterContext)context
{
  return (_CDPeopleSuggesterContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (_CDPeopleSuggesterSettings)settings
{
  return (_CDPeopleSuggesterSettings *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (double)cacheTimeoutSeconds
{
  return self->_cacheTimeoutSeconds;
}

- (void)setCacheTimeoutSeconds:(double)a3
{
  self->_cacheTimeoutSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_advisor, 0);
}

+ (void)peopleSuggesterWithDirectDBAccess
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Creating _CDPeopleSuggester with direct access", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)peopleSuggesterUsingDaemon
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Creating _CDPeopleSuggester using coreduetd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)suggestPeopleWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "_CDPeopleSuggester: Prioritizing active interaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)suggestPeopleWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "_CDPeopleSuggester: Using cached results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)suggestPeopleWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "_CDPeopleSuggester: Cache miss", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)suggestPeopleWithError:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "_CDPeopleSuggester:suggestPeopleWithError. context: %@, settings: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
