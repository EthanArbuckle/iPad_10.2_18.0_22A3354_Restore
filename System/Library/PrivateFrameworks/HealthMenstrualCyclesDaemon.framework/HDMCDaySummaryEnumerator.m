@implementation HDMCDaySummaryEnumerator

- (HDMCDaySummaryEnumerator)initWithProfile:(id)a3 calendarCache:(id)a4 dayIndexRange:(id)a5 ascending:(BOOL)a6 includeFactors:(BOOL)a7 includeWristTemperature:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  int64_t var1;
  int64_t var0;
  id v14;
  id v15;
  HDMCDaySummaryEnumerator *v16;
  HDMCDaySummaryEnumerator *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSArray *orderedWatchSources;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  HDMultiTypeSortedSampleIterator *iterator;
  _BOOL4 v49;
  _BOOL4 v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  void *v55;
  _QWORD v56[2];
  uint64_t v57;
  _QWORD v58[2];

  v8 = a7;
  v9 = a6;
  var1 = a5.var1;
  var0 = a5.var0;
  v58[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HDMCDaySummaryEnumerator;
  v16 = -[HDMCDaySummaryEnumerator init](&v54, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profile, v14);
    objc_storeStrong((id *)&v17->_calendarCache, a4);
    v17->_dayIndexRange.start = var0;
    v17->_dayIndexRange.duration = var1;
    v17->_ascending = v9;
    v52 = v14;
    v50 = v9;
    if (a8)
    {
      v49 = v8;
      WeakRetained = objc_loadWeakRetained((id *)&v17->_profile);
      objc_msgSend(WeakRetained, "sourceOrderManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _HKMCAppleSleepingWristTemperatureType();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      objc_msgSend(v19, "orderedSourcesForObjectType:error:", v20, &v53);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v53;
      orderedWatchSources = v17->_orderedWatchSources;
      v17->_orderedWatchSources = (NSArray *)v21;

      if (!v17->_orderedWatchSources)
      {
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
          -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:].cold.1(v24, (uint64_t)v17, (uint64_t)v22);
      }

      v8 = v49;
    }
    v57 = *MEMORY[0x24BE40840];
    v58[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (var0 == *MEMORY[0x24BDD2B60] && var1 == *(_QWORD *)(MEMORY[0x24BDD2B60] + 8))
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE40E48], "hdmc_predicateForSamplesInDayIndexRange:", var0, var1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    HKMCDaySummaryCategoryTypes();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v15;
    if (v8)
    {
      HKMCCycleFactorsTypes();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v30;
    }
    HKMCDaySummaryQuantityTypes();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc(MEMORY[0x24BE40BA0]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v33, v25, 0, 0, v27);
    v56[0] = v34;
    v35 = objc_alloc(MEMORY[0x24BE40BA0]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v36, v25, 0, 0, v27);
    v56[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (id *)MEMORY[0x24BDD3718];
    if (!v50)
      v39 = (id *)MEMORY[0x24BDD3710];
    v40 = (void *)MEMORY[0x24BDD17C0];
    v41 = *v39;
    objc_msgSend(v40, "sortDescriptorWithKey:ascending:", v41, v50);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_alloc(MEMORY[0x24BE40B18]);
    v55 = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v43;
    v14 = v52;
    v46 = objc_msgSend(v45, "initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:", v38, 0, 0, v44, 100, v52);
    iterator = v17->_iterator;
    v17->_iterator = (HDMultiTypeSortedSampleIterator *)v46;

    v15 = v51;
  }

  return v17;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  id v6;
  id v7;
  HDMultiTypeSortedSampleIterator *iterator;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HKCalendarCache *calendarCache;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HDMultiTypeSortedSampleIterator *v26;
  int v27;
  id v28;
  void *v29;
  BOOL v30;
  id *v32;
  _QWORD v33[6];
  id v34;
  char v35;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v35 = 0;
  iterator = self->_iterator;
  v34 = 0;
  v9 = -[HDMultiTypeSortedSampleIterator advanceWithError:](iterator, "advanceWithError:", &v34);
  v10 = v34;
  v11 = v10;
  if (v9)
  {
    v32 = a3;
    do
    {
      v12 = (void *)MEMORY[0x219A3147C]();
      -[HDMultiTypeSortedSampleIterator sample](self->_iterator, "sample");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "hkmc_isNotPresentSymptom") & 1) == 0)
      {
        if (self->_ascending)
        {
          objc_msgSend(v13, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "hk_earliestPossibleDayIndex");
        }
        else
        {
          objc_msgSend(v13, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "hk_latestPossibleDayIndex");
        }
        v16 = v15;

        objc_msgSend(v7, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __55__HDMCDaySummaryEnumerator_enumerateWithError_handler___block_invoke;
        v33[3] = &unk_24DB224B0;
        v33[4] = self;
        v33[5] = v16;
        objc_msgSend(v17, "hk_filter:", v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[HDMCDaySummaryEnumerator _closeBuilders:withIndexes:handler:stop:](self, "_closeBuilders:withIndexes:handler:stop:", v7, v18, v6, &v35);
        calendarCache = self->_calendarCache;
        objc_msgSend(v13, "_timeZone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCalendarCache calendarForTimeZone:](calendarCache, "calendarForTimeZone:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "hkmc_isSleepDependentSample") & 1) != 0)
        {
          objc_msgSend(v13, "endDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "hk_morningIndexWithCalendar:", v21);

          v24 = 1;
        }
        else
        {
          v23 = objc_msgSend(v13, "hk_dayIndexRangeWithCalendar:", v21);
          v24 = v25;
        }
        -[HDMCDaySummaryEnumerator _addSample:toBuilders:sampleRange:](self, "_addSample:toBuilders:sampleRange:", v13, v7, v23, v24);

      }
      objc_autoreleasePoolPop(v12);
      v26 = self->_iterator;
      v34 = v11;
      v27 = -[HDMultiTypeSortedSampleIterator advanceWithError:](v26, "advanceWithError:", &v34);
      v28 = v34;

      if (!v27)
        break;
      v11 = v28;
    }
    while (!v35);
    a3 = v32;
    if (v35)
    {
      if (!v28)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else
  {
    v28 = v10;
  }
  objc_msgSend(v7, "allKeys");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCDaySummaryEnumerator _closeBuilders:withIndexes:handler:stop:](self, "_closeBuilders:withIndexes:handler:stop:", v7, v29, v6, &v35);

  if (!v28)
  {
LABEL_19:
    v30 = 1;
    goto LABEL_23;
  }
