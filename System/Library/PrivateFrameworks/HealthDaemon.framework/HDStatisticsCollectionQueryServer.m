@implementation HDStatisticsCollectionQueryServer

- (HDStatisticsCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDStatisticsCollectionQueryServer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _HKDateIntervalCollection *intervalCollection;
  uint64_t v21;
  HKQuantityType *quantityType;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v30;
  void *v31;
  uint64_t v32;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *sourceOrderProvider;
  uint64_t v34;
  HDStatisticsCollectionCalculator *calculator;
  uint64_t v36;
  NSDate *anchorDate;
  uint64_t v38;
  NSDateInterval *resultsDateInterval;
  unint64_t statisticsOptions;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  HKStatisticsCollectionCacheSettings *cacheSettings;
  uint64_t v49;
  HKQuantityType *v50;
  objc_super v51;
  objc_super v52;

  v10 = a4;
  v52.receiver = self;
  v52.super_class = (Class)HDStatisticsCollectionQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v52, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (!v11)
    goto LABEL_14;
  objc_msgSend(v10, "intervalComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intervalComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCalendar:", v14);

  }
  v16 = objc_alloc(MEMORY[0x1E0CB6F60]);
  objc_msgSend(v10, "anchorDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intervalComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "initWithAnchorDate:intervalComponents:", v17, v18);
  intervalCollection = v11->_intervalCollection;
  v11->_intervalCollection = (_HKDateIntervalCollection *)v19;

  v51.receiver = v11;
  v51.super_class = (Class)HDStatisticsCollectionQueryServer;
  -[HDQueryServer quantityType](&v51, sel_quantityType);
  v21 = objc_claimAutoreleasedReturnValue();
  quantityType = v11->_quantityType;
  v11->_quantityType = (HKQuantityType *)v21;

  if (!v11->_quantityType)
  {
    -[HDQueryServer sampleType](v11, "sampleType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "conformsToProtocol:", &unk_1EF1ED398);

    if (v24)
    {
      -[HDQueryServer sampleType](v11, "sampleType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithConfigurationProviding:](_HDStatisticsSyntheticQuantityType, "syntheticQuantityTypeWithConfigurationProviding:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v11->_quantityType;
      v11->_quantityType = (HKQuantityType *)v26;
    }
    else
    {
      if (v11->_quantityType)
        goto LABEL_10;
      -[HDQueryServer sampleType](v11, "sampleType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_10;
      -[HDQueryServer sampleType](v11, "sampleType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:](_HDStatisticsSyntheticQuantityType, "syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:", v25, 1, v27);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v11->_quantityType;
      v11->_quantityType = (HKQuantityType *)v49;

    }
  }
LABEL_10:
  v30 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
  -[HDQueryServer profile](v11, "profile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider initWithProfile:quantityType:](v30, "initWithProfile:quantityType:", v31, v11->_quantityType);
  sourceOrderProvider = v11->_sourceOrderProvider;
  v11->_sourceOrderProvider = (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)v32;

  +[HDStatisticsCollectionCalculator calculatorForQuantityType:intervalCollection:options:mergeStrategy:](HDStatisticsCollectionCalculator, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v11->_quantityType, v11->_intervalCollection, objc_msgSend(v10, "options"), objc_msgSend(v10, "mergeStrategy"));
  v34 = objc_claimAutoreleasedReturnValue();
  calculator = v11->_calculator;
  v11->_calculator = (HDStatisticsCollectionCalculator *)v34;

  -[HDStatisticsCollectionCalculator setSourceOrderProvider:](v11->_calculator, "setSourceOrderProvider:", v11->_sourceOrderProvider);
  objc_msgSend(v10, "anchorDate");
  v36 = objc_claimAutoreleasedReturnValue();
  anchorDate = v11->_anchorDate;
  v11->_anchorDate = (NSDate *)v36;

  v11->_statisticsOptions = objc_msgSend(v10, "options");
  v11->_deliversUpdates = objc_msgSend(v10, "shouldDeactivateAfterInitialResults") ^ 1;
  objc_msgSend(v10, "dateInterval");
  v38 = objc_claimAutoreleasedReturnValue();
  resultsDateInterval = v11->_resultsDateInterval;
  v11->_resultsDateInterval = (NSDateInterval *)v38;

  v11->_mergeStrategy = objc_msgSend(v10, "mergeStrategy");
  statisticsOptions = v11->_statisticsOptions;
  if ((_HKStatisticsOptionBaselineRelativeQuantities() & statisticsOptions) == 0)
  {
    -[HDQueryServer profile](v11, "profile");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "daemon");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "behavior");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "supportsCachedStatisticsCollectionQueries");

    if (v44)
    {
      objc_msgSend(v10, "cacheSettings");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "copy");
      cacheSettings = v11->_cacheSettings;
      v11->_cacheSettings = (HKStatisticsCollectionCacheSettings *)v46;

    }
  }
  v11->_requiresFetch = 1;
LABEL_14:

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  unsigned __int8 v23;
  void *v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_opt_self();
  v11 = objc_msgSend(v10, "options");
  if ((_HKStatisticsOptionPercentile() & v11) != 0
    || (v12 = objc_msgSend(v10, "options"), (_HKStatisticsOptionPresence() & v12) != 0)
    || (v13 = objc_msgSend(v10, "options"), (_HKStatisticOptionsAverageSampleDuration() & v13) != 0)
    || (v14 = objc_msgSend(v10, "options"), (_HKStatisticsOptionBaselineRelativeQuantities() & v14) != 0)
    || (v15 = objc_msgSend(v10, "options"), (_HKStatisticsOptionSleepStages() & v15) != 0))
  {

  }
  else
  {
    objc_msgSend(v10, "objectType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
LABEL_8:
      v16 = objc_msgSend(v10, "options");
      if ((_HKStatisticsOptionBaselineRelativeQuantities() & v16) != 0)
      {
        objc_msgSend(v10, "objectType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v18 = objc_opt_isKindOfClass();

        if ((v18 & 1) == 0)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = CFSTR("Only quantity types are supported for baseline relative calculations");
LABEL_15:
          objc_msgSend(v21, "hk_assignError:code:format:", a5, 3, v22);
          goto LABEL_16;
        }
        objc_msgSend(v10, "objectType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "_supportsRelativeDataCalculation") & 1) == 0)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v19, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "hk_assignError:code:format:", a5, 3, CFSTR("%@ does not support baseline relative calculations"), v26);

          goto LABEL_16;
        }

      }
      v20 = objc_msgSend(v10, "options");
      if ((_HKStatisticsOptionSleepStages() & v20) == 0)
      {
        v29.receiver = a1;
        v29.super_class = (Class)&OBJC_METACLASS___HDStatisticsCollectionQueryServer;
        v23 = objc_msgSendSuper2(&v29, sel_validateConfiguration_client_error_, v10, v9, a5);
        goto LABEL_17;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFSTR("This statistics option is currently only intended to be used via HDStatisticsCalculator directly.");
      goto LABEL_15;
    }
  }
  if (objc_msgSend(v9, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], a5))
    goto LABEL_8;
LABEL_16:
  v23 = 0;
LABEL_17:

  return v23;
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (BOOL)_shouldListenForUpdates
{
  return self->_deliversUpdates;
}

- (void)_queue_start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDStatisticsCollectionQueryServer;
  -[HDQueryServer _queue_start](&v3, sel__queue_start);
  if (self->_requiresFetch)
  {
    -[HDStatisticsCollectionQueryServer _queue_fetchAndDeliverAllStatistics]((uint64_t)self);
  }
  else if (-[NSMutableDictionary count](self->_pendingQuantitiesBySeries, "count"))
  {
    -[HDStatisticsCollectionQueryServer _queue_updateStatistics]((uint64_t)self);
  }
}

- (void)_queue_fetchAndDeliverAllStatistics
{
  NSObject *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  HDStatisticsCollectionCalculatorRelativeDataSource *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  HDStatisticsCollectionCalculatorAttenuatedDataSource *v37;
  void *v38;
  void *v39;
  HDStatisticsCollectionCalculatorDefaultDataSource *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  HDQueryDescriptor *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  HDQueryDescriptor *v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  _QWORD v89[5];
  id v90;
  id v91;
  id v92;
  _QWORD v93[5];
  id v94;
  _QWORD v95[3];
  char v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  _QWORD aBlock[4];
  id v102;
  _QWORD *v103;
  _QWORD *v104;
  id v105;
  _QWORD v106[4];
  id location;
  id v108;
  _QWORD v109[3];
  char v110;
  _BYTE buf[24];
  void *v112;
  id v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "queryQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if ((objc_msgSend((id)a1, "_shouldStopProcessingQuery") & 1) == 0)
    {
      objc_msgSend((id)a1, "clientProxy");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = 0;
      v109[1] = v109;
      v109[2] = 0x2020000000;
      v110 = 1;
      v3 = *(void **)(a1 + 232);
      *(_QWORD *)(a1 + 232) = 0;

      objc_msgSend((id)a1, "sampleType");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend((id)a1, "profile");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dataManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "quantitySeriesManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "quantityType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:forType:", a1, v9);

      }
      objc_msgSend((id)a1, "sampleType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0;
      objc_msgSend((id)a1, "readAuthorizationStatusForType:error:", v10, &v108);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v108;

      if (!v11)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v12;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status; skipping statistics fetch: %{public}@",
            buf,
            0xCu);
        }
        goto LABEL_41;
      }
      if ((objc_msgSend(v11, "canRead") & 1) == 0)
      {
        objc_msgSend((id)a1, "queryUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "client_deliverStatisticsBatch:resetStatistics:isFinal:anchor:query:", MEMORY[0x1E0C9AA60], 1, 1, 0, v18);

LABEL_41:
        _Block_object_dispose(v109, 8);

        return;
      }
      objc_msgSend((id)a1, "filter");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (v87)
      {
        objc_msgSend((id)a1, "profile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "predicateWithProfile:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend((id)a1, "clientProxy");
          v86 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__queue_fetchAndDeliverAllStatistics, CFSTR("Error building predicate for query"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "queryUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "client_deliverError:forQuery:", v15, v16);

LABEL_40:
          goto LABEL_41;
        }
      }
      else
      {
        v14 = 0;
      }
      v19 = (void *)MEMORY[0x1E0D29840];
      objc_msgSend(v11, "authorizationPredicate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "compoundPredicateWithPredicate:otherPredicate:", v14, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "restrictedSourceEntities");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v21;
      v23 = v22;
      v84 = v87;
      v24 = *(_QWORD *)(a1 + 304);
      if ((_HKStatisticsOptionBaselineRelativeQuantities() & v24) != 0)
      {
        v25 = [HDStatisticsCollectionCalculatorRelativeDataSource alloc];
        objc_msgSend((id)a1, "profile");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "quantityType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "quantityType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        HKRollingBaselineConfigurationForQuantityType();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HDStatisticsCollectionCalculatorRelativeDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:configuration:currentDate:](v25, "initForProfile:quantityType:predicate:restrictedSourceEntities:configuration:currentDate:", v26, v27, v86, v23, v29, v30);

      }
      else
      {
        v32 = *(_QWORD *)(a1 + 304);
        if ((_HKStatisticsOptionAttenuateSamples() & v32) == 0)
          goto LABEL_19;
        objc_msgSend((id)a1, "quantityType");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C78]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "isEqual:", v34);

        if (!v35)
          goto LABEL_19;
        objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 272);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = [HDStatisticsCollectionCalculatorAttenuatedDataSource alloc];
        objc_msgSend((id)a1, "profile");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "quantityType");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HDStatisticsCollectionCalculatorAttenuatedDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:attenuationType:](v37, "initForProfile:quantityType:predicate:restrictedSourceEntities:attenuationType:", v38, v39, v86, v23, v36);

        if (!v31)
        {
LABEL_19:
          v40 = [HDStatisticsCollectionCalculatorDefaultDataSource alloc];
          objc_msgSend((id)a1, "profile");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "quantityType");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[HDStatisticsCollectionCalculatorDefaultDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:](v40, "initForProfile:quantityType:predicate:restrictedSourceEntities:", v41, v42, v86, v23);

        }
        objc_msgSend(v31, "setIncludeUnfrozenSeries:", 1);
        objc_msgSend(v31, "setFilter:", v84);
        objc_msgSend(v31, "setShouldContinueFrequency:", 1);
      }

      v43 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v31;

      objc_msgSend(*(id *)(a1 + 224), "setDataSource:", *(_QWORD *)(a1 + 208));
      objc_msgSend(*(id *)(a1 + 224), "reset");
      objc_initWeak(&location, (id)a1);
      v106[0] = 0;
      v106[1] = v106;
      v106[2] = 0x2020000000;
      v106[3] = 0;
      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke;
      aBlock[3] = &unk_1E6D01B78;
      objc_copyWeak(&v105, &location);
      v45 = v44;
      v102 = v45;
      v103 = v106;
      v104 = v109;
      v46 = _Block_copy(aBlock);
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_2;
      v97[3] = &unk_1E6D01BA0;
      objc_copyWeak(&v100, &location);
      v81 = v45;
      v98 = v81;
      v82 = v46;
      v99 = v82;
      objc_msgSend(*(id *)(a1 + 224), "setStatisticsHandler:", v97);
      v95[0] = 0;
      v95[1] = v95;
      v95[2] = 0x2020000000;
      v96 = 0;
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_3;
      v93[3] = &unk_1E6D01BC8;
      objc_copyWeak(&v94, &location);
      v93[4] = v95;
      objc_msgSend(*(id *)(a1 + 208), "setShouldContinueHandler:", v93);
      objc_msgSend((id)a1, "setDataCount:", 0);
      if (*(_QWORD *)(a1 + 272))
      {
        _HKInitializeLogging();
        v47 = (void *)*MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
        {
          v48 = v47;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(a1 + 272), "identifier");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v78;
            _os_log_debug_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEBUG, "%{public}@ Using cached statistics for %@.", buf, 0x16u);

          }
        }
        objc_msgSend(v11, "restrictedSourceEntities");
        v92 = v12;
        v85 = (id)objc_claimAutoreleasedReturnValue();
        v49 = v86;
        objc_msgSend((id)a1, "queryQueue");
        v50 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v50);

        v51 = [HDQueryDescriptor alloc];
        v52 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend((id)a1, "quantityType");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setWithObject:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = -[HDQueryDescriptor initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:](v51, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v54, 0, v85, 0, v49);

        objc_msgSend((id)a1, "profile");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "sourceManager");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localDeviceSourceWithError:", &v92);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          objc_msgSend(*(id *)(a1 + 200), "intervalComponents");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)objc_msgSend(v57, "copy");

          objc_msgSend((id)a1, "profile");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 272), "identifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_opt_class();
          v62 = *(_QWORD *)(a1 + 256);
          v63 = v11;
          v64 = v12;
          v65 = *(_QWORD *)(a1 + 296);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __103__HDStatisticsCollectionQueryServer__queue_cachingSessionWithPredicate_restrictedSourceEntities_error___block_invoke;
          v112 = &unk_1E6CEBBD8;
          v113 = v58;
          v66 = v58;
          v79 = v65;
          v12 = v64;
          v11 = v63;
          v67 = objc_msgSend((id)a1, "_newCachingSessionWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:", v59, v60, v83, v80, v61, v62, v79, v66, buf);

        }
        else
        {
          v67 = 0;
        }

        v68 = v92;
        v69 = *(void **)(a1 + 280);
        *(_QWORD *)(a1 + 280) = v67;

        v70 = *(void **)(a1 + 280);
        if (!v70)
        {
          objc_msgSend((id)a1, "queryUUID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "client_deliverError:forQuery:", v68, v77);

          v12 = v68;
          goto LABEL_39;
        }
        v91 = v68;
        v71 = objc_msgSend(v70, "cachesExistWithError:", &v91);
        v12 = v91;

        if (v71 == 1)
        {
          -[HDStatisticsCollectionQueryServer _queue_useCachedStatistics](a1);
          goto LABEL_39;
        }
        if (!v71)
        {
          objc_msgSend((id)a1, "queryUUID");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "client_deliverError:forQuery:", v12, v72);

LABEL_39:
          objc_destroyWeak(&v94);
          _Block_object_dispose(v95, 8);

          objc_destroyWeak(&v100);
          objc_destroyWeak(&v105);

          _Block_object_dispose(v106, 8);
          objc_destroyWeak(&location);
          goto LABEL_40;
        }
      }

      objc_msgSend((id)a1, "profile");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "database");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0;
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_280;
      v89[3] = &unk_1E6CEBC00;
      v89[4] = a1;
      v75 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDQuantitySampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v74, &v90, v89);
      v12 = v90;

      if (v75)
      {
        *(_BYTE *)(a1 + 241) = 0;
        (*((void (**)(id, uint64_t))v82 + 2))(v82, 1);
      }
      else if ((objc_msgSend(v12, "hk_isHealthKitErrorWithCode:", 128) & 1) == 0)
      {
        objc_msgSend((id)a1, "queryUUID");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "client_deliverError:forQuery:", v12, v76);

      }
      goto LABEL_39;
    }
  }
}

