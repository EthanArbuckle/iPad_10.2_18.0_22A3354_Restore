@implementation _ATXAppLaunchLocation

- (_ATXAppLaunchLocation)init
{
  void *v3;
  void *v4;
  _ATXAppLaunchLocation *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[_ATXAppLaunchLocation initWithDuetHelper:combinedIntentStream:locationManager:](self, "initWithDuetHelper:combinedIntentStream:locationManager:", v3, v4, 0);

  return v5;
}

- (_ATXAppLaunchLocation)initWithDuetHelper:(id)a3 combinedIntentStream:(id)a4 locationManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ATXAppLaunchLocation *v12;
  _ATXAppLaunchLocation *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _PASLock *lock;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_ATXAppLaunchLocation;
  v12 = -[_ATXAppLaunchLocation init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationManager, a5);
    objc_storeStrong((id *)&v13->_duetHelper, a3);
    v14 = objc_alloc(MEMORY[0x1E0D815F0]);
    v15 = (void *)objc_opt_new();
    v16 = objc_msgSend(v14, "initWithGuardedData:", v15);
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v16;

    objc_storeStrong((id *)&v13->_combinedIntentStream, a4);
    -[_ATXAppLaunchLocation loadModel](v13, "loadModel");
  }

  return v13;
}