LABEL_18:
  if ((objc_msgSend(v28, "hk_isHealthKitErrorWithCode:", 900) & 1) != 0)
    goto LABEL_19;
  if (a3)
  {
    v30 = 0;
    *a3 = objc_retainAutorelease(v28);
  }
  else
  {
    _HKLogDroppedError();
    v30 = 0;
  }
LABEL_23:

  return v30;
}

uint64_t __55__HDMCDaySummaryEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  _BOOL4 v7;
  unsigned int v8;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
  v4 = objc_msgSend(a2, "integerValue");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v4 <= v5;
  v7 = v4 < v5;
  v8 = !v6;
  if (v3)
    return v7;
  else
    return v8;
}

- (void)_closeBuilders:(id)a3 withIndexes:(id)a4 handler:(id)a5 stop:(BOOL *)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, BOOL *);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *context;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, BOOL *))a5;
  context = (void *)MEMORY[0x219A3147C]();
  v26 = v11;
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = v13;
  if (self->_ascending)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(v13, "reverseObjectEnumerator", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v23);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
LABEL_6:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v17)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18);
      objc_msgSend(v10, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createDaySummaryWithDevice:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v12[2](v12, v22, a6);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v19);
      LODWORD(v21) = *a6;

      if ((_DWORD)v21)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v16)
          goto LABEL_6;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
}

- (void)_addSample:(id)a3 toBuilders:(id)a4 atDayIndex:(int64_t)a5
{
  id v8;
  void *v9;
  HDMCDaySummaryBuilder *v10;
  HDMCDaySummaryBuilder *v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (HDMCDaySummaryBuilder *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [HDMCDaySummaryBuilder alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v10 = -[HDMCDaySummaryBuilder initWithProfile:dayIndex:orderedWatchSources:calendarCache:](v11, "initWithProfile:dayIndex:orderedWatchSources:calendarCache:", WeakRetained, a5, self->_orderedWatchSources, self->_calendarCache);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v13);

  }
  -[HDMCDaySummaryBuilder addCycleTrackingSample:](v10, "addCycleTrackingSample:", v14);

}

