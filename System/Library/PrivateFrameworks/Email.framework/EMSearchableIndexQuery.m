@implementation EMSearchableIndexQuery

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__EMSearchableIndexQuery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_36 != -1)
    dispatch_once(&log_onceToken_36, block);
  return (OS_os_log *)(id)log_log_36;
}

void __29__EMSearchableIndexQuery_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_36;
  log_log_36 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EMSearchableIndexQuery_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_3 != -1)
    dispatch_once(&signpostLog_onceToken_3, block);
  return (OS_os_log *)(id)signpostLog_log_3;
}

void __37__EMSearchableIndexQuery_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_3;
  signpostLog_log_3 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (double)intervalForSpotlightFailureSimulation
{
  if (intervalForSpotlightFailureSimulation_onceToken != -1)
    dispatch_once(&intervalForSpotlightFailureSimulation_onceToken, &__block_literal_global_45);
  return *(double *)&intervalForSpotlightFailureSimulation_intervalForSpotlightFailureSimulation;
}

void __63__EMSearchableIndexQuery_intervalForSpotlightFailureSimulation__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("kSearchableIndexQueryKeyIntervalForSpotlightFailureSimulation"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    intervalForSpotlightFailureSimulation_intervalForSpotlightFailureSimulation = v2;
    v1 = v3;
  }

}

+ (id)queryWithExpression:(id)a3 builder:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExpression:builder:", v6, v7);

  return v8;
}

- (EMSearchableIndexQuery)init
{
  -[EMSearchableIndexQuery doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMSearchableIndexQuery init]", "EMSearchableIndexQuery.m", 99, "0");
}

- (NSString)logPrefixString
{
  NSString *logPrefixString;
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  logPrefixString = self->_logPrefixString;
  if (!logPrefixString)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EMSearchableIndexQuery logIdentifier](self, "logIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@<%@: %p>"), v5, objc_opt_class(), self);
    v7 = self->_logPrefixString;
    self->_logPrefixString = v6;

    logPrefixString = self->_logPrefixString;
  }
  return logPrefixString;
}

- (EMSearchableIndexQuery)initWithExpression:(id)a3 builder:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  EMSearchableIndexQuery *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__EMSearchableIndexQuery_initWithExpression_builder___block_invoke;
  v13[3] = &unk_1E70F5B00;
  v8 = v6;
  v14 = v8;
  v9 = (void *)MEMORY[0x1BCCC8C10](v13);
  v10 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  v11 = -[EMSearchableIndexQuery initWithExpression:builder:queryContext:querySetup:](self, "initWithExpression:builder:queryContext:querySetup:", v8, v7, v10, v9);

  return v11;
}

id __53__EMSearchableIndexQuery_initWithExpression_builder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CA6B28]);
  objc_msgSend(*(id *)(a1 + 32), "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithQueryString:context:", v5, v3);

  return v6;
}

- (EMSearchableIndexQuery)initWithExpression:(id)a3 builder:(id)a4 queryContext:(id)a5 querySetup:(id)a6
{
  void (**v10)(id, EMSearchableIndexQuery *);
  id v11;
  id v12;
  EMSearchableIndexQuery *v13;
  EMSearchableIndexQuery *v14;
  NSString *logIdentifier;
  NSLock *v16;
  NSLock *lock;
  EFPromise *v18;
  EFPromise *resultsPromise;
  NSString *queryStatus;
  uint64_t v21;
  NSProgress *progress;
  uint64_t v23;
  NSProgress *internalProgress;
  os_activity_t v25;
  OS_os_activity *activity;
  double v27;
  uint64_t v28;
  dispatch_time_t v29;
  void *v30;
  EMSearchableIndexQuery *v31;
  void *v32;
  void *v33;
  EMSearchableIndexQuery *v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v72;
  void (**v73)(_QWORD, _QWORD);
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  id location;
  _QWORD v93[4];
  id *v94;
  id v95;
  _QWORD v96[4];
  EMSearchableIndexQuery *v97;
  id v98;
  _QWORD v99[4];
  EMSearchableIndexQuery *v100;
  id v101;
  _QWORD block[4];
  EMSearchableIndexQuery *v103;
  objc_super v104;
  uint8_t buf[4];
  void *v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[3];

  v109[1] = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v10 = (void (**)(id, EMSearchableIndexQuery *))a4;
  v11 = a5;
  v12 = a6;
  v73 = (void (**)(_QWORD, _QWORD))v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMSearchableIndexQuery.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builder"));

    if (v73)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMSearchableIndexQuery.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("querySetup"));

