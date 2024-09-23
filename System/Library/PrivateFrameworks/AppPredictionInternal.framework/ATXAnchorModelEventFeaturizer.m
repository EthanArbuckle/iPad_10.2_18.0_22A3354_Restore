@implementation ATXAnchorModelEventFeaturizer

- (ATXAnchorModelEventFeaturizer)init
{
  ATXAnchorModelEventFeaturizer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXAnchorModelEventFeaturizer;
  result = -[ATXAnchorModelEventFeaturizer init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_shouldComputeLaunchHistoryForAppLaunches = 257;
    result->_shouldComputeLaunchHistoryForActionUUIDLaunches = 1;
  }
  return result;
}

+ (void)setHourofDayAndDayOfWeekFromDate:(id)a3 anchorMetadata:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:timeZone:](_ATXActionUtils, "timeOfDayAndDayOfWeekForDate:timeZone:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "integerValue") < 0)
    goto LABEL_4;
  objc_msgSend(v5, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if ((v8 & 0x8000000000000000) == 0)
  {
    objc_msgSend(v5, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHourOfDay:", objc_msgSend(v9, "unsignedIntValue") / 0xE10uLL);

    objc_msgSend(v5, "second");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDayOfWeek:", objc_msgSend(v6, "unsignedIntValue") + 1);
LABEL_4:

  }
}

+ (void)setMonthAndDayOfMonthFromDate:(id)a3 anchorMetadata:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = (objc_class *)MEMORY[0x1E0C99D48];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v8, "components:fromDate:", 24, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "month") & 0x8000000000000000) == 0 && (objc_msgSend(v9, "day") & 0x8000000000000000) == 0)
  {
    objc_msgSend(v10, "setMonth:", objc_msgSend(v9, "month"));
    objc_msgSend(v10, "setDayOfMonth:", objc_msgSend(v9, "day"));
  }

}

+ (void)setLocationAndLocationTypeOnDate:(id)a3 anchorMetadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "locationOfInterestForAnchorOccurrenceDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocationIdentifier:", v8);

    v9 = objc_msgSend(v6, "type");
    if (v9 > 3)
      v10 = 0;
    else
      v10 = dword_1C9E7EB00[v9];
    objc_msgSend(v11, "setLocationType:", v10);
  }

}

- (id)featurizeAnchorEvent:(id)a3 anchor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setAnchorType:", objc_msgSend((id)objc_opt_class(), "anchorType"));
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnchorEventIdentifier:", v8);

  objc_msgSend(v7, "setAnchorEventType:", objc_msgSend((id)objc_opt_class(), "pbAnchorEventTypeFromDuetEvent:", v6));
  v9 = (void *)objc_opt_class();

  objc_msgSend(v9, "anchorOccurenceDateFromDuetEvent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "setHourofDayAndDayOfWeekFromDate:anchorMetadata:", v10, v7);
  objc_msgSend((id)objc_opt_class(), "setMonthAndDayOfMonthFromDate:anchorMetadata:", v10, v7);
  objc_msgSend((id)objc_opt_class(), "setLocationAndLocationTypeOnDate:anchorMetadata:", v10, v7);

  return v7;
}

+ (unint64_t)getMinTemporalDistanceFromAnchorDate:(id)a3 toTimeRange:(_NSRange)a4
{
  NSUInteger length;
  int64_t location;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  unint64_t v12;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  if (v7 >= (double)location)
  {
    v9 = location + length;
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    if (v10 <= (double)v9)
    {
      v12 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    location = (uint64_t)v11;
  }
  else
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v9 = (uint64_t)v8;
  }
  v12 = location - v9;
LABEL_7:

  return v12;
}