- (void)_queue_updateStatistics
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  id v34;
  _BYTE buf[24];
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "queryQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    *(_BYTE *)(a1 + 240) = 0;
    if (objc_msgSend(*(id *)(a1 + 232), "count"))
    {
      v3 = _Block_copy(*(const void **)(a1 + 320));
      v4 = v3;
      if (v3)
        (*((void (**)(void *, uint64_t))v3 + 2))(v3, a1);
      objc_msgSend((id)a1, "sampleType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend((id)a1, "readAuthorizationStatusForType:error:", v5, &v34);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v34;

      if (v6)
      {
        if (objc_msgSend(v6, "canRead"))
        {
          objc_msgSend(v6, "restrictedSourceEntities");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 208), "setRestrictedSourceEntities:", v8);

          objc_initWeak(&location, (id)a1);
          v9 = MEMORY[0x1E0C809B0];
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke;
          v31[3] = &unk_1E6D01B50;
          objc_copyWeak(&v32, &location);
          objc_msgSend(*(id *)(a1 + 224), "setStatisticsHandler:", v31);

          v30 = 0;
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend((id)a1, "client");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "authorizationOracle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v9;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __75__HDStatisticsCollectionQueryServer__queue_filteredPendingSeriesWithError___block_invoke;
          v36 = &unk_1E6D01B28;
          v37 = a1;
          v38 = v10;
          v13 = v10;
          LODWORD(v10) = objc_msgSend(v12, "performReadAuthorizationTransactionWithError:handler:", &v30, buf);

          if ((_DWORD)v10)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          v7 = v30;
          if (v15)
          {
            if (objc_msgSend(v15, "count"))
            {
              objc_msgSend((id)a1, "quantityType");
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v16, "canonicalUnit");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              v18 = *(void **)(a1 + 224);
              v26[0] = v9;
              v26[1] = 3221225472;
              v26[2] = __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke_266;
              v26[3] = &unk_1E6CF0678;
              v27 = v15;
              v28 = a1;
              v19 = v17;
              v29 = v19;
              v25 = 0;
              LOBYTE(v16) = objc_msgSend(v18, "performAddSampleTransaction:error:", v26, &v25);
              v7 = v25;
              objc_msgSend(*(id *)(a1 + 224), "setStatisticsHandler:", 0);
              if ((v16 & 1) == 0)
              {
                if (objc_msgSend(v7, "hk_isDatabaseAccessibilityError"))
                {
                  _HKInitializeLogging();
                  v20 = *MEMORY[0x1E0CB5348];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(_QWORD *)&buf[4] = a1;
                    _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_INFO, "%{public}@: unable to update statistics because of database accessibility error", buf, 0xCu);
                  }
                  *(_BYTE *)(a1 + 240) = 1;
                  v21 = _Block_copy(*(const void **)(a1 + 328));
                  v22 = v21;
                  if (v21)
                    (*((void (**)(void *, uint64_t))v21 + 2))(v21, a1);

                }
                else
                {
                  -[HDStatisticsCollectionQueryServer _queue_deliverUpdatedStatistics:error:]((void *)a1, 0, v7);
                }
              }
              if (!*(_BYTE *)(a1 + 240))
                objc_msgSend(*(id *)(a1 + 232), "removeAllObjects");

            }
          }
          else
          {
            _HKInitializeLogging();
            v24 = *MEMORY[0x1E0CB5348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v7;
              _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", buf, 0x16u);
            }
          }

          objc_destroyWeak(&v32);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v7;
          _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status; ignoring statistics update: %{public}@",
            buf,
            0xCu);
        }
      }

    }
  }
}