LABEL_3:
  v104.receiver = self;
  v104.super_class = (Class)EMSearchableIndexQuery;
  v13 = -[EMSearchableIndexQuery init](&v104, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_41;
  logIdentifier = v13->_logIdentifier;
  v13->_logIdentifier = (NSString *)&stru_1E70F6E90;

  v10[2](v10, v14);
  v16 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  lock = v14->_lock;
  v14->_lock = v16;

  v18 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
  resultsPromise = v14->_resultsPromise;
  v14->_resultsPromise = v18;

  queryStatus = v14->_queryStatus;
  v14->_queryStatus = (NSString *)CFSTR("not started");

  v14->_count = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v21 = objc_claimAutoreleasedReturnValue();
  progress = v14->_progress;
  v14->_progress = (NSProgress *)v21;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
  v23 = objc_claimAutoreleasedReturnValue();
  internalProgress = v14->_internalProgress;
  v14->_internalProgress = (NSProgress *)v23;

  -[NSProgress addChild:withPendingUnitCount:](v14->_progress, "addChild:withPendingUnitCount:", v14->_internalProgress, 1);
  v25 = _os_activity_create(&dword_1B99BB000, "Spotlight search query", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  activity = v14->activity;
  v14->activity = (OS_os_activity *)v25;

  objc_msgSend((id)objc_opt_class(), "intervalForSpotlightFailureSimulation");
  v28 = MEMORY[0x1E0C809B0];
  if (v27 > 0.0)
  {
    v29 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
    block[0] = v28;
    block[1] = 3221225472;
    block[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke;
    block[3] = &unk_1E70F1FA0;
    v103 = v14;
    dispatch_after(v29, MEMORY[0x1E0C80D38], block);

  }
  -[EMSearchableIndexQuery resultsBlock](v14, "resultsBlock");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v30;
  if (v30)
  {
    v99[0] = v28;
    v99[1] = 3221225472;
    v99[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2;
    v99[3] = &unk_1E70F5B28;
    v101 = v30;
    v31 = v14;
    v100 = v31;
    v32 = (void *)MEMORY[0x1BCCC8C10](v99);
    -[EMSearchableIndexQuery setResultsBlock:](v31, "setResultsBlock:", v32);

  }
  -[EMSearchableIndexQuery completionBlock](v14, "completionBlock");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFPromise future](v14->_resultsPromise, "future");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v28;
  v96[1] = 3221225472;
  v96[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3;
  v96[3] = &unk_1E70F5B50;
  v34 = v14;
  v97 = v34;
  v67 = v70;
  v98 = v67;
  objc_msgSend(v33, "addSuccessBlock:", v96);

  -[EMSearchableIndexQuery setCompletionBlock:](v34, "setCompletionBlock:", 0);
  -[EMSearchableIndexQuery failureBlock](v34, "failureBlock");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFPromise future](v14->_resultsPromise, "future");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v28;
  v93[1] = 3221225472;
  v93[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4;
  v93[3] = &unk_1E70F4ED8;
  v36 = v34;
  v94 = v36;
  v66 = v69;
  v95 = v66;
  objc_msgSend(v35, "addFailureBlock:", v93);

  objc_msgSend(v36, "setFailureBlock:", 0);
  objc_msgSend(v36, "setExpression:", v72);
  objc_msgSend(v36, "fetchAttributes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchAttributes:", v37);

  objc_msgSend(v36, "setFetchAttributes:", 0);
  objc_msgSend(v36, "rankingQueries");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRankingQueries:", v38);

  objc_msgSend(v36, "setRankingQueries:", 0);
  objc_msgSend(v11, "setLive:", objc_msgSend(v36, "live"));
  objc_msgSend(v11, "setCounting:", objc_msgSend(v36, "counting"));
  objc_msgSend(v36, "bundleID");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  if (v39)
  {
    v109[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  objc_msgSend(v11, "setBundleIDs:", v41);
  if (v40)

  objc_msgSend(v11, "setAttribute:", objc_msgSend(v36, "attribute"));
  objc_msgSend(v11, "setMaxCount:", objc_msgSend(v36, "maxCount"));
  objc_msgSend(v36, "protectionClasses");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v36, "protectionClasses");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProtectionClasses:", v43);

    objc_msgSend(v36, "setProtectionClasses:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isAppleSilicon");

    if (v45)
    {
      v108 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
    }
    else
    {
      v107 = *MEMORY[0x1E0CB2AB0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProtectionClasses:", v46);

  }
  ((void (**)(_QWORD, id))v73)[2](v73, v11);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setQuery:", v47);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v36);
  v90[0] = v28;
  v90[1] = 3221225472;
  v90[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5;
  v90[3] = &unk_1E70F1F78;
  objc_copyWeak(&v91, &location);
  -[NSProgress setCancellationHandler:](v14->_internalProgress, "setCancellationHandler:", v90);
  v88[0] = v28;
  v88[1] = 3221225472;
  v88[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_49;
  v88[3] = &unk_1E70F5B78;
  objc_copyWeak(&v89, &location);
  objc_msgSend(v36[22], "setFoundItemsHandler:", v88);
  v86[0] = v28;
  v86[1] = 3221225472;
  v86[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_50;
  v86[3] = &unk_1E70F5BA0;
  objc_copyWeak(&v87, &location);
  objc_msgSend(v36[22], "setCompletionHandler:", v86);
  if (objc_msgSend(v36, "live"))
  {
    v48 = (id)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", -1, v14->_progress, -1);
    v84[0] = v28;
    v84[1] = 3221225472;
    v84[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_51;
    v84[3] = &unk_1E70F1F78;
    objc_copyWeak(&v85, &location);
    objc_msgSend(v36[22], "setGatherEndedHandler:", v84);
    v82[0] = v28;
    v82[1] = 3221225472;
    v82[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4_52;
    v82[3] = &unk_1E70F5B78;
    objc_copyWeak(&v83, &location);
    objc_msgSend(v36[22], "setChangedItemsHandler:", v82);
    v80[0] = v28;
    v80[1] = 3221225472;
    v80[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_53;
    v80[3] = &unk_1E70F5BC8;
    objc_copyWeak(&v81, &location);
    objc_msgSend(v36[22], "setRemovedItemsHandler:", v80);
    if (objc_msgSend(v36, "attribute"))
    {
      +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        -[EMSearchableIndexQuery initWithExpression:builder:queryContext:querySetup:].cold.1(v49);

    }
    objc_destroyWeak(&v81);
    objc_destroyWeak(&v83);
    objc_destroyWeak(&v85);
    goto LABEL_29;
  }
  objc_msgSend(v36, "gatheredBlock");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50 || (objc_msgSend(v36, "removedItemsBlock"), (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_28;
  }
  objc_msgSend(v36, "changedItemsBlock");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 == 0;

  if (!v52)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, v36, CFSTR("EMSearchableIndexQuery.m"), 268, CFSTR("Attempting to add live query related block(s) to a non-live query"));

  }
LABEL_29:
  if (objc_msgSend(v36, "counting"))
  {
    v14->_count = 0;
    v78[0] = v28;
    v78[1] = 3221225472;
    v78[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_57;
    v78[3] = &unk_1E70F5BF0;
    objc_copyWeak(&v79, &location);
    objc_msgSend(v36[22], "setCountChangedHandler:", v78);
    objc_destroyWeak(&v79);
  }
  else
  {
    objc_msgSend(v36, "countChangedBlock");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54 == 0;

    if (!v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, v36, CFSTR("EMSearchableIndexQuery.m"), 278, CFSTR("Attempting to add count changed related block to a non-counting query"));

    }
  }
  if (objc_msgSend(v36, "attribute"))
  {
    v76[0] = v28;
    v76[1] = 3221225472;
    v76[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_61;
    v76[3] = &unk_1E70F5BC8;
    objc_copyWeak(&v77, &location);
    objc_msgSend(v36[22], "setFoundAttributesHandler:", v76);
    v74[0] = v28;
    v74[1] = 3221225472;
    v74[2] = __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_62;
    v74[3] = &unk_1E70F5BC8;
    objc_copyWeak(&v75, &location);
    objc_msgSend(v36[22], "setChangedAttributesHandler:", v74);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
  }
  else
  {
    objc_msgSend(v36, "foundAttributeResultsBlock");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v36, "changedAttributeResultsBlock");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57 == 0;

      if (!v58)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, v36, CFSTR("EMSearchableIndexQuery.m"), 293, CFSTR("Attempting to add attribute results block to a non-attribute query"));

      }
    }
  }
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v36, "description");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v106 = v61;
    _os_log_impl(&dword_1B99BB000, v60, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&v91);
  objc_destroyWeak(&location);

LABEL_41:
  return v14;
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("This is a simulated failure"), -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_searchQueryDidFailWithError:");

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (id)objc_opt_self();

}

uint64_t __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_removeResultsBlock");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removeResultsBlock");
  objc_msgSend(*(id *)(a1 + 32), "_removeAllLiveUpdatesBlocks");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "logPrefixString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_cold_1(v3, v4, v2);
  }

  objc_msgSend(WeakRetained, "_cancel");
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_49(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_searchQueryDidFindItems:", v3);

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_50(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(WeakRetained, "simulatedFailedQueryError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "simulatedFailedQueryError");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  v7 = objc_msgSend(WeakRetained, "live");
  if (v5)
    v8 = 0;
  else
    v8 = v7;
  v9 = v5;
  if (v8 == 1)
  {
    if (objc_msgSend(WeakRetained, "liveQueryDidGather"))
      objc_msgSend(MEMORY[0x1E0CB35C8], "ef_connectionInterruptedError");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "ef_temporarilyUnavailableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9)
    objc_msgSend(WeakRetained, "_searchQueryDidFailWithError:", v9);
  else
    objc_msgSend(WeakRetained, "_searchQueryDidComplete");

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_51(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_searchQueryGatherDidEnd");

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_4_52(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_searchQueryDidChangeItems:", v3);

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_53(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_searchQueryDidRemoveIdentifiers:", v4);

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_57(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_searchQueryDidChangeCount:", a2);

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_2_61(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_searchQueryDidFindAttribute:values:", v6, v5);

}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_3_62(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_searchQueryDidChangeAttribute:values:", v6, v5);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EMSearchableIndexQuery _cancelQuery](self, "_cancelQuery");
  -[EFPromise future](self->_resultsPromise, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)EMSearchableIndexQuery;
  -[EMSearchableIndexQuery dealloc](&v4, sel_dealloc);
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[NSLock lock](self->_lock, "lock");
  -[EMSearchableIndexQuery queryStatus](self, "queryStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQuery gatherEndedHandler](self->_query, "gatherEndedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSSearchQuery countChangedHandler](self->_query, "countChangedHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSSearchQuery countChangedHandler](self->_query, "countChangedHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%ld)"), self->_count);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E70F6E90;
  }

  -[NSLock unlock](self->_lock, "unlock");
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSearchableIndexQueryExpression ef_publicDescription](self->_expression, "ef_publicDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@ - %@ live:%@ counting:%@%@"), v11, v3, v12, v5, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)_isFinishedQueryStatus:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (_isFinishedQueryStatus__onceToken != -1)
    dispatch_once(&_isFinishedQueryStatus__onceToken, &__block_literal_global_71_0);
  v4 = objc_msgSend((id)_isFinishedQueryStatus__finishedQueryStatuses, "containsObject:", v3);

  return v4;
}

void __49__EMSearchableIndexQuery__isFinishedQueryStatus___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("failed");
  v2[1] = CFSTR("gathered");
  v2[2] = CFSTR("completed");
  v2[3] = CFSTR("cancelled");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isFinishedQueryStatus__finishedQueryStatuses;
  _isFinishedQueryStatus__finishedQueryStatuses = v0;

}

- (void)setQueryStatus:(id)a3
{
  NSString *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (NSString *)a3;
  if (self->_queryStatus != v5)
  {
    +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_INFO, "%{public}@ status changed to '%{public}@'", (uint8_t *)&v8, 0x16u);

    }
    objc_storeStrong((id *)&self->_queryStatus, a3);
    if (-[EMSearchableIndexQuery _isFinishedQueryStatus:](self, "_isFinishedQueryStatus:", v5)
      && !-[EMSearchableIndexQuery queryDidMoveToFinishedState](self, "queryDidMoveToFinishedState"))
    {
      -[EMSearchableIndexQuery setQueryDidMoveToFinishedState:](self, "setQueryDidMoveToFinishedState:", 1);
      if (!-[NSString isEqualToString:](self->_queryStatus, "isEqualToString:", CFSTR("gathered")))
        -[NSProgress setCancellationHandler:](self->_internalProgress, "setCancellationHandler:", 0);
      -[EMSearchableIndexQuery _logSignpostForSearchQueryDidFinishWithStatus:](self, "_logSignpostForSearchQueryDidFinishWithStatus:", v5);
    }
  }

}

- (int64_t)count
{
  int64_t count;

  -[NSLock lock](self->_lock, "lock");
  count = self->_count;
  -[NSLock unlock](self->_lock, "unlock");
  return count;
}

- (BOOL)isFinished
{
  void *v2;
  char v3;

  -[EFPromise future](self->_resultsPromise, "future");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  return v3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)_foundItems:(id)a3
{
  void *v4;
  char v5;
  void (**v6)(_QWORD, _QWORD);
  __CFString *v7;
  id v8;

  v8 = a3;
  -[EFPromise future](self->_resultsPromise, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if ((v5 & 1) == 0)
  {
    -[NSLock lock](self->_lock, "lock");
    v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(self->_resultsBlock, "copy");
    -[EMSearchableIndexQuery queryStatus](self, "queryStatus");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v7 != CFSTR("gathering"))
    {
      -[EMSearchableIndexQuery setQueryStatus:](self, "setQueryStatus:", CFSTR("gathering"));
      -[EMSearchableIndexQuery _logSignpostForSearchQueryDidReceiveFirstResultsWithItemCount:](self, "_logSignpostForSearchQueryDidReceiveFirstResultsWithItemCount:", objc_msgSend(v8, "count"));
    }
    -[NSLock unlock](self->_lock, "unlock");
    if (v6)
      ((void (**)(_QWORD, id))v6)[2](v6, v8);

  }
}

- (void)_changedItems:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(self->_changedItemsBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

}

- (void)_removedItems:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(self->_removedItemsBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

}

- (void)_changeCount:(int64_t)a3
{
  void *v5;
  id v6;

  -[NSLock lock](self->_lock, "lock");
  v6 = (id)objc_msgSend(self->_countChangedBlock, "copy");
  -[EMSearchableIndexQuery setCount:](self, "setCount:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(void))v6 + 2))();
    v5 = v6;
  }

}

- (void)_foundAttribute:(id)a3 values:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __CFString *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[EFPromise future](self->_resultsPromise, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFinished");

  if ((v8 & 1) == 0)
  {
    -[NSLock lock](self->_lock, "lock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(self->_foundAttributeResultsBlock, "copy");
    -[EMSearchableIndexQuery queryStatus](self, "queryStatus");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10 != CFSTR("gathering"))
      -[EMSearchableIndexQuery setQueryStatus:](self, "setQueryStatus:", CFSTR("gathering"));
    -[NSLock unlock](self->_lock, "unlock");
    if (v9)
      ((void (**)(_QWORD, id, id))v9)[2](v9, v11, v6);

  }
}

- (void)_changedAttribute:(id)a3 values:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSLock lock](self->_lock, "lock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(self->_changedAttributeResultsBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  if (v7)
    ((void (**)(_QWORD, id, id))v7)[2](v7, v8, v6);

}

- (void)_completed
{
  -[NSLock lock](self->_lock, "lock");
  -[EMSearchableIndexQuery setQueryStatus:](self, "setQueryStatus:", CFSTR("completed"));
  -[NSLock unlock](self->_lock, "unlock");
  -[NSProgress setTotalUnitCount:](self->_internalProgress, "setTotalUnitCount:", -[NSProgress completedUnitCount](self->_internalProgress, "completedUnitCount"));
  -[EFPromise finishWithResult:](self->_resultsPromise, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

- (void)_gathered
{
  id gatheredBlock;
  void (**v4)(void);

  -[NSLock lock](self->_lock, "lock");
  v4 = (void (**)(void))objc_msgSend(self->_gatheredBlock, "copy");
  gatheredBlock = self->_gatheredBlock;
  self->_gatheredBlock = 0;

  -[EMSearchableIndexQuery setQueryStatus:](self, "setQueryStatus:", CFSTR("gathered"));
  -[EMSearchableIndexQuery setLiveQueryDidGather:](self, "setLiveQueryDidGather:", 1);
  -[NSLock unlock](self->_lock, "unlock");
  if (v4)
    v4[2]();

}

- (BOOL)_isCancellationError:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "ef_cancelledError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5F00]))
  {

LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v8 = objc_msgSend(v3, "code");

  if (v8 != -2003)
    goto LABEL_7;
LABEL_2:
  v6 = 1;
LABEL_8:

  return v6;
}

- (void)_failedWithError:(id)a3
{
  _BOOL4 v4;
  const __CFString *v5;
  id v6;

  v6 = a3;
  v4 = -[EMSearchableIndexQuery _isCancellationError:](self, "_isCancellationError:");
  -[NSLock lock](self->_lock, "lock");
  if (v4)
    v5 = CFSTR("cancelled");
  else
    v5 = CFSTR("failed");
  -[EMSearchableIndexQuery setQueryStatus:](self, "setQueryStatus:", v5);
  -[NSLock unlock](self->_lock, "unlock");
  -[EFPromise finishWithError:](self->_resultsPromise, "finishWithError:", v6);

}

- (void)cancel
{
  -[NSProgress cancel](self->_progress, "cancel");
}

- (void)_cancelQuery
{
  -[CSSearchQuery setCompletionHandler:](self->_query, "setCompletionHandler:", 0);
  -[CSSearchQuery setFoundItemHandler:](self->_query, "setFoundItemHandler:", 0);
  -[CSSearchQuery cancel](self->_query, "cancel");
}

- (void)_cancel
{
  id v3;

  -[NSLock lock](self->_lock, "lock");
  -[EMSearchableIndexQuery _cancelQuery](self, "_cancelQuery");
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(MEMORY[0x1E0CB35C8], "ef_cancelledError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EMSearchableIndexQuery _failedWithError:](self, "_failedWithError:");

}

- (BOOL)isCancelled
{
  void *v3;
  char v4;

  -[NSLock lock](self->_lock, "lock");
  -[EMSearchableIndexQuery queryStatus](self, "queryStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("cancelled"));

  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (void)start
{
  os_activity_scope_state_s v3;

  v3.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v3.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter((os_activity_t)self->activity, &v3);
  -[NSLock lock](self->_lock, "lock");
  -[CSSearchQuery start](self->_query, "start");
  -[EMSearchableIndexQuery setQueryStatus:](self, "setQueryStatus:", CFSTR("started"));
  -[EMSearchableIndexQuery _logSignpostForSearchQueryStart](self, "_logSignpostForSearchQueryStart");
  -[NSLock unlock](self->_lock, "unlock");
  os_activity_scope_leave(&v3);
}

- (void)simulateFailedQueryWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[EMSearchableIndexQuery setSimulatedFailedQueryError:](self, "setSimulatedFailedQueryError:");
  -[CSSearchQuery cancel](self->_query, "cancel");

}

- (void)_removeResultsBlock
{
  -[NSLock lock](self->_lock, "lock");
  -[EMSearchableIndexQuery setResultsBlock:](self, "setResultsBlock:", 0);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_removeAllLiveUpdatesBlocks
{
  -[NSLock lock](self->_lock, "lock");
  -[EMSearchableIndexQuery setGatheredBlock:](self, "setGatheredBlock:", 0);
  -[EMSearchableIndexQuery setChangedItemsBlock:](self, "setChangedItemsBlock:", 0);
  -[EMSearchableIndexQuery setCountChangedBlock:](self, "setCountChangedBlock:", 0);
  -[EMSearchableIndexQuery setRemovedItemsBlock:](self, "setRemovedItemsBlock:", 0);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_performClientWork:(id)a3
{
  void (**v3)(void);

  v3 = (void (**)(void))a3;
  v3[2]();

}

- (void)_searchQueryDidFindItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu items", buf, 0x16u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__EMSearchableIndexQuery__searchQueryDidFindItems___block_invoke;
  v8[3] = &unk_1E70F2070;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v8);

}

uint64_t __51__EMSearchableIndexQuery__searchQueryDidFindItems___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_foundItems:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "resignCurrent");
}

- (void)_searchQueryDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexQuery _searchQueryDidFailWithError:].cold.1(v6, v7, buf, v5);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__EMSearchableIndexQuery__searchQueryDidFailWithError___block_invoke;
  v9[3] = &unk_1E70F2070;
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v9);

}

uint64_t __55__EMSearchableIndexQuery__searchQueryDidFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_failedWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_searchQueryDidComplete
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ completed", buf, 0xCu);

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__EMSearchableIndexQuery__searchQueryDidComplete__block_invoke;
  v5[3] = &unk_1E70F1FA0;
  v5[4] = self;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v5);
}

uint64_t __49__EMSearchableIndexQuery__searchQueryDidComplete__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completed");
}

- (void)_searchQueryGatherDidEnd
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ gathered", buf, 0xCu);

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__EMSearchableIndexQuery__searchQueryGatherDidEnd__block_invoke;
  v5[3] = &unk_1E70F1FA0;
  v5[4] = self;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v5);
}

