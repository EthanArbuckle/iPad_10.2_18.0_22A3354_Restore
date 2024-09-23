@implementation HDQuantitySeriesSampleQueryServer

- (HDQuantitySeriesSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDQuantitySeriesSampleQueryServer *v11;
  uint64_t v12;
  HKQuantitySample *sample;
  uint64_t v14;
  NSDate *maximumDeliveredStartDate;
  uint64_t v16;
  NSUUID *latestDeliveredUUID;
  uint64_t v18;
  NSDate *latestDeliveredSampleStartDate;
  objc_super v21;

  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDQuantitySeriesSampleQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v21, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "quantitySample");
    v12 = objc_claimAutoreleasedReturnValue();
    sample = v11->_sample;
    v11->_sample = (HKQuantitySample *)v12;

    v11->_lastDatumIndex = objc_msgSend(v10, "seriesAnchor");
    v11->_mode = objc_msgSend(v10, "mode");
    v11->_options = objc_msgSend(v10, "options");
    objc_msgSend(v10, "maximumStartDate");
    v14 = objc_claimAutoreleasedReturnValue();
    maximumDeliveredStartDate = v11->_maximumDeliveredStartDate;
    v11->_maximumDeliveredStartDate = (NSDate *)v14;

    objc_msgSend(v10, "latestUUID");
    v16 = objc_claimAutoreleasedReturnValue();
    latestDeliveredUUID = v11->_latestDeliveredUUID;
    v11->_latestDeliveredUUID = (NSUUID *)v16;

    objc_msgSend(v10, "latestSampleStartDate");
    v18 = objc_claimAutoreleasedReturnValue();
    latestDeliveredSampleStartDate = v11->_latestDeliveredSampleStartDate;
    v11->_latestDeliveredSampleStartDate = (NSDate *)v18;

    v11->_batchThreshold = 400;
  }

  return v11;
}

- (void)unitTest_setBatchThreshold:(int64_t)a3
{
  self->_batchThreshold = a3;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  id v5;
  int64_t mode;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
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
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  int64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  unint64_t options;
  id v41;
  id v42;
  void *v43;
  char v44;
  unint64_t v45;
  uint64_t *v46;
  void **v47;
  id v48;
  id v49;
  BOOL v50;
  BOOL v51;
  void *v52;
  double v53;
  char v54;
  id v55;
  uint64_t *v56;
  void *v57;
  void **v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  objc_super v63;
  id v64;
  id v65;
  uint64_t v66;
  double *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  HDQuantitySeriesSampleQueryServer *v79;
  uint64_t *v80;
  uint64_t *v81;
  void **v82;
  void **v83;
  uint64_t *v84;
  char v85;
  char v86;
  void *v87;
  void **v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v63.receiver = self;
  v63.super_class = (Class)HDQuantitySeriesSampleQueryServer;
  -[HDQueryServer _queue_start](&v63, sel__queue_start);
  -[HDQueryServer quantityType](self, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v3, &v62);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v62;

  if (!v4)
  {
    -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v5);
    goto LABEL_43;
  }
  if ((objc_msgSend(v4, "canRead") & 1) != 0)
  {
    mode = self->_mode;
    if (mode != 1)
    {
      if (!mode)
      {
        if (-[HKQuantitySample count](self->_sample, "count") == 1)
        {
          v7 = objc_alloc_init(MEMORY[0x1E0CB6470]);
          v8 = objc_alloc_init(MEMORY[0x1E0CB6478]);
          -[HKQuantitySample quantity](self->_sample, "quantity");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKQuantitySample quantity](self->_sample, "quantity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_unit");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "doubleValueForUnit:", v11);
          objc_msgSend(v8, "setValue:");

          -[HKQuantitySample startDate](self->_sample, "startDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceReferenceDate");
          objc_msgSend(v8, "setTimeInterval:");

          objc_msgSend(v7, "addValues:", v8);
          -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:]((const void **)&self->super.super.isa, v7, self->_lastDatumIndex, 1);

        }
        else
        {
          v70 = 0;
          v71 = &v70;
          v72 = 0x2020000000;
          v73 = 1;
          v66 = 0;
          v67 = (double *)&v66;
          v68 = 0x2020000000;
          v69 = 0;
          v87 = 0;
          v88 = &v87;
          v89 = 0x3032000000;
          v90 = __Block_byref_object_copy__141;
          v91 = __Block_byref_object_dispose__141;
          v92 = objc_alloc_init(MEMORY[0x1E0CB6470]);
          -[HKQuantitySample UUID](self->_sample, "UUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDQueryServer profile](self, "profile");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = 0;
          v75 = (void *)MEMORY[0x1E0C809B0];
          v76 = 3221225472;
          v77 = __65__HDQuantitySeriesSampleQueryServer__queue_startSingleSeriesMode__block_invoke;
          v78 = &unk_1E6D00218;
          v79 = self;
          v80 = &v70;
          v81 = &v66;
          v82 = &v87;
          v29 = +[HDQuantitySampleSeriesEntity enumerateDataWithIdentifier:profile:error:handler:](HDQuantitySampleSeriesEntity, "enumerateDataWithIdentifier:profile:error:handler:", v27, v28, &v74, &v75);
          v7 = v74;

          if (v29)
          {
            if (*((_BYTE *)v71 + 24))
            {
              v30 = *((_QWORD *)v67 + 3);
              self->_lastDatumIndex = v30;
              -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:]((const void **)&self->super.super.isa, v88[5], v30, 1);
            }
          }
          else
          {
            -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v7);
          }
          _Block_object_dispose(&v87, 8);

          _Block_object_dispose(&v66, 8);
          _Block_object_dispose(&v70, 8);
        }
        goto LABEL_19;
      }
      goto LABEL_43;
    }
    v74 = 0;
    v14 = (void *)MEMORY[0x1E0C99DE8];
    -[HDQueryServer quantityType](self, "quantityType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSampleEntityPredicateForDataType(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDQueryServer filter](self, "filter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer profile](self, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithProfile:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v17, "addObject:", v20);
    -[HDQueryServer client](self, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "authorizationOracle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer objectType](self, "objectType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "additionalAuthorizationPredicateForObjectType:error:", v23, &v74);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v74, 3, CFSTR("Unable to determine authorization status."));
      v60 = 0;