- (void)_addSample:(id)a3 toBuilders:(id)a4 sampleRange:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  char v10;
  int64_t start;
  int64_t duration;
  _BOOL4 v15;
  int64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v21;
  id v22;

  var1 = a5.var1;
  var0 = a5.var0;
  v22 = a3;
  v9 = a4;
  v10 = objc_msgSend(v22, "hkmc_isCycleFactorSample");
  start = self->_dayIndexRange.start;
  duration = self->_dayIndexRange.duration;
  if ((v10 & 1) != 0)
  {
    v15 = var0 >= start && var0 - start < duration
       || start == *MEMORY[0x24BDD2B60] && duration == *(_QWORD *)(MEMORY[0x24BDD2B60] + 8);
    if (var1 <= 0)
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v18 = var1 + var0 - 1;
    v19 = (v18 < start || v18 - start >= duration)
       && (start != *MEMORY[0x24BDD2B60] || duration != *(_QWORD *)(MEMORY[0x24BDD2B60] + 8));
    v21 = v22;
    if (v15)
    {
      -[HDMCDaySummaryEnumerator _addSample:toBuilders:atDayIndex:](self, "_addSample:toBuilders:atDayIndex:", v22, v9, var0);
      v21 = v22;
    }
    if (((objc_msgSend(v21, "hasUndeterminedDuration") | v19) & 1) == 0)
      -[HDMCDaySummaryEnumerator _addSample:toBuilders:atDayIndex:](self, "_addSample:toBuilders:atDayIndex:", v22, v9, v18);
  }
  else
  {
    if (start != *MEMORY[0x24BDD2B60] || duration != *(_QWORD *)(MEMORY[0x24BDD2B60] + 8))
    {
      var0 = HKIntersectionDayIndexRange();
      var1 = v17;
    }
    -[HDMCDaySummaryEnumerator _addSample:toBuilders:inRange:](self, "_addSample:toBuilders:inRange:", v22, v9, var0, var1);
  }

}

- (void)_addSample:(id)a3 toBuilders:(id)a4 inRange:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  int64_t v10;
  void *v11;
  HDMCDaySummaryBuilder *v12;
  HDMCDaySummaryBuilder *v13;
  id WeakRetained;
  void *v15;
  id v16;

  var1 = a5.var1;
  var0 = a5.var0;
  v16 = a3;
  v9 = a4;
  if (var1 >= 1)
  {
    v10 = var0 + var1;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", var0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v11);
      v12 = (HDMCDaySummaryBuilder *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = [HDMCDaySummaryBuilder alloc];
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        v12 = -[HDMCDaySummaryBuilder initWithProfile:dayIndex:orderedWatchSources:calendarCache:](v13, "initWithProfile:dayIndex:orderedWatchSources:calendarCache:", WeakRetained, var0, self->_orderedWatchSources, self->_calendarCache);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", var0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v15);

      }
      -[HDMCDaySummaryBuilder addCycleTrackingSample:](v12, "addCycleTrackingSample:", v16);

      ++var0;
    }
    while (var0 < v10);
  }

}

+ (id)daySummaryAtIndex:(int64_t)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  HDMCDaySummaryEnumerator *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v9 = a4;
  v10 = a5;
  LOBYTE(v14) = 0;
  v11 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v9, v10, a3, 1, 1, 0, v14);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__HDMCDaySummaryEnumerator_daySummaryAtIndex_profile_calendarCache_error___block_invoke;
  v15[3] = &unk_24DB21EC8;
  v15[4] = &v16;
  -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v11, "enumerateWithError:handler:", a6, v15);
  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __74__HDMCDaySummaryEnumerator_daySummaryAtIndex_profile_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)daySummariesInIndexRange:(id)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  int64_t var1;
  int64_t var0;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HDMCDaySummaryEnumerator *v14;
  id v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "arrayWithCapacity:", var1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = 0;
  v14 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v12, v11, var0, var1, 1, 0, v18);

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __81__HDMCDaySummaryEnumerator_daySummariesInIndexRange_profile_calendarCache_error___block_invoke;
  v19[3] = &unk_24DB224D8;
  v20 = v13;
  v15 = v13;
  -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v14, "enumerateWithError:handler:", a6, v19);
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

uint64_t __81__HDMCDaySummaryEnumerator_daySummariesInIndexRange_profile_calendarCache_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSArray)orderedWatchSources
{
  return self->_orderedWatchSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedWatchSources, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_iterator, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)initWithProfile:(uint64_t)a3 calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_21961B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving ordered wrist temperature sources: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
