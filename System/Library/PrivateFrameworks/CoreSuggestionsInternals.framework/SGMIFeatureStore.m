@implementation SGMIFeatureStore

- (SGMIFeatureStore)initWithDatabaseGetter:(id)a3 journalPath:(id)a4
{
  id v6;
  id v7;
  SGMIFeatureStore *v8;
  void *v9;
  uint64_t v10;
  id dbGetter;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _PASLock *lock;
  int v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id lockStateRegistration;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SGMIFeatureStore;
  v8 = -[SGMIFeatureStore init](&v28, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    location = 0;
    objc_initWeak(&location, v8);
    v10 = objc_msgSend(v6, "copy");
    dbGetter = v8->_dbGetter;
    v8->_dbGetter = (id)v10;

    v12 = (_QWORD *)objc_opt_new();
    v13 = objc_opt_new();
    v14 = (void *)v12[3];
    v12[3] = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v12);
    lock = v8->_lock;
    v8->_lock = (_PASLock *)v15;

    if (v7)
    {
      objc_storeStrong((id *)&v8->_journalPath, a4);
      v17 = objc_msgSend(MEMORY[0x1E0D81590], "lockState");
      if (v17 != 3)
      {
        objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGMIFeatureStore-LockState", 17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D81590];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke;
        v24[3] = &unk_1E7DB5AE0;
        v20 = v18;
        v25 = v20;
        objc_copyWeak(&v26, &location);
        objc_msgSend(v19, "registerForLockStateChangeNotifications:", v24);
        v21 = objc_claimAutoreleasedReturnValue();
        lockStateRegistration = v8->_lockStateRegistration;
        v8->_lockStateRegistration = (id)v21;

        if (!v17)
          -[SGMIFeatureStore _runJournal](v8, "_runJournal");
        objc_destroyWeak(&v26);

      }
    }

    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0D81590], "unregisterForLockStateChangeNotifications:", self->_lockStateRegistration);
  v3.receiver = self;
  v3.super_class = (Class)SGMIFeatureStore;
  -[SGMIFeatureStore dealloc](&v3, sel_dealloc);
}

- (id)_db
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__30539;
  v10 = __Block_byref_object_dispose__30540;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__SGMIFeatureStore__db__block_invoke;
  v5[3] = &unk_1E7DB5B30;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_journalQueue
{
  if (_journalQueue__pasOnceToken10 != -1)
    dispatch_once(&_journalQueue__pasOnceToken10, &__block_literal_global_329_31062);
  return (id)_journalQueue__pasExprOnceResult;
}

- (BOOL)_writeJournalCommand:(unsigned __int8)a3 blob:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[SGMIFeatureStore _journalQueue](self, "_journalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__SGMIFeatureStore__writeJournalCommand_blob___block_invoke;
  v11[3] = &unk_1E7DB5B78;
  v14 = a3;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)_runJournal
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  NSObject *v13;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", self->_journalPath);

  sgMailIntelligenceLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "Beginning SGMIFeatureStore _runJournal", buf, 2u);
    }

    -[SGMIFeatureStore _db](self, "_db");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[SGMIFeatureStore _journalQueue](self, "_journalQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __31__SGMIFeatureStore__runJournal__block_invoke;
      v12[3] = &unk_1E7DB6A30;
      v12[4] = self;
      v6 = v8;
      v13 = v6;
      dispatch_sync(v9, v12);

      sgMailIntelligenceLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "Finished SGMIFeatureStore _runJournal", buf, 2u);
      }

    }
    else
    {
      sgMailIntelligenceLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_INFO, "Aborting SGMIFeatureStore _runJournal -- db not available (maybe device is locking again?)", buf, 2u);
      }

      v6 = 0;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "Skipping SGMIFeatureStore _runJournal -- no journal file exists", buf, 2u);
  }

}

- (id)_featuresForDatabase:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  SEL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__30539;
  v16 = __Block_byref_object_dispose__30540;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SGMIFeatureStore__featuresForDatabase___block_invoke;
  v8[3] = &unk_1E7DB5BC8;
  v10 = &v12;
  v5 = v4;
  v9 = v5;
  v11 = a2;
  objc_msgSend(v5, "readTransaction:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (int)_effectiveLockState
{
  if (self->_lockStateRegistration)
    return objc_msgSend(MEMORY[0x1E0D81590], "lockState");
  else
    return 3;
}

- (void)_handleDeviceLockStateEvent:(int)a3
{
  if ((a3 - 1) > 1)
  {
    if (!a3)
    {
      if (self->_journalPath)
        -[SGMIFeatureStore _runJournal](self, "_runJournal");
    }
  }
  else
  {
    -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_337);
  }
}

- (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1)
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_344);
  return (id)_dateFormatter_dateFormatter;
}

- (id)_dateFromColumn:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  if (objc_msgSend(v5, "characterAtIndex:", 0) != 95)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMIFeatureStore.m"), 1299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[column characterAtIndex:0] == '_'"));

  }
  -[SGMIFeatureStore _dateFormatter](self, "_dateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_autoreleasePoolPop(v6);
  return v12;
}

- (id)_columnFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGMIFeatureStore _dateFormatter](self, "_dateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E7DB83A8;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_msgSend(CFSTR("_"), "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v11;
}

- (id)_stringForFeatureName:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tx"), a3);
}

- (int64_t)_featureNameForString:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v9;
  unsigned int v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if ((objc_msgSend(v6, "scanHexInt:", &v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMIFeatureStore.m"), 1324, CFSTR("could not scan hex feature name in %@"), v5);

  }
  v7 = v10;

  return v7;
}

- (id)naiveBayesModelQueryResultForFeature:(int64_t)a3 unigramTokens:(id)a4 bigramTokens:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SGMINaiveBayesModelQueryResult *v11;
  SGMITokenCounts *v12;
  SGMINaiveBayesModelQueryResult *v13;

  v8 = a4;
  v9 = a5;
  -[SGMIFeatureStore _db](self, "_db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SGMIFeatureStore _naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:usingDatabase:](self, "_naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:usingDatabase:", a3, v8, v9, v10);
    v11 = (SGMINaiveBayesModelQueryResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = -[SGMITokenCounts initWithSalientCount:regularCount:token:]([SGMITokenCounts alloc], "initWithSalientCount:regularCount:token:", &unk_1E7E0CB60, &unk_1E7E0CB60, &stru_1E7DB83A8);
    v13 = [SGMINaiveBayesModelQueryResult alloc];
    v11 = -[SGMINaiveBayesModelQueryResult initWithMailCount:unigramTokenCounts:bigramTokenCounts:unigramQueriedTokensCount:bigramQueriedTokensCount:oldestTokenAge:](v13, "initWithMailCount:unigramTokenCounts:bigramTokenCounts:unigramQueriedTokensCount:bigramQueriedTokensCount:oldestTokenAge:", v12, v12, v12, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], INFINITY);

  }
  return v11;
}

- (id)_naiveBayesModelQueryResultForFeature:(int64_t)a3 unigramTokens:(id)a4 bigramTokens:(id)a5 usingDatabase:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGMINaiveBayesModelQueryResult *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  SGMINaiveBayesModelQueryResult *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  SGMIFeatureStore *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[SGMIFeatureStore _stringForFeatureName:](self, "_stringForFeatureName:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__30539;
  v78 = __Block_byref_object_dispose__30540;
  v79 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__30539;
  v72 = __Block_byref_object_dispose__30540;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__30539;
  v66 = __Block_byref_object_dispose__30540;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__30539;
  v60 = __Block_byref_object_dispose__30540;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__30539;
  v54 = __Block_byref_object_dispose__30540;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__30539;
  v48 = __Block_byref_object_dispose__30540;
  v49 = 0;
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke;
  v32 = &unk_1E7DB5D30;
  v33 = self;
  v14 = v12;
  v34 = v14;
  v15 = v13;
  v35 = v15;
  v38 = &v74;
  v39 = &v68;
  v40 = &v62;
  v41 = &v56;
  v16 = v10;
  v36 = v16;
  v42 = &v50;
  v17 = v11;
  v37 = v17;
  v43 = &v44;
  objc_msgSend(v14, "readTransaction:", &v29);
  v18 = [SGMINaiveBayesModelQueryResult alloc];
  v19 = v75[5];
  v20 = v69[5];
  v21 = v63[5];
  v22 = v57[5];
  v23 = v51[5];
  v24 = (void *)v45[5];
  if (v24)
  {
    objc_msgSend(v24, "timeIntervalSinceNow", v29, v30, v31, v32, v33, v34, v35, v36);
    v26 = -v25;
  }
  else
  {
    v26 = INFINITY;
  }
  v27 = -[SGMINaiveBayesModelQueryResult initWithMailCount:unigramTokenCounts:bigramTokenCounts:unigramQueriedTokensCount:bigramQueriedTokensCount:oldestTokenAge:](v18, "initWithMailCount:unigramTokenCounts:bigramTokenCounts:unigramQueriedTokensCount:bigramQueriedTokensCount:oldestTokenAge:", v19, v20, v21, v22, v23, v26, v29, v30, v31, v32, v33);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  return v27;
}

- (id)highlyDiscriminantTokensForFeature:(int64_t)a3 minCount:(unint64_t)a4 minRatio:(double)a5
{
  void *v9;
  void *v10;

  -[SGMIFeatureStore _db](self, "_db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SGMIFeatureStore _highlyDiscriminantTokensForFeature:minCount:minRatio:domains:limit:usingDatabase:](self, "_highlyDiscriminantTokensForFeature:minCount:minRatio:domains:limit:usingDatabase:", a3, a4, &unk_1E7E10B30, 0, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)_highlyDiscriminantTokensForFeature:(int64_t)a3 minCount:(unint64_t)a4 minRatio:(double)a5 domains:(id)a6 limit:(id)a7 usingDatabase:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int64_t v34;
  double v35;
  unint64_t v36;
  SEL v37;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke;
  v28[3] = &unk_1E7DB5DA8;
  v28[4] = self;
  v29 = v17;
  v30 = v15;
  v31 = v16;
  v34 = a3;
  v32 = v19;
  v35 = a5;
  v36 = a4;
  v37 = a2;
  v20 = v18;
  v33 = v20;
  v21 = v19;
  v22 = v16;
  v23 = v15;
  v24 = v17;
  objc_msgSend(v24, "readTransaction:", v28);
  v25 = v33;
  v26 = v20;

  return v26;
}

- (id)_keyForField:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id result;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (!a3)
    return CFSTR("magicUnsubscribeSuggestionSenderDenyList");
  if (a3 == 1)
    return CFSTR("magicUnsubscribeSuggestionSenderDomainDenyList");
  v8 = v3;
  v9 = v4;
  sgMailIntelligenceLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl(&dword_1C3607000, v6, OS_LOG_TYPE_FAULT, "SGMIFeatureStore: Invalid SGMailIntelligenceUnsubscriptionRuleField for DB lookup", v7, 2u);
  }

  return result;
}

- (void)setUnsubscriptionOpportunitiesSuggestionsDenyListForField:(int64_t)a3 toValues:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "_pas_mappedArrayWithTransform:", &__block_literal_global_373);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pas_componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIFeatureStore _keyForField:](self, "_keyForField:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIFeatureStore setNSString:forKey:](self, "setNSString:forKey:", v6, v7);

}

- (id)getUnsubscriptionOpportunitiesSuggestionsDenyListForField:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[SGMIFeatureStore _keyForField:](self, "_keyForField:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIFeatureStore getNSStringForKey:](self, "getNSStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  }
  else
  {
    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6
{
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_opt_new();
  -[SGMIFeatureStore _db](self, "_db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = 1004;
    if (a3 != 1)
      v13 = 0;
    if (a3)
      v14 = v13;
    else
      v14 = 1000;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    -[SGMIFeatureStore _highlyDiscriminantTokensForFeature:minCount:minRatio:domains:limit:usingDatabase:](self, "_highlyDiscriminantTokensForFeature:minCount:minRatio:domains:limit:usingDatabase:", v14, a4, &unk_1E7E10B48, v15, v12, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGMIFeatureStore getUnsubscriptionOpportunitiesSuggestionsDenyListForField:](self, "getUnsubscriptionOpportunitiesSuggestionsDenyListForField:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v23, "token");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v17, "containsObject:", v24);

          if ((v25 & 1) == 0)
          {
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19890]), "initWithUnsubscriptionRuleField:tokenCounts:", a3, v23);
            objc_msgSend(v11, "addObject:", v26);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v20);
    }

    v12 = v28;
  }

  return v11;
}

