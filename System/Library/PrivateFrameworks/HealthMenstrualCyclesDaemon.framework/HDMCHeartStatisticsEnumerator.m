@implementation HDMCHeartStatisticsEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (id)_cachingSessionWithCalendar:(id)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v45;
  void *v46;
  id *location;
  void *v48;
  void *v49;
  void *v50;
  HDMCHeartStatisticsEnumerator *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];

  v63[2] = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v51 = self;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v8, "localDeviceSourceWithError:", &v57);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v57;

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v10, "metadataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDD43B0];
    MEMORY[0x219A31068]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithMetadataKey:allowedValues:", v12, v13);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BE40E20];
    HDDataEntityPredicateForObjectsFromAppleWatchSources();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v15;
    v63[1] = v50;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateMatchingAllPredicates:", v16);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    _HKCategoryValueSleepAnalysisAsleepValues();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDCategorySampleEntityPredicateEqualToValues();
    location = (id *)p_profile;
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = *MEMORY[0x24BE40840];
    v62 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v52 = v9;
    v19 = objc_alloc(MEMORY[0x24BE40BA0]);
    v20 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v18;
    v24 = (void *)objc_msgSend(v19, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v23, v18, 0, 0, v49);

    v25 = objc_alloc(MEMORY[0x24BE40BA0]);
    v26 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDD3E80], "heartRateType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v25, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v29, v18, 0, 0, v48);

    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v45, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("menstrualCycles"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1508], "hk_sleepDayIntervalForMorningIndexRange:calendar:", v51->_dayIndexRange.start, v51->_dayIndexRange.duration, v54);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v35, "setDay:", 1);
    v36 = objc_alloc(MEMORY[0x24BE40BB8]);
    v37 = objc_loadWeakRetained(location);
    v38 = objc_opt_class();
    objc_msgSend(v34, "startDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __67__HDMCHeartStatisticsEnumerator__cachingSessionWithCalendar_error___block_invoke;
    v55[3] = &unk_24DB223A8;
    v56 = v54;
    v40 = (void *)objc_msgSend(v36, "initWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:", v37, v33, v52, v30, v38, v34, v39, v35, v55);

    v58 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setInvalidationQueryDescriptors:", v41);

    v9 = v52;
    objc_msgSend(v40, "setAccessibilityAssertion:", v51->_databaseAccessibilityAssertion);

  }
  else
  {
    v42 = v53;
    if (v42)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v42);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v43 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_FAULT))
      -[HDMCHeartStatisticsEnumerator _cachingSessionWithCalendar:error:].cold.1(v43);
    v40 = 0;
  }

  return v40;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  int64_t start;
  os_log_t *v24;
  void *v25;
  void *v26;
  id v27;
  os_log_t v28;
  os_log_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  os_log_t v35;
  int64_t duration;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject **v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  int v54;
  NSObject *v55;
  int v56;
  int v57;
  id v58;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *loga;
  os_log_t logb;
  os_log_t log;
  id v67;
  id v68;
  id v69;
  id *v70;
  id *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void (**v76)(id, void *);
  _QWORD v77[5];
  _QWORD v78[5];
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  void (**v83)(id, void *);
  id v84;
  _QWORD v85[5];
  _QWORD v86[5];
  id v87;
  id v88;
  id v89;
  id v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v76 = (void (**)(id, void *))a4;
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE40BC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0;
  objc_msgSend(v7, "maxRowIDForPredicate:healthDatabase:error:", 0, v9, &v90);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v90;

  if (!v10)
  {
    v16 = v11;
    v12 = v16;
    if (v16)
    {
      if (a3)
      {
        v12 = objc_retainAutorelease(v16);
        v14 = 0;
        *a3 = v12;
        v15 = v12;
        goto LABEL_60;
      }
      _HKLogDroppedError();
    }
    v14 = 0;
    v15 = v12;
    goto LABEL_60;
  }
  v89 = v11;
  -[HDMCHeartStatisticsEnumerator _cachingSessionWithCalendar:error:](self, "_cachingSessionWithCalendar:error:", v6, &v89);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v89;

  if (!v12 && v13)
  {
    v14 = 0;
    v15 = v13;
    goto LABEL_60;
  }
  v88 = v13;
  v17 = objc_msgSend(v12, "cachesExistWithError:", &v88);
  v15 = v88;

  if (v17 == 2)
  {
    v60 = v15;
    v70 = a3;
    v72 = v10;
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v92 = v21;
      v22 = v21;
      _os_log_impl(&dword_21961B000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] No cache exists so we need to query all heart statistics data and save to our cache", buf, 0xCu);

    }
    v75 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    start = self->_dayIndexRange.start;
    v24 = (os_log_t *)MEMORY[0x24BDD3030];
    v73 = v6;
    while (1)
    {
      v25 = (void *)MEMORY[0x219A3147C]();
      v87 = 0;
      -[HDMCHeartStatisticsEnumerator _heartStatisticsForDayIndex:calendar:errorOut:](self, "_heartStatisticsForDayIndex:calendar:errorOut:", start, v6, &v87);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v87;
      if (v26)
      {
        if ((objc_msgSend(v26, "isEmpty") & 1) == 0)
        {
          _HKInitializeLogging();
          v28 = *v24;
          if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEBUG))
          {
            v41 = v28;
            v42 = (void *)objc_opt_class();
            log = (os_log_t)MEMORY[0x24BDD16E0];
            v69 = v42;
            -[NSObject numberWithInteger:](log, "numberWithInteger:", start);
            v43 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v92 = v42;
            v93 = 2112;
            v94 = v43;
            v44 = (void *)v43;
            v95 = 2114;
            v96 = (uint64_t)v26;
            _os_log_debug_impl(&dword_21961B000, v41, OS_LOG_TYPE_DEBUG, "[%{public}@] Statistics created for dayIndex: %@ heart statistics:%{public}@", buf, 0x20u);

          }
          objc_msgSend(v75, "addObject:", v26, v60);
          if ((unint64_t)objc_msgSend(v75, "count") >= 0x14)
          {
            v86[0] = MEMORY[0x24BDAC760];
            v86[1] = 3221225472;
            v86[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke;
            v86[3] = &unk_24DB21C90;
            v86[4] = self;
            objc_msgSend(v12, "insertCaches:anchor:completion:", v75, v72, v86);
            _HKInitializeLogging();
            v29 = *v24;
            if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
            {
              loga = v29;
              v62 = (void *)objc_opt_class();
              v30 = (void *)MEMORY[0x24BDD16E0];
              v67 = v62;
              objc_msgSend(v75, "firstObject");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v63, "dayIndex"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v75, "lastObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "dayIndex"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v92 = v62;
              v93 = 2112;
              v94 = (uint64_t)v61;
              v95 = 2112;
              v96 = (uint64_t)v33;
              _os_log_impl(&dword_21961B000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] Statistics saved from dayIndex:%@ to dayIndex: %@", buf, 0x20u);

              v6 = v73;
            }
            v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

            v75 = v34;
            v24 = (os_log_t *)MEMORY[0x24BDD3030];
          }
          v76[2](v76, v26);
        }
      }
      else
      {
        _HKInitializeLogging();
        v35 = *v24;
        if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
        {
          v37 = v35;
          v38 = (void *)objc_opt_class();
          logb = (os_log_t)MEMORY[0x24BDD16E0];
          v68 = v38;
          -[NSObject numberWithInteger:](logb, "numberWithInteger:", start);
          v39 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v92 = v38;
          v93 = 2114;
          v94 = (uint64_t)v27;
          v95 = 2112;
          v96 = v39;
          v40 = (void *)v39;
          _os_log_error_impl(&dword_21961B000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating heart statistics: %{public}@ for dayIndex: %@", buf, 0x20u);

        }
      }

      objc_autoreleasePoolPop(v25);
      if (v27)
        break;
      ++start;
      duration = self->_dayIndexRange.duration;
      if (duration >= 1 && duration + self->_dayIndexRange.start <= start)
      {
        v85[0] = MEMORY[0x24BDAC760];
        v85[1] = 3221225472;
        v85[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_211;
        v85[3] = &unk_24DB21C90;
        v85[4] = self;
        v10 = v72;
        objc_msgSend(v12, "insertCaches:anchor:completion:", v75, v72, v85);

        v56 = 0;
        a3 = v70;
        v15 = v60;
        goto LABEL_46;
      }
    }
    if (v70)
      *v70 = objc_retainAutorelease(v27);
    else
      _HKLogDroppedError();
    v15 = v60;

    v14 = 0;
    v10 = v72;
  }
  else
  {
    if (v17 == 1)
    {
      v71 = a3;
      v74 = v6;
      _HKInitializeLogging();
      v45 = (NSObject **)MEMORY[0x24BDD3030];
      v46 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v47 = v46;
        v48 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v92 = v48;
        v49 = v48;
        _os_log_impl(&dword_21961B000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cache exists and will be returning values from cache", buf, 0xCu);

      }
      v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v51 = MEMORY[0x24BDAC760];
      v84 = v15;
      v79[0] = MEMORY[0x24BDAC760];
      v79[1] = 3221225472;
      v79[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_212;
      v79[3] = &unk_24DB22380;
      v79[4] = self;
      v83 = v76;
      v80 = v74;
      v81 = v15;
      v52 = v50;
      v82 = v52;
      v53 = v15;
      v54 = objc_msgSend(v12, "activateWithError:cacheHandler:", &v84, v79);
      v15 = v84;

      if ((v54 & 1) != 0)
      {
        v78[0] = v51;
        v78[1] = 3221225472;
        v78[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_214;
        v78[3] = &unk_24DB21C90;
        v78[4] = self;
        objc_msgSend(v12, "insertCaches:anchor:completion:", v52, v10, v78);
      }
      else
      {
        _HKInitializeLogging();
        v55 = *v45;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          -[HDMCHeartStatisticsEnumerator enumerateWithError:handler:].cold.2(v55);
      }

      v56 = v54 ^ 1;
      v6 = v74;
      a3 = v71;
    }
    else
    {
      if (!v17)
      {
        _HKInitializeLogging();
        v18 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCHeartStatisticsEnumerator enumerateWithError:handler:].cold.1(v18);
        v15 = v15;
        if (v15)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v15);
          else
            _HKLogDroppedError();
        }

        v14 = 0;
        goto LABEL_60;
      }
      v56 = 0;
    }