LABEL_28:

      v39 = v74;
      if (v60)
      {
        v70 = 0;
        v71 = &v70;
        v72 = 0x2020000000;
        v73 = 1;
        options = self->_options;
        v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v59 = v39;
        v42 = objc_alloc_init(MEMORY[0x1E0CB6488]);
        v87 = 0;
        v88 = &v87;
        v89 = 0x3032000000;
        v90 = __Block_byref_object_copy__141;
        v91 = __Block_byref_object_dispose__141;
        v92 = 0;
        v66 = 0;
        v67 = (double *)&v66;
        v68 = 0x2020000000;
        v69 = 0;
        -[HDQueryServer profile](self, "profile");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = options & 1;
        v45 = options & 2;
        v65 = v59;
        v75 = (void *)MEMORY[0x1E0C809B0];
        v76 = 3221225472;
        v77 = __64__HDQuantitySeriesSampleQueryServer__queue_startEnumerationMode__block_invoke;
        v78 = &unk_1E6D00240;
        v79 = self;
        v82 = (void **)&v70;
        v85 = v45 >> 1;
        v46 = (uint64_t *)v42;
        v80 = v46;
        v83 = &v87;
        v84 = &v66;
        v56 = (uint64_t *)v41;
        v81 = v56;
        v86 = v44;
        v47 = &v75;
        v48 = v43;
        v49 = v60;
        objc_opt_self();
        if (v45)
          v50 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesBySeriesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesBySeriesForPredicate:profile:options:error:handler:", v49, v48, 3, &v65, v47, v56);
        else
          v50 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:profile:options:error:handler:", v49, v48, 0, &v65, v47, v56);
        v51 = v50;

        v39 = v65;
        if (!v51)
          -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v39);
        if (*((_BYTE *)v71 + 24))
        {
          v52 = v88[5];
          v53 = v67[3];
          v64 = v39;
          v54 = -[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:latestUUID:latestSampleStartTime:sampleIDsToLookup:isFinal:error:]((uint64_t)self, v46, v52, v57, 1u, v53);
          v55 = v64;

          v39 = v55;
          if ((v54 & 1) == 0)
            -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v55);
        }

        _Block_object_dispose(&v66, 8);
        _Block_object_dispose(&v87, 8);

        _Block_object_dispose(&v70, 8);
      }
      else
      {
        -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v39);
      }

      goto LABEL_43;
    }
    objc_msgSend(v17, "addObject:", v24);
    v25 = 0x1E0D29000;
    if ((self->_options & 2) != 0)
    {
      if (self->_latestDeliveredSampleStartDate)
      {
        HDSampleEntityPredicateForStartDate(1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0D29838];
        _HDSQLiteValueForUUID();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "predicateWithProperty:greaterThanOrEqualToValue:", CFSTR("uuid"), v32);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (void *)MEMORY[0x1E0D29840];
        v75 = v26;
        v76 = (uint64_t)v61;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "predicateMatchingAllPredicates:", v34);
        v58 = (void **)objc_claimAutoreleasedReturnValue();

        HDSampleEntityPredicateForStartDate(5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0D29840];
        v87 = v35;
        v88 = v58;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "predicateMatchingAnyPredicates:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObject:", v38);
        goto LABEL_26;
      }
    }
    else if (self->_maximumDeliveredStartDate)
    {
      HDSampleEntityPredicateForEndDate(6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v26);
LABEL_26:

      v25 = 0x1E0D29000uLL;
    }
    objc_msgSend(*(id *)(v25 + 2112), "predicateMatchingAllPredicates:", v17);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (self)
  {
    v13 = self->_mode;
    if (v13 == 1)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB6488]);
      -[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:isFinal:]((const void **)&self->super.super.isa, v7, 1);
    }
    else
    {
      if (v13)
        goto LABEL_43;
      v7 = objc_alloc_init(MEMORY[0x1E0CB6470]);
      -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:]((const void **)&self->super.super.isa, v7, self->_lastDatumIndex, 1);
    }
