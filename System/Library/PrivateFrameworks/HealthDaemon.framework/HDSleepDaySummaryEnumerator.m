@implementation HDSleepDaySummaryEnumerator

- (HDSleepDaySummaryEnumerator)initWithProfile:(id)a3 cachingSession:(id)a4 gregorianCalendar:(id)a5 morningIndexRange:(id)a6 ascending:(BOOL)a7 options:(unint64_t)a8 debugIdentifier:(id)a9
{
  int64_t var1;
  int64_t var0;
  id v15;
  id v16;
  id v17;
  HDSleepDaySummaryEnumerator *v18;
  HDSleepDaySummaryEnumerator *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t options;
  HDStatisticsCollectionCalculatorSourceOrderProvider *sourceOrderProvider;
  uint64_t v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *adjustedMorningIndexCache;
  id v29;
  id v30;
  objc_super v31;

  var1 = a6.var1;
  var0 = a6.var0;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v30 = a9;
  v31.receiver = self;
  v31.super_class = (Class)HDSleepDaySummaryEnumerator;
  v18 = -[HDSleepDaySummaryEnumerator init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    v29 = v16;
    objc_storeWeak((id *)&v18->_profile, v15);
    objc_storeStrong((id *)&v19->_cachingSession, a4);
    objc_storeStrong((id *)&v19->_gregorianCalendar, a5);
    v19->_morningIndexRange.start = var0;
    v19->_morningIndexRange.duration = var1;
    v19->_ascending = a7;
    v19->_options = a8;
    objc_storeStrong((id *)&v19->_debugIdentifier, a9);
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithDayIndex:calendar:", var0, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v17, "component:fromDate:", 512, v21);

    v19->_cachedFirstDayOfWeek = var0 - v22 + 1;
    options = v19->_options;
    if ((options & 4) != 0 || (options & 0x18) == 0)
    {
      +[HDStatisticsCollectionCalculatorCachingSourceOrderProvider sleepSourceOrderProviderForProfile:](HDStatisticsCollectionCalculatorCachingSourceOrderProvider, "sleepSourceOrderProviderForProfile:", v15, v16);
      v25 = objc_claimAutoreleasedReturnValue();
      sourceOrderProvider = v19->_sourceOrderProvider;
      v19->_sourceOrderProvider = (HDStatisticsCollectionCalculatorSourceOrderProvider *)v25;
    }
    else
    {
      sourceOrderProvider = v19->_sourceOrderProvider;
      v19->_sourceOrderProvider = 0;
    }
    v16 = v29;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    adjustedMorningIndexCache = v19->_adjustedMorningIndexCache;
    v19->_adjustedMorningIndexCache = v26;

  }
  return v19;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  id v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSString *debugIdentifier;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HDSampleAggregateCachingSession *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  char v19;
  char v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  NSString *v24;
  id v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  NSString *v29;
  id v30;
  char v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  os_log_t v38;
  NSObject *v39;
  void *v40;
  NSString *v41;
  id v42;
  char v43;
  id v44;
  HDSampleAggregateCachingSession *v45;
  id v46;
  id v47;
  char v48;
  id v49;
  os_log_t v50;
  id v51;
  os_log_t v52;
  NSObject *v53;
  void *v54;
  NSString *v55;
  id v56;
  HDSampleAggregateCachingSession *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  os_log_t v62;
  id v63;
  os_log_t v64;
  id v65;
  NSObject *v67;
  void *v68;
  NSString *v69;
  id v70;
  NSObject *v71;
  void *v72;
  NSString *v73;
  id v74;
  NSObject *v75;
  void *v76;
  NSString *v77;
  id v78;
  BOOL v79;
  id v80;
  void *v81;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[3];
  char v89;
  _BYTE buf[24];
  void *v91;
  _BYTE v92[24];
  _QWORD *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E0CB5368];
  v7 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    debugIdentifier = self->_debugIdentifier;
    v11 = v9;
    NSStringFromHKDayIndexRange();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromBool();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSleepDaySummaryQueryOptionsStringRepresentation();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = debugIdentifier;
    *(_WORD *)&buf[22] = 2114;
    v91 = v12;
    *(_WORD *)v92 = 2114;
    *(_QWORD *)&v92[2] = v13;
    *(_WORD *)&v92[10] = 2114;
    *(_QWORD *)&v92[12] = v14;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Enumerate with range: %{public}@, ascending: %{public}@, options: %{public}@", buf, 0x34u);

  }
  v15 = self->_cachingSession;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "behavior");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "supportsCachedSleepDaySummaryQueries");
  if (v15)
    v20 = v19;
  else
    v20 = 0;

  if ((v20 & 1) == 0)
  {
    _HKInitializeLogging();
    v26 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_opt_class();
      v29 = self->_debugIdentifier;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v29;
      v30 = v28;
      _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Caching not enabled; enumerating without caching.",
        buf,
        0x16u);

    }
    goto LABEL_14;
  }
  if (self->_morningIndexRange.start != *MEMORY[0x1E0CB4B90]
    || self->_morningIndexRange.duration != *(_QWORD *)(MEMORY[0x1E0CB4B90] + 8))
  {
    v32 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v32, "database");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0;
    +[HDHealthEntity maxRowIDForPredicate:healthDatabase:error:](HDSampleEntity, "maxRowIDForPredicate:healthDatabase:error:", 0, v33, &v87);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v87;

    if (!v81)
    {
      _HKInitializeLogging();
      v50 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v71 = v50;
        v72 = (void *)objc_opt_class();
        v73 = self->_debugIdentifier;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2114;
        v91 = v34;
        v74 = v72;
        _os_log_error_impl(&dword_1B7802000, v71, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error checking for max row ID to serve as cache anchor: %{public}@", buf, 0x20u);

      }
      v51 = v34;
      v35 = v51;
      if (v51)
      {
        if (a3)
        {
          v35 = objc_retainAutorelease(v51);
          v31 = 0;
          *a3 = v35;
        }
        else
        {
          _HKLogDroppedError();
          v31 = 0;
        }
        v49 = v35;
        goto LABEL_51;
      }
      v49 = 0;
      goto LABEL_50;
    }
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v86 = v34;
    v36 = -[HDSampleAggregateCachingSession cachesExistWithError:](v15, "cachesExistWithError:", &v86);
    v37 = v86;

    if (v36 == 1)
    {
      _HKInitializeLogging();
      v52 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v53 = v52;
        v54 = (void *)objc_opt_class();
        v55 = self->_debugIdentifier;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v55;
        v56 = v54;
        _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Cache exists! Returning cached sleep day summaries.", buf, 0x16u);

      }
      v84 = v37;
      v57 = v15;
      v80 = v81;
      v58 = v35;
      v59 = v5;
      v88[0] = 0;
      v88[1] = v88;
      v88[2] = 0x2020000000;
      v89 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __96__HDSleepDaySummaryEnumerator__enumerateCacheWithSession_anchor_summariesToCache_error_handler___block_invoke;
      v91 = &unk_1E6CED1D8;
      *(_QWORD *)v92 = self;
      v60 = v59;
      *(_QWORD *)&v92[16] = v60;
      v93 = v88;
      v61 = v58;
      *(_QWORD *)&v92[8] = v61;
      v79 = -[HDSampleAggregateCachingSession activateWithError:cacheHandler:](v57, "activateWithError:cacheHandler:", &v84, buf);

      _Block_object_dispose(v88, 8);
      v44 = v84;

      v37 = v44;
      if (v79)
      {
LABEL_21:
        v83 = v44;
        v35 = v35;
        v45 = v15;
        v46 = v81;
        if (objc_msgSend(v35, "count"))
        {
          if (v36 == 2
            && !-[HDSampleAggregateCachingSession activateWithError:cacheHandler:](v45, "activateWithError:cacheHandler:", &v83, &__block_literal_global_220))
          {
            v48 = 0;
            goto LABEL_26;
          }
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __101__HDSleepDaySummaryEnumerator__cacheSleepDaySummaries_cachingSession_cacheAnchor_isEmptyCache_error___block_invoke_2;
          v91 = &unk_1E6CE7DB8;
          *(_QWORD *)v92 = self;
          v47 = v35;
          *(_QWORD *)&v92[8] = v47;
          *(_QWORD *)&v92[16] = v46;
          -[HDSampleAggregateCachingSession insertCaches:anchor:completion:](v45, "insertCaches:anchor:completion:", v47, *(_QWORD *)&v92[16], buf);

        }
        v48 = 1;
LABEL_26:

        v49 = v83;
        if ((v48 & 1) != 0)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __53__HDSleepDaySummaryEnumerator__finishCachingSession___block_invoke;
          v91 = &unk_1E6CE77C8;
          *(_QWORD *)v92 = self;
          -[HDSampleAggregateCachingSession finishWithCompletion:](v45, "finishWithCompletion:", buf);
          v31 = 1;
LABEL_51:

          goto LABEL_52;
        }
        _HKInitializeLogging();
        v64 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v75 = v64;
          v76 = (void *)objc_opt_class();
          v77 = self->_debugIdentifier;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v76;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v77;
          *(_WORD *)&buf[22] = 2114;
          v91 = v49;
          v78 = v76;
          _os_log_error_impl(&dword_1B7802000, v75, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error caching sleep day summaries: %{public}@", buf, 0x20u);

        }
        v65 = v49;
        v49 = v65;
        if (v65)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v65);
          else
            _HKLogDroppedError();
        }

