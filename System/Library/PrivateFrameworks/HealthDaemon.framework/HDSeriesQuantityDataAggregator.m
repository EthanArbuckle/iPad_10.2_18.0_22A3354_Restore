@implementation HDSeriesQuantityDataAggregator

- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDSeriesQuantityDataAggregator;
  result = -[HDActiveQuantityDataAggregator initForQuantityType:dataCollectionManager:](&v5, sel_initForQuantityType_dataCollectionManager_, a3, a4);
  if (result)
    *((_DWORD *)result + 26) = 0;
  return result;
}

- (uint64_t)_successForPersistenceError:(void *)a3 series:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 3);
    if ((_DWORD)v9)
    {
      objc_msgSend(v8, "UUID");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
      v11 = *(void **)(a1 + 112);
      if (!v11)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v13 = *(void **)(a1 + 112);
        *(_QWORD *)(a1 + 112) = v12;

        v11 = *(void **)(a1 + 112);
      }
      objc_msgSend(v11, "addObject:", v10);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));

    }
    else
    {
      v14 = v7;
      v10 = v14;
      if (v14)
      {
        if (a4)
        {
          v10 = objc_retainAutorelease(v14);
          *a4 = v10;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)requiresNewSeriesForDatum:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 currentSeries:(id)a6 configuration:(id)a7 aggregationInterval:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  char v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  int v46;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v16, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v19 = v18;
    os_unfair_lock_lock(&self->_lock);
    v20 = -[NSMutableSet containsObject:](self->_lock_failedSeriesUUIDs, "containsObject:", v19);

    os_unfair_lock_unlock(&self->_lock);
    if ((v20 & 1) != 0)
      goto LABEL_3;
  }
  else
  {

  }
  if (!v15)
  {
    if (a5 > 288)
      goto LABEL_3;
    goto LABEL_15;
  }
  objc_msgSend(v15, "metadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "metadata");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v22 == (void *)v23)
  {

  }
  else
  {
    v24 = (void *)v23;
    objc_msgSend(v14, "metadata");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
    {

      goto LABEL_3;
    }
    v26 = (void *)v25;
    objc_msgSend(v15, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v27, "isEqual:", v28);

    if (!v46)
    {
LABEL_3:
      v21 = 1;
      goto LABEL_16;
    }
  }
  objc_msgSend(v14, "dateInterval");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "startDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeIntervalSinceReferenceDate");
  v32 = v31;
  objc_msgSend(v15, "dateInterval");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeIntervalSinceReferenceDate");
  v36 = v35;

  v21 = 1;
  if (a5 <= 288 && v32 - v36 <= fmax(a8, 120.0))
  {
LABEL_15:
    objc_msgSend(v14, "dateInterval");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "endDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSinceReferenceDate");
    v40 = v39;
    objc_msgSend(v16, "startDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSinceReferenceDate");
    v43 = v40 - v42;

    objc_msgSend(v17, "maximumSeriesDuration");
    v21 = v43 > v44;
  }
LABEL_16:

  return v21;
}

- (void)addDatum:(id)a3 toAccumulatedData:(id)a4
{
  objc_msgSend(a4, "addObject:", a3);
}

- (id)_codableDatumsFromData:(id)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v2, "quantityType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__HDSeriesQuantityDataAggregator__codableDatumsFromData___block_invoke;
    v8[3] = &unk_1E6CE9610;
    v9 = v5;
    v6 = v5;
    objc_msgSend(v3, "hk_map:", v8);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __57__HDSeriesQuantityDataAggregator__codableDatumsFromData___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB6478];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");
  *(float *)&v7 = v7;
  objc_msgSend(v5, "setDuration:", v7);

  objc_msgSend(v4, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setTimeInterval:");

  objc_msgSend(v4, "quantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setValue:");

  return v5;
}

- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9
{
  _HDSeriesQuantityDataAggregationState *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _HDSeriesQuantityDataAggregationState *v21;
  void *v22;
  HDDataAggregationResult *v23;
  void *v24;
  _HDSeriesQuantityDataAggregationState *v25;
  void *v26;
  _HDSeriesQuantityDataAggregationState *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  unint64_t i;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  char v63;
  void *v64;
  double v65;
  BOOL v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  _HDSeriesQuantityDataAggregationState *v79;
  void *v80;
  id v81;
  id *v82;
  HDDataAggregationResult *v83;
  NSObject *v85;
  objc_class *v86;
  void *v87;
  objc_class *v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  NSObject *v90;
  objc_class *v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void *v93;
  id v95;
  id v96;
  id v97;
  int64_t v98;
  void *v99;
  void *v100;
  _HDSeriesQuantityDataAggregationState *v101;
  void (**v102)(void *, void *);
  void *v103;
  void (**v104)(void);
  _QWORD v105[4];
  id v106;
  HDSeriesQuantityDataAggregator *v107;
  id v108;
  uint64_t *v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  HDSeriesQuantityDataAggregator *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[5];
  id v120;
  id v121;
  _BYTE *v122;
  _QWORD aBlock[4];
  id v124;
  HDSeriesQuantityDataAggregator *v125;
  id v126;
  id v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t *v130;
  _BYTE *v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  uint64_t v149;
  id *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  objc_super v155;
  uint8_t v156[128];
  _BYTE buf[24];
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v15 = (_HDSeriesQuantityDataAggregationState *)a3;
  v16 = a4;
  v17 = a5;
  v18 = v16;
  v19 = v17;
  v20 = a6;
  v99 = v19;
  v100 = v18;
  if (-[HDSeriesQuantityDataAggregator shouldAggregateToSeriesForState:collector:device:requestedAggregationDate:mode:options:](self, "shouldAggregateToSeriesForState:collector:device:requestedAggregationDate:mode:options:", v15, v18, v19, v20, a7, a8))
  {
    v98 = a7;
    v21 = v15;
    if (self)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[HDDataAggregationState openSeries](v21, "openSeries");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          _HKInitializeLogging();
          v26 = (void *)*MEMORY[0x1E0CB52A8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
          {
            v90 = v26;
            v91 = (objc_class *)objc_opt_class();
            NSStringFromClass(v91);
            v92 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2114;
            v158 = v92;
            _os_log_fault_impl(&dword_1B7802000, v90, OS_LOG_TYPE_FAULT, "%{public}@: Saved state has unexpected open series %{public}@ (expected class %{public}@); resetting state.",
              buf,
              0x20u);

          }
          v27 = [_HDSeriesQuantityDataAggregationState alloc];
          -[HDDataAggregationState unaggregatedSensorData](v21, "unaggregatedSensorData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = -[HDDataAggregationState initWithRemainingSensorData:](v27, "initWithRemainingSensorData:", v28);

        }
        else
        {
          v101 = v21;
        }
      }
      else
      {
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
        {
          v85 = v24;
          v86 = (objc_class *)objc_opt_class();
          NSStringFromClass(v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = (objc_class *)objc_opt_class();
          NSStringFromClass(v88);
          v89 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v87;
          *(_WORD *)&buf[22] = 2114;
          v158 = v89;
          _os_log_fault_impl(&dword_1B7802000, v85, OS_LOG_TYPE_FAULT, "%{public}@: Received unexpected state object %{public}@ (expected class %{public}@); resetting state.",
            buf,
            0x20u);

        }
        v25 = [_HDSeriesQuantityDataAggregationState alloc];
        -[HDDataAggregationState unaggregatedSensorData](v21, "unaggregatedSensorData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = -[HDDataAggregationState initWithRemainingSensorData:](v25, "initWithRemainingSensorData:", v22);
      }

    }
    else
    {
      v101 = 0;
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v158 = __Block_byref_object_copy__10;
    v159 = __Block_byref_object_dispose__10;
    -[HDDataAggregationState openSeries](v101, "openSeries");
    v160 = (id)objc_claimAutoreleasedReturnValue();
    v149 = 0;
    v150 = (id *)&v149;
    v151 = 0x3032000000;
    v152 = __Block_byref_object_copy__10;
    v153 = __Block_byref_object_dispose__10;
    -[_HDSeriesQuantityDataAggregationState lastDatum](v101, "lastDatum");
    v154 = (id)objc_claimAutoreleasedReturnValue();
    v143 = 0;
    v144 = &v143;
    v145 = 0x3032000000;
    v146 = __Block_byref_object_copy__10;
    v147 = __Block_byref_object_dispose__10;
    -[_HDSeriesQuantityDataAggregationState lastDatum](v101, "lastDatum");
    v148 = (id)objc_claimAutoreleasedReturnValue();
    v139 = 0;
    v140 = &v139;
    v141 = 0x2020000000;
    v142 = 0;
    v142 = -[_HDSeriesQuantityDataAggregationState length](v101, "length");
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSeriesQuantityDataAggregator.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentSeries == nil || [currentSeries isKindOfClass:[HKQuantitySample class]]"));

      }
    }
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HDActiveDataAggregator aggregationIntervalForCollector:](self, "aggregationIntervalForCollector:", v100);
    v31 = v30;
    -[HDDataAggregator configuration](self, "configuration");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = 0;
    v134 = &v133;
    v135 = 0x3032000000;
    v136 = __Block_byref_object_copy__10;
    v137 = __Block_byref_object_dispose__10;
    v138 = 0;
    -[HDDataAggregator dataCollectionManager](self, "dataCollectionManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "profile");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dataManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "quantitySeriesManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke;
    aBlock[3] = &unk_1E6CE9660;
    v96 = v36;
    v124 = v96;
    v125 = self;
    v128 = &v133;
    v129 = &v139;
    v130 = &v143;
    v131 = buf;
    v132 = &v149;
    v37 = v29;
    v126 = v37;
    v95 = v35;
    v127 = v95;
    v104 = (void (**)(void))_Block_copy(aBlock);
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_200;
    v119[3] = &unk_1E6CE96B0;
    v119[4] = self;
    v120 = v19;
    v122 = buf;
    v97 = v37;
    v121 = v97;
    v102 = (void (**)(void *, void *))_Block_copy(v119);
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    -[HDDataAggregationState unaggregatedSensorData](v101, "unaggregatedSensorData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v115, v156, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v116;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v116 != v40)
            objc_enumerationMutation(v38);
          v42 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v41);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSeriesQuantityDataAggregator.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[datum isKindOfClass:[HDQuantityDatum class]]"));

          }
          v43 = a8;
          v44 = v20;
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            v45 = v150[5];
            v46 = v140[3];
            v47 = objc_msgSend((id)v134[5], "count");
            if (-[HDSeriesQuantityDataAggregator requiresNewSeriesForDatum:lastDatum:seriesLength:currentSeries:configuration:aggregationInterval:](self, "requiresNewSeriesForDatum:lastDatum:seriesLength:currentSeries:configuration:aggregationInterval:", v42, v45, v47 + v46, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v103, v31))
            {
              v104[2]();
            }
          }
          v20 = v44;
          a8 = v43;
          if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
            v102[2](v102, v42);
          v48 = v134[5];
          if (!v48)
          {
            v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v50 = (void *)v134[5];
            v134[5] = (uint64_t)v49;

            v48 = v134[5];
          }
          -[HDSeriesQuantityDataAggregator addDatum:toAccumulatedData:](self, "addDatum:toAccumulatedData:", v42, v48);
          objc_storeStrong(v150 + 5, v42);
          v51 = v140[3];
          if (objc_msgSend((id)v134[5], "count") + v51 == 289)
            v104[2]();
          ++v41;
        }
        while (v39 != v41);
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v115, v156, 16);
      }
      while (v39);
    }

    if (objc_msgSend((id)v134[5], "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "collectionLatency");
      v55 = v54;
      for (i = 0; i < objc_msgSend((id)v134[5], "count"); ++i)
      {
        objc_msgSend((id)v134[5], "objectAtIndexedSubscript:", i);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "dateInterval");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v58;
        if (!v20)
          goto LABEL_44;
        objc_msgSend(v58, "endDate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "hk_isBeforeOrEqualToDate:", v20);

        if ((v61 & 1) != 0
          || !v98
          && (objc_msgSend(v59, "startDate"),
              v62 = (void *)objc_claimAutoreleasedReturnValue(),
              v63 = objc_msgSend(v62, "hk_isBeforeOrEqualToDate:", v20),
              v62,
              (v63 & 1) != 0))
        {

        }
        else
        {
LABEL_44:
          objc_msgSend(v59, "endDate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "timeIntervalSinceDate:", v64);
          v66 = v65 < v55;

          if (v66)
            break;
        }
      }
      if (i)
      {
        objc_msgSend((id)v134[5], "subarrayWithRange:", 0, i);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "addObjectsFromArray:", v67);
        objc_msgSend(v67, "lastObject");
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v144[5];
        v144[5] = v68;

        -[HDSeriesQuantityDataAggregator _codableDatumsFromData:](self, v67);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v134[5], "removeObjectsInRange:", 0, i);
        v140[3] += i;
        v71 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (!v71)
        {
          objc_msgSend(v67, "firstObject");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v102[2](v102, v72);

          v71 = *(void **)(*(_QWORD *)&buf[8] + 40);
        }
        v73 = v71;
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_3;
        v110[3] = &unk_1E6CE96D8;
        v111 = v95;
        v74 = v70;
        v112 = v74;
        v75 = v73;
        v113 = v75;
        v114 = self;
        v76 = (void *)objc_msgSend(v110, "copy");
        v77 = _Block_copy(v76);
        objc_msgSend(v97, "addObject:", v77);

      }
    }
    if ((a8 & 2) != 0)
      v104[2]();
    v78 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (v78
      && -[HDSeriesQuantityDataAggregator shouldFreezeCurrentSeries:lastDatum:seriesLength:configuration:aggregationInterval:](self, "shouldFreezeCurrentSeries:lastDatum:seriesLength:configuration:aggregationInterval:", v78, v150[5], v140[3], v103, v31))
    {
      v104[2]();
    }
    v79 = [_HDSeriesQuantityDataAggregationState alloc];
    v80 = (void *)v134[5];
    v81 = v80;
    if (!v80)
      v81 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v82 = -[_HDSeriesQuantityDataAggregationState initWithRemainingSensorData:currentSeries:lastDatum:length:](v79, (uint64_t)v81, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), (void *)v144[5], (void *)v140[3]);
    if (!v80)

    if (objc_msgSend(v97, "count"))
    {
      v83 = [HDDataAggregationResult alloc];
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_4;
      v105[3] = &unk_1E6CE9700;
      v106 = v97;
      v107 = self;
      v109 = &v143;
      v108 = v100;
      v23 = -[HDDataAggregationResult initWithResultingAggregationState:consumedSensorData:persistenceHandler:](v83, "initWithResultingAggregationState:consumedSensorData:persistenceHandler:", v82, v96, v105);

    }
    else
    {
      v23 = -[HDDataAggregationResult initWithResultingAggregationState:consumedSensorData:persistenceHandler:]([HDDataAggregationResult alloc], "initWithResultingAggregationState:consumedSensorData:persistenceHandler:", v82, 0, 0);
    }

    _Block_object_dispose(&v133, 8);
    _Block_object_dispose(&v139, 8);
    _Block_object_dispose(&v143, 8);

    _Block_object_dispose(&v149, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v155.receiver = self;
    v155.super_class = (Class)HDSeriesQuantityDataAggregator;
    v101 = v15;
    -[HDActiveQuantityDataAggregator aggregateForState:collector:device:requestedAggregationDate:mode:options:error:](&v155, sel_aggregateForState_collector_device_requestedAggregationDate_mode_options_error_, v15, v18, v19, v20, a7, a8, a9);
    v23 = (HDDataAggregationResult *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

void __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, _QWORD *);
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  -[HDSeriesQuantityDataAggregator _codableDatumsFromData:](*(id *)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v4 = objc_msgSend(v2, "count");
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  if (v8)
  {
    v16 = v4 + v3;
    v17 = *(void **)(a1 + 48);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2;
    v25 = &unk_1E6CE9638;
    v26 = v2;
    v27 = *(id *)(a1 + 56);
    v18 = v8;
    v19 = *(_QWORD *)(a1 + 40);
    v28 = v18;
    v29 = v19;
    v30 = v9;
    v31 = v16;
    v20 = (void *)objc_msgSend(&v22, "copy");
    v21 = _Block_copy(v20);
    objc_msgSend(v17, "addObject:", v21, v22, v23, v24, v25);

  }
}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  os_log_t *v22;
  id v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  id v27;
  id v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  _QWORD *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  _BYTE buf[12];
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v81 = 0;
    v9 = objc_msgSend(v6, "insertValues:series:error:", v7, v8, &v81);
    v10 = v81;
    v11 = v10;
    if (!v9)
    {
      v50 = -[HDSeriesQuantityDataAggregator _successForPersistenceError:series:error:](*(_QWORD *)(a1 + 56), v10, *(void **)(a1 + 48), a3);
      goto LABEL_33;
    }

  }
  v78 = a3;
  v12 = *(void **)(a1 + 64);
  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "dataCollectionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  v79 = v12;
  v17 = v5;
  v18 = v15;
  v77 = objc_opt_self();
  objc_msgSend(v18, "daemon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "behavior");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v20, "isAppleInternalInstall");
  v21 = _HDIsUnitTesting;

  v22 = (os_log_t *)MEMORY[0x1E0CB52A8];
  if ((v12 & 1) != 0 || v21)
  {
    objc_msgSend(v16, "sampleType");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "code") == 173)
    {
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v16, "sampleType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "code");

    v26 = v25 == 172;
    v22 = (os_log_t *)MEMORY[0x1E0CB52A8];
    if (!v26)
    {
      v82 = 0;
      v27 = v16;
      v73 = v17;
      v75 = v18;
      v28 = v79;
      objc_opt_self();
      v29 = (void *)MEMORY[0x1E0C99D68];
      v76 = v27;
      objc_msgSend(v27, "_startTimestamp");
      objc_msgSend(v29, "dateWithTimeIntervalSinceReferenceDate:", v30 + 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dateInterval");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dateByAddingTimeInterval:", -1.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v75;
      v36 = 0;
      if ((objc_msgSend(v31, "hk_isAfterOrEqualToDate:", v34) & 1) == 0)
      {
        v71 = v31;
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v31, v34);
        objc_msgSend(v76, "quantityType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)v37;
        v39 = (void *)v37;
        v35 = v75;
        HDSampleEntityPredicateForDateInterval(v39, v38);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v75, "dataProvenanceManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "provenanceEntityForProvenance:error:", v73, &v82);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = v41;
        if (v41)
        {
          v69 = v34;
          v43 = (void *)MEMORY[0x1E0D29838];
          v68 = v41;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v41, "persistentID"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "predicateWithProperty:equalToValue:", CFSTR("provenance"), v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v72, v45);
          v46 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "quantityType");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          v67 = (void *)v46;
          +[HDSampleEntity anySampleOfType:profile:encodingOptions:predicate:error:](HDSampleEntity, "anySampleOfType:profile:encodingOptions:predicate:error:", v47, v75, 0, v46, buf);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = *(id *)buf;

          if (v36)
          {
            v49 = v36;
          }
          else if (v48)
          {
            v82 = objc_retainAutorelease(v48);
          }

          v35 = v75;
          v31 = v71;
          v42 = v68;
          v34 = v69;
        }
        else
        {
          v36 = 0;
          v31 = v71;
        }

      }
      v23 = v82;
      if (v36)
      {
        v74 = v17;
        _HKInitializeLogging();
        v51 = *MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v77;
          v84 = 2114;
          v85 = v76;
          v86 = 2114;
          v87 = v36;
          _os_log_impl(&dword_1B7802000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: new series %{public}@ overlaps with %{public}@", buf, 0x20u);
        }
        objc_msgSend(v75, "daemon");
        v52 = v36;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "autoBugCaptureReporter");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "quantityType");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "reportDataCollectionSeriesProblem:quantityType:", CFSTR("overlap"), v55);

        v36 = v52;
        v17 = v74;
      }
      if (v23)
      {
        _HKInitializeLogging();
        v56 = *MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v77;
          v84 = 2114;
          v85 = v76;
          v86 = 2114;
          v87 = v23;
          _os_log_impl(&dword_1B7802000, v56, OS_LOG_TYPE_INFO, "%{public}@: error checking for overlap with %{public}@: %{public}@", buf, 0x20u);
        }
      }

      v22 = (os_log_t *)MEMORY[0x1E0CB52A8];
      goto LABEL_26;
    }
  }
