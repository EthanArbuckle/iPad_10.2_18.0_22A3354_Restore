@implementation HDSleepPeriodSegmentArrayBuilder

- (id)initProfile:(id)a3 morningIndex:(int64_t)a4 options:(unint64_t)a5 gregorianCalendar:(id)a6 sourceOrderProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  HDSleepPeriodSegmentArrayBuilder *v15;
  HDSleepPeriodSegmentArrayBuilder *v16;
  objc_super v18;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDSleepPeriodSegmentArrayBuilder;
  v15 = -[HDSleepPeriodSegmentArrayBuilder init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_profile, v12);
    v16->_morningIndex = a4;
    v16->_options = a5;
    objc_storeStrong((id *)&v16->_gregorianCalendar, a6);
    objc_storeWeak((id *)&v16->_sourceOrderProvider, v14);
  }

  return v16;
}

- (id)_computeStatisticsFromSamples:(void *)a3 sampleFilterBlock:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepDayStartForMorningIndex:calendar:", *((_QWORD *)a1 + 2), *((_QWORD *)a1 + 4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v8, "setCalendar:", *((_QWORD *)a1 + 4));
    objc_msgSend(v8, "setSecond:", (uint64_t)-[HDSleepPeriodSegmentArrayBuilder _timeIntervalForKey:defaultValue:]((uint64_t)a1, CFSTR("HDSleepStagesStatisticsBucketInterval"), 60.0));
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F60]), "initWithAnchorDate:intervalComponents:", v7, v8);
    objc_msgSend((id)v9, "setEnableRiskyFastMathOptimization:", 1);
    v10 = _HKStatisticsOptionSleepStages();
    WeakRetained = objc_loadWeakRetained((id *)a1 + 5);
    v12 = WeakRetained != 0;

    objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDStatisticsCollectionCalculator calculatorForCategoryType:intervalCollection:options:mergeStrategy:](HDStatisticsCollectionCalculator, "calculatorForCategoryType:intervalCollection:options:mergeStrategy:", v13, v9, v10 | v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setMergeGranularity:", -[HDSleepPeriodSegmentArrayBuilder _timeIntervalForKey:defaultValue:]((uint64_t)a1, CFSTR("HDSleepStagesSourceMergeInterval"), 30.0));
    v15 = objc_loadWeakRetained((id *)a1 + 5);
    objc_msgSend(v14, "setSourceOrderProvider:", v15);

    objc_msgSend(v14, "reset");
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke;
    v31[3] = &unk_1E6CE97C8;
    v18 = v16;
    v32 = v18;
    objc_msgSend(v14, "setStatisticsHandler:", v31);
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke_2;
    v27[3] = &unk_1E6CE97F0;
    v28 = v5;
    v30 = v6;
    v19 = v14;
    v29 = v19;
    v26 = 0;
    LOBYTE(v9) = objc_msgSend(v19, "performInitialStatisticsTransaction:error:", v27, &v26);
    v20 = v26;
    if ((v9 & 1) != 0)
    {
      a1 = v18;
    }
    else
    {
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x1E0CB5368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
      {
        v23 = v21;
        v24 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v34 = v24;
        v35 = 2114;
        v36 = v20;
        v25 = v24;
        _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Error adding samples to statistics calculator: %{public}@", buf, 0x16u);

      }
      a1 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  return a1;
}

uint64_t __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __84__HDSleepPeriodSegmentArrayBuilder__computeStatisticsFromSamples_sampleFilterBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v22 = a2;
  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "value", v22);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        {
          v9 = *(void **)(a1 + 40);
          v10 = (double)v8;
          objc_msgSend(v7, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v13 = v12;
          objc_msgSend(v7, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = v15;
          objc_msgSend(v7, "sourceRevision");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "source");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_sourceID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v9) = objc_msgSend(v9, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v19, "longLongValue"), v22, v10, v13, v16);

          if (!(_DWORD)v9)
          {
            v20 = 0;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v4)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_12:

  return v20;
}

- (id)sortedSleepPeriodSegmentsFromSamples:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HDSleepPeriodSegmentArrayBuilder _computeStatisticsFromSamples:sampleFilterBlock:](self, v4, &__block_literal_global_11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSleepPeriodSegmentArrayBuilder _computeStatisticsFromSamples:sampleFilterBlock:](self, v4, &__block_literal_global_192);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDSleepPeriodSegmentArrayBuilder _sleepPeriodSegmentsFromStatistics:]((uint64_t)self, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  -[HDSleepPeriodSegmentArrayBuilder _sleepPeriodSegmentsFromStatistics:]((uint64_t)self, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_194);
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

BOOL __73__HDSleepPeriodSegmentArrayBuilder_sortedSleepPeriodSegmentsFromSamples___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

BOOL __73__HDSleepPeriodSegmentArrayBuilder_sortedSleepPeriodSegmentsFromSamples___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 == 0;
}

- (id)_sleepPeriodSegmentsFromStatistics:(uint64_t)a1
{
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
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
  double v24;
  double v25;
  uint64_t v26;
  id v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = -[HDSleepPeriodSegmentArrayBuilder _timeIntervalForKey:defaultValue:](a1, CFSTR("HDSleepStagesSegmentCombinationDistance"), 29.0);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v5)
    {
      v6 = v5;
      v28 = v3;
      v29 = a1;
      v7 = 0;
      v31 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          v9 = v7;
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "categoryValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "integerValue");

          if (_HKCategoryValueSleepAnalysisIsAsleep() && (*(_BYTE *)(v29 + 24) & 1) == 0)
            v12 = _HKCategoryValueSleepAnalysisDefaultAsleepValue();
          v13 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v10, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "endDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:", v14, v15);

          objc_msgSend(v10, "sources");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "hk_firstObjectPassingTest:", &__block_literal_global_202);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0CB6C00];
          v37 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sleepPeriodSegmentWithDateInterval:sampleIntervals:category:containsAppleSleepTrackingData:", v16, v20, v12, v18 != 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v16, "startDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateInterval");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "endDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "timeIntervalSinceDate:", v23);
            v25 = v24;

            if (objc_msgSend(v9, "category") == v12 && v25 <= v4)
            {
              objc_msgSend(v32, "removeLastObject");
              objc_msgSend(v9, "mergingSleepPeriodSegment:", v7);
              v26 = objc_claimAutoreleasedReturnValue();

              v7 = (void *)v26;
            }
          }
          objc_msgSend(v32, "addObject:", v7);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v6);

      v3 = v28;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

uint64_t __73__HDSleepPeriodSegmentArrayBuilder_sortedSleepPeriodSegmentsFromSamples___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __71__HDSleepPeriodSegmentArrayBuilder__sleepPeriodSegmentsFromStatistics___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isAppleWatch");
}

- (double)_timeIntervalForKey:(double)a3 defaultValue:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
    {
      v11 = v8;
      objc_msgSend(v7, "doubleValue");
      v13 = 138543874;
      v14 = a1;
      v15 = 2114;
      v16 = v5;
      v17 = 2050;
      v18 = v12;
      _os_log_debug_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Found value for key: %{public}@ = %{public}f", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(v7, "doubleValue");
    a3 = v9;
  }

  return a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceOrderProvider);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