LABEL_50:
        v31 = 0;
        goto LABEL_51;
      }
    }
    else if (v36 == 2)
    {
      _HKInitializeLogging();
      v38 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        v40 = (void *)objc_opt_class();
        v41 = self->_debugIdentifier;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v41;
        v42 = v40;
        _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Cache does not exist. Enumerating sleep day summaries from scratch.", buf, 0x16u);

      }
      v85 = v37;
      v43 = -[HDSleepDaySummaryEnumerator _enumerateSleepDaySummariesForMorningIndexRanges:summariesToCache:error:handler:]((uint64_t)self, self->_morningIndexRange.start, self->_morningIndexRange.duration, v35, &v85, v5);
      v44 = v85;

      v37 = v44;
      if ((v43 & 1) != 0)
        goto LABEL_21;
    }
    _HKInitializeLogging();
    v62 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v67 = v62;
      v68 = (void *)objc_opt_class();
      v69 = self->_debugIdentifier;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v68;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2114;
      v91 = v37;
      v70 = v68;
      _os_log_error_impl(&dword_1B7802000, v67, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error enumerating sleep day summaries: %{public}@", buf, 0x20u);

    }
    v63 = v37;
    v49 = v63;
    if (v63)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v63);
      else
        _HKLogDroppedError();
    }

    goto LABEL_50;
  }
  _HKInitializeLogging();
  v21 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = (void *)objc_opt_class();
    v24 = self->_debugIdentifier;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v24;
    v25 = v23;
    _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Client specified HKDayIndexRangeZero; enumerating without caching.",
      buf,
      0x16u);

  }