+ (id)locationOfInterestForAnchorOccurrenceDate:(id)a3
{
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  if (v4 <= -120.0 || (objc_msgSend(v3, "timeIntervalSinceNow"), v5 >= 0.0))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v3, "dateByAddingTimeInterval:", -115200.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

    v12 = dispatch_semaphore_create(0);
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__6;
    v52 = __Block_byref_object_dispose__6;
    v53 = 0;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __75__ATXAnchorModelEventFeaturizer_locationOfInterestForAnchorOccurrenceDate___block_invoke;
    v45[3] = &unk_1E82DC280;
    v47 = &v48;
    v13 = v12;
    v46 = v13;
    v34 = (void *)v11;
    objc_msgSend(v35, "fetchLocationsOfInterestVisitedDuring:handler:", v11, v45);
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v13, 2.0))
    {
      __atxlog_handle_anchor();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "LOI fetch near anchor timed out", buf, 2u);
      }
    }
    else
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = (id)v49[5];
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      if (v15)
      {
        v16 = 0;
        v17 = *(_QWORD *)v42;
        v18 = 900;
        v33 = v14;
        v30 = *(_QWORD *)v42;
        do
        {
          v19 = 0;
          v31 = v15;
          do
          {
            if (*(_QWORD *)v42 != v17)
              objc_enumerationMutation(v14);
            v32 = v19;
            v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v19);
            objc_msgSend(v20, "visits");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v22 = v21;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v38;
              while (2)
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v38 != v24)
                    objc_enumerationMutation(v22);
                  v26 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "rangeValue");
                  v28 = +[ATXAnchorModelEventFeaturizer getMinTemporalDistanceFromAnchorDate:toTimeRange:](ATXAnchorModelEventFeaturizer, "getMinTemporalDistanceFromAnchorDate:toTimeRange:", v3, v26, v27);
                  if (v28 < v18)
                  {
                    v7 = v20;

                    if (!v28)
                    {

                      v14 = v33;
                      goto LABEL_29;
                    }
                    v16 = v7;
                    v18 = v28;
                  }
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
                if (v23)
                  continue;
                break;
              }
            }

            v19 = v32 + 1;
            v14 = v33;
            v17 = v30;
          }
          while (v32 + 1 != v31);
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        }
        while (v15);
        v7 = v16;
        goto LABEL_29;
      }
    }
    v7 = 0;
LABEL_29:

    _Block_object_dispose(&v48, 8);
    goto LABEL_30;
  }
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[ATXAnchorModelEventFeaturizer locationOfInterestForAnchorOccurrenceDate:].cold.1(v6);

  objc_msgSend(v35, "previousLOIAndCurrentLOI");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "second");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v7;
}

void __75__ATXAnchorModelEventFeaturizer_locationOfInterestForAnchorOccurrenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)warmLaunchHistoryForAppEvents:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *bundleIdToLaunchHistoryDict;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  ATXAnchorModelEventFeaturizer *v36;
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (NSMutableDictionary *)objc_opt_new();
  bundleIdToLaunchHistoryDict = self->_bundleIdToLaunchHistoryDict;
  self->_bundleIdToLaunchHistoryDict = v8;

  objc_msgSend(v6, "dateByAddingTimeInterval:", -2419201.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1209601.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -604801.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -172801.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86401.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -43201.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v27;
  v37[1] = v26;
  v37[2] = v10;
  v37[3] = v11;
  v37[4] = v12;
  v37[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v15, "initWithArray:", v16);
  v18 = (void *)v17;
  -[ATXAnchorModelEventFeaturizer numAppLaunchesForBundleIds:endDate:dateBuckets:](self, "numAppLaunchesForBundleIds:endDate:dateBuckets:", v17, v14, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __84__ATXAnchorModelEventFeaturizer_warmLaunchHistoryForAppEvents_anchorOccurrenceDate___block_invoke_2;
  v29[3] = &unk_1E82DC2E8;
  v30 = v27;
  v31 = v26;
  v32 = v10;
  v33 = v11;
  v34 = v12;
  v35 = v13;
  v36 = self;
  v20 = v13;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v26;
  v25 = v27;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v29);

}

uint64_t __84__ATXAnchorModelEventFeaturizer_warmLaunchHistoryForAppEvents_anchorOccurrenceDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleId");
}