LABEL_19:

  }
LABEL_43:

}

- (void)_deliverError:(void *)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    -[HDQuantitySeriesSampleQueryServer _clientProxy](a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "client_deliverError:forQuery:", v3, v4);

  }
}

- (id)_clientProxy
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__HDQuantitySeriesSampleQueryServer__clientProxy__block_invoke;
  v6[3] = &unk_1E6CE8030;
  v6[4] = a1;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_deliverQuantitySeries:(uint64_t)a3 seriesAnchor:(uint64_t)a4 isFinal:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  if (a1)
  {
    v12 = v7;
    -[HDQuantitySeriesSampleQueryServer _clientProxy](a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _Block_copy(a1[33]);
    v11 = v10;
    if (v10)
      (*((void (**)(void *, const void **))v10 + 2))(v10, a1);
    objc_msgSend(v8, "client_deliverQuantitySeries:seriesAnchor:isFinal:query:", v12, a3, a4, v9);

    v7 = v12;
  }

}

- (void)_deliverEnumerationResults:(uint64_t)a3 isFinal:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  -[HDQuantitySeriesSampleQueryServer _clientProxy](a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _Block_copy(a1[33]);
  v8 = v7;
  if (v7)
    (*((void (**)(void *, const void **))v7 + 2))(v7, a1);
  objc_msgSend(v5, "client_deliverEnumerationResults:isFinal:query:", v9, a3, v6);

}

void __49__HDQuantitySeriesSampleQueryServer__clientProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error during XPC call to client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __65__HDQuantitySeriesSampleQueryServer__queue_startSingleSeriesMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    v4 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "values");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);

      if (v6 >= v7)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:](*(const void ***)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), 0);
        v8 = objc_alloc_init(MEMORY[0x1E0CB6470]);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addValues:", v3);
    }
    v4 = 1;
  }

  return v4;
}