LABEL_27:

  _HKInitializeLogging();
  v57 = *v22;
  if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
  {
    v59 = *(void **)(a1 + 48);
    v58 = *(_QWORD *)(a1 + 56);
    v61 = *(_QWORD *)(a1 + 64);
    v60 = *(void **)(a1 + 72);
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v58;
    v84 = 2112;
    v85 = v59;
    v86 = 2048;
    v87 = v60;
    v88 = 2112;
    v89 = v61;
    _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: Freezing series %@, length %ld, with final datum %@", buf, 0x2Au);
  }
  v62 = *(void **)(a1 + 40);
  v63 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 64), "metadata");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v62, "freezeSeries:metadata:endDate:error:", v63, v64, 0, &v80);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v80;

  if (v65)
    v50 = 1;
  else
    v50 = -[HDSeriesQuantityDataAggregator _successForPersistenceError:series:error:](*(_QWORD *)(a1 + 56), v11, *(void **)(a1 + 48), v78);

LABEL_33:
  return v50;
}

void __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_200(uint64_t a1, void *a2)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  uint64_t v20;
  id v21;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB6A40];
    v6 = *(id *)(a1 + 40);
    v7 = a2;
    objc_msgSend(v3, "quantityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "quantity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_unfrozenQuantitySampleWithQuantityType:quantity:startDate:device:", v8, v9, v11, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  v12 = *(void **)(a1 + 48);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2_201;
  v19 = &unk_1E6CE9688;
  v20 = *(_QWORD *)(a1 + 32);
  v21 = v3;
  v13 = v3;
  v14 = (void *)objc_msgSend(&v16, "copy");
  v15 = _Block_copy(v14);
  objc_msgSend(v12, "addObject:", v15, v16, v17, v18, v19, v20);

}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2_201(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "dataCollectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v10, v6, 1, a3, CFAbsoluteTimeGetCurrent());

  return v11;
}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_3(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  id v12;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v12 = 0;
  v8 = objc_msgSend(v5, "insertValues:series:error:", v6, v7, &v12);
  v9 = v12;
  if ((v8 & 1) != 0)
    v10 = 1;
  else
    v10 = -[HDSeriesQuantityDataAggregator _successForPersistenceError:series:error:](a1[7], v9, (void *)a1[6], a3);

  return v10;
}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = (os_log_t *)MEMORY[0x1E0CB52A8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = (*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10) + 16))();
        v12 = 0;
        if ((v11 & 1) == 0)
        {
          _HKInitializeLogging();
          v13 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            v14 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v24 = v14;
            v25 = 2114;
            v26 = v12;
            _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring failed persistence: %{public}@", buf, 0x16u);
          }
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v15)
    v16 = objc_msgSend(*(id *)(a1 + 40), "didPersistObjects:lastDatum:collector:error:", 0, v15, *(_QWORD *)(a1 + 48), a3);
  else
    v16 = 1;

  return v16;
}

- (BOOL)shouldAggregateToSeriesForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8
{
  return 1;
}

- (id)initialAggregationState
{
  _HDSeriesQuantityDataAggregationState *v2;
  id v3;
  id *v4;

  v2 = [_HDSeriesQuantityDataAggregationState alloc];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[_HDSeriesQuantityDataAggregationState initWithRemainingSensorData:currentSeries:lastDatum:length:](v2, (uint64_t)v3, 0, 0, 0);

  return v4;
}

- (BOOL)shouldFreezeCurrentSeries:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 configuration:(id)a6 aggregationInterval:(double)a7
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_failedSeriesUUIDs, 0);
}

@end