- (id)incrementUserEngagement:(BOOL)a3 forWarning:(id)a4
{
  return -[SGMIFeatureStore shouldExposeWarning:updateAction:](self, "shouldExposeWarning:updateAction:", a4, a3);
}

- (void)incrementUserEngagement:(BOOL)a3 forFollowUpWarning:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  int v29;
  BOOL v30;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  sgMailIntelligenceLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = CFSTR("kTotalNumberOfWarningsForFollowUpWithNegativeEngagement");
      if (v4)
        v9 = CFSTR("kTotalNumberOfWarningsForFollowUpWithPositiveEngagement");
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Follow Up. [incrementUserEngagement] Incrementing %@", buf, 0xCu);
    }

    if (v4)
      v10 = CFSTR("totalNumberOfWarningsForFollowUpWithPositiveEngagement");
    else
      v10 = CFSTR("totalNumberOfWarningsForFollowUpWithNegativeEngagement");
    -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, v10);
    objc_msgSend(v6, "signature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
    v7 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v7, "count") == 2)
    {
      -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      if (!v15)
      {
        sgMailIntelligenceLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v6, "type");
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v23;
          _os_log_fault_impl(&dword_1C3607000, v16, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Unsupported type: %@", buf, 0xCu);

        }
      }
      objc_msgSend(v6, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      -[SGMIFeatureStore _db](self, "_db");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke;
        v24[3] = &unk_1E7DB5E18;
        v25 = v19;
        v26 = v6;
        v27 = v12;
        v29 = v18;
        v28 = v13;
        v30 = v4;
        -[NSObject writeTransaction:](v25, "writeTransaction:", v24);

        v21 = v25;
      }
      else
      {
        sgMailIntelligenceLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "Follow Up. [incrementUserEngagement:forFollowUpWarning] Can't access the db.", buf, 2u);
        }
      }

    }
    else
    {
      sgMailIntelligenceLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v6, "signature");
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v22;
        _os_log_fault_impl(&dword_1C3607000, v12, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Error in signature format: %@", buf, 0xCu);

      }
    }

  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Follow Up. [incrementUserEngagement] warning is nil. Nothing will be stored.", buf, 2u);
  }

}

- (id)shouldExposeWarning:(id)a3
{
  return -[SGMIFeatureStore shouldExposeWarning:updateAction:](self, "shouldExposeWarning:updateAction:", a3, 2);
}

- (id)shouldExposeWarning:(id)a3 updateAction:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  __int128 *p_buf;
  _BOOL8 v27;
  uint64_t v28;
  _BOOL8 v29;
  int v30;
  __int128 buf;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "signature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 2)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        sgMailIntelligenceLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf) = 0;
          _os_log_fault_impl(&dword_1C3607000, v18, OS_LOG_TYPE_FAULT, "Unsupported SGMailIntelligenceWarning for method shouldExposeWarning", (uint8_t *)&buf, 2u);
        }

        v12 = (void *)MEMORY[0x1E0C9AAB0];
        goto LABEL_21;
      }
      v11 = 20;
    }
    if (a4)
      v13 = 0;
    else
      v13 = -1;
    v14 = v13 - (a4 == 1);
    if (a4 == 2)
      v15 = 1;
    else
      v15 = v14;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v32 = 0x2020000000;
    v33 = 1;
    -[SGMIFeatureStore _db](self, "_db");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke;
      v21[3] = &unk_1E7DB5E68;
      v22 = v16;
      v23 = v6;
      v24 = v9;
      v30 = v11;
      v27 = a4 == 0;
      v28 = v15;
      v29 = a4 == 1;
      v25 = v10;
      p_buf = &buf;
      objc_msgSend(v22, "writeTransaction:", v21);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&buf, 8);
LABEL_21:

    goto LABEL_22;
  }
  sgMailIntelligenceLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v6, "signature");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_fault_impl(&dword_1C3607000, v9, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Error in signature format: %@", (uint8_t *)&buf, 0xCu);

  }
  v12 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_22:

  return v12;
}

- (void)updateAttachmentDetectionStatsOnMailWithTextContent:(id)a3 attachments:(id)a4 warningRaised:(BOOL)a5 attachmentPredicted:(BOOL)a6 isIncomingMail:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  unint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  id v16;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v16 = a4;
  v12 = a3;
  -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, CFSTR("totalNumberOfEmailsProcessedForAttachmentDetection"));
  v13 = objc_msgSend(v12, "length");

  if (v13 >= 0x201
    && objc_msgSend(v16, "indexOfObjectPassingTest:", &__block_literal_global_407) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v7 ? CFSTR("numberOfLargeIncomingMailsWithAttachment") : CFSTR("numberOfLargeOutgoingMailsWithAttachment");
    -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, v14);
    if (v8)
    {
      if (v7)
        v15 = CFSTR("numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachment");
      else
        v15 = CFSTR("numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachment");
      -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, v15);
    }
  }
  if (v9)
    -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, CFSTR("totalNumberOfRaisedMissingAttachmentWarning"));

}

- (void)updateRecipientDetectionStatsWarningRaised:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, CFSTR("totalNumberOfEmailsProcessedForRecipientDetection"));
  if (v3)
    -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, CFSTR("totalNumberOfRaisedMissingRecipientWarning"));
}

- (void)updateFollowUpDetectionStatsWithWarning:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  int v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGMIFeatureStore incrementInt64NSNumber:forKey:](self, "incrementInt64NSNumber:forKey:", &unk_1E7E0CB78, CFSTR("totalNumberOfEmailsProcessedForFollowUpDetection"));
  if (v4)
  {
    objc_msgSend(v4, "signature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
    v6 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v6, "count") == 2)
    {
      -[NSObject objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 0);
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      if (!v10)
      {
        sgMailIntelligenceLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v4, "type");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v17;
          _os_log_fault_impl(&dword_1C3607000, v11, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Unsupported type: %@", buf, 0xCu);

        }
      }
      objc_msgSend(v4, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      -[SGMIFeatureStore _db](self, "_db");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke;
        v18[3] = &unk_1E7DB5EF8;
        v19 = v14;
        v20 = v4;
        v21 = v7;
        v23 = v13;
        v22 = v8;
        -[NSObject writeTransaction:](v19, "writeTransaction:", v18);

        v16 = v19;
      }
      else
      {
        sgMailIntelligenceLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "Follow Up. [updateFollowUpDetectionStatsWithWarning] Can't access the db.", buf, 2u);
        }
      }

    }
    else
    {
      sgMailIntelligenceLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v4, "signature");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_fault_impl(&dword_1C3607000, v7, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Error in signature format: %@", buf, 0xCu);
    }

    goto LABEL_17;
  }
  sgMailIntelligenceLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "Follow Up. [updateFollowUpDetectionStatsWithWarning] warning is nil. Nothing will be stored.", buf, 2u);
  }
LABEL_18:

}

- (int64_t)warningStatsCount
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -1;
  -[SGMIFeatureStore _db](self, "_db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__SGMIFeatureStore_warningStatsCount__block_invoke;
    v6[3] = &unk_1E7DB78A0;
    v7 = v2;
    v8 = &v9;
    objc_msgSend(v7, "readTransaction:", v6);

  }
  v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)warningStatsForLogging:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v3 = a3;
  if (a3)
  {
    v5 = -[SGMIFeatureStore warningStatsCount](self, "warningStatsCount");
    if (v5 < 0)
      return 0;
    v6 = v5;
    -[SGMIFeatureStore getInt64NSNumberForKey:](self, "getInt64NSNumberForKey:", CFSTR("countOnLastRegexSignatureStatsLoggingAction"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &unk_1E7E0CB60;
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    v11 = objc_msgSend(v10, "integerValue");
    if (v11 / 10 >= (uint64_t)(v6 / 0xA))
    {
      sgMailIntelligenceLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGMIFeatureStore will not return SGMIMetricsRegexSignatureStats for sampling reasons", buf, 2u);
      }

      return 0;
    }
  }
  else
  {
    v6 = 0;
  }
  v14 = (void *)objc_opt_new();
  -[SGMIFeatureStore _db](self, "_db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_2;
    v18[3] = &unk_1E7DB6F48;
    v19 = v15;
    v20 = v14;
    v21 = &__block_literal_global_417_30949;
    objc_msgSend(v19, "readTransaction:", v18);

  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMIFeatureStore setInt64NSNumber:forKey:](self, "setInt64NSNumber:forKey:", v17, CFSTR("countOnLastRegexSignatureStatsLoggingAction"));

  }
  return v14;
}

- (id)followUpWarningStats
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[SGMIFeatureStore _db](self, "_db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__30539;
  v14 = __Block_byref_object_dispose__30540;
  v15 = 0;
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__SGMIFeatureStore_followUpWarningStats__block_invoke;
    v7[3] = &unk_1E7DB78A0;
    v8 = v2;
    v9 = &v10;
    objc_msgSend(v8, "readTransaction:", v7);

    v4 = (void *)v11[5];
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)clearSignatureStatsTable
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[SGMIFeatureStore _db](self, "_db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SGMIFeatureStore _clearSignatureStatsTableUsingDatabase:](self, "_clearSignatureStatsTableUsingDatabase:", v3);
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Failed to clearSignatureStatsTable due to Class A data protection", v5, 2u);
    }

  }
}

- (void)_clearSignatureStatsTableUsingDatabase:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SGMIFeatureStore__clearSignatureStatsTableUsingDatabase___block_invoke;
  v5[3] = &unk_1E7DB56F0;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "writeTransaction:", v5);

}

- (void)deleteNaiveBayesModelForProbabilityFeatureName:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SGMIFeatureStore _db](self, "_db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SGMIFeatureStore _deleteNaiveBayesModelForProbabilityFeatureName:usingDatabase:](self, "_deleteNaiveBayesModelForProbabilityFeatureName:usingDatabase:", a3, v5);
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_fault_impl(&dword_1C3607000, v6, OS_LOG_TYPE_FAULT, "Not performing deleteNaiveBayesModelForProbabilityFeatureName:%ld due to data protection", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_deleteNaiveBayesModelForProbabilityFeatureName:(int64_t)a3 usingDatabase:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__SGMIFeatureStore__deleteNaiveBayesModelForProbabilityFeatureName_usingDatabase___block_invoke;
  v8[3] = &unk_1E7DB6BB8;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  objc_msgSend(v7, "writeTransaction:", v8);

}

- (void)commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SGMIFeatureStore commitNaiveBayesModel:probabilityFeatureName:updateDate:](self, "commitNaiveBayesModel:probabilityFeatureName:updateDate:", v7, a4, v8);

}

- (void)commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4 updateDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v8 = a3;
  v9 = a5;
  -[SGMIFeatureStore _db](self, "_db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SGMIFeatureStore _commitNaiveBayesModel:probabilityFeatureName:updateDate:usingDatabase:](self, "_commitNaiveBayesModel:probabilityFeatureName:updateDate:usingDatabase:", v8, a4, v9, v10);
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "Discarding commitNaiveBayesModel commit due to data protection", v12, 2u);
    }

  }
}

- (void)_commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4 updateDate:(id)a5 usingDatabase:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  sgMailIntelligenceLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2048;
    v27 = a4;
    v28 = 2112;
    v29 = v11;
    _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "commitNaiveBayesModel:%@ probabilityFeatureName:%ld updateDate:%@", buf, 0x20u);
  }

  -[SGMIFeatureStore _stringForFeatureName:](self, "_stringForFeatureName:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke;
  v19[3] = &unk_1E7DB57C8;
  v19[4] = self;
  v20 = v12;
  v21 = v11;
  v22 = v14;
  v23 = v10;
  v15 = v10;
  v16 = v14;
  v17 = v11;
  v18 = v12;
  objc_msgSend(v18, "writeTransaction:", v19);

}