- (BOOL)_shouldObserveDatabaseProtectedDataAvailability
{
  return 1;
}

- (void)_queue_scheduleUpdate
{
  _QWORD v2[4];
  id v3;
  id location;

  if (a1
    && (objc_msgSend(*(id *)(a1 + 232), "count") || *(_BYTE *)(a1 + 241))
    && !*(_BYTE *)(a1 + 242)
    && (objc_msgSend((id)a1, "_shouldSuspendQuery") & 1) == 0)
  {
    *(_BYTE *)(a1 + 242) = 1;
    objc_initWeak(&location, (id)a1);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __58__HDStatisticsCollectionQueryServer__queue_scheduleUpdate__block_invoke;
    v2[3] = &unk_1E6CECE78;
    objc_copyWeak(&v3, &location);
    objc_msgSend((id)a1, "scheduleDatabaseAccessOnQueueWithBlock:", v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __58__HDStatisticsCollectionQueryServer__queue_scheduleUpdate__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[242] = 0;
    v2 = WeakRetained;
    if (WeakRetained[241])
      -[HDStatisticsCollectionQueryServer _queue_fetchAndDeliverAllStatistics]((uint64_t)WeakRetained);
    else
      -[HDStatisticsCollectionQueryServer _queue_updateStatistics]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (id)quantityType
{
  return self->_quantityType;
}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  NSObject *v7;
  NSMutableDictionary *v9;
  NSMutableDictionary *pendingQuantitiesBySeries;
  _QWORD aBlock[5];

  -[HDQueryServer queryQueue](self, "queryQueue", a3, a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (a4)
    return 0;
  if (!self->_pendingQuantitiesBySeries)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingQuantitiesBySeries = self->_pendingQuantitiesBySeries;
    self->_pendingQuantitiesBySeries = v9;

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__HDStatisticsCollectionQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
  aBlock[3] = &unk_1E6D01B00;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

void __98__HDStatisticsCollectionQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  int v33;
  _HDStatisticsCollectionQueryPendingSeries *v34;
  id v35;
  id v36;
  _HDStatisticsCollectionQueryPendingSeries *v37;
  uint64_t v38;
  NSNumber *anchor;
  NSMutableArray *v40;
  NSMutableArray *quantities;
  id v42;
  id v43;
  _HDStatisticsCollectionQueryPendingQuantity *v44;
  id v45;
  id v46;
  id *v47;
  uint64_t v48;
  HKQuantity *quantity;
  uint64_t v50;
  NSDateInterval *dateInterval;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  objc_super v65;

  v64 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_msgSend(*(id *)(a1 + 32), "queryQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) == 0)
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v64;
    v61 = v13;
    v62 = v14;
    v63 = v15;
    v60 = v16;
    if (v18)
    {
      v20 = *(_QWORD *)(v18 + 304);
      if ((_HKStatisticsOptionBaselineRelativeQuantities() & v20) != 0)
      {
        *(_BYTE *)(v18 + 241) = 1;
      }
      else
      {
        objc_msgSend((id)v18, "filter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v21;
        if (!v21)
          goto LABEL_30;
        v22 = objc_msgSend(v21, "acceptsDataObject:", v63);
        v23 = v59;
        if (v22)
        {
          v53 = (void *)MEMORY[0x1E0CB6FA0];
          objc_msgSend(v62, "startDate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "timeIntervalSinceReferenceDate");
          v25 = v24;
          objc_msgSend(v62, "startDate");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "timeIntervalSinceReferenceDate");
          v27 = v26;
          objc_msgSend(v62, "duration");
          v29 = v27 + v28;
          objc_msgSend(v61, "canonicalUnit");
          v57 = a7;
          v30 = v19;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValueForUnit:", v31);
          v33 = objc_msgSend(v53, "filter:acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", v59, v25, v29, v32);

          v19 = v30;
          a7 = v57;

          v23 = v59;
          if (v33)
          {
LABEL_30:
            if (objc_msgSend((id)v18, "_shouldSuspendQuery"))
            {
              *(_BYTE *)(v18 + 241) = 1;
            }
            else
            {
              v58 = a7;
              v56 = v19;
              objc_msgSend(*(id *)(v18 + 232), "objectForKeyedSubscript:", v63);
              v54 = objc_claimAutoreleasedReturnValue();
              if (v54)
                goto LABEL_15;
              v34 = [_HDStatisticsCollectionQueryPendingSeries alloc];
              v35 = v63;
              v36 = v60;
              if (v34)
              {
                v65.receiver = v34;
                v65.super_class = (Class)_HDStatisticsCollectionQueryPendingSeries;
                v37 = (_HDStatisticsCollectionQueryPendingSeries *)objc_msgSendSuper2(&v65, sel_init);
                v34 = v37;
                if (v37)
                {
                  objc_storeStrong((id *)&v37->_series, a5);
                  v38 = objc_msgSend(v36, "copy");
                  anchor = v34->_anchor;
                  v34->_anchor = (NSNumber *)v38;

                  v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  quantities = v34->_quantities;
                  v34->_quantities = v40;

                }
              }

              objc_msgSend(*(id *)(v18 + 232), "setObject:forKeyedSubscript:", v34, v35);
              v54 = (uint64_t)v34;
              if (v34)
              {
LABEL_15:
                v42 = v62;
                v43 = v56;
                v44 = [_HDStatisticsCollectionQueryPendingQuantity alloc];
                v45 = v43;
                v46 = v42;
                if (v44)
                {
                  v65.receiver = v44;
                  v65.super_class = (Class)_HDStatisticsCollectionQueryPendingQuantity;
                  v44 = (_HDStatisticsCollectionQueryPendingQuantity *)objc_msgSendSuper2(&v65, sel_init);
                  v47 = (id *)v54;
                  if (v44)
                  {
                    v48 = objc_msgSend(v45, "copy");
                    quantity = v44->_quantity;
                    v44->_quantity = (HKQuantity *)v48;

                    v50 = objc_msgSend(v46, "copy");
                    dateInterval = v44->_dateInterval;
                    v44->_dateInterval = (NSDateInterval *)v50;

                  }
                  v19 = v56;
                }
                else
                {
                  v47 = (id *)v54;
                  v19 = v56;
                }

                objc_msgSend(v47[3], "addObject:", v44);
              }
              else
              {
                v47 = 0;
                v19 = v56;
              }
              a7 = v58;

            }
            v23 = v59;
          }
        }

      }
    }

    if (a7)
      -[HDStatisticsCollectionQueryServer _queue_scheduleUpdate](*(_QWORD *)(a1 + 32));
  }

}

- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4
{
  NSObject *v5;

  -[HDQueryServer queryQueue](self, "queryQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_requiresFetch = 1;
  -[HDStatisticsCollectionQueryServer _queue_scheduleUpdate]((uint64_t)self);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  -[HDQueryServer queryQueue](self, "queryQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8.receiver = self;
  v8.super_class = (Class)HDStatisticsCollectionQueryServer;
  -[HDQueryServer database:protectedDataDidBecomeAvailable:](&v8, sel_database_protectedDataDidBecomeAvailable_, v6, v4);

  if (v4
    && !-[HDQueryServer _shouldStopProcessingQuery](self, "_shouldStopProcessingQuery")
    && self->_addedSamplesRequireProtectedData)
  {
    -[HDStatisticsCollectionQueryServer _queue_scheduleUpdate]((uint64_t)self);
  }
}

uint64_t __75__HDStatisticsCollectionQueryServer__queue_filteredPendingSeriesWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t (*v14)(_QWORD *, id, id, id *);
  id v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v21 = a3;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        if (v11)
        {
          v12 = *(id *)(v11 + 8);
          v13 = *(void **)(v11 + 16);
        }
        else
        {
          v12 = 0;
          v13 = 0;
        }
        v23 = 0;
        v14 = (uint64_t (*)(_QWORD *, id, id, id *))v5[2];
        v15 = v13;
        v16 = v14(v5, v12, v15, &v23);
        v17 = v23;

        if (v16)
        {
          objc_msgSend(*(id *)(v6 + 40), "addObject:", v11);
        }
        else if (v17)
        {
          if (v21)
            *v21 = objc_retainAutorelease(v17);
          else
            _HKLogDroppedError();

          v19 = 0;
          goto LABEL_20;
        }

        ++v10;
      }
      while (v8 != v10);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v8 = v18;
      if (v18)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_20:

  return v19;
}

void __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  -[HDStatisticsCollectionQueryServer _queue_deliverUpdatedStatistics:error:](WeakRetained, v4, 0);

}

- (void)_queue_deliverUpdatedStatistics:(void *)a3 error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "queryQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    objc_msgSend(a1, "clientProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "queryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client_deliverError:forQuery:", v5, v8);
    }
    else
    {
      if (!v9)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(a1, "queryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client_deliverUpdatedStatistics:anchor:query:", v9, 0, v8);
    }

    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke_266(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v2 = a1;
  v56 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v3 = *(id *)(a1 + 32);
  v36 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v36)
  {
    v4 = *(_QWORD *)v51;
    v38 = v3;
    v40 = v2;
    v35 = *(_QWORD *)v51;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v51 != v4)
          objc_enumerationMutation(v3);
        v6 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v5);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v37 = v5;
        if (v6)
          v7 = *(void **)(v6 + 24);
        else
          v7 = 0;
        obj = v7;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v44)
        {
          v41 = v6;
          v42 = *(_QWORD *)v47;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v47 != v42)
                objc_enumerationMutation(obj);
              v9 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v8);
              v10 = *(void **)(*(_QWORD *)(v2 + 40) + 224);
              if (v9)
                v11 = *(void **)(v9 + 8);
              else
                v11 = 0;
              v12 = v11;
              objc_msgSend(v12, "doubleValueForUnit:", *(_QWORD *)(v2 + 48));
              v14 = v13;
              if (v9)
                v15 = *(void **)(v9 + 16);
              else
                v15 = 0;
              v16 = v15;
              objc_msgSend(v16, "startDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "timeIntervalSinceReferenceDate");
              v19 = v18;
              v45 = v12;
              if (v9)
                v20 = *(void **)(v9 + 16);
              else
                v20 = 0;
              v21 = v20;
              objc_msgSend(v21, "endDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "timeIntervalSinceReferenceDate");
              v24 = v23;
              if (v6)
                v25 = *(void **)(v6 + 8);
              else
                v25 = 0;
              v26 = v25;
              objc_msgSend(v26, "sourceRevision");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "source");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "_sourceID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v10, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v29, "longLongValue"), a2, v14, v19, v24);

              if (!v30)
              {

                v33 = 0;
                v3 = v38;
                goto LABEL_36;
              }
              ++v8;
              v2 = v40;
              v6 = v41;
            }
            while (v44 != v8);
            v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            v44 = v31;
          }
          while (v31);
        }

        v5 = v37 + 1;
        v3 = v38;
        v4 = v35;
      }
      while (v37 + 1 != v36);
      v32 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      v33 = 1;
      v36 = v32;
    }
    while (v32);
  }
  else
  {
    v33 = 1;
  }