void __84__ATXAnchorModelEventFeaturizer_warmLaunchHistoryForAppEvents_anchorOccurrenceDate___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = a2;
  v13 = (id)objc_opt_new();
  objc_msgSend(v5, "objectForKeyedSubscript:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLaunchesInLast28Days:", objc_msgSend(v7, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLaunchesInLast14Days:", objc_msgSend(v8, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLaunchesInLast7Days:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", a1[7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLaunchesInLast48Hours:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", a1[8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLaunchesInLast24Hours:", objc_msgSend(v11, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", a1[9]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setLaunchesInLast12Hours:", objc_msgSend(v12, "unsignedIntValue"));
  objc_msgSend(*(id *)(a1[10] + 8), "setObject:forKeyedSubscript:", v13, v6);

}

- (id)historyForAppLaunchDuetEvents:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSMutableDictionary *bundleIdToLaunchHistoryDict;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  _BYTE v57[128];
  _QWORD v58[8];

  v58[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __84__ATXAnchorModelEventFeaturizer_historyForAppLaunchDuetEvents_anchorOccurrenceDate___block_invoke;
  v56[3] = &unk_1E82DC310;
  v56[4] = self;
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", v56);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_pas_mappedArrayWithTransform:", &__block_literal_global_24);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -2419201.0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -1209601.0);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -604801.0);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -172801.0);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -86401.0);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -43201.0);
  v14 = objc_claimAutoreleasedReturnValue();
  v45 = v7;
  objc_msgSend(v7, "dateByAddingTimeInterval:", -1.0);
  v15 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v10;
  v51 = (void *)v9;
  v58[0] = v9;
  v58[1] = v10;
  v48 = (void *)v12;
  v49 = (void *)v11;
  v58[2] = v11;
  v58[3] = v12;
  v46 = (void *)v14;
  v47 = (void *)v13;
  v58[4] = v13;
  v58[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 6);
  v16 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v8;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
  v41 = (void *)v16;
  v42 = (void *)v15;
  -[ATXAnchorModelEventFeaturizer numAppLaunchesForBundleIds:endDate:dateBuckets:](self, "numAppLaunchesForBundleIds:endDate:dateBuckets:", v17, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        bundleIdToLaunchHistoryDict = self->_bundleIdToLaunchHistoryDict;
        objc_msgSend(v25, "bundleId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](bundleIdToLaunchHistoryDict, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = self->_bundleIdToLaunchHistoryDict;
          objc_msgSend(v25, "bundleId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
        }
        else
        {
          v31 = (void *)objc_opt_new();
          objc_msgSend(v25, "bundleId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v33);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "objectForKeyedSubscript:", v51);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setLaunchesInLast28Days:", objc_msgSend(v34, "unsignedIntValue"));

          objc_msgSend(v32, "objectForKeyedSubscript:", v50);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setLaunchesInLast14Days:", objc_msgSend(v35, "unsignedIntValue"));

          objc_msgSend(v32, "objectForKeyedSubscript:", v49);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setLaunchesInLast7Days:", objc_msgSend(v36, "unsignedIntValue"));

          objc_msgSend(v32, "objectForKeyedSubscript:", v48);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setLaunchesInLast48Hours:", objc_msgSend(v37, "unsignedIntValue"));

          objc_msgSend(v32, "objectForKeyedSubscript:", v47);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setLaunchesInLast24Hours:", objc_msgSend(v38, "unsignedIntValue"));

          objc_msgSend(v32, "objectForKeyedSubscript:", v46);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setLaunchesInLast12Hours:", objc_msgSend(v39, "unsignedIntValue"));

          v30 = v31;
        }
        objc_msgSend(v19, "addObject:", v31);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v22);
  }

  return v19;
}

BOOL __84__ATXAnchorModelEventFeaturizer_historyForAppLaunchDuetEvents_anchorOccurrenceDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(a2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

uint64_t __84__ATXAnchorModelEventFeaturizer_historyForAppLaunchDuetEvents_anchorOccurrenceDate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleId");
}