- (BOOL)areSubmodelsEmpty
{
  void *v3;
  BOOL v4;

  -[SGMIFeatureStore _db](self, "_db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SGMIFeatureStore _areSubmodelsEmptyUsingDatabase:](self, "_areSubmodelsEmptyUsingDatabase:", v3);
  else
    v4 = 1;

  return v4;
}

- (BOOL)_areSubmodelsEmptyUsingDatabase:(id)a3
{
  id v4;
  id v5;
  char v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SGMIFeatureStore__areSubmodelsEmptyUsingDatabase___block_invoke;
  v8[3] = &unk_1E7DB7878;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v5, "readTransaction:", v8);
  v6 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)submodelsAgesInDays
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = (void *)objc_opt_new();
  -[SGMIFeatureStore _db](self, "_db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke;
  v10[3] = &unk_1E7DB7800;
  v10[4] = self;
  v11 = v4;
  v5 = v3;
  v12 = v5;
  v6 = v4;
  objc_msgSend(v6, "readTransaction:", v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

- (id)subModelsStats
{
  void *v4;
  void *v6;

  -[SGMIFeatureStore subModelsStatsWithShouldContinueBlock:](self, "subModelsStatsWithShouldContinueBlock:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMIFeatureStore.m"), 2144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  return v4;
}

- (id)subModelsStatsWithShouldContinueBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SGMIFeatureStore _db](self, "_db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SGMIFeatureStore _subModelsStatsWithShouldContinueBlock:usingDatabase:](self, "_subModelsStatsWithShouldContinueBlock:usingDatabase:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_subModelsStatsWithShouldContinueBlock:(id)a3 usingDatabase:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__30539;
  v20 = __Block_byref_object_dispose__30540;
  v21 = 0;
  v21 = (id)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke;
  v12[3] = &unk_1E7DB74C8;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "readTransaction:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (BOOL)purgeTokensWhichLastUpdateWasBefore:(id)a3 shouldContinue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  -[SGMIFeatureStore _db](self, "_db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[SGMIFeatureStore _purgeTokensWhichLastUpdateWasBefore:shouldContinue:usingDatabase:](self, "_purgeTokensWhichLastUpdateWasBefore:shouldContinue:usingDatabase:", v6, v7, v8);
  else
    v9 = 1;

  return v9;
}

- (BOOL)_purgeTokensWhichLastUpdateWasBefore:(id)a3 shouldContinue:(id)a4 usingDatabase:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke;
  v15[3] = &unk_1E7DB6B50;
  v15[4] = self;
  v11 = v10;
  v16 = v11;
  v12 = v9;
  v18 = v12;
  v19 = &v20;
  v13 = v8;
  v17 = v13;
  objc_msgSend(v11, "writeTransaction:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

- (id)getSGMIStoredAddresses
{
  void *v3;
  void *v4;

  -[SGMIFeatureStore _db](self, "_db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SGMIFeatureStore _getSGMIStoredAddressesUsingDatabase:](self, "_getSGMIStoredAddressesUsingDatabase:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (id)_getSGMIStoredAddressesUsingDatabase:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke;
  v13[3] = &unk_1E7DB7800;
  v13[4] = self;
  v14 = v4;
  v15 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v8, "readTransaction:", v13);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_2;
  v11[3] = &unk_1E7DB61C0;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v12 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  return v9;
}

- (void)_clearBucketForColumn:(id)a3
{
  void *v4;
  void *v5;
  _PASLock *lock;
  id v7;
  _QWORD v8[4];
  id v9;
  SGMIFeatureStore *v10;

  v7 = a3;
  -[SGMIFeatureStore _db](self, "_db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SGMIFeatureStore _clearBucketForColumn:usingDatabase:](self, "_clearBucketForColumn:usingDatabase:", v7, v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x1C3BD4F6C]();
    lock = self->_lock;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__SGMIFeatureStore__clearBucketForColumn___block_invoke;
    v8[3] = &unk_1E7DB5BA0;
    v9 = v7;
    v10 = self;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);

    objc_autoreleasePoolPop(v5);
  }

}

- (void)_clearBucketForColumn:(id)a3 usingDatabase:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SGMIFeatureStore__clearBucketForColumn_usingDatabase___block_invoke;
  v10[3] = &unk_1E7DB7800;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "writeTransaction:", v10);

}

- (void)clearBucketForDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGMIFeatureStore clearBucketsForDates:](self, "clearBucketsForDates:", v6, v7, v8);
}

- (void)clearBucketsForDates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[SGMIFeatureStore _columnFromDate:](self, "_columnFromDate:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[SGMIFeatureStore _clearBucketForColumn:](self, "_clearBucketForColumn:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)deleteTokensForDeletedEmailAddresses:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[SGMIFeatureStore _db](self, "_db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SGMIFeatureStore _deleteTokensForDeletedEmailAddresses:usingDatabase:](self, "_deleteTokensForDeletedEmailAddresses:usingDatabase:", v4, v5);
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1C3607000, v6, OS_LOG_TYPE_FAULT, "Unable to deleteTokensForDeletedEmailAddresses due to Class A protection", v7, 2u);
    }

  }
}

- (void)_deleteTokensForDeletedEmailAddresses:(id)a3 usingDatabase:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke;
  v10[3] = &unk_1E7DB7800;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "writeTransaction:", v10);

}

- (BOOL)applyCappingPolicy:(id)a3 shouldContinue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  -[SGMIFeatureStore _db](self, "_db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[SGMIFeatureStore _applyCappingPolicy:shouldContinue:usingDatabase:](self, "_applyCappingPolicy:shouldContinue:usingDatabase:", v6, v7, v8);
  else
    v9 = 1;

  return v9;
}

- (BOOL)_applyCappingPolicy:(id)a3 shouldContinue:(id)a4 usingDatabase:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke;
  v15[3] = &unk_1E7DB6B50;
  v15[4] = self;
  v11 = v10;
  v16 = v11;
  v12 = v9;
  v18 = v12;
  v19 = &v20;
  v13 = v8;
  v17 = v13;
  objc_msgSend(v11, "writeTransaction:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

- (void)clearSubModelsTables
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[SGMIFeatureStore _db](self, "_db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SGMIFeatureStore _clearSubModelsTablesUsingDatabase:](self, "_clearSubModelsTablesUsingDatabase:", v3);
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Failed to clearSubmodelTables due to Class A data protection", v5, 2u);
    }

  }
}

- (void)_clearSubModelsTablesUsingDatabase:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SGMIFeatureStore__clearSubModelsTablesUsingDatabase___block_invoke;
  v6[3] = &unk_1E7DB6A30;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "writeTransaction:", v6);

}

- (void)clearKVStoreTable
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[SGMIFeatureStore _db](self, "_db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SGMIFeatureStore _clearKVStoreUsingDatabase:](self, "_clearKVStoreUsingDatabase:", v3);
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Failed to clearKVStoreTable due to Class A data protection", v5, 2u);
    }

  }
}

- (void)_clearKVStoreUsingDatabase:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SGMIFeatureStore__clearKVStoreUsingDatabase___block_invoke;
  v5[3] = &unk_1E7DB56F0;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "writeTransaction:", v5);

}

- (void)insertToken:(id)a3 forFeatureName:(int64_t)a4 salientCount:(int64_t)a5 regularCount:(int64_t)a6 time:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;

  v12 = a3;
  v13 = a7;
  -[SGMIFeatureStore _db](self, "_db");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__SGMIFeatureStore_insertToken_forFeatureName_salientCount_regularCount_time___block_invoke;
  v18[3] = &unk_1E7DB62A8;
  v18[4] = self;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v15 = v12;
  v16 = v13;
  v17 = v14;
  objc_msgSend(v17, "writeTransaction:", v18);

}

- (id)databaseHandle
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__30539;
  v10 = __Block_byref_object_dispose__30540;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SGMIFeatureStore_databaseHandle__block_invoke;
  v5[3] = &unk_1E7DB62D0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)migrations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];
  const __CFString *v12;
  _QWORD v13[12];
  _QWORD v14[13];

  v14[12] = *MEMORY[0x1E0C80C00];
  v13[0] = &unk_1E7E0CB78;
  v13[1] = &unk_1E7E0CBD8;
  v14[0] = &unk_1E7E10B78;
  v14[1] = &unk_1E7E10B90;
  v13[2] = &unk_1E7E0CBF0;
  v13[3] = &unk_1E7E0CC08;
  v14[2] = &unk_1E7E10BA8;
  v14[3] = &unk_1E7E10BC0;
  v13[4] = &unk_1E7E0CC20;
  v13[5] = &unk_1E7E0CC38;
  v14[4] = &unk_1E7E10BD8;
  v14[5] = &unk_1E7E10BF0;
  v13[6] = &unk_1E7E0CC50;
  v12 = CFSTR("CREATE TABLE IF NOT EXISTS mailsPendingFollowUpProcessing (messageId TEXT NOT NULL PRIMARY KEY,spotlightIdentifier TEXT NOT NULL,date FLOAT)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v2;
  v14[7] = &unk_1E7E10C08;
  v13[7] = &unk_1E7E0CC68;
  v13[8] = &unk_1E7E0CC80;
  v11[0] = CFSTR("DELETE FROM followUpTable");
  v11[1] = CFSTR("ALTER TABLE followUpTable ADD COLUMN dateStored FLOAT");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v3;
  v14[9] = &unk_1E7E10C20;
  v13[9] = &unk_1E7E0CC98;
  v13[10] = &unk_1E7E0CCB0;
  v10 = CFSTR("CREATE TABLE IF NOT EXISTS nicknameMapping (nickname TEXT NOT NULL,email TEXT NOT NULL,count INTEGER NOT NULL,dateOfLastMatch FLOAT NOT NULL,PRIMARY KEY (nickname, email)) WITHOUT ROWID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v4;
  v13[11] = &unk_1E7E0CCC8;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM signatureStats WHERE type = %d"), 20);
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[11] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)migration_createFeaturesTable
{
  uint64_t v2;
  void *v3;

  -[SGMIFeatureStore _db](self, "_db");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    +[SGMIDomainCountingTable createTableNamed:inDatabase:](SGMIDomainCountingTable, "createTableNamed:inDatabase:", CFSTR("features"), v2);

    LOBYTE(v2) = 4;
  }
  return v2;
}

- (unsigned)migration_createKVTable
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  -[SGMIFeatureStore _db](self, "_db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__SGMIFeatureStore_migration_createKVTable__block_invoke;
    v5[3] = &unk_1E7DB56F0;
    v6 = v2;
    v3 = v2;
    objc_msgSend(v3, "writeTransaction:", v5);

    LOBYTE(v2) = 4;
  }
  return v2;
}

- (unsigned)migration_createFollowUpTable
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  -[SGMIFeatureStore _db](self, "_db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__SGMIFeatureStore_migration_createFollowUpTable__block_invoke;
    v5[3] = &unk_1E7DB56F0;
    v6 = v2;
    v3 = v2;
    objc_msgSend(v3, "writeTransaction:", v5);

    LOBYTE(v2) = 4;
  }
  return v2;
}

- (unsigned)migration_createFollowUpTableWithAppleMailMessageIdAsPrimaryKey
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  -[SGMIFeatureStore _db](self, "_db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__SGMIFeatureStore_migration_createFollowUpTableWithAppleMailMessageIdAsPrimaryKey__block_invoke;
    v5[3] = &unk_1E7DB56F0;
    v6 = v2;
    v3 = v2;
    objc_msgSend(v3, "writeTransaction:", v5);

    LOBYTE(v2) = 4;
  }
  return v2;
}