LABEL_46:
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_215;
    v77[3] = &unk_24DB21C90;
    v77[4] = self;
    objc_msgSend(v12, "finishWithCompletion:", v77, v60);
    if (v15)
      v57 = 1;
    else
      v57 = v56;
    if (v57 == 1)
    {
      v58 = v15;
      if (v15)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v58);
        else
          _HKLogDroppedError();
      }

    }
    v14 = v57 ^ 1;
  }
LABEL_60:

  return v14;
}

- (HDMCHeartStatisticsEnumerator)initWithProfile:(id)a3 calendarCache:(id)a4 dayIndexRange:(id)a5 databaseAccessibilityAssertion:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  id v13;
  HDMCHeartStatisticsEnumerator *v14;
  HDMCHeartStatisticsEnumerator *v15;
  objc_super v17;

  var1 = a5.var1;
  var0 = a5.var0;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDMCHeartStatisticsEnumerator;
  v14 = -[HDMCHeartStatisticsEnumerator init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v11);
    objc_storeStrong((id *)&v15->_calendarCache, a4);
    v15->_dayIndexRange.start = var0;
    v15->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v15->_databaseAccessibilityAssertion, a6);
  }

  return v15;
}

- (id)_asleepSleepAnalysisDateIntervalTreeOnDayIndex:(int64_t)a3 calendar:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD3990];
  v9 = *MEMORY[0x24BDD2A28];
  v10 = a4;
  objc_msgSend(v8, "categoryTypeForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1508], "hk_sleepDayIntervalForMorningIndex:calendar:", a3, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForDateInterval();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _HKCategoryValueSleepAnalysisAsleepValues();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDCategorySampleEntityPredicateEqualToValues();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BE40E20];
  v29[0] = v13;
  v29[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateMatchingAllPredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BE40BC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v19, "entityEnumeratorWithType:profile:", v11, WeakRetained);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setPredicate:", v18);
  objc_msgSend(v21, "setLimitCount:", 0);
  v22 = objc_alloc_init(MEMORY[0x24BDD3AE8]);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __95__HDMCHeartStatisticsEnumerator__asleepSleepAnalysisDateIntervalTreeOnDayIndex_calendar_error___block_invoke;
  v27[3] = &unk_24DB22180;
  v28 = v22;
  v23 = v22;
  if (objc_msgSend(v21, "enumerateWithError:handler:", a5, v27))
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  return v25;
}