- (id)historyForModeChangeEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
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
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -2419201.0);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -1209601.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -604801.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -172801.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86401.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -43201.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v8;
  v27[0] = v8;
  v27[1] = v9;
  v27[2] = v10;
  v27[3] = v22;
  v27[4] = v24;
  v27[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXAnchorModelDataStoreWrapper candidateIdFromModeBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromModeBiomeEvent:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelEventFeaturizer numModeChangesForModeCandidateId:endDate:dateBuckets:](self, "numModeChangesForModeCandidateId:endDate:dateBuckets:", v25, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast28Days:", objc_msgSend(v15, "unsignedIntValue"));

  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast14Days:", objc_msgSend(v16, "unsignedIntValue"));

  objc_msgSend(v14, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast7Days:", objc_msgSend(v17, "unsignedIntValue"));

  objc_msgSend(v14, "objectForKeyedSubscript:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast48Hours:", objc_msgSend(v18, "unsignedIntValue"));

  objc_msgSend(v14, "objectForKeyedSubscript:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v19, "unsignedIntValue"));

  objc_msgSend(v14, "objectForKeyedSubscript:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v20, "unsignedIntValue"));

  return v7;
}

- (id)historyForLinkActionChangeEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[7];

  v42[6] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -2419201.0);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1209601.0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -604801.0);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -172801.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86401.0);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -43201.0);
  v38 = (void *)v9;
  v39 = (void *)v8;
  v42[0] = v8;
  v42[1] = v9;
  v13 = (void *)v12;
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v10;
  v42[2] = v10;
  v42[3] = v11;
  v42[4] = v12;
  v42[5] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelEventFeaturizer earliestDate:](self, "earliestDate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:toDate:error:](ATXLinkTranscriptUtil, "systemLinkTranscriptPublisherFromDate:toDate:error:", v16, v15, &v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v41;

  v35 = (uint64_t)v18;
  if (!v18)
  {
    +[ATXAnchorModelDataStoreWrapper candidateIdFromLinkActionBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromLinkActionBiomeEvent:", v40);
    v21 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1CAA48B6C]();
    v34 = v11;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v21, 0);
    objc_autoreleasePoolPop(v23);
    -[ATXAnchorModelEventFeaturizer numEventsForEventIds:dateBuckets:biomePublisher:](self, "numEventsForEventIds:dateBuckets:biomePublisher:", v24, v14, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v34;
    objc_msgSend(v26, "objectForKeyedSubscript:", v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLaunchesInLast28Days:", objc_msgSend(v27, "unsignedIntValue"));

    objc_msgSend(v26, "objectForKeyedSubscript:", v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLaunchesInLast14Days:", objc_msgSend(v28, "unsignedIntValue"));

    objc_msgSend(v26, "objectForKeyedSubscript:", v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLaunchesInLast7Days:", objc_msgSend(v29, "unsignedIntValue"));

    objc_msgSend(v26, "objectForKeyedSubscript:", v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLaunchesInLast48Hours:", objc_msgSend(v30, "unsignedIntValue"));

    objc_msgSend(v26, "objectForKeyedSubscript:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v31, "unsignedIntValue"));

    objc_msgSend(v26, "objectForKeyedSubscript:", v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v32, "unsignedIntValue"));

    v20 = v13;
    v19 = (void *)v36;
    goto LABEL_5;
  }
  v19 = (void *)v36;
  v20 = v13;
  __atxlog_handle_anchor();
  v21 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
LABEL_5:
    v22 = (void *)v35;
    goto LABEL_6;
  }
  v22 = (void *)v35;
  -[ATXAnchorModelEventFeaturizer historyForLinkActionChangeEvent:anchorOccurrenceDate:].cold.1(v35, v21);
LABEL_6:

  return v7;
}

- (id)recentHistoryForAppLaunchDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86401.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -43201.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, 0);
  -[ATXAnchorModelEventFeaturizer numAppLaunchesForBundleIds:endDate:dateBuckets:](self, "numAppLaunchesForBundleIds:endDate:dateBuckets:", v14, v11, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLaunchesInLast24Hours:", objc_msgSend(v18, "unsignedIntValue"));

  objc_msgSend(v17, "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLaunchesInLast12Hours:", objc_msgSend(v19, "unsignedIntValue"));

  return v8;
}

- (id)recentHistoryForModeWithModeEvent:(id)a3 anchorOccurrenceDate:(id)a4
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
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86401.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -43201.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXAnchorModelDataStoreWrapper candidateIdFromBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromBiomeEvent:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelEventFeaturizer numModeChangesForModeCandidateId:endDate:dateBuckets:](self, "numModeChangesForModeCandidateId:endDate:dateBuckets:", v13, v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLaunchesInLast24Hours:", objc_msgSend(v15, "unsignedIntValue"));

  objc_msgSend(v14, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLaunchesInLast12Hours:", objc_msgSend(v16, "unsignedIntValue"));

  return v8;
}

- (id)numAppLaunchesForBundleIds:(id)a3 endDate:(id)a4 dateBuckets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "App");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "InFocus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelEventFeaturizer earliestDate:](self, "earliestDate:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v9, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "filterWithIsIncluded:", &__block_literal_global_29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelEventFeaturizer numEventsForEventIds:dateBuckets:biomePublisher:](self, "numEventsForEventIds:dateBuckets:biomePublisher:", v10, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __80__ATXAnchorModelEventFeaturizer_numAppLaunchesForBundleIds_endDate_dateBuckets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

- (id)numModeChangesForModeCandidateId:(id)a3 endDate:(id)a4 dateBuckets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1CAA48B6C]();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, 0, 0);
  objc_autoreleasePoolPop(v11);
  -[ATXAnchorModelEventFeaturizer numModeChangesForModeCandidateIds:endDate:dateBuckets:](self, "numModeChangesForModeCandidateIds:endDate:dateBuckets:", v12, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)numModeChangesForModeCandidateIds:(id)a3 endDate:(id)a4 dateBuckets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UserFocus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ComputedMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelEventFeaturizer earliestDate:](self, "earliestDate:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v9, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAnchorModelEventFeaturizer numEventsForEventIds:dateBuckets:biomePublisher:](self, "numEventsForEventIds:dateBuckets:biomePublisher:", v10, v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)numEventsForEventIds:(id)a3 dateBuckets:(id)a4 biomePublisher:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if (v10)
  {
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke;
    v23[3] = &unk_1E82DC378;
    objc_copyWeak(&v24, &location);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke_2;
    v19[3] = &unk_1E82DC3A0;
    v20 = v8;
    v21 = v9;
    v13 = v11;
    v22 = v13;
    v14 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", v23, v19);
    v15 = v22;
    v16 = v13;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    __atxlog_handle_anchor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelEventFeaturizer numEventsForEventIds:dateBuckets:biomePublisher:].cold.1(v17);

  }
  return v11;
}