- (unsigned)migration_createSignatureStatsTable
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  -[SGMIFeatureStore _db](self, "_db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__SGMIFeatureStore_migration_createSignatureStatsTable__block_invoke;
    v5[3] = &unk_1E7DB56F0;
    v6 = v2;
    v3 = v2;
    objc_msgSend(v3, "writeTransaction:", v5);

    LOBYTE(v2) = 4;
  }
  return v2;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  *a3 = 0;
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)performMaintenanceWithShouldContinueBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t (**v9)(_QWORD);
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unsigned int (**v19)(_QWORD);
  uint64_t v20;
  void *v21;
  char v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE v31[128];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGMIFeatureStore _db](self, "_db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = v4;
  else
    v6 = &__block_literal_global_558_30831;
  v7 = (void *)MEMORY[0x1C3BD5158](v6);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __62__SGMIFeatureStore_performMaintenanceWithShouldContinueBlock___block_invoke_2;
  v28[3] = &unk_1E7DB6318;
  v8 = v5;
  v29 = v8;
  v9 = v7;
  v30 = v9;
  v10 = (void *)MEMORY[0x1C3BD5158](v28);
  v32[0] = v10;
  v11 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_pas_shuffledArrayUsingRng:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(unsigned int (***)(_QWORD))(*((_QWORD *)&v24 + 1) + 8 * i);
        if (!v19[2](v19))
        {
LABEL_17:
          v11 = 0;
          goto LABEL_18;
        }
        objc_msgSend(v14, "lastObject", (_QWORD)v24);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v19 == (unsigned int (**)(_QWORD))v20)
        {

        }
        else
        {
          v21 = (void *)v20;
          v22 = v9[2](v9);

          if ((v22 & 1) == 0)
            goto LABEL_17;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      v11 = 1;
      if (v16)
        continue;
      break;
    }
  }
LABEL_18:

  return v11;
}

- (void)clearMailIntelligenceSaliencyDetection
{
  id v3;
  _QWORD v4[5];

  -[SGMIFeatureStore _db](self, "_db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SGMIFeatureStore_clearMailIntelligenceSaliencyDetection__block_invoke;
  v4[3] = &unk_1E7DB56F0;
  v4[4] = self;
  objc_msgSend(v3, "writeTransaction:", v4);

}

- (void)reset
{
  id v3;
  _QWORD v4[5];

  -[SGMIFeatureStore _db](self, "_db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__SGMIFeatureStore_reset__block_invoke;
  v4[3] = &unk_1E7DB56F0;
  v4[4] = self;
  objc_msgSend(v3, "writeTransaction:", v4);

}

- (id)knownEmailAddressesForNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[SGMIFeatureStore _db](self, "_db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke;
    v9[3] = &unk_1E7DB7800;
    v10 = v6;
    v11 = v4;
    v12 = v5;
    objc_msgSend(v10, "readTransaction:", v9);

  }
  return v5;
}

- (void)recordMappingFromNickname:(id)a3 toEmailAddress:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SGMIFeatureStore recordMappingFromNickname:toEmailAddress:withDateOfMatch:](self, "recordMappingFromNickname:toEmailAddress:withDateOfMatch:", v8, v7, v9);

}

- (void)recordMappingFromNickname:(id)a3 toEmailAddress:(id)a4 withDateOfMatch:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[SGMIFeatureStore _db](self, "_db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke;
    v13[3] = &unk_1E7DB77B0;
    v14 = v10;
    v15 = v12;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v14, "writeTransaction:", v13);

  }
}

- (void)purgeOldNicknameMappingRecords
{
  double Current;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  double v8;

  Current = CFAbsoluteTimeGetCurrent();
  -[SGMIFeatureStore _db](self, "_db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke;
    v6[3] = &unk_1E7DB6368;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    v8 = Current + -10368000.0;
    objc_msgSend(v7, "writeTransaction:", v6);

    v4 = v5;
  }

}

- (void)clearNicknameMappingTable
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[4];
  id v7;

  -[SGMIFeatureStore _db](self, "_db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__SGMIFeatureStore_clearNicknameMappingTable__block_invoke;
    v6[3] = &unk_1E7DB56F0;
    v7 = v2;
    objc_msgSend(v7, "writeTransaction:", v6);

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Failed to clearNicknameMappingTable due to Class A data protection", v5, 2u);
    }

  }
}

- (void)setValue:(id)a3 forKey:(id)a4 binder:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v10 = a4;
  v7 = a5;
  -[SGMIFeatureStore _db](self, "_db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke;
    v11[3] = &unk_1E7DB6F48;
    v12 = v8;
    v13 = v10;
    v14 = v7;
    objc_msgSend(v12, "writeTransaction:", v11);

  }
}

- (void)deleteValueForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v6 = a3;
  -[SGMIFeatureStore _db](self, "_db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SGMIFeatureStore_deleteValueForKey___block_invoke;
    v7[3] = &unk_1E7DB6A30;
    v8 = v4;
    v9 = v6;
    objc_msgSend(v8, "writeTransaction:", v7);

  }
}

- (id)getForKey:(id)a3 binder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__30539;
  v21 = __Block_byref_object_dispose__30540;
  v22 = 0;
  -[SGMIFeatureStore _db](self, "_db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__SGMIFeatureStore_getForKey_binder___block_invoke;
    v12[3] = &unk_1E7DB74C8;
    v13 = v8;
    v14 = v6;
    v16 = &v17;
    v15 = v7;
    objc_msgSend(v13, "readTransaction:", v12);

  }
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)setInt64NSNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SGMIFeatureStore_setInt64NSNumber_forKey___block_invoke;
  v8[3] = &unk_1E7DB74A0;
  v9 = v6;
  v7 = v6;
  -[SGMIFeatureStore setValue:forKey:binder:](self, "setValue:forKey:binder:", v7, a4, v8);

}

- (id)getInt64NSNumberForKey:(id)a3
{
  return -[SGMIFeatureStore getForKey:binder:](self, "getForKey:binder:", a3, &__block_literal_global_581);
}

- (void)incrementInt64NSNumber:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v9 = a3;
  v6 = a4;
  -[SGMIFeatureStore _db](self, "_db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke;
    v10[3] = &unk_1E7DB7800;
    v11 = v7;
    v12 = v6;
    v13 = v9;
    objc_msgSend(v11, "writeTransaction:", v10);

  }
}

- (void)setDoubleNSNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SGMIFeatureStore_setDoubleNSNumber_forKey___block_invoke;
  v8[3] = &unk_1E7DB74A0;
  v9 = v6;
  v7 = v6;
  -[SGMIFeatureStore setValue:forKey:binder:](self, "setValue:forKey:binder:", v7, a4, v8);

}

- (id)getDoubleNSNumberForKey:(id)a3
{
  return -[SGMIFeatureStore getForKey:binder:](self, "getForKey:binder:", a3, &__block_literal_global_585);
}

- (void)setNSString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SGMIFeatureStore_setNSString_forKey___block_invoke;
  v8[3] = &unk_1E7DB74A0;
  v9 = v6;
  v7 = v6;
  -[SGMIFeatureStore setValue:forKey:binder:](self, "setValue:forKey:binder:", v7, a4, v8);

}

- (id)getNSStringForKey:(id)a3
{
  return -[SGMIFeatureStore getForKey:binder:](self, "getForKey:binder:", a3, &__block_literal_global_587);
}

- (void)setNSDate:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__SGMIFeatureStore_setNSDate_forKey___block_invoke;
  v11[3] = &unk_1E7DB74A0;
  v12 = v9;
  v10 = v9;
  -[SGMIFeatureStore setValue:forKey:binder:](self, "setValue:forKey:binder:", v10, v6, v11);

}

- (id)getNSDateForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SGMIFeatureStore getForKey:binder:](self, "getForKey:binder:", a3, &__block_literal_global_588);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "dateFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalPath, 0);
  objc_storeStrong(&self->_lockStateRegistration, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong(&self->_dbGetter, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __36__SGMIFeatureStore_getNSDateForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getNSStringForColumn:", 0);
}

uint64_t __37__SGMIFeatureStore_setNSDate_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":value", *(_QWORD *)(a1 + 32));
}

uint64_t __38__SGMIFeatureStore_getNSStringForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getNSStringForColumn:", 0);
}

uint64_t __39__SGMIFeatureStore_setNSString_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":value", *(_QWORD *)(a1 + 32));
}

uint64_t __44__SGMIFeatureStore_getDoubleNSNumberForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getDoubleAsNSNumberForColumn:", 0);
}

uint64_t __45__SGMIFeatureStore_setDoubleNSNumber_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDoubleAsNSNumber:", ":value", *(_QWORD *)(a1 + 32));
}

void __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke_2;
  v3[3] = &unk_1E7DB6E80;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO keyValueStore (key, value) VALUES (:key, :incrementValue) ON CONFLICT (key) DO UPDATE SET value = value + :incrementValue"), v3, 0, 0);

}

void __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":key", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":incrementValue", *(_QWORD *)(a1 + 40));

}

uint64_t __43__SGMIFeatureStore_getInt64NSNumberForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getInt64AsNSNumberForColumn:", 0);
}

uint64_t __44__SGMIFeatureStore_setInt64NSNumber_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64AsNSNumber:", ":value", *(_QWORD *)(a1 + 32));
}

void __37__SGMIFeatureStore_getForKey_binder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SGMIFeatureStore_getForKey_binder___block_invoke_2;
  v8[3] = &unk_1E7DB74A0;
  v3 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __37__SGMIFeatureStore_getForKey_binder___block_invoke_3;
  v6[3] = &unk_1E7DB63B8;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT value FROM keyValueStore WHERE key = :key LIMIT 1"), v8, v6, 0);

}

uint64_t __37__SGMIFeatureStore_getForKey_binder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNonnullNSString:", ":key", *(_QWORD *)(a1 + 32));
}

uint64_t __37__SGMIFeatureStore_getForKey_binder___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *MEMORY[0x1E0D81788];
}

void __38__SGMIFeatureStore_deleteValueForKey___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__SGMIFeatureStore_deleteValueForKey___block_invoke_2;
  v2[3] = &unk_1E7DB74A0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM keyValueStore WHERE key = :key"), v2, 0, 0);

}

uint64_t __38__SGMIFeatureStore_deleteValueForKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNonnullNSString:", ":key", *(_QWORD *)(a1 + 32));
}

void __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke_2;
  v3[3] = &unk_1E7DB6390;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO keyValueStore (key, value) VALUES (:key, :value)"), v3, 0, 0);

}

void __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":key", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __45__SGMIFeatureStore_clearNicknameMappingTable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM nicknameMapping"), 0, 0, 0);
}

uint64_t __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke_2;
  v3[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM nicknameMapping WHERE dateOfLastMatch < :oldestAcceptableDate"), v3, 0, 0);
}

uint64_t __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":oldestAcceptableDate", *(double *)(a1 + 32));
}

void __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke_2;
  v3[3] = &unk_1E7DB6340;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO nicknameMapping (nickname, email, count, dateOfLastMatch) VALUES (:nickname, :email, 1, :dateOfLastMatch) ON CONFLICT (nickname, email) DO UPDATE SET count = count + 1, dateOfLastMatch = max(dateOfLastMatch, :dateOfLastMatch)"), v3, 0, 0);

}

void __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":nickname", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":email", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":dateOfLastMatch");

}

void __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_2;
  v6[3] = &unk_1E7DB74A0;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_3;
  v4[3] = &unk_1E7DB6ED0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT email FROM nicknameMapping WHERE nickname = :nickname"), v6, v4, 0);

}

uint64_t __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":nickname", *(_QWORD *)(a1 + 32));
}

uint64_t __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __25__SGMIFeatureStore_reset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearSubModelsTables");
  objc_msgSend(*(id *)(a1 + 32), "clearKVStoreTable");
  objc_msgSend(*(id *)(a1 + 32), "clearSignatureStatsTable");
  return objc_msgSend(*(id *)(a1 + 32), "clearNicknameMappingTable");
}

