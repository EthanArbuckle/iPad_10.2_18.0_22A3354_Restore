@implementation HDHeadphoneAudioExposureStatisticsCalculator

- (HDHeadphoneAudioExposureStatisticsCalculator)initWithProfile:(id)a3 keyValueStore:(id)a4
{
  return (HDHeadphoneAudioExposureStatisticsCalculator *)-[HDHeadphoneAudioExposureStatisticsCalculator _initWithProfile:keyValueStore:daemonDidBecomeReadyHandler:](self, "_initWithProfile:keyValueStore:daemonDidBecomeReadyHandler:", a3, a4, 0);
}

- (id)_initWithProfile:(id)a3 keyValueStore:(id)a4 daemonDidBecomeReadyHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  HDHeadphoneAudioExposureStatisticsCalculator *v13;
  HDHeadphoneAudioExposureStatisticsCalculator *v14;
  uint64_t v15;
  OS_dispatch_queue *queue;
  HDHeadphoneAudioExposureBucketCollection *memoryCache;
  NSMutableArray *v18;
  NSMutableArray *pendingSamples;
  HDHeadphoneAudioExposureStatisticsCalculator *v20;
  void *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "profileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_profileIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsCalculator.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[profile.profileIdentifier isEqual:keyValueStore._profileIdentifier]"));

  }
  v23.receiver = self;
  v23.super_class = (Class)HDHeadphoneAudioExposureStatisticsCalculator;
  v13 = -[HDHeadphoneAudioExposureStatisticsCalculator init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v8);
    objc_storeStrong((id *)&v14->_keyValueStore, a4);
    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    *(_WORD *)&v14->_setup = 256;
    memoryCache = v14->_memoryCache;
    v14->_memoryCache = 0;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingSamples = v14->_pendingSamples;
    v14->_pendingSamples = v18;

    v20 = v14;
  }

  return v14;
}

- (id)rebuildWithAssertion:(id)a3 error:(id *)a4
{
  if (self->_setup)
    -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:](self, "_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:", a3, 0, 0, a4);
  else
    -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:](self, "_setupWithAssertion:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateWithNotifications:(id)a3 assertion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  HDHeadphoneDoseMetadataStore *keyValueStore;
  void *v13;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543618;
    v17 = objc_opt_class();
    v18 = 2048;
    v19 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_21A0AA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing %lu HAEN sample(s)", buf, 0x16u);

  }
  keyValueStore = self->_keyValueStore;
  v15 = 0;
  -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertionFromHAENFireDateUpdate:assertion:error:](self, "_rebuildWithAssertionFromHAENFireDateUpdate:assertion:error:", -[HDHeadphoneDoseMetadataStore updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:error:](keyValueStore, "updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:error:", v8, &v15), v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)updateWithRemoteNotificationDismissalFireDate:(id)a3 assertion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v15 = 138543362;
    v16 = objc_opt_class();
    _os_log_impl(&dword_21A0AA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating last HAE notification fired received", (uint8_t *)&v15, 0xCu);

  }
  v12 = -[HDHeadphoneDoseMetadataStore updatePreviousSevenDayRemoteNotificationFireDateWith:error:](self->_keyValueStore, "updatePreviousSevenDayRemoteNotificationFireDateWith:error:", v9, a5);

  -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertionFromHAENFireDateUpdate:assertion:error:](self, "_rebuildWithAssertionFromHAENFireDateUpdate:assertion:error:", v12, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_rebuildWithAssertionFromHAENFireDateUpdate:(int64_t)a3 assertion:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a3)
  {
    v9 = MEMORY[0x22073925C](self->_unitTesting_didUpdatePreviousSevenDayNotificationFireDate);
    v10 = (void *)v9;
    if (v9)
      (*(void (**)(uint64_t))(v9 + 16))(v9);

    if (a3 == 1)
    {
      +[HDHeadphoneExposureUpdateDoseResult resultForNoChange](HDHeadphoneExposureUpdateDoseResult, "resultForNoChange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v16 = 138543362;
        v17 = objc_opt_class();
        _os_log_impl(&dword_21A0AA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting 7-day headphone stats for next notification.", (uint8_t *)&v16, 0xCu);

      }
      -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self, "setNeedsRebuild");
      -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:](self, "_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:", v8, 1, a3 == 3, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        +[HDHeadphoneExposureUpdateDoseResult resultForUpdate:](HDHeadphoneExposureUpdateDoseResult, "resultForUpdate:", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self, "setNeedsRebuild");
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("Process HAEN Failed"), 0);
    v11 = 0;
  }

  return v11;
}