uint64_t __50__EMSearchableIndexQuery__searchQueryGatherDidEnd__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gathered");
}

- (void)_searchQueryDidChangeItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ changed %lu items", buf, 0x16u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__EMSearchableIndexQuery__searchQueryDidChangeItems___block_invoke;
  v8[3] = &unk_1E70F2070;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v8);

}

uint64_t __53__EMSearchableIndexQuery__searchQueryDidChangeItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changedItems:", *(_QWORD *)(a1 + 40));
}

- (void)_searchQueryDidRemoveIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removed %lu items", buf, 0x16u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__EMSearchableIndexQuery__searchQueryDidRemoveIdentifiers___block_invoke;
  v8[3] = &unk_1E70F2070;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v8);

}

uint64_t __59__EMSearchableIndexQuery__searchQueryDidRemoveIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removedItems:", *(_QWORD *)(a1 + 40));
}

- (void)_searchQueryDidChangeCount:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ count changed %lu items", buf, 0x16u);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__EMSearchableIndexQuery__searchQueryDidChangeCount___block_invoke;
  v7[3] = &unk_1E70F5C38;
  v7[4] = self;
  v7[5] = a3;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v7);
}

uint64_t __53__EMSearchableIndexQuery__searchQueryDidChangeCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeCount:", *(_QWORD *)(a1 + 40));
}

