@implementation HDValueHistogramCollectionQueryServer

- (HDValueHistogramCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDValueHistogramCollectionQueryServer *v11;
  uint64_t v12;
  HKValueHistogramCollectionQueryServerConfiguration *valueHistogramCollectionQueryServerConfiguration;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDValueHistogramCollectionQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    valueHistogramCollectionQueryServerConfiguration = v11->_valueHistogramCollectionQueryServerConfiguration;
    v11->_valueHistogramCollectionQueryServerConfiguration = (HKValueHistogramCollectionQueryServerConfiguration *)v12;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  HDValueHistogramCollectionCalculator *v8;
  void *v9;
  HDValueHistogramCollectionCalculator *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDValueHistogramCollectionCalculator *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  objc_super v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _BYTE buf[24];
  void *v46;
  HDValueHistogramCollectionCalculator *v47;
  HDValueHistogramCollectionQueryServer *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)HDValueHistogramCollectionQueryServer;
  -[HDQueryServer _queue_start](&v40, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer quantityType](self, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v5, &v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v39;

  if (v6)
  {
    if ((objc_msgSend(v6, "canRead") & 1) != 0)
    {
      v38 = v7;
      if (self)
      {
        -[HKValueHistogramCollectionQueryServerConfiguration quantityRanges](self->_valueHistogramCollectionQueryServerConfiguration, "quantityRanges");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKValueHistogramCollectionQueryServerConfiguration anchorDate](self->_valueHistogramCollectionQueryServerConfiguration, "anchorDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKValueHistogramCollectionQueryServerConfiguration intervalComponents](self->_valueHistogramCollectionQueryServerConfiguration, "intervalComponents");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F60]), "initWithAnchorDate:intervalComponents:", v37, v36);
        v8 = [HDValueHistogramCollectionCalculator alloc];
        -[HDQueryServer quantityType](self, "quantityType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[HDValueHistogramCollectionCalculator initWithQuantityType:quantityRanges:intervalCollection:](v8, "initWithQuantityType:quantityRanges:intervalCollection:", v9, v35, v34);

        -[HDQueryServer filter](self, "filter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryServer profile](self, "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "predicateWithProfile:", v12);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[HDQueryServer objectType](self, "objectType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        HDSampleEntityPredicateForDataType(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v33, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v42 = &v41;
        v43 = 0x2020000000;
        v44 = 0;
        -[HDQueryServer profile](self, "profile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __87__HDValueHistogramCollectionQueryServer__queue_fetchValueHistogramCollectionWithError___block_invoke;
        v46 = &unk_1E6CFB1C0;
        v17 = v10;
        v47 = v17;
        v48 = self;
        v49 = &v41;
        +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:profile:options:error:handler:", v15, v16, 0, &v38, buf);

        if (*((_BYTE *)v42 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Query stopped before completing sample enumeration"));
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
            v38 = objc_retainAutorelease(v18);

          v20 = 0;
        }
        else
        {
          -[HDValueHistogramCollectionCalculator result](v17, "result");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }

        _Block_object_dispose(&v41, 8);
        v30 = v38;
      }
      else
      {
        v20 = 0;
        v30 = v7;
      }
      v31 = v30;

      -[HDQueryServer queryUUID](self, "queryUUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        objc_msgSend(v4, "client_deliverError:forQuery:", v31, v32);
      else
        objc_msgSend(v4, "client_deliverValueHistogramCollection:forQuery:", v20, v32);

      v7 = v31;
    }
    else
    {
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        v24 = v23;
        _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);

      }
      -[HKValueHistogramCollectionQueryServerConfiguration quantityRanges](self->_valueHistogramCollectionQueryServerConfiguration, "quantityRanges");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0CB6D80]);
      -[HKValueHistogramCollectionQueryServerConfiguration anchorDate](self->_valueHistogramCollectionQueryServerConfiguration, "anchorDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKValueHistogramCollectionQueryServerConfiguration intervalComponents](self->_valueHistogramCollectionQueryServerConfiguration, "intervalComponents");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v25, "initWithQuantityRanges:valueHistogramsByDateIntervalIndex:anchorDate:intervalComponents:", v20, MEMORY[0x1E0C9AA70], v26, v27);

      -[HDQueryServer queryUUID](self, "queryUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "client_deliverValueHistogramCollection:forQuery:", v28, v29);

    }
  }
  else
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v20);
  }

}

uint64_t __87__HDValueHistogramCollectionQueryServer__queue_fetchValueHistogramCollectionWithError___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "addSampleValue:startTime:", a4, a2);
  v5 = objc_msgSend(*(id *)(a1 + 40), "_shouldStopProcessingQuery");
  if (v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return v5 ^ 1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueHistogramCollectionQueryServerConfiguration, 0);
}

@end