LABEL_14:
  v31 = -[HDSleepDaySummaryEnumerator _enumerateSleepDaySummariesForMorningIndexRanges:summariesToCache:error:handler:]((uint64_t)self, self->_morningIndexRange.start, self->_morningIndexRange.duration, 0, a3, v5);
LABEL_52:

  return v31;
}

- (uint64_t)_enumerateSleepDaySummariesForMorningIndexRanges:(uint64_t)a3 summariesToCache:(void *)a4 error:(_QWORD *)a5 handler:(void *)a6
{
  id v10;
  BOOL v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  BOOL v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  _QWORD *v50;
  id v51;
  void *v52;
  void *v53;
  HDMultiTypeSortedSampleIterator *v54;
  void *v55;
  id v56;
  HDMultiTypeSortedSampleIterator *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  id WeakRetained;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD *v73;
  char v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  id v83;
  id v84;
  uint64_t v85;
  char v86;
  uint64_t v88;
  uint64_t v89;
  char v90;
  id v92;
  id v93;
  id v94;
  void *v95;
  id obj;
  void *v97;
  id v98;
  void *v99;
  id v100;
  uint64_t v101;
  _QWORD v102[2];
  void (*v103)(_QWORD *, void *, char *);
  void *v104;
  uint64_t v105;
  id v106;
  id v107;
  id v108;
  __int128 *v109;
  id *v110;
  id *v111;
  id v112;
  id *v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  id *v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  id v125;
  char v126;
  _BYTE buf[24];
  void *v128;
  id v129;
  char *v130;
  _QWORD v131[4];

  v131[1] = *MEMORY[0x1E0C80C00];
  v93 = a4;
  v94 = a6;
  if (!a1)
  {
    v85 = 0;
    goto LABEL_81;
  }
  v92 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v101 = a1;
  v10 = *(id *)(a1 + 24);
  v11 = a2 == *MEMORY[0x1E0CB4B90] && a3 == *(_QWORD *)(MEMORY[0x1E0CB4B90] + 8);
  v12 = v11;
  v90 = v12;
  v88 = a3;
  v89 = a2;
  if (v11)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3588], "hk_sleepDayIntervalForMorningIndexRange:calendar:", a2, a3, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v15, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateByAddingTimeInterval:", -172800.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v18, v19);

    }
    else
    {
      v13 = 0;
    }
    a2 = v89;
  }

  v20 = v13;
  v21 = v101;
  v95 = v20;
  if ((*(_BYTE *)(v101 + 56) & 2) != 0)
  {

    goto LABEL_38;
  }
  +[HDDataEntity hk_timeZoneEncodingOptions](HDDataEntity, "hk_timeZoneEncodingOptions");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "startDate");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v101;
  v22 = *(void **)(v101 + 80);
  *(_QWORD *)(v101 + 80) = 0;

  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = *(void **)(v101 + 72);
  *(_QWORD *)(v101 + 72) = v23;

  if (!v99)
  {

LABEL_37:
    a2 = v89;
LABEL_38:
    v120 = 0;
    *(_QWORD *)&v121 = 0;
    *((_QWORD *)&v121 + 1) = &v121;
    v122 = 0x2020000000uLL;
    if ((v90 & 1) == 0)
    {
      v44 = v88 + a2 - 1;
      if (v88 <= 0)
        v44 = 0x7FFFFFFFFFFFFFFFLL;
      if (*(_BYTE *)(v21 + 48))
        v45 = a2;
      else
        v45 = v44;
      v46 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)v21, v45);
      *(_QWORD *)(*((_QWORD *)&v121 + 1) + 24) = v46;
    }
    v116 = 0;
    v117 = &v116;
    v118 = 0x2020000000;
    v119 = 0;
    v112 = 0;
    v113 = &v112;
    v114 = 0x2020000000;
    v47 = MEMORY[0x1E0C809B0];
    v115 = 0;
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v103 = __111__HDSleepDaySummaryEnumerator__enumerateSleepDaySummariesForMorningIndexRanges_summariesToCache_error_handler___block_invoke;
    v104 = &unk_1E6CED1B0;
    v105 = v21;
    v100 = v92;
    v106 = v100;
    v109 = &v121;
    v110 = &v112;
    v98 = v93;
    v107 = v98;
    v48 = v94;
    v108 = v48;
    v111 = &v116;
    v49 = v95;
    v50 = v102;
    if ((*(_BYTE *)(v21 + 56) & 2) != 0)
    {
      v62 = (void *)MEMORY[0x1E0CB6380];
      v63 = *MEMORY[0x1E0CB4980];
      v64 = v49;
      objc_msgSend(v62, "categoryTypeForIdentifier:", v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "sleepAnalysisQueryDescriptorForDateInterval:options:", v64, *(_QWORD *)(v101 + 56));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(v101 + 8));
      +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v65, WeakRetained);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "samplePredicate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setPredicate:", v69);

      objc_msgSend(v66, "encodingOptions");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addEncodingOptionsFromDictionary:", v70);

      objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), *(unsigned __int8 *)(v101 + 48));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v131[0] = v71;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setOrderingTerms:", v72);

      *(_QWORD *)buf = v47;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __89__HDSleepDaySummaryEnumerator__enumerateSleepSamplesWithDateInterval_stop_error_handler___block_invoke;
      v128 = &unk_1E6CED200;
      v73 = v50;
      v129 = v73;
      v130 = &v120;
      v74 = objc_msgSend(v68, "enumerateWithError:handler:", a5, buf);

      if ((v74 & 1) == 0)
      {
LABEL_73:
        v85 = 0;
LABEL_79:

        _Block_object_dispose(&v112, 8);
        _Block_object_dispose(&v116, 8);
        _Block_object_dispose(&v121, 8);
        goto LABEL_80;
      }