- (id)updateWithExposure:(id)a3 assertion:(id)a4 error:(id *)a5
{
  return -[HDHeadphoneAudioExposureStatisticsCalculator _updateWithExposure:replaying:assertion:error:](self, "_updateWithExposure:replaying:assertion:error:", a3, 0, a4, a5);
}

- (id)pruneWithNowDate:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  HDHeadphoneAudioExposureBucketCollection *memoryCache;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;

  memoryCache = self->_memoryCache;
  v9 = a3;
  -[HDHeadphoneAudioExposureBucketCollection pruneWithNowDate:](memoryCache, "pruneWithNowDate:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDHeadphoneAudioExposureStatisticsEntity _pruneWithNowDate:limit:profile:error:](HDHeadphoneAudioExposureStatisticsEntity, "_pruneWithNowDate:limit:profile:error:", v9, a4, WeakRetained, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDHeadphoneExposureStatisticsResult resultWithCache:prunedCount:](HDHeadphoneExposureStatisticsResult, "resultWithCache:prunedCount:", self->_memoryCache, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setNeedsRebuild
{
  -[HDHeadphoneAudioExposureStatisticsCalculator _setNeedsRebuild:](self, "_setNeedsRebuild:", 1);
}

- (id)unitTesting_snapshotBuckets
{
  return -[HDHeadphoneAudioExposureBucketCollection unitTesting_snapshotBuckets](self->_memoryCache, "unitTesting_snapshotBuckets");
}

- (id)unitTesting_pendingSamples
{
  return (id)-[NSMutableArray copy](self->_pendingSamples, "copy");
}

- (void)unitTesting_clearNeedsRebuild
{
  -[HDHeadphoneAudioExposureStatisticsCalculator _setNeedsRebuild:](self, "_setNeedsRebuild:", 0);
}

- (id)_setupWithAssertion:(id)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  HDHeadphoneDoseMetadataStore *keyValueStore;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  HDProfile **p_profile;
  id WeakRetained;
  void *v16;
  int v17;
  _BOOL4 needsRebuild;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v38;
  HDHeadphoneAudioExposureStatisticsCalculator *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  HDHeadphoneAudioExposureStatisticsCalculator *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  SEL v78;
  void *v79;
  uint64_t v80;
  HDHeadphoneAudioExposureStatisticsCalculator *v81;
  NSMutableArray *obj;
  id v83;
  uint64_t v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v83 = a3;
  if (-[HDHeadphoneAudioExposureStatisticsCalculator isSetup](self, "isSetup"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsCalculator.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.isSetup == NO"));

  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543362;
    v95 = objc_opt_class();
    _os_log_impl(&dword_21A0AA000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting up 7-Day HAE statistics.", buf, 0xCu);

  }
  keyValueStore = self->_keyValueStore;
  v93 = 0;
  v10 = -[HDHeadphoneDoseMetadataStore _shouldRebuildSevenDayStatisticsWithError:](keyValueStore, "_shouldRebuildSevenDayStatisticsWithError:", &v93);
  v11 = v93;
  v12 = v11;
  self->_needsRebuild = v10;
  if (v11)
  {
    if (objc_msgSend(v11, "hk_isHealthStoreUnavailableError"))
    {
      if (a4)
      {
        v13 = 0;
        *a4 = objc_retainAutorelease(v12);
        goto LABEL_86;
      }
      _HKLogDroppedError();
LABEL_85:
      v13 = 0;
      goto LABEL_86;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.6();
    self->_needsRebuild = 1;
  }
  v78 = a2;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isProtectedDataAvailable");
  v81 = self;
  if (!v17)
  {

LABEL_19:
    goto LABEL_21;
  }
  needsRebuild = self->_needsRebuild;

  if (needsRebuild)
  {
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v95 = v21;
      _os_log_impl(&dword_21A0AA000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Priming: protected data available; rebuilding.",
        buf,
        0xCu);

    }
    v92 = 0;
    -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:](v81, "_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:", v83, 0, 0, &v92);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v92;
    WeakRetained = v22;
    if (v13)
    {
      v17 = 1;
      goto LABEL_24;
    }
    if (objc_msgSend(v22, "hk_isHealthStoreUnavailableError"))
    {
      v28 = v12;
      v29 = WeakRetained;
      if (v29)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v29);
        else
          _HKLogDroppedError();
      }

      v12 = v28;
      goto LABEL_85;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.5();
    goto LABEL_19;
  }
  v17 = 0;
LABEL_21:
  _HKInitializeLogging();
  v23 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    v25 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v95 = v25;
    _os_log_impl(&dword_21A0AA000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Priming: protected data unavailable; loading statistics from disk.",
      buf,
      0xCu);

  }
  v91 = 0;
  -[HDHeadphoneAudioExposureStatisticsCalculator _loadCacheWithError:](v81, "_loadCacheWithError:", &v91);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v91;
  WeakRetained = v26;
  if (v13)
  {
LABEL_24:

    if ((objc_msgSend(v13, "needsRebuildOnNextUnlock") & 1) == 0 && !v81->_needsRebuild)
      goto LABEL_58;
    goto LABEL_41;
  }
  v27 = v26;
  if (v27)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v27);
    else
      _HKLogDroppedError();
  }

  if ((objc_msgSend(v27, "hk_isHealthStoreUnavailableError") & 1) != 0)
  {

    goto LABEL_85;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
    -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.4();

  v13 = 0;
LABEL_41:
  v30 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v30, "database");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isProtectedDataAvailable");

  if (v32 && !v17)
  {
    v33 = v13;
    _HKInitializeLogging();
    v34 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v95 = v36;
      _os_log_impl(&dword_21A0AA000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Priming failed: protected data available; rebuilding.",
        buf,
        0xCu);

    }
    v90 = 0;
    -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:](v81, "_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:", v83, 0, 0, &v90);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v90;

    if (!v13)
    {
      v38 = v37;
      if (v38)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v38);
        else
          _HKLogDroppedError();
      }

      if ((objc_msgSend(v38, "hk_isHealthStoreUnavailableError") & 1) != 0)
      {

        goto LABEL_85;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
        -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.3();
    }

  }
  if (!v13)
  {
LABEL_82:
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.1();

    goto LABEL_85;
  }