BOOL __95__HDMCHeartStatisticsEnumerator__asleepSleepAnalysisDateIntervalTreeOnDayIndex_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x219A3147C]();
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

    objc_msgSend(*(id *)(a1 + 32), "insertInterval:", v9);
  }

  objc_autoreleasePoolPop(v4);
  return v5 != 0;
}

- (id)_heartStatisticsForDayIndex:(int64_t)a3 calendar:(id)a4 errorOut:(id *)a5
{
  os_log_t *v8;
  id v9;
  os_signpost_id_t v10;
  os_log_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  HDMCHeartStatisticsEnumerator *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *p_profile;
  id WeakRetained;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  os_signpost_id_t spid;
  void *v74;
  void *v75;
  void *v76;
  int64_t v77;
  HDMCHeartStatisticsEnumerator *v78;
  id v79;
  id *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  _QWORD aBlock[5];
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  _QWORD v100[6];

  v100[3] = *MEMORY[0x24BDAC8D0];
  v8 = (os_log_t *)MEMORY[0x24BDD3030];
  v9 = a4;
  v10 = _HKLogSignpostIDGenerate();
  _HKInitializeLogging();
  v11 = *v8;
  if (os_signpost_enabled(*v8))
  {
    v12 = v11;
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v97 = v14;
      _os_signpost_emit_with_name_impl(&dword_21961B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "menstrual-cycles-heartStatisticsForDayIndex", "dayIndex=%@", buf, 0xCu);

    }
  }
  spid = v10;
  v80 = a5;
  objc_msgSend(MEMORY[0x24BDD3E80], "heartRateType");
  v15 = objc_claimAutoreleasedReturnValue();
  v94 = 0;
  -[HDMCHeartStatisticsEnumerator _asleepSleepAnalysisDateIntervalTreeOnDayIndex:calendar:error:](self, "_asleepSleepAnalysisDateIntervalTreeOnDayIndex:calendar:error:", a3, v9, &v94);
  v16 = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v94;
  objc_msgSend(MEMORY[0x24BE40C28], "hdmc_tenthPercentileCalculator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = a3;
  objc_msgSend(MEMORY[0x24BDD1508], "hk_sleepDayIntervalForMorningIndex:calendar:", a3, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForDateInterval();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v16;
  p_profile = (id *)&v16->_profile;
  WeakRetained = objc_loadWeakRetained(p_profile);
  objc_msgSend(WeakRetained, "metadataManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BDD43B0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24DB302B8, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateWithMetadataKey:allowedValues:", v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "mergedIntervals");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  v83 = (void *)v26;
  if (!v28)
  {
    v59 = (void *)v15;
    v50 = v17;
    v60 = (void *)MEMORY[0x24BE40E20];
    v100[0] = v20;
    HDDataEntityPredicateForObjectsFromAppleWatchSources();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v61;
    v100[2] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "predicateMatchingAllPredicates:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = objc_loadWeakRetained(p_profile);
    v93 = v81;
    objc_msgSend(v18, "hdmc_heartRateStatisticsWithProfile:predicate:errorOut:", v64, v63, &v93);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v93;

    if (v48)
    {
      if (v80)
        *v80 = objc_retainAutorelease(v48);
      else
        _HKLogDroppedError();

      v54 = 0;
      goto LABEL_39;
    }
    objc_msgSend(MEMORY[0x24BE46B60], "dailyHeartStatisticsWithDayIndex:asleepStatistics:awakeStatistics:", v77, 0, v65);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v67 = (void *)*MEMORY[0x24BDD3030];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x24BDD3030]))
    {
      v68 = v67;
      v69 = v68;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v77);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v97 = v70;
        v98 = 2112;
        v99 = &unk_24DB302D0;
        _os_signpost_emit_with_name_impl(&dword_21961B000, v69, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-daily-heart-statistics", "dayIndex=%@ sleepData=%@", buf, 0x16u);

      }
    }