LABEL_52:
      _HKInitializeLogging();
      v75 = (id)*MEMORY[0x1E0CB5368];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = (void *)objc_opt_class();
        v77 = *(_QWORD *)(v101 + 64);
        v78 = v117[3];
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v76;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v77;
        *(_WORD *)&buf[22] = 2050;
        v128 = v78;
        v79 = v76;
        _os_log_impl(&dword_1B7802000, v75, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Enumerated %{public}ld samples", buf, 0x20u);

      }
      if (v120)
        goto LABEL_78;
      if ((v90 & 1) != 0)
      {
        v80 = (uint64_t)v113[3];
        v81 = v101;
      }
      else
      {
        v81 = v101;
        if (*(_BYTE *)(v101 + 48))
        {
          if (v88 <= 0)
          {
            v80 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_77;
          }
          v80 = v88 + v89 - 1;
        }
        else
        {
          v80 = v89;
        }
      }
      if (!v80)
      {
LABEL_78:
        v85 = 1;
        goto LABEL_79;
      }
LABEL_77:
      -[HDSleepDaySummaryEnumerator _closeBuilders:fromIndex:toIndex:summariesToCache:handler:stop:](v81, v100, *(_QWORD *)(*((_QWORD *)&v121 + 1) + 24), v80, v98, v48, &v120);
      goto LABEL_78;
    }
    v51 = v49;
    objc_msgSend((id)objc_opt_class(), "sleepTypesQueryDescriptorsForDateInterval:options:", v51, *(_QWORD *)(v101 + 56));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E60], *(unsigned __int8 *)(v101 + 48));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = [HDMultiTypeSortedSampleIterator alloc];
    v131[0] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_loadWeakRetained((id *)(v101 + 8));
    v57 = -[HDMultiTypeSortedSampleIterator initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:](v54, "initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:", v52, 0, 0, v55, 100, v56);

    v125 = 0;
    LODWORD(v56) = -[HDMultiTypeSortedSampleIterator advanceWithError:](v57, "advanceWithError:", &v125);
    v58 = v125;
    if ((_DWORD)v56)
    {
      while (!v120)
      {
        v59 = MEMORY[0x1BCCACAC4]();
        -[HDMultiTypeSortedSampleIterator sample](v57, "sample");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v103(v50, v60, &v120);

        objc_autoreleasePoolPop((void *)v59);
        v125 = v58;
        LOBYTE(v59) = -[HDMultiTypeSortedSampleIterator advanceWithError:](v57, "advanceWithError:", &v125);
        v61 = v125;

        v58 = v61;
        if ((v59 & 1) == 0)
        {
          if (v61)
            goto LABEL_58;
          goto LABEL_59;
        }
      }
    }
    v61 = v58;
    if (v58)
    {
LABEL_58:
      if ((objc_msgSend(v61, "hk_isHealthKitErrorWithCode:", 900, v88) & 1) == 0)
      {
        if (a5)
        {
          v83 = objc_retainAutorelease(v61);
          v82 = 0;
          *a5 = v83;
        }
        else
        {
          _HKLogDroppedError();
          v82 = 0;
        }
LABEL_72:
        v126 = v82;

        v86 = v126;
        if ((v86 & 1) == 0)
          goto LABEL_73;
        goto LABEL_52;
      }
    }
LABEL_59:
    v82 = 1;
    goto LABEL_72;
  }
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  HKSleepScheduleWeekdayArrayFromWeekdays();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, buf, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v122;
    while (2)
    {
      v28 = 0;
      v29 = v25;
      do
      {
        if (*(_QWORD *)v122 != v27)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v28);
        v31 = objc_msgSend(v30, "integerValue", v88);
        v32 = objc_loadWeakRetained((id *)(v101 + 8));
        v116 = v29;
        +[HDSleepScheduleEntity mostRecentSleepScheduleForWeekday:beforeDate:profile:encodingOptions:error:](HDSleepScheduleEntity, "mostRecentSleepScheduleForWeekday:beforeDate:profile:encodingOptions:error:", v31, v99, v32, v97, &v116);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v116;

        objc_msgSend(*(id *)(v101 + 72), "setObject:forKeyedSubscript:", v33, v30);
        if (v33)
          v34 = 1;
        else
          v34 = v25 == 0;
        if (!v34)
        {
          v43 = *(void **)(v101 + 72);
          *(_QWORD *)(v101 + 72) = 0;

          if (a5)
          {
            v25 = objc_retainAutorelease(v25);
            *a5 = v25;
          }
          else
          {
            _HKLogDroppedError();
          }
          v84 = obj;
          goto LABEL_64;
        }

        ++v28;
        v29 = v25;
      }
      while (v26 != v28);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, buf, 16);
      if (v26)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB6978], "sleepDurationGoalType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_loadWeakRetained((id *)(v101 + 8));
  HDSampleEntityPredicateForStartDate(3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v25;
  +[HDSampleEntity mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:](HDQuantitySampleEntity, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v35, v36, v97, v37, 0, &v112);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v112;

  v40 = *(void **)(v101 + 80);
  *(_QWORD *)(v101 + 80) = v38;

  if (*(_QWORD *)(v101 + 72))
  {
    v41 = v39;
    if (!*(_QWORD *)(v101 + 80) && v39)
    {
      v42 = v39;
      goto LABEL_69;
    }

    v21 = v101;
    goto LABEL_37;
  }
  v41 = v39;
  v84 = v39;
  if (v84)
  {
LABEL_69:
    if (a5)
    {
      v84 = objc_retainAutorelease(v41);
      *a5 = v84;
      v25 = v84;
    }
    else
    {
      _HKLogDroppedError();
      v84 = v39;
      v25 = v39;
    }
    goto LABEL_64;
  }
  v25 = 0;
LABEL_64:

  v85 = 0;
LABEL_80:

LABEL_81:
  return v85;
}