LABEL_58:
  v39 = v81;
  if (!v81->_memoryCache)
    goto LABEL_82;
  _HKInitializeLogging();
  v40 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    v42 = objc_opt_class();
    v43 = -[NSMutableArray count](v81->_pendingSamples, "count");
    *(_DWORD *)buf = 138543618;
    v95 = v42;
    v96 = 2048;
    v97 = v43;
    _os_log_impl(&dword_21A0AA000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replaying %lu HAE sample batches that arrived during setup.", buf, 0x16u);

  }
  v77 = v12;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v81->_pendingSamples;
  v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
  v44 = 0;
  if (v84)
  {
    v45 = 0;
    v46 = *(_QWORD *)v87;
    v80 = *(_QWORD *)v87;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v87 != v46)
          objc_enumerationMutation(obj);
        v48 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v47);
        v49 = v45 + v47 + 1;
        _HKInitializeLogging();
        v50 = (void *)*MEMORY[0x24BDD3000];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
        {
          v51 = v50;
          v52 = objc_opt_class();
          v53 = v39;
          v54 = v45 + v47 + 1;
          v55 = v52;
          v56 = -[NSMutableArray count](v53->_pendingSamples, "count");
          objc_msgSend(v48, "samples");
          v57 = v44;
          v58 = v45;
          v59 = v13;
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "count");
          *(_DWORD *)buf = 138544130;
          v95 = v55;
          v49 = v54;
          v96 = 2048;
          v97 = v54;
          v98 = 2048;
          v99 = v56;
          v39 = v81;
          v100 = 2048;
          v101 = v61;
          _os_log_impl(&dword_21A0AA000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replaying HAE batch (%lu of %lu) containing %lu samples.", buf, 0x2Au);

          v13 = v59;
          v45 = v58;
          v44 = v57;
          v46 = v80;
        }
        v85 = 0;
        -[HDHeadphoneAudioExposureStatisticsCalculator _updateWithExposure:replaying:assertion:error:](v39, "_updateWithExposure:replaying:assertion:error:", v48, 1, v83, &v85);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v85;
        if (v62)
        {
          v64 = v62;

          objc_msgSend(v64, "cache");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v65)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", v78, v39, CFSTR("HDHeadphoneAudioExposureStatisticsCalculator.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.cache"));

          }
          v44 = objc_msgSend(v64, "eligbleForUserNotification") | v44;
          v13 = v64;
        }
        else
        {
          v66 = v49;
          _HKInitializeLogging();
          v67 = (void *)*MEMORY[0x24BDD3000];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
          {
            v79 = v13;
            v68 = v67;
            v69 = objc_opt_class();
            v70 = -[NSMutableArray count](v39->_pendingSamples, "count");
            *(_DWORD *)buf = 138544130;
            v95 = v69;
            v96 = 2048;
            v97 = v66;
            v98 = 2048;
            v99 = v70;
            v100 = 2112;
            v101 = (uint64_t)v63;
            _os_log_fault_impl(&dword_21A0AA000, v68, OS_LOG_TYPE_FAULT, "[%{public}@] Replaying HAE batch (%lu of %lu) failed with error: %@", buf, 0x2Au);

            v13 = v79;
          }
          -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](v39, "setNeedsRebuild");
        }

        ++v47;
      }
      while (v84 != v47);
      v45 += v47;
      v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
    }
    while (v84);
  }

  if ((v44 & 1) != objc_msgSend(v13, "eligbleForUserNotification"))
  {
    v72 = objc_msgSend(v13, "copyWithEligbleForUserNotificationOverride:");
    v73 = v13;
    v13 = (void *)v72;

  }
  v12 = v77;
  -[NSMutableArray removeAllObjects](v39->_pendingSamples, "removeAllObjects");
  if (v13 && v39->_memoryCache)
  {
    v39->_setup = 1;
  }
  else
  {
    _HKInitializeLogging();
    v75 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      -[HDHeadphoneAudioExposureStatisticsCalculator _setupWithAssertion:error:].cold.2(v75);
  }