LABEL_37:
    v54 = v54;
    v48 = 0;
    v71 = v54;
    goto LABEL_40;
  }
  v76 = v18;
  v29 = objc_loadWeakRetained(p_profile);
  objc_msgSend(v29, "metadataManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x219A31068]();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "predicateWithMetadataKey:allowedValues:", v24, v31);
  v32 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BE40E20];
  HDSampleEntityPredicateForDataType();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v34;
  v95[1] = v20;
  v75 = v20;
  HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v35;
  v95[3] = v32;
  v74 = (void *)v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "predicateMatchingAllPredicates:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE40C28], "hdmc_tenthPercentileCalculator");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40C28], "hdmc_tenthPercentileCalculator");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke;
  aBlock[3] = &unk_24DB22330;
  aBlock[4] = v78;
  v41 = v37;
  v89 = v41;
  v90 = v17;
  v42 = v39;
  v91 = v42;
  v43 = v38;
  v92 = v43;
  v44 = _Block_copy(aBlock);
  v85[0] = v40;
  v85[1] = 3221225472;
  v85[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_4;
  v85[3] = &unk_24DB22358;
  v45 = v42;
  v86 = v45;
  v46 = v44;
  v87 = v46;
  v84 = v81;
  v47 = objc_msgSend(v43, "performAddSampleTransaction:error:", v85, &v84);
  v48 = v84;

  v49 = (void *)v15;
  if ((v47 & 1) != 0)
  {
    v79 = v41;
    v50 = v17;
    v82 = v49;
    v51 = (void *)MEMORY[0x24BE46B60];
    objc_msgSend(v45, "currentStatistics");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "currentStatistics");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dailyHeartStatisticsWithDayIndex:asleepStatistics:awakeStatistics:", v77, v52, v53);
    v54 = (id)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v55 = (void *)*MEMORY[0x24BDD3030];
    if (!os_signpost_enabled((os_log_t)*MEMORY[0x24BDD3030]))
    {
      v49 = v82;
      v41 = v79;
      goto LABEL_31;
    }
    v56 = v55;
    v57 = v56;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v77);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v97 = v58;
      v98 = 2112;
      v99 = &unk_24DB302E8;
      _os_signpost_emit_with_name_impl(&dword_21961B000, v57, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-heartStatisticsForDayIndex", "dayIndex=%@ sleepData=%@", buf, 0x16u);

    }
    v49 = v82;
    v41 = v79;
  }
  else
  {
    v50 = v17;
    v66 = v48;
    v57 = v66;
    if (v66)
    {
      if (v80)
      {
        v57 = objc_retainAutorelease(v66);
        *v80 = v57;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    v54 = 0;
  }

LABEL_31:
  v59 = v49;
  if (!v47)
  {
    v71 = 0;
    v20 = v75;
    v18 = v76;
    goto LABEL_40;
  }
  if (!v48)
  {
    v20 = v75;
    v18 = v76;
    goto LABEL_37;
  }
  v20 = v75;
  v18 = v76;
  if (!v80)
  {
    _HKLogDroppedError();
LABEL_39:
    v71 = 0;
    goto LABEL_40;
  }
  v48 = objc_retainAutorelease(v48);
  v71 = 0;
  *v80 = v48;
LABEL_40:

  return v71;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40AB0], "contextForReadingProtectedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_2;
  v13[3] = &unk_24DB22308;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v9 = objc_msgSend(v5, "performTransactionWithContext:error:block:inaccessibilityHandler:", v6, &v19, v13, 0);
  v10 = v19;

  if ((v9 & 1) == 0)
  {
    v11 = v10;
    if (v11)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  return v9;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x24BE40B10], "metadataValueStatementWithTransaction:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE40B98];
  v7 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v19 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_3;
  v14[3] = &unk_24DB222E0;
  v14[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v10 = objc_msgSend(v6, "orderedQuantityValuesBySeriesForPredicate:profile:options:error:handler:", v7, WeakRetained, 1, &v19, v14);
  v11 = v19;

  if ((v10 & 1) == 0)
  {
    v12 = v11;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

  }
  return v10;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id WeakRetained;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  int IsSedentary;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "metadataManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "metadataForObjectID:baseMetadata:keyFilter:statement:error:", a2, 0, 0, *(_QWORD *)(a1 + 40), a13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = *MEMORY[0x24BDD43B0];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BDD43B0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "hasOverlapWithStartTime:endTime:", a6, a7))
    {
      v27 = *(void **)(a1 + 56);
      v28 = a5;
      v29 = a6;
      v30 = a7;
    }
    else
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "integerValue");
      IsSedentary = HKMCHeartRateContextIsSedentary();

      if (!IsSedentary)
      {
        v31 = 1;
        goto LABEL_9;
      }
      v27 = *(void **)(a1 + 64);
      v28 = a5;
      v29 = a3;
      v30 = a4;
    }
    v31 = objc_msgSend(v27, "addSampleValue:startTime:endTime:sourceID:error:", a10, a13, v28, v29, v30);
  }
  else
  {
    v31 = 0;
  }