uint64_t __58__SGMIFeatureStore_clearMailIntelligenceSaliencyDetection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearSubModelsTables");
}

uint64_t __62__SGMIFeatureStore_performMaintenanceWithShouldContinueBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "vacuumWithShouldContinueBlock:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __62__SGMIFeatureStore_performMaintenanceWithShouldContinueBlock___block_invoke()
{
  return 1;
}

uint64_t __55__SGMIFeatureStore_migration_createSignatureStatsTable__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE TABLE IF NOT EXISTS signatureStats (emailLanguage TEXT NOT NULL,regexLanguage TEXT NOT NULL,type INTEGER NOT NULL,incomingMessage BOOLEAN NOT NULL,signature TEXT NOT NULL,negativeEngagement INTEGER NOT NULL,noEngagement INTEGER NOT NULL,positiveEngagement INTEGER NOT NULL,blockedWarningCount INTEGER NOT NULL)"), 0, 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS signatureStatsIdx ON signatureStats(emailLanguage, regexLanguage, type, incomingMessage, signature)"), 0, 0, 0);
}

uint64_t __83__SGMIFeatureStore_migration_createFollowUpTableWithAppleMailMessageIdAsPrimaryKey__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE TABLE IF NOT EXISTS followUpTable (appleMailMessageId TEXT NOT NULL PRIMARY KEY,messageId TEXT NOT NULL,snippet TEXT,core TEXT,score DOUBLE,startDate TEXT NOT NULL,startDateCore TEXT,endDate TEXT NOT NULL,endDateCore TEXT,alreadyReturned BOOLEAN DEFAULT false)"), 0, 0, 0);
}

uint64_t __49__SGMIFeatureStore_migration_createFollowUpTable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE TABLE IF NOT EXISTS followUpTable (id INTEGER PRIMARY KEY AUTOINCREMENT,appleMailMessageId TEXT NOT NULL,snippet TEXT,core TEXT,score DOUBLE,startDate TEXT NOT NULL,startDateCore TEXT,endDate TEXT NOT NULL,endDateCore TEXT,alreadyReturned BOOLEAN DEFAULT false)"), 0, 0, 0);
}

uint64_t __43__SGMIFeatureStore_migration_createKVTable__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE TABLE keyValueStore (key TEXT PRIMARY KEY NOT NULL, value) WITHOUT ROWID"), 0, 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE UNIQUE INDEX keyValueStoreIdx ON keyValueStore(key)"), 0, 0, 0);
}

void __34__SGMIFeatureStore_databaseHandle__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __78__SGMIFeatureStore_insertToken_forFeatureName_salientCount_regularCount_time___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_columnFromDate:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasColumn:", v3) & 1) == 0)
    objc_msgSend(v2, "addColumn:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = CFSTR("s");
  v5 = *(_QWORD *)(a1 + 56);
  v17[2] = CFSTR("u");
  v17[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v4;
  v16[1] = CFSTR("r");
  v8 = *(_QWORD *)(a1 + 56);
  v16[2] = CFSTR("u");
  v16[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commitDomainsAndCounts:toColumn:", v13, v3);

}

uint64_t __47__SGMIFeatureStore__clearKVStoreUsingDatabase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM keyValueStore"), 0, 0, 0);
}

void __55__SGMIFeatureStore__clearSubModelsTablesUsingDatabase___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteAllRows");

}

void __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t (**v3)(void);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(void);
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t (**v15)(void);
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56))
    v2 = *(void **)(a1 + 56);
  else
    v2 = &__block_literal_global_487;
  v3 = (uint64_t (**)(void))MEMORY[0x1C3BD5158](v2);
  if ((v3[2]() & 1) != 0)
  {
    objc_msgSend(v11, "currentColumns");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_pas_proxyArrayReversed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_pas_unproxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_3;
    v12[3] = &unk_1E7DB6280;
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 64);
    v15 = v8;
    v16 = v9;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v14 = v11;
    v10 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BYTE *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD *v45;
  uint64_t *v46;
  _QWORD v47[3];
  unint64_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  _QWORD v61[2];
  _BYTE v62[128];
  _QWORD v63[2];
  _QWORD v64[5];

  v64[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v35 = v7;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) != 0)
  {
    v37 = a4;
    v34 = v8;
    v9 = objc_msgSend(v7, "integerValue");
    objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v10;
    v64[1] = CFSTR("s");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v12;
    v63[1] = CFSTR("r");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_msgSend(v34, "unsignedIntegerValue");
    v40 = (void *)objc_opt_new();
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v14 = *(id *)(a1 + 40);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v15)
    {
      v36 = 0;
      v16 = *(_QWORD *)v54;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v17);
        v19 = *(void **)(a1 + 48);
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_4;
        v49[3] = &unk_1E7DB6230;
        v20 = v40;
        v50 = v20;
        v51 = *(id *)(a1 + 48);
        v52 = v18;
        objc_msgSend(v19, "enumerateChildrenOfDomain:depth:usingBlock:", v39, 2, v49);
        if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) != 0)
        {
          if (objc_msgSend(v20, "count") >= v38)
          {
            v22 = 0;
            *((_BYTE *)v58 + 24) = 1;
            v21 = 2;
          }
          else
          {
            v36 = objc_msgSend(v20, "count");
            v21 = 0;
            v22 = 1;
          }
        }
        else
        {
          v22 = 0;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          v21 = 1;
          *a4 = 1;
        }

        if (!v22)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          if (v15)
            goto LABEL_4;
          goto LABEL_20;
        }
      }

      if ((v21 | 2) == 2)
        goto LABEL_21;
      goto LABEL_25;
    }
    v36 = 0;
LABEL_20:

LABEL_21:
    v23 = v40;
    if (*((_BYTE *)v58 + 24))
      goto LABEL_22;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v48 = 0;
    v48 = v38 - objc_msgSend(v40, "count");
    v32 = *(void **)(a1 + 48);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_5;
    v43[3] = &unk_1E7DB6258;
    v44 = v40;
    v45 = v47;
    v46 = &v57;
    objc_msgSend(v32, "enumerateChildrenOfDomain:depth:usingBlock:", v33, 2, v43);
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *v37 = 1;

      _Block_object_dispose(v47, 8);
      goto LABEL_25;
    }

    _Block_object_dispose(v47, 8);
    v23 = v40;
    if (*((_BYTE *)v58 + 24))
    {
LABEL_22:
      if (objc_msgSend(v23, "count") > v38)
      {
        v24 = objc_msgSend(v23, "count");
        v25 = objc_msgSend(v23, "count");
        v26 = (void *)objc_opt_new();
        v27 = v25 - v36;
        objc_msgSend(v26, "addIndexesInRange:", arc4random_uniform(v27), v24 - v38);
        objc_msgSend(v26, "shiftIndexesStartingAtIndex:by:", v27, -v27);
        objc_msgSend(v26, "shiftIndexesStartingAtIndex:by:", 0, v36);
        objc_msgSend(v23, "removeObjectsAtIndexes:", v26);

      }
    }
    v28 = objc_alloc(MEMORY[0x1E0D815A0]);
    v61[0] = v39;
    v61[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithDomainsFromArray:", v29);

    v31 = *(void **)(a1 + 48);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_6;
    v41[3] = &unk_1E7DB5860;
    v42 = v40;
    objc_msgSend(v31, "deleteDomainSelection:keepingDomainsPassingTest:", v30, v41);

LABEL_25:
    _Block_object_dispose(&v57, 8);

    v8 = v34;
    goto LABEL_26;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  *a4 = 1;
LABEL_26:

}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 4)
  {
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0
      && objc_msgSend(*(id *)(a1 + 40), "countForColumn:domain:", *(_QWORD *)(a1 + 48), v3) >= 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }

  }
  return 1;
}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 4)
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(_QWORD *)(v5 + 24);
      if (!v6)
      {
        v7 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_8;
      }
      *(_QWORD *)(v5 + 24) = v6 - 1;
    }
    v7 = 1;
LABEL_8:

    goto LABEL_9;
  }
  v7 = 1;
LABEL_9:

  return v7;
}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 4)
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_2()
{
  return 1;
}

void __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_2;
  v5[3] = &unk_1E7DB61E8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", objc_msgSend(v5, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815A0]), "initWithDomain:", v9);
    v11 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_3;
    v12[3] = &unk_1E7DB5860;
    v13 = v6;
    objc_msgSend(v11, "deleteDomainSelection:keepingDomainsPassingTest:", v10, v12);

  }
}

uint64_t __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 4)
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(v4, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 2, (_QWORD)v12) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v10 = 0;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_13:

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

void __56__SGMIFeatureStore__clearBucketForColumn_usingDatabase___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasColumn:", *(_QWORD *)(a1 + 48)))
    objc_msgSend(v2, "zeroColumn:", *(_QWORD *)(a1 + 48));

}

void __42__SGMIFeatureStore__clearBucketForColumn___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;

  v5 = a2;
  if ((objc_msgSend(v5[3], "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v5[3], "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_writeJournalCommand:blob:", 1, v4);

    objc_autoreleasePoolPop(v3);
  }

}

void __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(&unk_1E7E10B60, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(&unk_1E7E10B60);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", objc_msgSend(v7, "integerValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_482;
        v11[3] = &unk_1E7DB6198;
        v12 = *(id *)(a1 + 48);
        v13 = v7;
        objc_msgSend(v2, "enumerateChildrenOfDomain:depth:usingBlock:", v10, 3, v11);

      }
      v4 = objc_msgSend(&unk_1E7E10B60, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v4);
  }

}

void __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_482(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 4)
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("@"), 2);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL
      && v5 == objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("@"), 6, v5, objc_msgSend(v4, "length") - v5))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

      }
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v4);

    }
  }

  return 1;
}