LABEL_86:

  return v13;
}

- (id)_rebuildWithAssertion:(id)a3 allowInitialQueriesToFail:(BOOL)a4 resetDoseToZero:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v11;
  os_log_t *v12;
  void *v13;
  NSObject *v14;
  HDHeadphoneDoseMetadataStore *keyValueStore;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  HDHeadphoneDoseMetadataStore *v22;
  void *v23;
  id v24;
  id WeakRetained;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  HDProfile **p_profile;
  os_log_t *v34;
  void *v35;
  os_log_t v36;
  HDHeadphoneAudioExposureBucketCollection *memoryCache;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  HDHeadphoneAudioExposureBucketCollection *v44;
  os_log_t v45;
  _BOOL4 v46;
  id v47;
  BOOL v48;
  HDHeadphoneAudioExposureBucketCollection *v49;
  HDHeadphoneAudioExposureBucketCollection *v50;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v7 = a5;
  v73 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  if (v7 && !a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsCalculator.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!resetDoseToZero || (resetDoseToZero && allowInitialQueriesToFail)"));

  }
  _HKInitializeLogging();
  v12 = (os_log_t *)MEMORY[0x24BDD3000];
  v13 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    *(_DWORD *)buf = 138543362;
    v68 = objc_opt_class();
    _os_log_impl(&dword_21A0AA000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rebuilding 7-Day HAE Statistics.", buf, 0xCu);

  }
  keyValueStore = self->_keyValueStore;
  v66 = 0;
  v16 = -[HDHeadphoneDoseMetadataStore rebuildCachedFireDateFromLocalHAENStoreIfNeededWithError:](keyValueStore, "rebuildCachedFireDateFromLocalHAENStoreIfNeededWithError:", &v66);
  v17 = v66;
  v18 = v17;
  if (v16)
  {
LABEL_13:
    v22 = self->_keyValueStore;
    v65 = 0;
    +[HDHeadphoneAudioExposurePolicyDeterminer determinePreviousFireDateWithStore:error:](HDHeadphoneAudioExposurePolicyDeterminer, "determinePreviousFireDateWithStore:error:", v22, &v65);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v65;
    v20 = v24;
    if (!v23 && v24)
    {
      -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self, "setNeedsRebuild");
      if (a6)
      {
        v21 = 0;
        *a6 = objc_retainAutorelease(v20);
      }
      else
      {
        _HKLogDroppedError();
        v21 = 0;
      }
      goto LABEL_48;
    }
    v57 = a6;
    v58 = v18;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v60 = v23;
    +[HDHeadphoneAudioExposureStatisticsBucket makeBucketsForProfile:earliestStartDate:](HDHeadphoneAudioExposureStatisticsBucket, "makeBucketsForProfile:earliestStartDate:", WeakRetained, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v11;
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForAccessibilityAssertion:", v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "mutableCopy");

    objc_msgSend((id)v29, "setCacheScope:", 1);
    v30 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v30, "database");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __118__HDHeadphoneAudioExposureStatisticsCalculator__rebuildWithAssertion_allowInitialQueriesToFail_resetDoseToZero_error___block_invoke;
    v62[3] = &unk_24DC5F3C8;
    v32 = v26;
    v63 = v32;
    v56 = (void *)v29;
    LOBYTE(v29) = objc_msgSend(v31, "performWithTransactionContext:error:block:", v29, &v64, v62);
    v59 = v64;

    if ((v29 & 1) != 0)
    {
      v11 = v27;
      v18 = v58;
      p_profile = &self->_profile;
    }
    else
    {
      if (!a4)
      {
        -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self, "setNeedsRebuild");
        v41 = v59;
        v42 = v59;
        v43 = v42;
        v11 = v27;
        v18 = v58;
        if (v42)
        {
          if (v57)
            *v57 = objc_retainAutorelease(v42);
          else
            _HKLogDroppedError();
        }

        v21 = 0;
        goto LABEL_47;
      }
      _HKInitializeLogging();
      v34 = (os_log_t *)MEMORY[0x24BDD3000];
      v35 = (void *)*MEMORY[0x24BDD3000];
      v11 = v27;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      {
        v52 = v35;
        v53 = objc_opt_class();
        v54 = objc_msgSend(v32, "count");
        *(_DWORD *)buf = 138543874;
        v68 = v53;
        v69 = 2048;
        v70 = v54;
        v71 = 2112;
        v72 = v59;
        _os_log_error_impl(&dword_21A0AA000, v52, OS_LOG_TYPE_ERROR, "[%{public}@] Resetting %lu buckets after initial query failure: %@.", buf, 0x20u);

      }
      v18 = v58;
      if (!v60 && v7)
      {
        _HKInitializeLogging();
        v36 = *v34;
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_FAULT))
          -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:].cold.3(v36);
        -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self, "setNeedsRebuild");
        v7 = 0;
      }
      memoryCache = self->_memoryCache;
      v61 = 0;
      -[HDHeadphoneAudioExposureBucketCollection _bucketsWithEarliestStartDate:resetDoseToZero:error:](memoryCache, "_bucketsWithEarliestStartDate:resetDoseToZero:error:", v60, v7, &v61);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v61;
      if (v38)
      {
        v40 = v38;

        v32 = v40;
      }
      else
      {
        v44 = self->_memoryCache;
        _HKInitializeLogging();
        v45 = *v34;
        v46 = os_log_type_enabled(*v34, OS_LOG_TYPE_ERROR);
        if (v44)
        {
          if (v46)
            -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:].cold.2();
        }
        else if (v46)
        {
          -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:].cold.1(v45);
        }
      }
      p_profile = &self->_profile;

    }
    v47 = objc_loadWeakRetained((id *)p_profile);
    v48 = +[HDHeadphoneAudioExposureStatisticsEntity _replaceExistingWithBuckets:profile:error:](HDHeadphoneAudioExposureStatisticsEntity, "_replaceExistingWithBuckets:profile:error:", v32, v47, v57);

    if (v48)
    {
      v49 = -[HDHeadphoneAudioExposureBucketCollection initWithBuckets:]([HDHeadphoneAudioExposureBucketCollection alloc], "initWithBuckets:", v32);
      v50 = self->_memoryCache;
      self->_memoryCache = v49;

      -[HDHeadphoneAudioExposureStatisticsCalculator _setNeedsRebuild:](self, "_setNeedsRebuild:", 0);
      +[HDHeadphoneExposureStatisticsResult resultWithCache:eligbleForUserNotification:](HDHeadphoneExposureStatisticsResult, "resultWithCache:eligbleForUserNotification:", self->_memoryCache, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self, "setNeedsRebuild");
      v21 = 0;
    }
    v41 = v59;