LABEL_36:

  return v33;
}

- (void)_queue_sendAccumulatedStatistics:(void *)a3 cachedStatistics:(uint64_t)a4 isFinal:(_QWORD *)a5 statisticsCount:(_BYTE *)a6 shouldResetStatistics:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _QWORD *v34;
  _QWORD v36[5];
  id v37;
  id v38;
  uint64_t v39;
  _BYTE buf[24];
  void *v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  if (a1)
  {
    objc_msgSend((id)a1, "clientProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 272);
    if (v13)
    {
      v34 = a5;
      objc_msgSend(v13, "identifier");
      v14 = objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
      {
        v32 = v15;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = objc_msgSend(v11, "count");
        *(_WORD *)&buf[22] = 2112;
        v41 = (void *)v14;
        _os_log_debug_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ Updating %lu cached statistics for %@.", buf, 0x20u);

      }
      v16 = v11;
      v17 = (void *)v14;
      objc_msgSend(*(id *)(a1 + 208), "maxRowID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v16;
      v19 = v16;
      v20 = v18;
      objc_msgSend((id)a1, "queryQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v21);

      if (*(_QWORD *)(a1 + 272) && objc_msgSend(v19, "count") && objc_msgSend(*(id *)(a1 + 272), "mode") != 1)
      {
        v22 = *(void **)(a1 + 280);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __67__HDStatisticsCollectionQueryServer__queue_cacheStatistics_anchor___block_invoke;
        v41 = &unk_1E6CE77C8;
        v42 = a1;
        objc_msgSend(v22, "insertCaches:anchor:completion:", v19, v20, buf);
      }

      a5 = v34;
      if ((_DWORD)a4)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v17;
          _os_log_debug_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session for %@.", buf, 0x16u);
        }
        v24 = *(_QWORD *)(a1 + 288);
        v25 = *(void **)(a1 + 280);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __133__HDStatisticsCollectionQueryServer__queue_sendAccumulatedStatistics_cachedStatistics_isFinal_statisticsCount_shouldResetStatistics___block_invoke;
        v36[3] = &unk_1E6CF8AF0;
        v36[4] = a1;
        v37 = v17;
        v38 = v12;
        v39 = v24;
        objc_msgSend(v25, "finishWithCompletion:", v36);

      }
      v11 = v33;
    }
    if ((a4 & 1) != 0 || objc_msgSend(v10, "count"))
    {
      v26 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v10, "removeAllObjects");
      v27 = *a5;
      v28 = objc_msgSend(v26, "count") + v27;
      v29 = *(_QWORD *)(a1 + 312);
      if (v29)
        (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v29 + 16))(v29, a1, v26, v28);
      v30 = *a6;
      objc_msgSend((id)a1, "queryUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "client_deliverStatisticsBatch:resetStatistics:isFinal:anchor:query:", v26, v30, a4, 0, v31);

      *a6 = 0;
      *a5 = v28;

    }
  }

}