- (uint64_t)_aggregationIntervalAdjustedMorningIndexFromMorningIndex:(_QWORD *)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = a2;
  v4 = (void *)a1[13];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = a1[7];
    if ((v7 & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepMonthStartForMorningIndex:calendar:", v2, a1[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v7 & 8) == 0)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepWeekStartForMorningIndex:calendar:", v2, a1[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    v10 = objc_msgSend(v8, "hk_morningIndexWithCalendar:", a1[3]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)a1[13];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    v2 = v10;
    goto LABEL_8;
  }
  v2 = objc_msgSend(v6, "integerValue");
LABEL_8:

  return v2;
}

void __111__HDSleepDaySummaryEnumerator__enumerateSleepDaySummariesForMorningIndexRanges_summariesToCache_error_handler___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = *(_QWORD *)(a1[8] + 8);
  v8 = *(_QWORD *)(a1[9] + 8);
  v9 = *(void **)(v5 + 24);
  v10 = (void *)a1[6];
  v11 = (void *)a1[7];
  v12 = a2;
  v52 = v6;
  v55 = v9;
  v54 = v10;
  v53 = v11;
  v50 = v7;
  v51 = v8;
  v13 = *(_QWORD *)(v7 + 24);
  v49 = *(_QWORD *)(v8 + 24);
  if (*(_BYTE *)(v5 + 48))
    objc_msgSend(v12, "startDate");
  else
    objc_msgSend(v12, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hk_morningIndexWithCalendar:", v55);

  v16 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)v5, v15);
  v17 = v16;
  if (*(_BYTE *)(v5 + 48))
    v18 = v16 - 1;
  else
    v18 = v16 + 1;
  v19 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)v5, v18);
  if (v13)
    v20 = v13;
  else
    v20 = v17;
  if (*(_BYTE *)(v5 + 48))
  {
    if (v17 > v20)
    {
LABEL_12:
      -[HDSleepDaySummaryEnumerator _closeBuilders:fromIndex:toIndex:summariesToCache:handler:stop:](v5, v52, v20, v19, v54, v53, a3);
      v48 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)v5, v17);
      goto LABEL_15;
    }
  }
  else if (v17 < v20)
  {
    goto LABEL_12;
  }
  v48 = v20;
LABEL_15:
  objc_msgSend(v12, "sampleType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "code");

  if (v22 == 198)
  {
    v23 = v12;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v23, "weekdays");
    HKSleepScheduleWeekdayArrayFromWeekdays();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v57 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v29, "integerValue"))
            objc_msgSend(*(id *)(v5 + 72), "setObject:forKeyedSubscript:", v23, v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v26);
    }

  }
  objc_msgSend(v12, "sampleType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "code");

  if (v31 == 197)
    objc_storeStrong((id *)(v5 + 80), a2);
  v32 = objc_msgSend(v12, "hk_morningIndexRangeWithCalendarWithCalendar:", v55);
  v34 = v33;
  if (*(_QWORD *)(v5 + 32) != *MEMORY[0x1E0CB4B90] || *(_QWORD *)(v5 + 40) != *(_QWORD *)(MEMORY[0x1E0CB4B90] + 8))
  {
    v32 = HKIntersectionDayIndexRange();
    v34 = v35;
  }
  v36 = v12;
  v37 = v52;
  v38 = v32 + v34;
  if (v34 >= 1)
  {
    v39 = 0x7FFFFFFFFFFFFFFFLL;
    v40 = v32;
    do
    {
      v41 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)v5, v40);
      if (v41 != v39)
      {
        v42 = v41;
        -[HDSleepDaySummaryEnumerator _updatedBuilderForMorningIndex:fromBuilders:createIfNeeded:](v5, v41, v37, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addOrderedSample:", v36);

        v39 = v42;
      }
      ++v40;
    }
    while (v40 < v38);
  }

  if (v49 >= v32)
    v44 = v32;
  else
    v44 = v49;
  v45 = v38 - 1;
  if (v34 <= 0)
    v45 = 0x7FFFFFFFFFFFFFFFLL;
  if (v49 > v45)
    v45 = v49;
  if (*(_BYTE *)(v5 + 48))
    v46 = v45;
  else
    v46 = v44;
  *(_QWORD *)(v50 + 24) = v48;
  *(_QWORD *)(v51 + 24) = v46;

  ++*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
}