LABEL_9:

  return v31;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAddSampleTransaction:error:", *(_QWORD *)(a1 + 40), a2);
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(a1, v6);
  }

}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_211(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(a1, v6);
  }

}

uint64_t __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_212(uint64_t a1, void *a2, char a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = *(_QWORD **)(a1 + 32);
  v11 = v10[2];
  v12 = __OFSUB__(a4, v11);
  v13 = a4 - v11;
  if (v13 < 0 != v12 || v13 >= v10[3])
  {
LABEL_16:
    v21 = 1;
    goto LABEL_17;
  }
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEBUG))
    {
      v24 = v20;
      v25 = (void *)objc_opt_class();
      v26 = (void *)MEMORY[0x24BDD16E0];
      v27 = v25;
      objc_msgSend(v26, "numberWithInteger:", a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v25;
      v43 = 2112;
      v44 = v28;
      v45 = 2114;
      v46 = v9;
      _os_log_debug_impl(&dword_21961B000, v24, OS_LOG_TYPE_DEBUG, "[%{public}@] Statistics returned for dayIndex:%@ heart statistics:%{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_16;
  }
  v15 = *(_QWORD *)(a1 + 40);
  v40 = 0;
  objc_msgSend(v10, "_heartStatisticsForDayIndex:calendar:errorOut:", a4, v15, &v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v40;
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x24BDD3030];
  v19 = *MEMORY[0x24BDD3030];
  if (v16)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v29 = v18;
      v30 = (void *)objc_opt_class();
      v31 = (void *)MEMORY[0x24BDD16E0];
      v32 = v30;
      objc_msgSend(v31, "numberWithInteger:", a4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v30;
      v43 = 2112;
      v44 = v33;
      v45 = 2114;
      v46 = v16;
      _os_log_debug_impl(&dword_21961B000, v29, OS_LOG_TYPE_DEBUG, "[%{public}@] Statistics created for dayIndex:%@ heart statistics:%{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);
    if ((objc_msgSend(v16, "isEmpty") & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    goto LABEL_16;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v34 = v18;
    v35 = (void *)objc_opt_class();
    v36 = *(void **)(a1 + 48);
    v37 = (void *)MEMORY[0x24BDD16E0];
    v38 = v35;
    objc_msgSend(v37, "numberWithInteger:", a4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v35;
    v43 = 2114;
    v44 = v36;
    v45 = 2112;
    v46 = v39;
    _os_log_error_impl(&dword_21961B000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating heart statistics: %{public}@ for dayIndex: %@", buf, 0x20u);

  }
  v23 = v17;
  if (v23)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v23);
    else
      _HKLogDroppedError();
  }

  v21 = 0;
LABEL_17:

  return v21;
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_214(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(a1, v6);
  }

}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_215(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_215_cold_1(a1, v6);
  }

}

uint64_t __67__HDMCHeartStatisticsEnumerator__cachingSessionWithCalendar_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hk_morningIndexWithCalendar:", *(_QWORD *)(a1 + 32));

  return v3;
}

- (void)enumerateWithError:(void *)a1 handler:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error checking for caches in cacheStore: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)enumerateWithError:(void *)a1 handler:.cold.2(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_4(a1);
  v2 = (id)OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21961B000, v3, v4, "[%{public}@] Error activating cache and enumerating over existing caches: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error saving statistics in cache store: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_215_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Failed to finish caching session: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)_cachingSessionWithCalendar:(void *)a1 error:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  _os_log_fault_impl(&dword_21961B000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] Error retrieving source to create cache store: %{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

@end