void __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 && ((*(uint64_t (**)(void))(v3 + 16))() & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_columnFromDate:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentColumns");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v5, "count"), 1280, &__block_literal_global_30656);
    if (v6)
    {
      v7 = v6;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        __assert_rtn("-[SGMIFeatureStore _purgeTokensWhichLastUpdateWasBefore:shouldContinue:usingDatabase:]_block_invoke", "SGMIFeatureStore.m", 2322, "idx != NSNotFound");
      if (v6 == objc_msgSend(v5, "count"))
      {
        objc_msgSend(v2, "deleteAllRows");
      }
      else
      {
        objc_msgSend(v5, "subarrayWithRange:", v7, objc_msgSend(v5, "count") - v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v26 = &v25;
        v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__30539;
        v29 = __Block_byref_object_dispose__30540;
        v30 = 0;
        v9 = (void *)objc_opt_new();
        v19 = v4;
        v10 = MEMORY[0x1E0C809B0];
        while (1)
        {
          v11 = v26[5];
          v22[0] = v10;
          v22[1] = 3221225472;
          v22[2] = __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_2;
          v22[3] = &unk_1E7DB6148;
          v24 = &v25;
          v12 = v9;
          v23 = v12;
          objc_msgSend(v2, "enumerateChildrenOfDomain:greaterThan:depth:limit:usingBlock:", 0, v11, -1, 0, v22);
          if (!objc_msgSend(v12, "count"))
            break;
          objc_msgSend(v2, "firstNonZeroColumnForDomains:withColumns:", v12, v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc(MEMORY[0x1E0D815A0]);
          v20[0] = v10;
          v20[1] = 3221225472;
          v20[2] = __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_3;
          v20[3] = &unk_1E7DB6170;
          v15 = v13;
          v21 = v15;
          objc_msgSend(v12, "_pas_filteredArrayWithTest:", v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)objc_msgSend(v14, "initWithDomainsFromArray:", v16);
          objc_msgSend(v2, "deleteDomainSelection:", v17);
          objc_msgSend(v12, "removeAllObjects");
          v18 = *(_QWORD *)(a1 + 56);
          if (v18 && ((*(uint64_t (**)(void))(v18 + 16))() & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

            break;
          }

        }
        _Block_object_dispose(&v25, 8);

        v4 = v19;
      }
    }

  }
}

BOOL __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  unint64_t v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");

  return v5 < 0x80;
}

BOOL __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 48))
    v3 = *(void **)(a1 + 48);
  else
    v3 = &__block_literal_global_447;
  v4 = (uint64_t (**)(_QWORD))MEMORY[0x1C3BD5158](v3);
  if ((((uint64_t (*)(void))v4[2])() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v5, CFSTR("counts"));

    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v8 = MEMORY[0x1E0C809B0];
    v48 = 0;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_3;
    v44[3] = &unk_1E7DB6080;
    v44[4] = &v45;
    objc_msgSend(v2, "enumerateChildrenOfDomain:depth:usingBlock:", 0, 4, v44);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("numberOfTokenEntries"));

    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_4;
    v38[3] = &unk_1E7DB60A8;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v39 = v10;
    v40 = v11;
    v12 = v6;
    v41 = v12;
    v13 = v2;
    v14 = *(_QWORD *)(a1 + 56);
    v42 = v13;
    v43 = v14;
    objc_msgSend(v13, "enumerateChildrenOfDomain:depth:usingBlock:", 0, 1, v38);
    if ((v4[2](v4) & 1) != 0)
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v15, CFSTR("lastUpdates"));

      v16 = (void *)objc_opt_new();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
      objc_msgSend(v16, "setLocale:", v17);

      objc_msgSend(v16, "setDateFormat:", CFSTR("MMM,dd"));
      objc_msgSend(v13, "currentColumns");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nonZeroColumnsForDomains:withColumns:", v10, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v8;
      v35[1] = 3221225472;
      v35[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_5;
      v35[3] = &unk_1E7DB60D0;
      v35[4] = *(_QWORD *)(a1 + 32);
      v20 = v16;
      v21 = *(_QWORD *)(a1 + 56);
      v36 = v20;
      v37 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v35);

      v31[0] = v8;
      v31[1] = 3221225472;
      v31[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_6;
      v31[3] = &unk_1E7DB6120;
      v22 = v12;
      v23 = *(_QWORD *)(a1 + 32);
      v32 = v22;
      v33 = v23;
      v34 = v13;
      v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v31);
      if ((v4[2](v4) & 1) != 0
        && (((void (**)(_QWORD, const __CFString *))v24)[2](v24, CFSTR("s")),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v25, CFSTR("salientTokensDistribution")), v25, v4[2](v4)))
      {
        ((void (**)(_QWORD, const __CFString *))v24)[2](v24, CFSTR("r"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v26, CFSTR("regularTokensDistribution"));
      }
      else
      {
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v26 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = 0;
      }

    }
    else
    {
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(id *)(v29 + 40);
      *(_QWORD *)(v29 + 40) = 0;
    }

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = 0;

  }
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 4)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
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
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)a1[5];
  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "_featureNameForString:", v7);

  v9 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)a1[7];
  +[SGMIDomainCountingTable domainByAppendingToken:toDomain:](SGMIDomainCountingTable, "domainByAppendingToken:toDomain:", CFSTR("s"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "totalForDomain:", v13);

  v15 = (void *)a1[7];
  +[SGMIDomainCountingTable domainByAppendingToken:toDomain:](SGMIDomainCountingTable, "domainByAppendingToken:toDomain:", CFSTR("r"), v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v15, "totalForDomain:", v16);
  v34[0] = CFSTR("salientCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = CFSTR("regularCount");
  v35[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "objectForKeyedSubscript:", CFSTR("counts"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v11);

  v32[0] = CFSTR("salientCount");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "objectForKeyedSubscript:", CFSTR("overallCounts"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("salientCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v24, "unsignedIntegerValue") + v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = CFSTR("regularCount");
  v33[0] = v25;
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "objectForKeyedSubscript:", CFSTR("overallCounts"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("regularCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue") + v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setObject:forKeyedSubscript:", v30, CFSTR("overallCounts"));

  return 1;
}

void __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v24 = v5;
  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "_featureNameForString:", v9);

  +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(*(id *)(a1 + 32), "_dateFromColumn:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "stringFromDate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
          objc_msgSend(v11, "addObject:", v19);

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", CFSTR("lastUpdates"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, v23);

}

id __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v19 = a1;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(*(id *)(v19 + 40), "_stringForFeatureName:", objc_msgSend(v23, "integerValue"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v24;
        v31[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = (void *)objc_opt_new();
        v7 = *(void **)(v19 + 48);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_7;
        v25[3] = &unk_1E7DB60F8;
        v8 = v6;
        v26 = v8;
        objc_msgSend(v7, "enumerateChildrenOfDomain:depth:usingBlock:", v5, 2, v25);
        v9 = (void *)objc_opt_new();
        v10 = objc_msgSend(v8, "count");
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v8, "countForObject:", v13);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v15);

            v11 -= v14 != 0;
            ++v12;
          }
          while (v11);
        }
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, v23);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

  return v20;
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", __clz(a3 | 1) ^ 0x3F);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  return 1;
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_2()
{
  return 1;
}

void __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", 1000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", 1001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", 1002);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", 1003);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", 1004);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", 1005);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", 1008);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_442_30920);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "currentColumns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstNonZeroColumnForDomains:withColumns:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke_3;
  v14[3] = &unk_1E7DB6018;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "_featureNameForString:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_dateFromColumn:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15, "timeIntervalSinceNow");
  objc_msgSend(v10, "numberWithDouble:", v11 / 86400.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

}

id __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v4, v7, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __52__SGMIFeatureStore__areSubmodelsEmptyUsingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentColumns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(MEMORY[0x1E0C9AA60], "isEqual:", v2);

}

void __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_columnFromDate:", *(_QWORD *)(a1 + 48));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasColumn:", v3) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v2, "currentColumns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 0x180)
  {
    objc_msgSend(v2, "addColumn:", v3);
LABEL_7:

LABEL_8:
    v26[0] = *(_QWORD *)(a1 + 56);
    v26[1] = CFSTR("s");
    v26[2] = CFSTR("m");
    v26[3] = &stru_1E7DB83A8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = *(_QWORD *)(a1 + 56);
    v25[1] = CFSTR("r");
    v25[2] = CFSTR("m");
    v25[3] = &stru_1E7DB83A8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v19;
    objc_msgSend(*(id *)(a1 + 64), "mailCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "salientCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v8;
    v24[0] = v10;
    objc_msgSend(*(id *)(a1 + 64), "mailCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regularCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_2;
    v20[3] = &unk_1E7DB5FD0;
    v21 = *(id *)(a1 + 56);
    v22 = v14;
    v15 = v14;
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BD5158](v20);
    objc_msgSend(*(id *)(a1 + 64), "unigramTokensCount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v16)[2](v16, CFSTR("u"), v17);

    objc_msgSend(*(id *)(a1 + 64), "bigramTokensCount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v16)[2](v16, CFSTR("b"), v18);

    objc_msgSend(v2, "commitDomainsAndCounts:toColumn:", v15, v3);
    goto LABEL_9;
  }
  objc_msgSend(v4, "firstObject");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (CFStringCompare(v5, v3, 0) == kCFCompareLessThan)
  {
    objc_msgSend(v2, "recycleColumn:asColumn:", v5, v3);

    goto LABEL_7;
  }

LABEL_9:
}

void __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v19[0] = *(_QWORD *)(a1 + 32);
  v19[1] = CFSTR("s");
  v19[2] = a2;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = *(_QWORD *)(a1 + 32);
  v18[1] = CFSTR("r");
  v18[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_3;
  v14[3] = &unk_1E7DB5FA8;
  v15 = v9;
  v16 = *(id *)(a1 + 40);
  v17 = v11;
  v12 = v11;
  v13 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  +[SGMIDomainCountingTable domainByAppendingToken:toDomain:](SGMIDomainCountingTable, "domainByAppendingToken:toDomain:", v7, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "salientCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v11);

  +[SGMIDomainCountingTable domainByAppendingToken:toDomain:](SGMIDomainCountingTable, "domainByAppendingToken:toDomain:", v7, *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regularCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);
}

void __82__SGMIFeatureStore__deleteNaiveBayesModelForProbabilityFeatureName_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tx"), *(_QWORD *)(a1 + 48));
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteDomain:", v5);

}

uint64_t __59__SGMIFeatureStore__clearSignatureStatsTableUsingDatabase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM signatureStats"), 0, 0, 0);
}

uint64_t __40__SGMIFeatureStore_followUpWarningStats__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__SGMIFeatureStore_followUpWarningStats__block_invoke_3;
  v3[3] = &unk_1E7DB7510;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT SUM(positiveEngagement), SUM(noEngagement), SUM(negativeEngagement) FROM signatureStats WHERE (type=:followUpAsk OR type=:followUpQuestion) AND (emailLanguage='+' OR emailLanguage='*')"), &__block_literal_global_434, v3, 0);
}

uint64_t __40__SGMIFeatureStore_followUpWarningStats__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  SGMISimpleEngagementStats *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  v4 = [SGMISimpleEngagementStats alloc];
  objc_msgSend(v3, "getInt64AsNSNumberForColumn:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &unk_1E7E0CB60;
  objc_msgSend(v3, "getInt64AsNSNumberForColumn:", 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &unk_1E7E0CB60;
  objc_msgSend(v3, "getInt64AsNSNumberForColumn:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v11;
  else
    v12 = &unk_1E7E0CB60;
  v13 = -[SGMISimpleEngagementStats initWithPositiveEngagement:noEngagement:negativeEngagement:](v4, "initWithPositiveEngagement:noEngagement:negativeEngagement:", v7, v10, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  return *MEMORY[0x1E0D81788];
}

void __40__SGMIFeatureStore_followUpWarningStats__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "bindNamedParam:toInteger:", ":followUpAsk", 30);
  objc_msgSend(v2, "bindNamedParam:toInteger:", ":followUpQuestion", 31);

}

void __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_3;
  v7[3] = &unk_1E7DB5F60;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT key, value FROM keyValueStore"), 0, v7, 0);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_4;
  v5[3] = &unk_1E7DB6ED0;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount FROM signatureStats"), 0, v5, 0);

}