- (void)_closeBuilders:(uint64_t)a3 fromIndex:(uint64_t)a4 toIndex:(void *)a5 summariesToCache:(void *)a6 handler:(_BYTE *)a7 stop:
{
  os_log_t *v12;
  void *v13;
  __int128 v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  BOOL v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  os_log_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  os_log_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  __int128 v58;
  uint64_t v59;
  void (**v60)(id, void *, _BYTE *);
  id v61;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v63 = a2;
  v61 = a5;
  v60 = a6;
  _HKInitializeLogging();
  v12 = (os_log_t *)MEMORY[0x1E0CB5368];
  v13 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
  {
    v53 = v13;
    v54 = (void *)objc_opt_class();
    v55 = *(_QWORD *)(a1 + 64);
    v56 = v54;
    HKStringFromBool();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v65 = v54;
    v66 = 2114;
    v67 = v55;
    v12 = (os_log_t *)MEMORY[0x1E0CB5368];
    v68 = 2050;
    v69 = a3;
    v70 = 2050;
    v71 = a4;
    v72 = 2112;
    v73 = v57;
    _os_log_debug_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Closing builders from %{public}ld to %{public}ld (ascending = %@)", buf, 0x34u);

  }
  if (*(_BYTE *)(a1 + 48))
    v15 = a3 <= a4;
  else
    v15 = a3 >= a4;
  if (v15)
  {
    v17 = *MEMORY[0x1E0CB4B90];
    v16 = *(_QWORD *)(MEMORY[0x1E0CB4B90] + 8);
    *(_QWORD *)&v14 = 138543874;
    v58 = v14;
    v59 = a4;
    do
    {
      v18 = (void *)MEMORY[0x1BCCACAC4]();
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v21 = v19 == v17 && v20 == v16;
      if (v21 || ((v22 = __OFSUB__(a3, v19), v23 = a3 - v19, v23 < 0 == v22) ? (v24 = v23 < v20) : (v24 = 0), v24))
      {
        v33 = *(_QWORD *)(a1 + 56);
        if ((v33 & 0x10) != 0)
        {
          v39 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)a1, a3);
          if (a3 == v39)
            goto LABEL_24;
          v46 = v39;
          _HKInitializeLogging();
          v47 = *v12;
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
          {
            v26 = v47;
            v48 = (void *)objc_opt_class();
            v49 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 138544130;
            v65 = v48;
            v66 = 2114;
            v67 = v49;
            v68 = 2050;
            v69 = a3;
            v70 = 2050;
            v71 = v46;
            v29 = v48;
            v30 = v26;
            v31 = "[%{public}@:%{public}@] Aggregating monthly! Skipping day index %{public}ld because it's beyond start "
                  "of month index %{public}ld";
LABEL_29:
            v32 = 42;
LABEL_30:
            _os_log_debug_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEBUG, v31, buf, v32);

          }
        }
        else
        {
          if ((v33 & 8) == 0
            || (v34 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)a1, a3), a3 == v34))
          {
LABEL_24:
            v40 = v16;
            v41 = v17;
            -[HDSleepDaySummaryEnumerator _updatedBuilderForMorningIndex:fromBuilders:createIfNeeded:](a1, a3, v63, (*(_QWORD *)(a1 + 56) & 1) == 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v42)
            {
              objc_msgSend(v42, "createDaySummary");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "periods");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v45, "count"))
              {

LABEL_32:
                v60[2](v60, v44, a7);
                if (v61)
                  objc_msgSend(v61, "addObject:", v44);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, v58);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "setObject:forKeyedSubscript:", 0, v51);

                if (*a7)
                {

                  objc_autoreleasePoolPop(v18);
                  break;
                }
              }
              else
              {
                v50 = *(_QWORD *)(a1 + 56);

                if ((v50 & 1) == 0)
                  goto LABEL_32;
              }

              a4 = v59;
              v12 = (os_log_t *)MEMORY[0x1E0CB5368];
            }

            v17 = v41;
            v16 = v40;
            goto LABEL_37;
          }
          v35 = v34;
          _HKInitializeLogging();
          v36 = *v12;
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
          {
            v26 = v36;
            v37 = (void *)objc_opt_class();
            v38 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 138544130;
            v65 = v37;
            v66 = 2114;
            v67 = v38;
            v68 = 2050;
            v69 = a3;
            v70 = 2050;
            v71 = v35;
            v29 = v37;
            v30 = v26;
            v31 = "[%{public}@:%{public}@] Aggregating weekly! Skipping day index %{public}ld because it's beyond start o"
                  "f week index %{public}ld";
            goto LABEL_29;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        v25 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
        {
          v26 = v25;
          v27 = (void *)objc_opt_class();
          v28 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = v58;
          v65 = v27;
          v66 = 2114;
          v67 = v28;
          v68 = 2050;
          v69 = a3;
          v29 = v27;
          v30 = v26;
          v31 = "[%{public}@:%{public}@] Skipping index out of range for morning index %{public}ld";
          v32 = 32;
          goto LABEL_30;
        }
      }
LABEL_37:
      objc_autoreleasePoolPop(v18);
      if (*(_BYTE *)(a1 + 48))
        ++a3;
      else
        --a3;
      if (*(_BYTE *)(a1 + 48))
        v52 = a3 <= a4;
      else
        v52 = a3 >= a4;
    }
    while (v52);
  }

}