LABEL_47:

    v23 = v60;
LABEL_48:

    goto LABEL_49;
  }
  if (!objc_msgSend(v17, "hk_isHealthStoreUnavailableError"))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
      -[HDHeadphoneAudioExposureStatisticsCalculator _rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:].cold.4();
    goto LABEL_13;
  }
  v19 = v18;
  v20 = v19;
  if (!v19)
  {
LABEL_34:
    v21 = 0;
    goto LABEL_49;
  }
  if (!a6)
  {
    _HKLogDroppedError();
    goto LABEL_34;
  }
  v20 = objc_retainAutorelease(v19);
  v21 = 0;
  *a6 = v20;
LABEL_49:

  return v21;
}

uint64_t __118__HDHeadphoneAudioExposureStatisticsCalculator__rebuildWithAssertion_allowInitialQueriesToFail_resetDoseToZero_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "queryForInitialStatisticsWithError:", a2, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)_loadBucketsFromProfile:(id)a3 needsRebuild:(BOOL *)a4 error:(id *)a5
{
  id v8;
  id WeakRetained;
  HDHeadphoneDoseMetadataStore *v10;
  void *v11;
  id v12;
  HDHeadphoneDoseMetadataStore *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  HDHeadphoneDoseMetadataStore *v19;
  uint64_t *v20;
  BOOL *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v10 = self->_keyValueStore;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke;
  v17[3] = &unk_24DC5F478;
  v20 = &v22;
  v12 = WeakRetained;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v21 = a4;
  LODWORD(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDHeadphoneAudioExposureStatisticsEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v17);

  if ((_DWORD)a5)
    v14 = (void *)v23[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  return v15;
}

BOOL __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  _BYTE *v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BYTE *v25;
  uint64_t v27;
  uint64_t v28;
  id (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;

  +[HDHeadphoneAudioExposureStatisticsEntity _loadBucketsFromProfile:error:](HDHeadphoneAudioExposureStatisticsEntity, "_loadBucketsFromProfile:error:", a1[4], a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v8)
    return 0;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "hk_containsObjectPassingTest:", &__block_literal_global_4);
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "hk_containsObjectPassingTest:", &__block_literal_global_211);
    v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_4;
    v30 = &unk_24DC5F450;
    v13 = v9;
    v31 = v13;
    objc_msgSend(v12, "hk_map:", &v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count", v27, v28, v29, v30);

    if ((v10 & 1) != 0 || (v11 & 1) != 0 || v15 < 3)
    {
      v16 = (_BYTE *)a1[7];
      if (v16)
        *v16 = 1;
    }
    v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count") != 0;

  }
  else
  {
    v18 = a1[5];
    v32 = 0;
    +[HDHeadphoneAudioExposurePolicyDeterminer determinePreviousFireDateWithStore:error:](HDHeadphoneAudioExposurePolicyDeterminer, "determinePreviousFireDateWithStore:error:", v18, &v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v32;
    v21 = v20;
    if (v19 || !v20)
    {
      +[HDHeadphoneAudioExposureStatisticsBucket makeBucketsForProfile:earliestStartDate:](HDHeadphoneAudioExposureStatisticsBucket, "makeBucketsForProfile:earliestStartDate:", a1[4], v19);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1[6] + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      v25 = (_BYTE *)a1[7];
      if (v25)
        *v25 = 1;
      v17 = +[HDHeadphoneAudioExposureStatisticsEntity _replaceExistingWithBuckets:profile:error:](HDHeadphoneAudioExposureStatisticsEntity, "_replaceExistingWithBuckets:profile:error:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4], a3);
    }
    else if (a3)
    {
      v17 = 0;
      *a3 = objc_retainAutorelease(v20);
    }
    else
    {
      _HKLogDroppedError();
      v17 = 0;
    }

  }
  return v17;
}

uint64_t __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "includesJournaledSamples");
}