void __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke(uint64_t a1)
{

}

void __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
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
  id v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ATXAnchorModelDataStoreWrapper candidateIdFromBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromBiomeEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(a1[4], "containsObject:", v4))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    v22 = v3;
    objc_msgSend(v3, "timestamp");
    v6 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = a1[5];
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v24 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v24)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v6, "earlierDate:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != v6)
          {
            objc_msgSend(a1[6], "objectForKeyedSubscript:", v4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
            {
              v13 = (void *)objc_opt_new();
              objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v13, v4);

            }
            objc_msgSend(a1[6], "objectForKeyedSubscript:", v4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              objc_msgSend(a1[6], "objectForKeyedSubscript:", v4);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E83CBC08, v10);

            }
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(a1[6], "objectForKeyedSubscript:", v4);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v10);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "objectForKeyedSubscript:", v4);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v10);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    v3 = v22;
  }

}

- (id)earliestDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "earlierDate:", v4, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v10)
        {
          v12 = v10;

          v4 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)featurizeAppLaunchEvents:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;

  v6 = a3;
  v7 = a4;
  if (self->_shouldComputeLaunchHistoryForAppLaunches)
  {
    -[ATXAnchorModelEventFeaturizer historyForAppLaunchDuetEvents:anchorOccurrenceDate:](self, "historyForAppLaunchDuetEvents:anchorOccurrenceDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    v29 = v8;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_new();
      objc_msgSend(v11, "bundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBundleId:", v13);

      objc_msgSend(v11, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v7);
      objc_msgSend(v12, "setRelativeTimeSinceAnchorInSeconds:", (int)v15);

      +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appInfoForBundleId:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "installDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v7, "timeIntervalSinceDate:", v19);
        v21 = v20 < 172800.0;
      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v12, "setAppInstalledInLast48Hours:", v21);
      objc_msgSend(v18, "genreId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        objc_msgSend(v12, "setGenreId:", objc_msgSend(v22, "longLongValue"));
      objc_msgSend(v12, "setApp2VecCluster:", objc_msgSend(&unk_1E83CBC08, "longLongValue"));
      if (v8 && objc_msgSend(v8, "count") > v10)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v24 = v6;
        v25 = v7;
        v26 = v9;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAppLaunchHistory:", v27);

        v9 = v26;
        v7 = v25;
        v6 = v24;
        v8 = v29;
      }
      objc_msgSend(v9, "addObject:", v12);

      ++v10;
    }
    while (objc_msgSend(v6, "count") > v10);
  }

  return v9;
}