uint64_t __64__HDQuantitySeriesSampleQueryServer__queue_startEnumerationMode__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id obj;

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    v23 = (void *)MEMORY[0x1E0CB6FA0];
    objc_msgSend(*(id *)(a1 + 32), "filter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = objc_msgSend(v23, "filter:acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", v24, a6, a7, a5);

    if (!(_DWORD)v23)
      return 1;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a9);
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 240);
    v28 = *(void **)(v26 + 248);
    v29 = *(unsigned __int8 *)(a1 + 80);
    obj = v25;
    v30 = v25;
    v31 = v27;
    v32 = v28;
    objc_opt_self();
    if (v31)
    {
      objc_msgSend(v31, "timeIntervalSinceReferenceDate");
      v34 = v33;
      if (v29)
      {
LABEL_8:
        if (v34 >= a6 && (objc_msgSend(v30, "isEqual:", v32) & 1) != 0)
        {
LABEL_25:

          v44 = v30;
          goto LABEL_26;
        }
LABEL_17:

        objc_msgSend(*(id *)(a1 + 40), "results");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);

        if (v38 >= v39)
        {
          v21 = 0;
          if (!-[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:latestUUID:latestSampleStartTime:sampleIDsToLookup:isFinal:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(void **)(a1 + 48), 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)))
          {
LABEL_28:

            return v21;
          }
          objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
          objc_msgSend(*(id *)(a1 + 40), "results");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "removeAllObjects");

          v41 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v42 = *(void **)(v41 + 40);
          *(_QWORD *)(v41 + 40) = 0;

        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), obj);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
        if (*(_BYTE *)(a1 + 81))
          v43 = v30;
        else
          v43 = 0;
        objc_msgSend(MEMORY[0x1E0CB6480], "resultWithID:UUID:value:count:startTime:endTime:seriesIndex:", a2, v43, a11, a12, a5, a6, a7);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addResults:", v44);
        if (!*(_BYTE *)(a1 + 81))
        {
LABEL_27:

          v21 = 1;
          goto LABEL_28;
        }
        v45 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v31);
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceReferenceDate");
      v34 = v36;

      if (v29)
        goto LABEL_8;
    }
    if (v34 > a6 || v32 && v34 == a6 && objc_msgSend(v30, "hk_compare:", v32) != 1)
      goto LABEL_25;
    goto LABEL_17;
  }
  v21 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  return v21;
}

- (uint64_t)_deliverEnumerationResults:(uint64_t)a1 latestUUID:(void *)a2 latestSampleStartTime:(void *)a3 sampleIDsToLookup:(void *)a4 isFinal:(unsigned int)a5 error:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id v27;
  id v28;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  if (!a1)
    goto LABEL_5;
  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v10, "results");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startTime");
  objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(a1 + 240);
  *(_QWORD *)(a1 + 240) = v16;

  objc_storeStrong((id *)(a1 + 248), a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a6);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(void **)(a1 + 256);
  *(_QWORD *)(a1 + 256) = v18;

  objc_msgSend(v11, "hk_dataForUUIDBytes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "results");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUuid:", v20);

  objc_msgSend(v10, "setLatestSampleStartTime:", a6);
  if (!objc_msgSend(v12, "count")
    || (v27 = v12,
        v28 = v10,
        v23 = HKWithAutoreleasePool(),
        v28,
        v27,
        v23))
  {
    -[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:isFinal:]((const void **)a1, v10, a5);
    v24 = 1;
  }
  else
  {
LABEL_5:
    v24 = 0;
  }

  return v24;
}

uint64_t __129__HDQuantitySeriesSampleQueryServer__deliverEnumerationResults_latestUUID_latestSampleStartTime_sampleIDsToLookup_isFinal_error___block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1[4], "newDataEntityEnumerator");
  objc_msgSend(a1[5], "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForRowIDs((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __129__HDQuantitySeriesSampleQueryServer__deliverEnumerationResults_latestUUID_latestSampleStartTime_sampleIDsToLookup_isFinal_error___block_invoke_2;
  v27[3] = &unk_1E6CF89B8;
  v22 = v7;
  v28 = v22;
  if (objc_msgSend(v4, "enumerateWithError:handler:", a2, v27))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(a1[6], "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v10)
    {
      v11 = v10;
      v21 = v4;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "persistentID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
          {
            objc_msgSend(v8, "addObject:", v15);
            objc_msgSend(v22, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, a2);
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {

              v19 = 0;
              goto LABEL_15;
            }
            v18 = (void *)v17;
            objc_msgSend(v14, "setQuantitySample:", v17);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v11)
          continue;
        break;
      }
      v19 = 1;
LABEL_15:
      v4 = v21;
    }
    else
    {
      v19 = 1;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __129__HDQuantitySeriesSampleQueryServer__deliverEnumerationResults_latestUUID_latestSampleStartTime_sampleIDsToLookup_isFinal_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  return 1;
}

- (id)unitTest_batchWillDeliver
{
  return self->_unitTest_batchWillDeliver;
}

- (void)setUnitTest_batchWillDeliver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_batchWillDeliver, 0);
  objc_storeStrong((id *)&self->_latestDeliveredSampleStartDate, 0);
  objc_storeStrong((id *)&self->_latestDeliveredUUID, 0);
  objc_storeStrong((id *)&self->_maximumDeliveredStartDate, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