- (id)locationManager
{
  ATXLocationManagerProtocol *locationManager;
  ATXLocationManagerProtocol *v4;
  ATXLocationManagerProtocol *v5;

  locationManager = self->_locationManager;
  if (!locationManager)
  {
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v4 = (ATXLocationManagerProtocol *)objc_claimAutoreleasedReturnValue();
    v5 = self->_locationManager;
    self->_locationManager = v4;

    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)resetAppIntentLocationData
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51___ATXAppLaunchLocation_resetAppIntentLocationData__block_invoke;
  v3[3] = &unk_1E82E1B28;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (double)launchProbabilityAtLOI:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  _PASLock *lock;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0.0;
  if (v6 && objc_msgSend(v7, "length"))
  {
    v22 = 0;
    v23 = (double *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    lock = self->_lock;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57___ATXAppLaunchLocation_launchProbabilityAtLOI_bundleId___block_invoke;
    v13[3] = &unk_1E82E1B50;
    v16 = &v22;
    v14 = v6;
    v15 = v8;
    v17 = &v18;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
    v11 = v19[3];
    if (v11 != 0.0)
      v9 = v23[3] / v11;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (int)launchCountAtLOI:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _PASLock *lock;
  int v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "length"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    lock = self->_lock;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51___ATXAppLaunchLocation_launchCountAtLOI_bundleId___block_invoke;
    v12[3] = &unk_1E82E1B78;
    v15 = &v16;
    v13 = v6;
    v14 = v8;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
    v10 = *((_DWORD *)v17 + 6);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)launchProbabilityAtLOI:(id)a3 appIntent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  _PASLock *lock;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0.0;
  if (v6 && objc_msgSend(v7, "length"))
  {
    v22 = 0;
    v23 = (double *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    lock = self->_lock;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58___ATXAppLaunchLocation_launchProbabilityAtLOI_appIntent___block_invoke;
    v13[3] = &unk_1E82E1B50;
    v16 = &v22;
    v14 = v6;
    v15 = v8;
    v17 = &v18;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
    v11 = v19[3];
    if (v11 != 0.0)
      v9 = v23[3] / v11;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (double)launchProbabilityAtLOI:(id)a3 appForAllIntentsBundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  _PASLock *lock;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0.0;
  if (v6 && objc_msgSend(v7, "length"))
  {
    v22 = 0;
    v23 = (double *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    lock = self->_lock;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73___ATXAppLaunchLocation_launchProbabilityAtLOI_appForAllIntentsBundleId___block_invoke;
    v13[3] = &unk_1E82E1B50;
    v16 = &v22;
    v14 = v6;
    v15 = v8;
    v17 = &v18;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
    v11 = v19[3];
    if (v11 != 0.0)
      v9 = v23[3] / v11;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (void)train
{
  -[_ATXAppLaunchLocation trainWithCallback:](self, "trainWithCallback:", 0);
}

- (void)trainWithCallback:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sel_getName(a2);
  v6 = (void *)os_transaction_create();
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 136446210;
    v19 = "_ATXAppLaunchLocation";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }

  -[_ATXAppLaunchLocation locationManager](self, "locationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43___ATXAppLaunchLocation_trainWithCallback___block_invoke;
  v14[3] = &unk_1E82E1BA0;
  v16 = v5;
  v17 = v8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v11, "fetchAllLocationsOfInterest:", v14);

}

- (void)_trainModelWithLOI:(id)a3 startDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _PASLock *lock;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *context;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _ATXAppLaunchLocation *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  SEL v48;
  _QWORD v49[4];
  id v50;
  id v51;

  v34 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v29 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  v27 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  +[_ATXAppLaunchLocation visitsWithLOI:startDate:](_ATXAppLaunchLocation, "visitsWithLOI:startDate:", v34, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:batchSize:](self->_duetHelper, "getAppLaunchesBetweenStartDate:endDate:batchSize:", v6, v31, 800);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke;
  v49[3] = &unk_1E82E1BC8;
  v12 = v7;
  v50 = v12;
  v13 = v8;
  v51 = v13;
  +[_ATXAppLaunchLocation joinLaunchEvents:withVisits:block:](_ATXAppLaunchLocation, "joinLaunchEvents:withVisits:block:", v26, v10, v49);
  -[ATXCombinedIntentStream getActivityAndIntentEventsFromLastMonth](self->_combinedIntentStream, "getActivityAndIntentEventsFromLastMonth");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_2;
  v43[3] = &unk_1E82E1BF0;
  v48 = a2;
  v43[4] = self;
  v15 = v29;
  v44 = v15;
  v16 = v28;
  v45 = v16;
  v17 = v27;
  v46 = v17;
  v18 = v9;
  v47 = v18;
  +[_ATXAppLaunchLocation joinLaunchEvents:withVisits:block:](_ATXAppLaunchLocation, "joinLaunchEvents:withVisits:block:", v14, v10, v43);

  objc_autoreleasePoolPop(context);
  lock = self->_lock;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_3;
  v35[3] = &unk_1E82E1C18;
  v36 = v12;
  v37 = v15;
  v38 = v16;
  v39 = v17;
  v40 = v13;
  v41 = v18;
  v42 = self;
  v20 = v18;
  v21 = v13;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v35);

}

+ (id)visitsWithLOI:(id)a3 startDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  id obj;
  uint64_t v23;
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
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v9, "visits");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              v16 = objc_msgSend(v15, "rangeValue");
              v18 = (double)(unint64_t)(v16 + v17);
              objc_msgSend(v6, "timeIntervalSinceReferenceDate");
              if (v19 <= v18)
              {
                objc_msgSend(v9, "uuid");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v15);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v12);
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }

  return v7;
}

+ (void)joinLaunchEvents:(id)a3 withVisits:(id)a4 block:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  unint64_t v27;
  id v28;

  v28 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *, void *))a5;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchLocation sortTimeIntervals:](_ATXAppLaunchLocation, "sortTimeIntervals:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  v12 = v28;
  if (v11)
  {
    v13 = 0;
    v14 = 0;
    while (1)
    {
      if (v14 >= objc_msgSend(v12, "count"))
        goto LABEL_10;
      objc_msgSend(v28, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rangeValue");
      v19 = v18;
      objc_msgSend(v15, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      v22 = v21;

      if (v22 < (double)v17)
        goto LABEL_8;
      objc_msgSend(v15, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceReferenceDate");
      v25 = v24;

      if (v25 <= (double)(v17 + v19))
        break;
      ++v13;
LABEL_9:

      v27 = objc_msgSend(v10, "count");
      v12 = v28;
      if (v13 >= v27)
        goto LABEL_10;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v15, v26);

LABEL_8:
    ++v14;
    goto LABEL_9;
  }
LABEL_10:

}

+ (id)sortTimeIntervals:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_90);
}

+ (id)defaultPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXAppLaunchLocation"));
}