- (id)featurizeActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[ATXAnchorModelEventFeaturizer featurizeAppLaunchForActionEvent:anchorOccurrenceDate:](self, "featurizeAppLaunchForActionEvent:anchorOccurrenceDate:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppLaunchMetadata:", v9);

  -[ATXAnchorModelEventFeaturizer featurizeActionKeyForActionEvent:anchorOccurrenceDate:](self, "featurizeActionKeyForActionEvent:anchorOccurrenceDate:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionKeyMetadata:", v10);

  v11 = (void *)MEMORY[0x1E0C99DE8];
  -[ATXAnchorModelEventFeaturizer featurizeActionUUIDForActionEvent:anchorOccurrenceDate:](self, "featurizeActionUUIDForActionEvent:anchorOccurrenceDate:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionUUIDMetadatas:", v13);

  return v8;
}

- (id)featurizeModeEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeId:", v10);

  objc_msgSend(v7, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsStart:", objc_msgSend(v11, "starting"));

  objc_msgSend(v7, "timestamp");
  v13 = v12;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "setRelativeTimeSinceAnchorInSeconds:", (int)(v13 - v14));
  -[ATXAnchorModelEventFeaturizer historyForModeChangeEvent:anchorOccurrenceDate:](self, "historyForModeChangeEvent:anchorOccurrenceDate:", v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setModeHistory:", v15);
  return v8;
}

- (id)featurizeLinkActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBundleId:", v10);

  objc_msgSend(v7, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionId:", v13);

  objc_msgSend(v7, "timestamp");
  v15 = v14;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "setRelativeTimeSinceAnchorInSeconds:", (int)(v15 - v16));
  -[ATXAnchorModelEventFeaturizer historyForLinkActionChangeEvent:anchorOccurrenceDate:](self, "historyForLinkActionChangeEvent:anchorOccurrenceDate:", v7, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setActionHistory:", v17);
  return v8;
}

- (id)featurizeAppLaunchForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  ATXAppLaunchDuetEvent *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXAppLaunchDuetEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [ATXAppLaunchDuetEvent alloc];
  objc_msgSend(v7, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ATXAppLaunchDuetEvent initWithBundleId:startDate:endDate:](v8, "initWithBundleId:startDate:endDate:", v9, v10, v11);
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelEventFeaturizer featurizeAppLaunchEvents:anchorOccurrenceDate:](self, "featurizeAppLaunchEvents:anchorOccurrenceDate:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)featurizeActionKeyForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionType:", v9);

  if (self->_shouldComputeLaunchHistoryForActionKeyLaunches)
  {
    v10 = (void *)objc_opt_new();
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v6, "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@:%@"), v12, v13);

    objc_msgSend(v7, "dateByAddingTimeInterval:", -1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v15, "dateByAddingTimeInterval:", -2419201.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLaunchesInLast28Days:", objc_msgSend(v18, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v17, v15));

    objc_autoreleasePoolPop(v16);
    v19 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v15, "dateByAddingTimeInterval:", -1209601.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLaunchesInLast14Days:", objc_msgSend(v21, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v20, v15));

    objc_autoreleasePoolPop(v19);
    v22 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v15, "dateByAddingTimeInterval:", -604801.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLaunchesInLast7Days:", objc_msgSend(v24, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v23, v15));

    objc_autoreleasePoolPop(v22);
    v25 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v15, "dateByAddingTimeInterval:", -172801.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLaunchesInLast48Hours:", objc_msgSend(v27, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v26, v15));

    objc_autoreleasePoolPop(v25);
    v28 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v15, "dateByAddingTimeInterval:", -86401.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLaunchesInLast24Hours:", objc_msgSend(v30, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v29, v15));

    objc_autoreleasePoolPop(v28);
    v31 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v15, "dateByAddingTimeInterval:", -43201.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLaunchesInLast12Hours:", objc_msgSend(v33, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v32, v15));

    objc_autoreleasePoolPop(v31);
    objc_msgSend(v8, "setActionKeyLaunchHistory:", v10);

  }
  return v8;
}