- (void)_searchQueryDidFindAttribute:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v9;
    v17 = 2114;
    v18 = v6;
    v19 = 2048;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ found attribute %{public}@ with %lu values", buf, 0x20u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__EMSearchableIndexQuery__searchQueryDidFindAttribute_values___block_invoke;
  v12[3] = &unk_1E70F2158;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v12);

}

uint64_t __62__EMSearchableIndexQuery__searchQueryDidFindAttribute_values___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_foundAttribute:values:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "resignCurrent");
}

- (void)_searchQueryDidChangeAttribute:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexQuery logPrefixString](self, "logPrefixString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v9;
    v17 = 2114;
    v18 = v6;
    v19 = 2048;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ change attribute %{public}@ with %lu values", buf, 0x20u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__EMSearchableIndexQuery__searchQueryDidChangeAttribute_values___block_invoke;
  v12[3] = &unk_1E70F2158;
  v12[4] = self;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  -[EMSearchableIndexQuery _performClientWork:](self, "_performClientWork:", v12);

}

uint64_t __64__EMSearchableIndexQuery__searchQueryDidChangeAttribute_values___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_changedAttribute:values:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "resignCurrent");
}

- (void)_logSignpostForSearchQueryStart
{
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EMSearchableIndexQuery signpostLog](EMSearchableIndexQuery, "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[EMSearchableIndexQuery signpostID](self, "signpostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    -[EMSearchableIndexQuery expression](self, "expression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138477827;
    v7 = v5;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EMSearchableIndexQuery", "QueryStartedWithExpression=%{signpost.description:attribute,private}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_logSignpostForSearchQueryDidReceiveFirstResultsWithItemCount:(unint64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[EMSearchableIndexQuery signpostLog](EMSearchableIndexQuery, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EMSearchableIndexQuery signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = 134349056;
    v8 = a3;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v5, OS_SIGNPOST_EVENT, v6, "EMSearchableIndexQuery", "ReceivedFirstResultsWithItemCount=%{signpost.description:attribute,public}lu", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_logSignpostForSearchQueryDidFinishWithStatus:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMSearchableIndexQuery signpostLog](EMSearchableIndexQuery, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EMSearchableIndexQuery signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = 138543362;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EMSearchableIndexQuery", "QueryFinishedWithStatus=%{signpost.description:attribute,public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (void)setResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)gatheredBlock
{
  return self->_gatheredBlock;
}

- (void)setGatheredBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)changedItemsBlock
{
  return self->_changedItemsBlock;
}

- (void)setChangedItemsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)foundAttributeResultsBlock
{
  return self->_foundAttributeResultsBlock;
}

- (void)setFoundAttributeResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)changedAttributeResultsBlock
{
  return self->_changedAttributeResultsBlock;
}

- (void)setChangedAttributeResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)removedItemsBlock
{
  return self->_removedItemsBlock;
}