uint64_t __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreviousStatistics");
}

id __91__HDHeadphoneAudioExposureStatisticsCalculator__loadBucketsFromProfile_needsRebuild_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (objc_msgSend(v3, "isExpiredForNowDate:", v2))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (id)_loadCacheWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  HDHeadphoneAudioExposureBucketCollection *v7;
  HDHeadphoneAudioExposureBucketCollection *memoryCache;
  void *v9;
  unsigned __int8 v11;

  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDHeadphoneAudioExposureStatisticsCalculator _loadBucketsFromProfile:needsRebuild:error:](self, "_loadBucketsFromProfile:needsRebuild:error:", WeakRetained, &v11, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = -[HDHeadphoneAudioExposureBucketCollection initWithBuckets:]([HDHeadphoneAudioExposureBucketCollection alloc], "initWithBuckets:", v6);
    memoryCache = self->_memoryCache;
    self->_memoryCache = v7;

    +[HDHeadphoneExposureStatisticsResult resultWithCache:eligbleForUserNotification:](HDHeadphoneExposureStatisticsResult, "resultWithCache:eligbleForUserNotification:", self->_memoryCache, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsRebuildOnNextUnlock:", v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_updateWithExposure:(id)a3 replaying:(BOOL)a4 assertion:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  int v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForReading");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "addAccessibilityAssertion:", v11);
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    v29 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __94__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_assertion_error___block_invoke;
    v20[3] = &unk_24DC5F4A0;
    v22 = &v24;
    v20[4] = self;
    v21 = v10;
    v23 = v8;
    v16 = objc_msgSend(v15, "performWithTransactionContext:error:block:", v13, a6, v20);

    if (v16)
      v17 = (void *)v25[5];
    else
      v17 = 0;
    v18 = v17;

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    -[HDHeadphoneAudioExposureStatisticsCalculator _updateWithExposure:replaying:error:](self, "_updateWithExposure:replaying:error:", v10, v8, a6);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