- (id)featurizeActionUUIDForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
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

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "parameterHashes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionUUID:", objc_msgSend(v10, "longLongValue"));

  objc_msgSend(v6, "slotSetHashes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSlotHash:", objc_msgSend(v12, "longLongValue"));

  objc_msgSend(v6, "paramCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParamCount:", objc_msgSend(v13, "unsignedIntValue"));

  if (self->_shouldComputeLaunchHistoryForActionUUIDLaunches)
  {
    -[ATXAnchorModelEventFeaturizer historyForActionUUIDWithAppIntentDuetEvent:anchorOccurrenceDate:](self, "historyForActionUUIDWithAppIntentDuetEvent:anchorOccurrenceDate:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActionUUIDLaunchHistory:", v14);

  }
  return v8;
}

- (id)historyForActionUUIDWithAppIntentDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@:%@"), v9, v10);

  objc_msgSend(v5, "parameterHashes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -2419201.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast28Days:", objc_msgSend(v18, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v17, v15));

  objc_autoreleasePoolPop(v16);
  v19 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -1209601.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast14Days:", objc_msgSend(v21, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v20, v15));

  objc_autoreleasePoolPop(v19);
  v22 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -604801.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast7Days:", objc_msgSend(v24, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v23, v15));

  objc_autoreleasePoolPop(v22);
  v25 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -172801.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast48Hours:", objc_msgSend(v27, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v26, v15));

  objc_autoreleasePoolPop(v25);
  v28 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -86401.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v30, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v29, v15));

  objc_autoreleasePoolPop(v28);
  v31 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -43201.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v33, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v32, v15));

  objc_autoreleasePoolPop(v31);
  return v7;
}

- (id)recentHistoryForActionUUIDWithAppIntentDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@:%@"), v9, v10);

  objc_msgSend(v5, "parameterHashes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -86401.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v18, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v17, v15));

  objc_autoreleasePoolPop(v16);
  v19 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -43201.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v21, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v20, v15));

  objc_autoreleasePoolPop(v19);
  return v7;
}

- (BOOL)shouldComputeLaunchHistoryForAppLaunches
{
  return self->_shouldComputeLaunchHistoryForAppLaunches;
}

- (void)setShouldComputeLaunchHistoryForAppLaunches:(BOOL)a3
{
  self->_shouldComputeLaunchHistoryForAppLaunches = a3;
}

- (BOOL)shouldComputeLaunchHistoryForActionKeyLaunches
{
  return self->_shouldComputeLaunchHistoryForActionKeyLaunches;
}

- (void)setShouldComputeLaunchHistoryForActionKeyLaunches:(BOOL)a3
{
  self->_shouldComputeLaunchHistoryForActionKeyLaunches = a3;
}

- (BOOL)shouldComputeLaunchHistoryForActionUUIDLaunches
{
  return self->_shouldComputeLaunchHistoryForActionUUIDLaunches;
}

- (void)setShouldComputeLaunchHistoryForActionUUIDLaunches:(BOOL)a3
{
  self->_shouldComputeLaunchHistoryForActionUUIDLaunches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdToLaunchHistoryDict, 0);
}

+ (void)locationOfInterestForAnchorOccurrenceDate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Accessing the current location from ATXLocationManager during anchor event featurization since anchor occurred less than 2 minutes ago.", v1, 2u);
}

- (void)historyForLinkActionChangeEvent:(uint64_t)a1 anchorOccurrenceDate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Error when fetching Link transcript publisher: %@", (uint8_t *)&v2, 0xCu);
}

- (void)numEventsForEventIds:(os_log_t)log dateBuckets:biomePublisher:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXAnchorModelEventFeaturizer numEventsForEventIds:dateBuckets:biomePublisher:]";
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "%s: could not access biome publisher", (uint8_t *)&v1, 0xCu);
}

@end