void __133__HDStatisticsCollectionQueryServer__queue_sendAccumulatedStatistics_cachedStatistics_isFinal_statisticsCount_shouldResetStatistics___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@ encountered error when finishing caching session for %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "client_finishedCachingStatisticsWithCacheHits:error:", *(_QWORD *)(a1 + 56), v5);

}

- (uint64_t)_queue_accumulateUpdatedStatistics:(void *)a3 accumulatedStatistics:(void *)a4 sendHandler:
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 0x64)
      v9[2](v9, 0);
    v10 = v7;
    v11 = v10;
    v12 = *(id *)(a1 + 256);
    if (v12)
    {
      objc_msgSend(v10, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "hk_intersectsDateIntervalWithStartDate:endDate:", v13, v14);

      if (!v15
        || (objc_msgSend(v11, "endDate"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(*(id *)(a1 + 256), "startDate"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v16, "isEqualToDate:", v17),
            v17,
            v16,
            v18))
      {

LABEL_8:
        a1 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v11, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 256), "endDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToDate:", v20);

      if ((v21 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_msgSend(v8, "addObject:", v11);
    objc_msgSend((id)a1, "setDataCount:", objc_msgSend((id)a1, "dataCount") + objc_msgSend(v11, "dataCount"));
    a1 = 1;
  }
LABEL_12:

  return a1;
}

void __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[HDStatisticsCollectionQueryServer _queue_sendAccumulatedStatistics:cachedStatistics:isFinal:statisticsCount:shouldResetStatistics:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 32), a2, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

void __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_2(void **a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = a1 + 6;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  -[HDStatisticsCollectionQueryServer _queue_accumulateUpdatedStatistics:accumulatedStatistics:sendHandler:]((uint64_t)WeakRetained, v5, a1[4], a1[5]);

}

uint64_t __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_3(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    || (objc_msgSend(WeakRetained, "_shouldStopProcessingQuery") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "_shouldSuspendQuery");
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 128, CFSTR("Query suspended or aborted"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError();
    }

    goto LABEL_13;
  }
  v8 = 1;
LABEL_14:

  return v8;
}