uint64_t __96__HDSleepDaySummaryEnumerator__enumerateCacheWithSession_anchor_summariesToCache_error_handler___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  BOOL v15;
  os_log_t *v16;
  os_log_t v17;
  os_log_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE aBlock[24];
  void *v41;
  _BYTE v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v10 + 32);
  v11 = *(_QWORD *)(v10 + 40);
  v13 = __OFSUB__(a4, v12);
  v14 = a4 - v12;
  v15 = v14 < 0 == v13 && v14 < v11;
  v16 = (os_log_t *)MEMORY[0x1E0CB5368];
  if (!v15)
  {
    _HKInitializeLogging();
    v17 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_FAULT))
    {
      v29 = v17;
      v30 = (void *)objc_opt_class();
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v32 = v30;
      NSStringFromHKDayIndexRange();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)aBlock = 138544386;
      *(_QWORD *)&aBlock[4] = v30;
      *(_WORD *)&aBlock[12] = 2114;
      *(_QWORD *)&aBlock[14] = v33;
      *(_WORD *)&aBlock[22] = 2050;
      v41 = (void *)a4;
      *(_WORD *)v42 = 2114;
      *(_QWORD *)&v42[2] = v31;
      *(_WORD *)&v42[10] = 2114;
      *(_QWORD *)&v42[12] = v9;
      _os_log_fault_impl(&dword_1B7802000, v29, OS_LOG_TYPE_FAULT, "[%{public}@:%{public}@] Error: Summary for morningIndex %{public}ld is out of bounds for expected morningIndexRange %{public}@: %{public}@", aBlock, 0x34u);

    }
  }
  _HKInitializeLogging();
  v18 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
  {
    v24 = v18;
    v25 = (void *)objc_opt_class();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v27 = v25;
    HKStringFromBool();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)aBlock = 138544386;
    *(_QWORD *)&aBlock[4] = v25;
    *(_WORD *)&aBlock[12] = 2114;
    *(_QWORD *)&aBlock[14] = v26;
    *(_WORD *)&aBlock[22] = 2050;
    v41 = (void *)a4;
    *(_WORD *)v42 = 2114;
    *(_QWORD *)&v42[2] = v28;
    *(_WORD *)&v42[10] = 2114;
    *(_QWORD *)&v42[12] = v9;
    _os_log_debug_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Summary returned for dayIndex: %{public}ld, stale: %{public}@, summary: %{public}@", aBlock, 0x34u);

  }
  if (!v9 || a3)
  {
    v20 = *(_QWORD *)(a1 + 32);
    if (v20)
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__30;
      v38 = __Block_byref_object_dispose__30;
      v39 = 0;
      *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
      *(_QWORD *)&aBlock[8] = 3221225472;
      *(_QWORD *)&aBlock[16] = __69__HDSleepDaySummaryEnumerator__sleepDaySummaryForMorningIndex_error___block_invoke;
      v41 = &unk_1E6CED2D0;
      *(_QWORD *)&v42[8] = &v34;
      *(_QWORD *)&v42[16] = sel__sleepDaySummaryForMorningIndex_error_;
      *(_QWORD *)v42 = v20;
      v21 = _Block_copy(aBlock);
      -[HDSleepDaySummaryEnumerator _enumerateSleepDaySummariesForMorningIndexRanges:summariesToCache:error:handler:](v20, a4, 1, 0, a5, v21);
      v22 = (id)v35[5];

      _Block_object_dispose(&v34, 8);
      if (v22)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
        v19 = 1;
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
      v22 = 0;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v19 = 1;
  }

  return v19;
}

uint64_t __89__HDSleepDaySummaryEnumerator__enumerateSleepSamplesWithDateInterval_stop_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)MEMORY[0x1BCCACAC4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v4);

  return 1;
}

- (id)_updatedBuilderForMorningIndex:(void *)a3 fromBuilders:(int)a4 createIfNeeded:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  HDSleepDaySummaryBuilder *v16;
  id WeakRetained;
  uint64_t v18;
  HDSleepIntervalSummaryBuilder *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  HDSleepIntervalSummaryBuilder *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((_QWORD *)a1, a2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = 1;
  else
    v11 = a4 == 0;
  if (!v11)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
    {
      v31 = v12;
      v32 = (void *)objc_opt_class();
      v33 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v40 = v32;
      v41 = 2114;
      v42 = v33;
      v43 = 2050;
      v44 = v8;
      v34 = v32;
      _os_log_debug_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Creating builder for morning index %{public}ld", buf, 0x20u);

    }
    v13 = HKSleepScheduleWeekdayFromWeekdayComponent();
    v14 = *(_QWORD *)(a1 + 56);
    v15 = (v14 >> 2) & 1;
    if ((v14 & 0x10) != 0)
    {
      v19 = [HDSleepIntervalSummaryBuilder alloc];
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(MEMORY[0x1E0C99D68], "hk_noonWithDayIndex:calendar:", v8, *(_QWORD *)(a1 + 24));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 24), "rangeOfUnit:inUnit:forDate:", 16, 8, v20);
      v22 = v21;

      v18 = -[HDSleepDaySummaryBuilder initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:](v19, "initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:", WeakRetained, v8, v22, v13, v15, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 96));
    }
    else if ((v14 & 8) != 0)
    {
      v23 = [HDSleepIntervalSummaryBuilder alloc];
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v18 = -[HDSleepDaySummaryBuilder initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:](v23, "initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:", WeakRetained, v8, 7, v13, v15, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 96));
    }
    else
    {
      v16 = [HDSleepDaySummaryBuilder alloc];
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v18 = -[HDSleepDaySummaryBuilder initWithProfile:morningIndex:weekday:options:gregorianCalendar:sourceOrderProvider:](v16, "initWithProfile:morningIndex:weekday:options:gregorianCalendar:sourceOrderProvider:", WeakRetained, v8, v13, v15, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 96));
    }
    v10 = (void *)v18;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v24);

  }
  if (v10 && (*(_BYTE *)(a1 + 56) & 2) == 0)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
    {
      v35 = v25;
      v36 = (void *)objc_opt_class();
      v37 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v40 = v36;
      v41 = 2114;
      v42 = v37;
      v43 = 2050;
      v44 = v8;
      v38 = v36;
      _os_log_debug_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Updating builder with schedule and goal for morning index %{public}ld", buf, 0x20u);

    }
    v26 = HKSleepScheduleWeekdayFromWeekdayComponent();
    v27 = *(void **)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(v10, "addOrderedSample:", v29);
    if (*(_QWORD *)(a1 + 80))
      objc_msgSend(v10, "addOrderedSample:");

  }
  return v10;
}