- (void)setRemovedItemsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)countChangedBlock
{
  return self->_countChangedBlock;
}

- (void)setCountChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)counting
{
  return self->_counting;
}

- (void)setCounting:(BOOL)a3
{
  self->_counting = a3;
}

- (BOOL)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(BOOL)a3
{
  self->_attribute = a3;
}

- (NSArray)fetchAttributes
{
  return self->_fetchAttributes;
}

- (void)setFetchAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)protectionClasses
{
  return self->_protectionClasses;
}

- (void)setProtectionClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)rankingQueries
{
  return self->_rankingQueries;
}

- (void)setRankingQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (BOOL)live
{
  return self->_live;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (EMSearchableIndexQueryExpression)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
  objc_storeStrong((id *)&self->_expression, a3);
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void)setLogPrefixString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)queryStatus
{
  return self->_queryStatus;
}

- (BOOL)queryDidMoveToFinishedState
{
  return self->_queryDidMoveToFinishedState;
}

- (void)setQueryDidMoveToFinishedState:(BOOL)a3
{
  self->_queryDidMoveToFinishedState = a3;
}

- (BOOL)liveQueryDidGather
{
  return self->_liveQueryDidGather;
}

- (void)setLiveQueryDidGather:(BOOL)a3
{
  self->_liveQueryDidGather = a3;
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSProgress)internalProgress
{
  return self->_internalProgress;
}