- (void)_queue_useCachedStatistics
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD aBlock[4];
  id v64;
  id v65;
  _QWORD *v66;
  _QWORD *v67;
  id v68;
  _QWORD v69[3];
  char v70;
  _QWORD v71[4];
  id location;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)a1, "queryQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = *(void **)(a1 + 280);
  v73 = 0;
  objc_msgSend(v3, "persistentAnchorDateWithError:", &v73);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v73;
  if (v41)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB6F60]);
    objc_msgSend(*(id *)(a1 + 200), "intervalComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithAnchorDate:intervalComponents:", v41, v5);

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_initWeak(&location, (id)a1);
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v71[3] = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2020000000;
    v70 = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke;
    aBlock[3] = &unk_1E6D01BF0;
    v11 = v7;
    v64 = v11;
    v12 = v9;
    v65 = v12;
    objc_copyWeak(&v68, &location);
    v66 = v71;
    v67 = v69;
    v13 = _Block_copy(aBlock);
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_2;
    v55[3] = &unk_1E6D01C18;
    v14 = v8;
    v56 = v14;
    objc_copyWeak(&v62, &location);
    v15 = v11;
    v57 = v15;
    v16 = v13;
    v61 = v16;
    v39 = v12;
    v58 = v39;
    v17 = v10;
    v59 = v17;
    v18 = v6;
    v60 = v18;
    objc_msgSend(*(id *)(a1 + 224), "setStatisticsHandler:", v55);
    *(_QWORD *)(a1 + 288) = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v19 = *(void **)(a1 + 224);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_3;
    v44[3] = &unk_1E6D01C68;
    v44[4] = a1;
    v20 = v15;
    v45 = v20;
    v21 = v16;
    v49 = v21;
    v38 = v14;
    v46 = v38;
    v22 = v18;
    v47 = v22;
    v23 = v17;
    v48 = v23;
    v50 = &v51;
    v43 = 0;
    v24 = objc_msgSend(v19, "performAddSampleTransaction:error:", v44, &v43);
    v25 = v43;
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
    {
      v27 = v26;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 272), "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(a1 + 288);
        v37 = v52[3];
        *(_DWORD *)buf = 138544130;
        v75 = (void *)a1;
        v76 = 2112;
        v77 = v35;
        v78 = 2048;
        v79 = v36;
        v80 = 2048;
        v81 = v37;
        _os_log_debug_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ Finished fetching statistics for %@ with %ld cache hits and %ld cache misses.", buf, 0x2Au);

      }
    }
    if (v24)
    {
      *(_BYTE *)(a1 + 241) = 0;
      v28 = *(void **)(a1 + 280);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_293;
      v42[3] = &unk_1E6CE77C8;
      v42[4] = a1;
      objc_msgSend(v28, "deleteCachesForIntervals:completion:", v23, v42);
      (*((void (**)(id, uint64_t))v21 + 2))(v21, 1);
    }
    else if ((objc_msgSend(v25, "hk_isHealthKitErrorWithCode:", 128) & 1) == 0)
    {
      objc_msgSend((id)a1, "clientProxy");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "queryUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "client_deliverError:forQuery:", v25, v31);

    }
    _Block_object_dispose(&v51, 8);

    objc_destroyWeak(&v62);
    objc_destroyWeak(&v68);

    _Block_object_dispose(v69, 8);
    _Block_object_dispose(v71, 8);
    objc_destroyWeak(&location);

  }
  else
  {
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v32 = *(void **)(a1 + 272);
      v33 = v29;
      objc_msgSend(v32, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v75 = v34;
      _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Failed to fetch persisted anchor date for cached query %@", buf, 0xCu);

    }
    objc_msgSend((id)a1, "clientProxy");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "queryUUID");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "client_deliverError:forQuery:", v40, v20);
  }

}