uint64_t __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 *v5;

  v3 = a2;
  objc_msgSend(v3, "nonnullNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("totalNumberOfEmailsProcessedForAttachmentDetection"), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  }
  else if (objc_msgSend(CFSTR("totalNumberOfEmailsProcessedForRecipientDetection"), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  }
  else if (objc_msgSend(CFSTR("totalNumberOfEmailsProcessedForFollowUpDetection"), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  }
  else if (objc_msgSend(CFSTR("numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachment"), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  }
  else if (objc_msgSend(CFSTR("numberOfLargeIncomingMailsWithAttachment"), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  }
  else if (objc_msgSend(CFSTR("numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachment"), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  }
  else if (objc_msgSend(CFSTR("numberOfLargeOutgoingMailsWithAttachment"), "isEqualToString:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  }
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v5;
}

uint64_t __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "emailLanguage", "signatureStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmailLanguage:", v5);

  objc_msgSend(v3, "getNSStringForColumnName:table:", "regexLanguage", "signatureStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRegexLanguage:", v6);

  objc_msgSend(v4, "setType:", objc_msgSend(v3, "getInt64ForColumnName:table:", "type", "signatureStats"));
  objc_msgSend(v4, "setIncomingMessage:", objc_msgSend(v3, "getInt64ForColumnName:table:", "incomingMessage", "signatureStats") != 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "signature", "signatureStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIFeatureStore nsDataFromSignature:](SGMIFeatureStore, "nsDataFromSignature:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSignature:", v8);

  objc_msgSend(v4, "setNegativeEngagement:", objc_msgSend(v3, "getInt64ForColumnName:table:", "negativeEngagement", "signatureStats"));
  objc_msgSend(v4, "setNoEngagement:", objc_msgSend(v3, "getInt64ForColumnName:table:", "noEngagement", "signatureStats"));
  objc_msgSend(v4, "setPositiveEngagement:", objc_msgSend(v3, "getInt64ForColumnName:table:", "positiveEngagement", "signatureStats"));
  v9 = objc_msgSend(v3, "getInt64ForColumnName:table:", "blockedWarningCount", "signatureStats");

  objc_msgSend(v4, "setBlockedWarningCount:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addStats:", v4);
  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v10;
}

uint64_t __43__SGMIFeatureStore_warningStatsForLogging___block_invoke(uint64_t a1, void *a2)
{
  return (20 * ((int)(objc_msgSend(a2, "getInt64ForColumn:", 1) + 9) / 20));
}

uint64_t __37__SGMIFeatureStore_warningStatsCount__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__SGMIFeatureStore_warningStatsCount__block_invoke_2;
  v3[3] = &unk_1E7DB7510;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT SUM(negativeEngagement), SUM(noEngagement), SUM(positiveEngagement), SUM(blockedWarningCount) FROM signatureStats"), 0, v3, 0);
}

uint64_t __37__SGMIFeatureStore_warningStatsCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint8_t v14[16];

  v3 = a2;
  if ((objc_msgSend(v3, "getIntegerForColumn:", 0) & 1) != 0
    || (objc_msgSend(v3, "getIntegerForColumn:", 1) & 1) != 0
    || (objc_msgSend(v3, "getIntegerForColumn:", 2) & 1) != 0)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "SGMIFeatureStore: Inconsistent state of the DB.", v14, 2u);
    }

  }
  v5 = objc_msgSend(v3, "getIntegerForColumn:", 0);
  if (v5 >= 0)
    v6 = v5;
  else
    v6 = v5 + 1;
  v7 = objc_msgSend(v3, "getIntegerForColumn:", 1);
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = v7 + 1;
  v9 = v8 >> 1;
  v10 = objc_msgSend(v3, "getIntegerForColumn:", 2);
  if (v10 >= 0)
    v11 = v10;
  else
    v11 = v10 + 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9
                                                              + (v6 >> 1)
                                                              + (v11 >> 1)
                                                              + objc_msgSend(v3, "getIntegerForColumn:", 3);
  v12 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  return *v12;
}

void __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  int v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  int v14;

  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_2;
  v10[3] = &unk_1E7DB5ED0;
  v3 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v14 = *(_DWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES (:emailLanguage, :regexLanguage, :type, :incomingMessage, :signature, 0, 1, 0, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET noEngagement = noEngagement + 1"), v10, 0, 0);
  v4 = *(void **)(a1 + 32);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_3;
  v5[3] = &unk_1E7DB5ED0;
  v6 = *(id *)(a1 + 48);
  v9 = *(_DWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES ('*', :regexLanguage, :type, :incomingMessage, :signature, 0, 1, 0, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET noEngagement = noEngagement + 1"), v5, 0, 0);

}

void __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "detectedLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":emailLanguage", v4);

  objc_msgSend(v6, "bindNamedParam:toNSString:", ":regexLanguage", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "bindNamedParam:toInteger:", ":type", *(int *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIncomingMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toInt64AsNSNumber:", ":incomingMessage", v5);

  objc_msgSend(v6, "bindNamedParam:toNSString:", ":signature", *(_QWORD *)(a1 + 48));
}

void __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":regexLanguage", v3);
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":type", *(int *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isIncomingMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":incomingMessage", v4);

  objc_msgSend(v5, "bindNamedParam:toNSString:", ":signature", *(_QWORD *)(a1 + 48));
}

BOOL __133__SGMIFeatureStore_updateAttachmentDetectionStatsOnMailWithTextContent_attachments_warningRaised_attachmentPredicted_isIncomingMail___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "fileSizeInBytes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "unsignedIntegerValue") > 0x100000;

  return v3;
}

void __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  int v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  int v19;

  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_2;
  v13[3] = &unk_1E7DB5E40;
  v3 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v19 = *(_DWORD *)(a1 + 96);
  v16 = *(id *)(a1 + 56);
  v17 = *(_OWORD *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES (:emailLanguage, :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, :noEngagement, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement, noEngagement = noEngagement + :noEngagement, positiveEngagement = positiveEngagement + :positiveEngagement"), v13, 0, 0);
  v4 = *(void **)(a1 + 32);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_3;
  v6[3] = &unk_1E7DB5E40;
  v7 = *(id *)(a1 + 48);
  v12 = *(_DWORD *)(a1 + 96);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 88);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_4;
  v5[3] = &unk_1E7DB7510;
  v5[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES ('+', :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, :noEngagement, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement,               noEngagement = noEngagement + :noEngagement,               positiveEngagement = positiveEngagement + :positiveEngagement,               blockedWarningCount = blockedWarningCount + min(1, max(0, 1 + negativeEngagement - positiveEngagement - :positiveEngagement                                                                         - :maxAllowedNegativeUserEngagementDiffToExposeAWarning))RETURNING negativeEngagement, positiveEngagement, blockedWarningCount"), v6, v5, 0);

}

void __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "detectedLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":emailLanguage", v4);

  objc_msgSend(v6, "bindNamedParam:toNSString:", ":regexLanguage", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "bindNamedParam:toInteger:", ":type", *(int *)(a1 + 80));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIncomingMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toInt64AsNSNumber:", ":incomingMessage", v5);

  objc_msgSend(v6, "bindNamedParam:toNSString:", ":signature", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "bindNamedParam:toInteger:", ":negativeEngagement", *(_QWORD *)(a1 + 56));
  objc_msgSend(v6, "bindNamedParam:toInteger:", ":noEngagement", *(_QWORD *)(a1 + 64));
  objc_msgSend(v6, "bindNamedParam:toInteger:", ":positiveEngagement", *(_QWORD *)(a1 + 72));

}

void __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":regexLanguage", v3);
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":type", *(int *)(a1 + 80));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isIncomingMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toInt64AsNSNumber:", ":incomingMessage", v4);

  objc_msgSend(v5, "bindNamedParam:toNSString:", ":signature", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":negativeEngagement", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":noEngagement", *(_QWORD *)(a1 + 64));
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":positiveEngagement", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":maxAllowedNegativeUserEngagementDiffToExposeAWarning", 3);

}

uint64_t __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnAlias:", "negativeEngagement");
  v5 = objc_msgSend(v3, "getInt64ForColumnAlias:", "positiveEngagement");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 - v5 < 3;
  return *MEMORY[0x1E0D81788];
}

void __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  int v9;
  char v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  int v15;
  char v16;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_2;
  v11[3] = &unk_1E7DB5DF0;
  v3 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v15 = *(_DWORD *)(a1 + 64);
  v14 = *(id *)(a1 + 56);
  v16 = *(_BYTE *)(a1 + 68);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES (:emailLanguage, :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, 0, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement, positiveEngagement = positiveEngagement + :positiveEngagement, noEngagement = noEngagement - 1"), v11, 0, 0);
  v4 = *(void **)(a1 + 32);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_3;
  v5[3] = &unk_1E7DB5DF0;
  v6 = *(id *)(a1 + 48);
  v9 = *(_DWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 56);
  v10 = *(_BYTE *)(a1 + 68);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES ('*', :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, 0, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement, positiveEngagement = positiveEngagement + :positiveEngagement, noEngagement = noEngagement - 1"), v5, 0, 0);

}

void __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "detectedLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":emailLanguage", v5);

  objc_msgSend(v4, "bindNamedParam:toNSString:", ":regexLanguage", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":type", *(int *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIncomingMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":incomingMessage", v6);

  objc_msgSend(v4, "bindNamedParam:toNSString:", ":signature", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 60) == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":negativeEngagement", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":positiveEngagement", v8);

}

void __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":regexLanguage", v3);
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":type", *(int *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isIncomingMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":incomingMessage", v5);

  objc_msgSend(v4, "bindNamedParam:toNSString:", ":signature", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 60) == 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":negativeEngagement", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":positiveEngagement", v7);

}

uint64_t __87__SGMIFeatureStore_setUnsubscriptionOpportunitiesSuggestionsDenyListForField_toValues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowercaseString");
}

void __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id obj;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", *(_QWORD *)(a1 + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_2;
  v29[3] = &unk_1E7DB5D58;
  v15 = v3;
  v30 = v15;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v29);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_3;
        v17[3] = &unk_1E7DB5D80;
        v10 = *(_QWORD *)(a1 + 56);
        v11 = *(id *)(a1 + 64);
        v22 = *(_QWORD *)(a1 + 88);
        v12 = *(_QWORD *)(a1 + 104);
        v23 = *(_QWORD *)(a1 + 96);
        v24 = v12;
        v13 = *(_QWORD *)(a1 + 32);
        v18 = v11;
        v19 = v13;
        v14 = v2;
        v20 = v14;
        v21 = *(id *)(a1 + 72);
        objc_msgSend(v14, "enumerateChildrenOfDomain:greaterThan:depth:limit:usingBlock:", v9, 0, 1, v10, v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }

}

id __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a2;
  v9 = CFSTR("u");
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v4, v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  SGMITokenCounts *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SGMITokenCounts *v22;

  +[SGMIDomainCountingTable stringTokensFromDomain:](SGMIDomainCountingTable, "stringTokensFromDomain:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 4)
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0
      && (double)a3 / *(double *)(a1 + 64) >= (double)*(unint64_t *)(a1 + 72))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(CFSTR("s"), "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v9 = CFSTR("r");
      }
      else
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(CFSTR("r"), "isEqual:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("SGMIFeatureStore.m"), 1485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isSalientDomain || [@\"r\" isEqual:tokenDomainItems[1]]"));

        }
        v9 = CFSTR("s");
      }
      v13 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v9, 1);
      +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(*(id *)(a1 + 48), "totalForDomain:", v14);
      if ((unint64_t)(v15 + a3) >= *(_QWORD *)(a1 + 72)
        && (double)a3 / (double)(v15 + a3) >= *(double *)(a1 + 64))
      {
        v16 = v15;
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
        v17 = *(void **)(a1 + 56);
        v18 = [SGMITokenCounts alloc];
        if (v8)
          v19 = a3;
        else
          v19 = v16;
        if (v8)
          a3 = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[SGMITokenCounts initWithSalientCount:regularCount:token:](v18, "initWithSalientCount:regularCount:token:", v20, v21, v6);
        objc_msgSend(v17, "addObject:", v22);

      }
    }

  }
  return 1;
}