+ (void)writeModel:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3[2] && v3[3] && v3[4] && v3[5] && v3[6] && v3[7])
  {
    v5 = (void *)MEMORY[0x1CAA48B6C]();
    v23[0] = CFSTR("modelVersion");
    v23[1] = CFSTR("appLaunchCountMapKey");
    v6 = v4[2];
    v7 = v4[3];
    v24[0] = &unk_1E83CC8E0;
    v24[1] = v6;
    v23[2] = CFSTR("appIntentLaunchCountMapKey");
    v23[3] = CFSTR("intentLaunchCountMapKey");
    v8 = v4[4];
    v9 = v4[5];
    v24[2] = v7;
    v24[3] = v8;
    v23[4] = CFSTR("appForAllIntentsLaunchCountMapKey");
    v23[5] = CFSTR("totalLaunchCountMapKey");
    v10 = v4[6];
    v11 = v4[7];
    v24[4] = v9;
    v24[5] = v10;
    v23[6] = CFSTR("totalIntentLaunchCountMapKey");
    v24[6] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    if (v13)
    {
      v15 = (void *)MEMORY[0x1E0C99E98];
      +[_ATXAppLaunchLocation defaultPath](_ATXAppLaunchLocation, "defaultPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileURLWithPath:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v21 = v14;
      v18 = objc_msgSend(v13, "writeToURL:options:error:", v17, 805306369, &v21);
      v19 = v21;

      if ((v18 & 1) == 0)
      {
        __atxlog_handle_default();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          +[_ATXAppLaunchLocation writeModel:].cold.2();

      }
    }
    else
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[_ATXAppLaunchLocation writeModel:].cold.1();
      v19 = v14;
    }

    objc_autoreleasePoolPop(v5);
  }

}

- (unint64_t)loadModel
{
  void *v3;
  unint64_t v4;

  +[_ATXAppLaunchLocation defaultPath](_ATXAppLaunchLocation, "defaultPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ATXAppLaunchLocation loadModelAtPath:](self, "loadModelAtPath:", v3);

  return v4;
}

- (unint64_t)loadModelAtPath:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  _PASLock *lock;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81590], "lockState") - 1 > 1)
  {
    v8 = (void *)MEMORY[0x1CAA48B6C]();
    v30 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v4, 0, &v30);
    v10 = v30;
    if (!v9)
    {
      __atxlog_handle_default();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v4;
        v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "Could not open model at %@: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeItemAtPath:error:", v4, 0);
      v7 = 2;
      v19 = v10;
      goto LABEL_18;
    }
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1CAA48B6C]();
    v29 = v10;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v16, v9, &v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v29;

    objc_autoreleasePoolPop(v17);
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("modelVersion"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if (v21 == 2)
      {
        lock = self->_lock;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_75;
        v27[3] = &unk_1E82E1B28;
        v28 = v18;
        -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v27);
        v7 = 1;
        v23 = v28;
LABEL_14:

LABEL_18:
        objc_autoreleasePoolPop(v8);
        goto LABEL_19;
      }
      __atxlog_handle_default();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchLocation loadModelAtPath:].cold.2(v21, v23);
    }
    else
    {
      __atxlog_handle_default();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchLocation loadModelAtPath:].cold.1();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeItemAtPath:error:](v23, "removeItemAtPath:error:", v4, 0);
    }
    v7 = 2;
    goto LABEL_14;
  }
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "Model data data was locked. Waiting...", buf, 2u);
  }

  v6 = self->_lock;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke;
  v31[3] = &unk_1E82E1CE8;
  v31[4] = self;
  v32 = v4;
  -[_PASLock runWithLockAcquired:](v6, "runWithLockAcquired:", v31);

  v7 = 0;
LABEL_19:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedIntentStream, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

+ (void)writeModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error archiving location model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)writeModel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error writing location model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)loadModelAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_ERROR, "Error unarchiving model at %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)loadModelAtPath:(int)a1 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = 2;
  v3 = 1024;
  v4 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Expected model version %i, got %i", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_1_0();
}

@end