uint64_t __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_280(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 243))
  {
    objc_msgSend(*(id *)(v6 + 232), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 32), "sampleType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v6 = *(_QWORD *)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend((id)v6, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "quantitySeriesManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "quantityType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queryQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:forType:queue:", v12, v13, v14);

      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  v15 = objc_msgSend(*(id *)(v6 + 224), "queryForInitialStatisticsWithError:", a3);

  return v15;
}

void __67__HDStatisticsCollectionQueryServer__queue_cacheStatistics_anchor___block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a3;
    objc_msgSend(v4, "clientProxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client_deliverError:forQuery:", v5, v6);

  }
}

uint64_t __103__HDStatisticsCollectionQueryServer__queue_cachingSessionWithPredicate_restrictedSourceEntities_error___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0C99D68];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithTimeIntervalSinceReferenceDate:", a3);
  v8 = objc_msgSend(v4, "hk_indexForDate:anchorDate:", v7, v6);

  return v8;
}

void __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  -[HDStatisticsCollectionQueryServer _queue_sendAccumulatedStatistics:cachedStatistics:isFinal:statisticsCount:shouldResetStatistics:]((uint64_t)WeakRetained, *(void **)(a1 + 32), v5, a2, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

  objc_msgSend(*(id *)(a1 + 40), "removeAllIndexes");
}