+ (id)sleepAnalysisQueryDescriptorForDateInterval:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDQueryDescriptor *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HDQueryDescriptor *v18;
  _QWORD v20[2];

  v4 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6DF8B10, "hk_map:", &__block_literal_global_37);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v8, 0);
  if (v5)
  {
    HDSampleEntityPredicateForDateInterval(v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  if ((v4 & 0x20) != 0)
  {
    HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [HDQueryDescriptor alloc];
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);
  +[HDDataEntity hk_timeZoneEncodingOptions](HDDataEntity, "hk_timeZoneEncodingOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HDQueryDescriptor initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:](v13, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v16, v17, 0, 0, v12);

  return v18;
}

id __83__HDSleepDaySummaryEnumerator_sleepAnalysisQueryDescriptorForDateInterval_options___block_invoke()
{
  return HDCategorySampleEntityPredicateForValue(1);
}

+ (id)sleepTypesQueryDescriptorsForDateInterval:(id)a3 options:(unint64_t)a4
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
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "sleepAnalysisQueryDescriptorForDateInterval:options:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithArray:", v9);

  if ((a4 & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 198);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB6A70], "dataTypeWithCode:", 197);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__HDSleepDaySummaryEnumerator_sleepTypesQueryDescriptorsForDateInterval_options___block_invoke;
    v16[3] = &unk_1E6CED268;
    v17 = v6;
    objc_msgSend(v13, "hk_map:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v14);

  }
  return v10;
}

HDQueryDescriptor *__81__HDSleepDaySummaryEnumerator_sleepTypesQueryDescriptorsForDateInterval_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HDQueryDescriptor *v6;
  void *v7;
  void *v8;
  HDQueryDescriptor *v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    HDSampleEntityPredicateForDateInterval(v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = [HDQueryDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity hk_timeZoneEncodingOptions](HDDataEntity, "hk_timeZoneEncodingOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDQueryDescriptor initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:](v6, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v7, v8, 0, 0, v5);

  return v9;
}

void __53__HDSleepDaySummaryEnumerator__finishCachingSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5368];
  v7 = *MEMORY[0x1E0CB5368];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v8 = v6;
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v14 = 138543874;
    v15 = v12;
    v16 = 2114;
    v17 = v13;
    v18 = 2114;
    v19 = v5;
    v11 = v12;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error finishing caching session: %{public}@", (uint8_t *)&v14, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v9 = (void *)objc_opt_class();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v14 = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v11 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Finished caching session!", (uint8_t *)&v14, 0x16u);
LABEL_4:

  }
LABEL_6:

}

uint64_t __101__HDSleepDaySummaryEnumerator__cacheSleepDaySummaries_cachingSession_cacheAnchor_isEmptyCache_error___block_invoke()
{
  return 1;
}

void __101__HDSleepDaySummaryEnumerator__cacheSleepDaySummaries_cachingSession_cacheAnchor_isEmptyCache_error___block_invoke_2(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5368];
  v7 = *MEMORY[0x1E0CB5368];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v8 = v6;
    v15 = (void *)objc_opt_class();
    v16 = *(_QWORD *)(a1[4] + 64);
    v18 = 138543874;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    v22 = 2114;
    v23 = (uint64_t)v5;
    v17 = v15;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error updating cache: %{public}@", (uint8_t *)&v18, 0x20u);

    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v9 = (void *)objc_opt_class();
    v10 = (void *)a1[5];
    v11 = *(_QWORD *)(a1[4] + 64);
    v12 = v9;
    v13 = objc_msgSend(v10, "count");
    v14 = a1[6];
    v18 = 138544130;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    v22 = 2050;
    v23 = v13;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Updated cache with %{public}ld sleep day summaries (anchor: %{public}@)", (uint8_t *)&v18, 0x2Au);

LABEL_4:
  }
LABEL_6:

}

void __69__HDSleepDaySummaryEnumerator__sleepDaySummaryForMorningIndex_error___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("HDSleepDaySummaryEnumerator.m"), 781, CFSTR("Handler should only be called once since we're only enumerating samples for a single day."));

    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
  }
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustedMorningIndexCache, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_sleepDurationGoalSample, 0);
  objc_storeStrong((id *)&self->_schedulesByWeekday, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_cachingSession, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