void __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SGMITokenCounts *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SGMITokenCounts *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  SGMITokenCounts *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  uint64_t v68;
  _QWORD v69[6];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[5];

  v75[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_featuresForDatabase:", *(_QWORD *)(a1 + 40));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = *(_QWORD *)(a1 + 48);
  v75[1] = CFSTR("s");
  v75[2] = CFSTR("m");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v74[0] = *(_QWORD *)(a1 + 48);
  v74[1] = CFSTR("r");
  v74[2] = CFSTR("m");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v73[0] = *(_QWORD *)(a1 + 48);
  v73[1] = CFSTR("s");
  v73[2] = CFSTR("u");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v72[0] = *(_QWORD *)(a1 + 48);
  v72[1] = CFSTR("r");
  v72[2] = CFSTR("u");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v71[0] = *(_QWORD *)(a1 + 48);
  v71[1] = CFSTR("s");
  v71[2] = CFSTR("b");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v70[0] = *(_QWORD *)(a1 + 48);
  v70[1] = CFSTR("r");
  v70[2] = CFSTR("b");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v9);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v69[0] = v63;
  v69[1] = v62;
  v10 = v5;
  v58 = (void *)v5;
  v69[2] = v5;
  v69[3] = v7;
  v11 = (void *)v7;
  v69[4] = v59;
  v69[5] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "totalsForDomains:", v61);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [SGMITokenCounts alloc];
  objc_msgSend(v12, "objectForKeyedSubscript:", v63);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = &unk_1E7E0CB60;
  objc_msgSend(v12, "objectForKeyedSubscript:", v62);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = &unk_1E7E0CB60;
  v20 = -[SGMITokenCounts initWithSalientCount:regularCount:token:](v13, "initWithSalientCount:regularCount:token:", v16, v19, &stru_1E7DB83A8);
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  v23 = [SGMITokenCounts alloc];
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (void *)v24;
  else
    v26 = &unk_1E7E0CB60;
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (void *)v27;
  else
    v29 = &unk_1E7E0CB60;
  v30 = -[SGMITokenCounts initWithSalientCount:regularCount:token:](v23, "initWithSalientCount:regularCount:token:", v26, v29, &stru_1E7DB83A8);
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

  v33 = [SGMITokenCounts alloc];
  objc_msgSend(v12, "objectForKeyedSubscript:", v59);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (void *)v34;
  else
    v36 = &unk_1E7E0CB60;
  objc_msgSend(v12, "objectForKeyedSubscript:", v60);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (void *)v37;
  else
    v39 = &unk_1E7E0CB60;
  v40 = -[SGMITokenCounts initWithSalientCount:regularCount:token:](v33, "initWithSalientCount:regularCount:token:", v36, v39, &stru_1E7DB83A8);
  v41 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v42 = *(void **)(v41 + 40);
  *(_QWORD *)(v41 + 40) = v40;

  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_2;
  v65[3] = &unk_1E7DB5D08;
  v66 = *(id *)(a1 + 48);
  v43 = v64;
  v67 = v43;
  v44 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BD5158](v65);
  ((void (**)(_QWORD, const __CFString *, _QWORD))v44)[2](v44, CFSTR("u"), *(_QWORD *)(a1 + 56));
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v47 = *(void **)(v46 + 40);
  *(_QWORD *)(v46 + 40) = v45;

  ((void (**)(_QWORD, const __CFString *, _QWORD))v44)[2](v44, CFSTR("b"), *(_QWORD *)(a1 + 64));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v50 = *(void **)(v49 + 40);
  *(_QWORD *)(v49 + 40) = v48;

  v68 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "currentColumns");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "firstNonZeroColumnForDomain:withColumns:", v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(*(id *)(a1 + 32), "_dateFromColumn:", v54);
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v57 = *(void **)(v56 + 40);
    *(_QWORD *)(v56 + 40) = v55;

  }
}

id __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD4F6C]();
  if (objc_msgSend(v6, "count"))
  {
    v8 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_3;
    v25[3] = &unk_1E7DB5CB8;
    v26 = *(id *)(a1 + 32);
    v9 = v5;
    v27 = v9;
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_4;
    v22[3] = &unk_1E7DB5CB8;
    v23 = *(id *)(a1 + 32);
    v24 = v9;
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "totalsForDomains:", v12);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_5;
    v18[3] = &unk_1E7DB5CE0;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v10;
    v21 = v11;
    v13 = v11;
    v14 = v10;
    v15 = v19;
    objc_msgSend(v6, "_pas_mappedArrayWithIndexedTransform:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_autoreleasePoolPop(v7);

  return v16;
}

id __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v8[0] = *(_QWORD *)(a1 + 32);
  v8[1] = CFSTR("s");
  v8[2] = v2;
  v8[3] = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v8[0] = *(_QWORD *)(a1 + 32);
  v8[1] = CFSTR("r");
  v8[2] = v2;
  v8[3] = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

SGMITokenCounts *__99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SGMITokenCounts *v12;
  void *v13;
  void *v14;
  SGMITokenCounts *v15;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v8 | v11)
  {
    v12 = [SGMITokenCounts alloc];
    if (v8)
      v13 = (void *)v8;
    else
      v13 = &unk_1E7E0CB60;
    if (v11)
      v14 = (void *)v11;
    else
      v14 = &unk_1E7E0CB60;
    v15 = -[SGMITokenCounts initWithSalientCount:regularCount:token:](v12, "initWithSalientCount:regularCount:token:", v13, v14, v5);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __34__SGMIFeatureStore__dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = v0;

  return objc_msgSend((id)_dateFormatter_dateFormatter, "setFormatOptions:", 19);
}

void __48__SGMIFeatureStore__handleDeviceLockStateEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;

}

void __41__SGMIFeatureStore__featuresForDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  SGMIDomainCountingTable *v5;
  uint64_t v6;
  void *v7;

  objc_getAssociatedObject(*(id *)(a1 + 32), *(const void **)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = -[SGMIDomainCountingTable initWithDatabase:tableName:]([SGMIDomainCountingTable alloc], "initWithDatabase:tableName:", *(_QWORD *)(a1 + 32), CFSTR("features"));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_setAssociatedObject(*(id *)(a1 + 32), *(const void **)(a1 + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (void *)1);
  }
}

void __31__SGMIFeatureStore__runJournal__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SGMIFeatureStore__runJournal__block_invoke_2;
  v6[3] = &unk_1E7DB5BA0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "runWithLockAcquired:", v6);

}

void __31__SGMIFeatureStore__runJournal__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5[2];
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SGMIFeatureStore__runJournal__block_invoke_3;
  v6[3] = &unk_1E7DB7800;
  *(_OWORD *)v5 = *(_OWORD *)(a1 + 32);
  v4 = v5[0];
  v7 = vextq_s8(*(int8x16_t *)v5, *(int8x16_t *)v5, 8uLL);
  v8 = v3;
  v5[0] = v3;
  objc_msgSend(v4, "writeTransaction:", v6);

}

void __31__SGMIFeatureStore__runJournal__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  __int128 v17;
  size_t size;
  char v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "open");
    v5 = (void *)*MEMORY[0x1E0D81688];
    *(_QWORD *)&v6 = 138412290;
    v17 = v6;
    while (1)
    {
      v19 = 0;
      v7 = objc_msgSend(v4, "read:maxLength:", &v19, 1, v17);
      if (v7 < 1)
      {
        v15 = v7 == 0;
        goto LABEL_21;
      }
      size = 0;
      if (objc_msgSend(v4, "read:maxLength:", &size, 8) < 0)
        break;
      if (size)
      {
        if (size < 0xFFFF)
          v8 = malloc_type_malloc(size, 0x33D97687uLL);
        else
          v8 = malloc_type_calloc(1uLL, size, 0x33B41EB9uLL);
        v10 = v8;
        if (!v8)
          break;
        if (objc_msgSend(v4, "read:maxLength:", v8, size) < 0)
        {
          free(v10);
          break;
        }
        v11 = objc_alloc(MEMORY[0x1E0C99D50]);
        v9 = (id)objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", v10, size, 1);
      }
      else
      {
        v9 = v5;
      }
      v12 = v9;
      if (v19 == 1)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v17;
          v21 = v13;
          _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_INFO, "Running journal command: delete column %@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_clearBucketForColumn:usingDatabase:", v13, *(_QWORD *)(a1 + 40));
      }

    }
    v15 = 0;
LABEL_21:
    objc_msgSend(v4, "close");
    if (!v15)
      objc_msgSend(*(id *)(a1 + 32), "_clearSubModelsTablesUsingDatabase:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0);

  }
}

void __46__SGMIFeatureStore__writeJournalCommand_blob___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  __int16 v8;
  uint8_t buf[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sgMailIntelligenceLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v7;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "Journaling command: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "open");
  if (objc_msgSend(v3, "write:maxLength:", a1 + 56, 1) < 0)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v5 = "Failed to write command type to journal";
      v6 = buf;
LABEL_15:
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  *(_QWORD *)buf = objc_msgSend(*(id *)(a1 + 40), "length");
  if (objc_msgSend(v3, "write:maxLength:", buf, 8) < 0)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 0;
      v5 = "Failed to write command blob length to journal";
LABEL_14:
      v6 = (uint8_t *)&v8;
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (*(_QWORD *)buf
    && objc_msgSend(v3, "write:maxLength:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length")) < 0)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 0;
      v5 = "Failed to write command blob to journal";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  objc_msgSend(v3, "close");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_17:

}

void __33__SGMIFeatureStore__journalQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "SGMIFeatureStore-Journal");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_journalQueue__pasExprOnceResult;
  _journalQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __23__SGMIFeatureStore__db__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3[1]);
  v4 = objc_msgSend(*(id *)(a1 + 32), "_effectiveLockState");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1C3BD4F6C]();
    if (v5 == 3 || v5 == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v3[1];
      v3[1] = (id)v8;

      v10 = v3[1];
      if (v10)
      {
        if ((objc_msgSend(v10, "isInMemory") & 1) == 0)
        {
          v31 = 0;
          v32 = &v31;
          v33 = 0x2020000000;
          v34 = 0;
          v25 = 0;
          v26 = &v25;
          v27 = 0x3032000000;
          v28 = __Block_byref_object_copy__30539;
          v29 = __Block_byref_object_dispose__30540;
          v30 = 0;
          v11 = v3[1];
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __23__SGMIFeatureStore__db__block_invoke_2;
          v24[3] = &unk_1E7DB5B08;
          v24[4] = &v31;
          v24[5] = &v25;
          objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE TABLE IF NOT EXISTS integrityCheck (inconsequential STRING)"), 0, 0, v24);
          if (*((_BYTE *)v32 + 24))
          {
            sgMailIntelligenceLogHandle();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v23 = v26[5];
              *(_DWORD *)buf = 138412290;
              v37 = v23;
              _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "Encountered corrupt db (%@), attempting to reinitialize", buf, 0xCu);
            }

            v13 = (void *)MEMORY[0x1E0D81620];
            objc_msgSend(v3[1], "filename");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "truncateDatabaseAtPath:", v14);

            objc_msgSend(v3[1], "closePermanently");
            *((_BYTE *)v3 + 16) = 0;
            (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = v3[1];
            v3[1] = (id)v15;

          }
          _Block_object_dispose(&v25, 8);

          _Block_object_dispose(&v31, 8);
        }
        v17 = v3[1];
        if (v17 && !*((_BYTE *)v3 + 16))
        {
          v18 = objc_alloc(MEMORY[0x1E0D81578]);
          v35 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithMigrationObjects:", v19);

          v21 = objc_msgSend(v20, "migrateDatabases");
          *((_BYTE *)v3 + 16) = v21 == 1;
          if (v21 != 1)
          {
            v22 = v3[1];
            v3[1] = 0;

          }
          v17 = v3[1];
        }
      }
      else
      {
        v17 = 0;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v17);
    }
    objc_autoreleasePoolPop(v6);
  }

}

uint64_t __23__SGMIFeatureStore__db__block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

void __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  int v6;

  v3 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke_2;
  v4[3] = &unk_1E7DB5AB8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v6 = a2;
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
}

void __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDeviceLockStateEvent:", *(unsigned int *)(a1 + 40));

}

+ (id)storeInMemory
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseGetter:journalPath:", &__block_literal_global_339, 0);
}

+ (SGMIFeatureStore)storeWithFilename:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__SGMIFeatureStore_storeWithFilename___block_invoke;
  v10[3] = &unk_1E7DB5C70;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("sgmijournal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDatabaseGetter:journalPath:", v10, v7);

  return (SGMIFeatureStore *)v8;
}

+ (id)shouldExposeWarningGivenPositiveFeedbackCount:(id)a3 negativeFeedbackCount:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  v7 = objc_msgSend(a4, "integerValue");
  v8 = objc_msgSend(v6, "integerValue");

  return (id)objc_msgSend(v5, "numberWithInt:", v7 - v8 < 3);
}

+ (id)nsDataFromSignature:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  char __str[2];
  __int16 v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "UTF8String");
    v10 = 0;
    if (objc_msgSend(v5, "length"))
    {
      v7 = 0;
      do
      {
        *(_WORD *)__str = *(_WORD *)(v6 + v7);
        HIBYTE(v10) = strtol(__str, 0, 16);
        objc_msgSend(v4, "appendBytes:length:", (char *)&v10 + 1, 1);
        v7 += 2;
      }
      while (v7 < objc_msgSend(v5, "length"));
    }
  }

  return v4;
}

uint64_t __38__SGMIFeatureStore_storeWithFilename___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D81620], "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", *(_QWORD *)(a1 + 32), 1, 0, 0);
}

uint64_t __33__SGMIFeatureStore_storeInMemory__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D81620], "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", CFSTR(":memory:"), 0, 0, 0);
}

@end