void __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v13 = v4;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v8 = -[HDStatisticsCollectionQueryServer _queue_accumulateUpdatedStatistics:accumulatedStatistics:sendHandler:]((uint64_t)WeakRetained, v13, *(void **)(a1 + 40), *(void **)(a1 + 72));

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v13, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    }
    v11 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "dateIntervalAtIndex:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v12);

  }
}

uint64_t __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_4;
  v11[3] = &unk_1E6D01C40;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 280);
  v11[1] = 3221225472;
  v11[4] = v4;
  v12 = v5;
  v16 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v15 = v7;
  v17 = v8;
  v9 = objc_msgSend(v6, "activateWithError:cacheHandler:", a2, v11);

  return v9;
}

uint64_t __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_4(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a2;
  v10 = v9;
  if ((a3 & 1) != 0)
    goto LABEL_6;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HDStatisticsCollectionQueryServer _queue_accumulateUpdatedStatistics:accumulatedStatistics:sendHandler:](*(_QWORD *)(a1 + 32), v10, *(void **)(a1 + 40), *(void **)(a1 + 72));
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v10, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      goto LABEL_5;
    }
LABEL_6:
    objc_msgSend(*(id *)(a1 + 56), "dateIntervalAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "invalidateInterval:error:", v13, a5);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);

    goto LABEL_7;
  }
LABEL_5:
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 288);
LABEL_7:

  return 1;
}

void __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_293(uint64_t a1, char a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a3;
    objc_msgSend(v4, "clientProxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client_deliverError:forQuery:", v5, v6);

  }
}

- (id)_newCachingSessionWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HDSampleAggregateCachingSession *v25;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = -[HDSampleAggregateCachingSession initWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:]([HDSampleAggregateCachingSession alloc], "initWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:", v24, v23, v22, v21, a7, v20, v19, v18, v17);

  return v25;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (unint64_t)statisticsOptions
{
  return self->_statisticsOptions;
}

- (id)unitTest_queryServerStatisticsEnumerationHandler
{
  return self->_unitTest_queryServerStatisticsEnumerationHandler;
}

- (void)setUnitTest_queryServerStatisticsEnumerationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (id)unitTest_queryServerUpdateStatisticsHandler
{
  return self->_unitTest_queryServerUpdateStatisticsHandler;
}

- (void)setUnitTest_queryServerUpdateStatisticsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (id)unitTest_queryServerUnableToUpdateStatisticsHandler
{
  return self->_unitTest_queryServerUnableToUpdateStatisticsHandler;
}

- (void)setUnitTest_queryServerUnableToUpdateStatisticsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_queryServerUnableToUpdateStatisticsHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerUpdateStatisticsHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerStatisticsEnumerationHandler, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_cachingSession, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_resultsDateInterval, 0);
  objc_storeStrong((id *)&self->_pendingQuantitiesBySeries, 0);
  objc_storeStrong((id *)&self->_calculator, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_intervalCollection, 0);
}

@end