- (void)setInternalProgress:(id)a3
{
  objc_storeStrong((id *)&self->_internalProgress, a3);
}

- (EFPromise)resultsPromise
{
  return self->_resultsPromise;
}

- (void)setResultsPromise:(id)a3
{
  objc_storeStrong((id *)&self->_resultsPromise, a3);
}

- (NSError)simulatedFailedQueryError
{
  return self->_simulatedFailedQueryError;
}

- (void)setSimulatedFailedQueryError:(id)a3
{
  objc_storeStrong((id *)&self->_simulatedFailedQueryError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedFailedQueryError, 0);
  objc_storeStrong((id *)&self->_resultsPromise, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryStatus, 0);
  objc_storeStrong((id *)&self->_logPrefixString, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_protectionClasses, 0);
  objc_storeStrong((id *)&self->_fetchAttributes, 0);
  objc_storeStrong(&self->_countChangedBlock, 0);
  objc_storeStrong(&self->_removedItemsBlock, 0);
  objc_storeStrong(&self->_changedAttributeResultsBlock, 0);
  objc_storeStrong(&self->_foundAttributeResultsBlock, 0);
  objc_storeStrong(&self->_changedItemsBlock, 0);
  objc_storeStrong(&self->_gatheredBlock, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->activity, 0);
}