BOOL __94__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_assertion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateWithExposure:replaying:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

- (id)_updateWithExposure:(id)a3 replaying:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  HDHeadphoneAudioExposureBucketCollection *memoryCache;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HDHeadphoneDoseMetadataStore *keyValueStore;
  BOOL v18;
  id v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[7];
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  memoryCache = self->_memoryCache;
  _HKInitializeLogging();
  v10 = (os_log_t *)MEMORY[0x24BDD3000];
  v11 = (void *)*MEMORY[0x24BDD3000];
  v12 = *MEMORY[0x24BDD3000];
  if (memoryCache)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v11;
      v14 = objc_opt_class();
      objc_msgSend(v8, "samples");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v14;
      v34 = 2048;
      v35 = objc_msgSend(v15, "count");
      _os_log_impl(&dword_21A0AA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing HAE sample batch (%lu).", buf, 0x16u);

    }
    buf[0] = 0;
    -[HDHeadphoneAudioExposureBucketCollection _updateWithSampleBatch:needsRebuild:error:](self->_memoryCache, "_updateWithSampleBatch:needsRebuild:error:", v8, buf, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (buf[0])
    {
      keyValueStore = self->_keyValueStore;
      v31 = 0;
      v18 = -[HDHeadphoneDoseMetadataStore _setShouldRebuildSevenDayStatistics:error:](keyValueStore, "_setShouldRebuildSevenDayStatistics:error:", 1, &v31);
      v19 = v31;
      if (!v18)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
          -[HDHeadphoneAudioExposureStatisticsCalculator _updateWithExposure:replaying:error:].cold.2();
      }

    }
    if (objc_msgSend(v16, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v21 = (void *)objc_opt_class();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __84__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_error___block_invoke;
      v30[3] = &unk_24DC5F4C8;
      v30[5] = WeakRetained;
      v30[6] = v21;
      v30[4] = v16;
      v22 = (void *)MEMORY[0x22073925C](v30);
      objc_msgSend(WeakRetained, "database");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v21, "performWriteTransactionWithHealthDatabase:error:block:", v23, a5, v22);

      if ((v24 & 1) != 0)
      {
        +[HDHeadphoneExposureStatisticsResult resultWithCache:eligbleForUserNotification:](HDHeadphoneExposureStatisticsResult, "resultWithCache:eligbleForUserNotification:", self->_memoryCache, objc_msgSend(v8, "canTriggerUserNotification"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HDHeadphoneAudioExposureStatisticsCalculator setNeedsRebuild](self, "setNeedsRebuild");
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else if (v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[HDHeadphoneAudioExposureStatisticsCalculator _updateWithExposure:replaying:error:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 100, CFSTR("cannot flush pending samples without memory cache."));
    v25 = 0;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v11;
      v27 = objc_opt_class();
      objc_msgSend(v8, "samples");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v27;
      v34 = 2048;
      v35 = objc_msgSend(v28, "count");
      _os_log_impl(&dword_21A0AA000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Caching HAE sample batch (%lu) for replay after initial rebuild.", buf, 0x16u);

    }
    -[NSMutableArray addObject:](self->_pendingSamples, "addObject:", v8);
    +[HDHeadphoneExposureStatisticsResult resultForAppendedSamplesDuringStartup](HDHeadphoneExposureStatisticsResult, "resultForAppendedSamplesDuringStartup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

uint64_t __84__HDHeadphoneAudioExposureStatisticsCalculator__updateWithExposure_replaying_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "_replaceExistingWithBuckets:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (void)_setNeedsRebuild:(BOOL)a3
{
  _BOOL4 v3;
  HDHeadphoneDoseMetadataStore *keyValueStore;
  BOOL v6;
  id v7;
  HDHeadphoneDoseMetadataStore *v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;

  v3 = a3;
  self->_needsRebuild = a3;
  keyValueStore = self->_keyValueStore;
  v12 = 0;
  v6 = -[HDHeadphoneDoseMetadataStore _setShouldRebuildSevenDayStatistics:error:](keyValueStore, "_setShouldRebuildSevenDayStatistics:error:");
  v7 = v12;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
    {
      -[HDHeadphoneAudioExposureStatisticsCalculator _setNeedsRebuild:].cold.2();
      if (v3)
        goto LABEL_4;
LABEL_8:
      v10 = v7;
      goto LABEL_9;
    }
  }
  if (!v3)
    goto LABEL_8;
LABEL_4:
  v8 = self->_keyValueStore;
  v11 = v7;
  v9 = -[HDHeadphoneDoseMetadataStore _setShouldRebuildPreviousSevenDayNotification:error:](v8, "_setShouldRebuildPreviousSevenDayNotification:error:", 1, &v11);
  v10 = v11;

  if (!v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      -[HDHeadphoneAudioExposureStatisticsCalculator _setNeedsRebuild:].cold.1();
  }
LABEL_9:

}

- (BOOL)needsRebuild
{
  return self->_needsRebuild;
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (id)unitTesting_didUpdatePreviousSevenDayNotificationFireDate
{
  return self->_unitTesting_didUpdatePreviousSevenDayNotificationFireDate;
}

- (void)setUnitTesting_didUpdatePreviousSevenDayNotificationFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didUpdatePreviousSevenDayNotificationFireDate, 0);
  objc_storeStrong((id *)&self->_pendingSamples, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_setupWithAssertion:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  _BOOL4 v9;
  __int16 v10;
  _BOOL4 v11;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v3);
  v4 = OUTLINED_FUNCTION_2_0();
  v5 = *(_QWORD *)(v1 + 40);
  v6 = 138543874;
  v7 = v4;
  v8 = 1024;
  v9 = v0 != 0;
  v10 = 1024;
  v11 = v5 != 0;
  _os_log_fault_impl(&dword_21A0AA000, v2, OS_LOG_TYPE_FAULT, "[%{public}@] Priming Failed (success: %d, memory cache exists: %d).", (uint8_t *)&v6, 0x18u);

  OUTLINED_FUNCTION_1();
}

- (void)_setupWithAssertion:(void *)a1 error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_21A0AA000, v2, v3, "[%{public}@] Setup failed with an unexpected error.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_0();
}

- (void)_setupWithAssertion:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_21A0AA000, v0, v1, "Setup failed to rebuild HAE stats (after failed load) with error: %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)_setupWithAssertion:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_21A0AA000, v0, v1, "Setup failed to load HAE stats with error: %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)_setupWithAssertion:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_21A0AA000, v0, v1, "Setup failed to rebuild HAE stats with error: %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)_setupWithAssertion:error:.cold.6()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Unable to load rebuild flag due to error (defaulting to YES): %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_rebuildWithAssertion:(void *)a1 allowInitialQueriesToFail:resetDoseToZero:error:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_21A0AA000, v1, v2, "[%{public}@] No dose to reset since HAEN arrived before initial setup.", v3);

  OUTLINED_FUNCTION_8_0();
}

- (void)_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Failed to update buckets to exclude additional historical HAE datums while preserving existing: %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_rebuildWithAssertion:(void *)a1 allowInitialQueriesToFail:resetDoseToZero:error:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_21A0AA000, v2, v3, "[%{public}@] Reset dose to zero without HAEN fire date is unsupported.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_0();
}

- (void)_rebuildWithAssertion:allowInitialQueriesToFail:resetDoseToZero:error:.cold.4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Unable to optimistically rebuild Previous 7-Day HAEN FireDate: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_updateWithExposure:replaying:error:.cold.1()
{
  void *v0;
  NSObject *v1;
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v2);
  v3 = OUTLINED_FUNCTION_2_0();
  objc_msgSend(v0, "samples");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v3;
  v7 = 2048;
  v8 = objc_msgSend(v4, "count");
  _os_log_fault_impl(&dword_21A0AA000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to replay HAE Batch (%lu samples) with no cache available.", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)_updateWithExposure:replaying:error:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Error performing rebuild while processing HAE sample batch: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_setNeedsRebuild:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Failed to request Previous 7-Day HAEN Fire Date rebuild: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_setNeedsRebuild:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v2, v3, "[%{public}@] Failed to request 7-Day HAE rebuild: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