+ (id)_operandStringForOperand:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("&&");
  if (a3 == 2)
    v3 = CFSTR("||");
  if (a3)
    return (id)v3;
  else
    return CFSTR("!");
}

+ (id)_modifierStringFromModifiers:(unint64_t)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;

  v3 = "c";
  v4 = "";
  if ((a3 & 1) == 0)
    v3 = "";
  v5 = "d";
  if ((a3 & 2) == 0)
    v5 = "";
  v6 = "w";
  if ((a3 & 4) == 0)
    v6 = "";
  v7 = "t";
  if ((a3 & 8) == 0)
    v7 = "";
  if ((a3 & 0x10) != 0)
    v4 = "f070";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%s%s%s%s"), v3, v5, v6, v7, v4);
}

+ (id)queryStringByJoiningQueries:(id)a3 withOperand:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "_operandStringForOperand:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR(" %@ "), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "componentsJoinedByString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@)"), v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)_queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 phraseMatchFormatString:(id)a6
{
  objc_msgSend(a1, "_queryStringForPhrase:attributes:modifiers:phraseMatchFormatString:comparisonOperator:", a3, a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 phraseMatchFormatString:(id)a6 comparisonOperator:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  __CFString *v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  objc_msgSend(a1, "_modifierStringFromModifiers:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "em_stringForQuotingWithCharacter:", 39);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("!=");
  if (!a7)
    v18 = CFSTR("=");
  v19 = v18;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __152__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration___queryStringForPhrase_attributes_modifiers_phraseMatchFormatString_comparisonOperator___block_invoke;
  v26[3] = &unk_1E70F5C60;
  v20 = v19;
  v27 = v20;
  v21 = v17;
  v28 = v21;
  v22 = v15;
  v29 = v22;
  objc_msgSend(v13, "ef_map:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryStringByJoiningQueries:withOperand:", v23, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __152__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration___queryStringForPhrase_attributes_modifiers_phraseMatchFormatString_comparisonOperator___block_invoke(_QWORD *a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ '%@'%@"), a2, a1[4], a1[5], a1[6]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 languages:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "ef_stringByRemovingQuotesForLanguages:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_queryStringForPhrase:attributes:modifiers:phraseMatchFormatString:", v13, v11, a5, CFSTR("*%@*"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 4) == 0 || (unint64_t)objc_msgSend(v11, "count") < 2)
    goto LABEL_8;
  objc_msgSend(a1, "searchWordsForPhrase:languages:", v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") <= 1)
  {

LABEL_8:
    v17 = 0;
    v18 = v14 != 0;
    goto LABEL_9;
  }
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __118__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration__queryStringForPhrase_attributes_modifiers_languages___block_invoke;
  v27 = &unk_1E70F5C88;
  v29 = a1;
  v28 = v11;
  v30 = a5;
  objc_msgSend(v15, "ef_map:", &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryStringByJoiningQueries:withOperand:", v16, 1, v24, v25, v26, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v14 != 0;
  if (v14 && v17)
  {
    v31[0] = v14;
    v31[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryStringByJoiningQueries:withOperand:", v19, 2);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_9:
  if (v18)
    v21 = v14;
  else
    v21 = v17;
  v20 = v21;
LABEL_13:
  v22 = v20;

  return v22;
}

id __118__EMSearchableIndexQuery_EMSearchableIndexQueryStringGeneration__queryStringForPhrase_attributes_modifiers_languages___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 40), "_queryStringForPhrase:attributes:modifiers:phraseMatchFormatString:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), CFSTR("%@*"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryStringForPhrase:(id)a3 attributes:(id)a4 modifiers:(unint64_t)a5 languages:(id)a6 phraseMatchFormatString:(id)a7 comparisonOperator:(int64_t)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;

  v14 = a4;
  v15 = a7;
  objc_msgSend(a3, "ef_stringByRemovingQuotesForLanguages:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_queryStringForPhrase:attributes:modifiers:phraseMatchFormatString:comparisonOperator:", v16, v14, a5, v15, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)searchWordsForPhrase:(id)a3 languages:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  id v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  objc_msgSend(v17, "ef_quotedWordComponentsForLanguages:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v19;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "length");
        if (((v12 > 3) & v8) == 1)
        {
          if (objc_msgSend(v5, "length"))
            objc_msgSend(v20, "addObject:", v5);
          v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v11);

          v5 = (id)v13;
        }
        else
        {
          v14 = objc_msgSend(v5, "length");
          v15 = CFSTR(" ");
          if (!v14)
            v15 = &stru_1E70F6E90;
          objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), v15, v11);
        }
        v8 |= v12 > 3;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v20, "addObject:", v5);

  return v20;
}

- (void)initWithExpression:(os_log_t)log builder:queryContext:querySetup:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Live queries for attribute values are not implemented in EMSearchableIndexQuery. If this is required, then additional plumbing will be required. Will fall back to using a one-time foundAttributesHandler.", v1, 2u);
}

void __77__EMSearchableIndexQuery_initWithExpression_builder_queryContext_querySetup___block_invoke_5_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B99BB000, log, OS_LOG_TYPE_DEBUG, "%{public}@ cancelled via NSProgress", buf, 0xCu);

}

- (void)_performClientWork:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_FAULT, "#Warning %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_searchQueryDidFailWithError:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed: %{public}@", buf, 0x16u);

}

@end
