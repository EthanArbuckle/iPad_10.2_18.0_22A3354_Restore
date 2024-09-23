@implementation HDQuantitySampleSeriesEntityEncoder

uint64_t __78___HDQuantitySampleSeriesEntityEncoder_addSeriesDataForHFDKey_toSample_error___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  void *v7;
  HDCodableQuantitySeriesDatum *v8;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = *(void **)(a1 + 32);
  v8 = objc_alloc_init(HDCodableQuantitySeriesDatum);
  -[HDCodableQuantitySeriesDatum setValue:](v8, "setValue:", a3);
  if (a4 != -1.0)
  {
    -[HDCodableQuantitySeriesDatum setStartDate:](v8, "setStartDate:", a2);
    a2 = a2 + a4;
  }
  -[HDCodableQuantitySeriesDatum setEndDate:](v8, "setEndDate:", a2);
  objc_msgSend(v7, "addQuantitySeriesData:", v8);

  return 1;
}

uint64_t __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCount:", a2);
}

uint64_t __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  HDCodableQuantitySeriesDatum *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 32 > *(_QWORD *)(a1 + 88))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFinal:", 0);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (!*(_BYTE *)(v8 + 24))
    {
      *(_BYTE *)(v8 + 24) = 1;
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v10 = *(_QWORD *)(a1 + 88);
      v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      _HKInitializeLogging();
      v12 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "sample");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueInCanonicalUnit");
        v15 = v14;
        v16 = objc_msgSend(v11, "count");
        v17 = objc_msgSend(v11, "frozen");
        v18 = objc_msgSend(v11, "final");
        objc_msgSend(v11, "quantitySeriesDatas");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v41 = v13;
        v42 = 2048;
        v43 = v15;
        v44 = 2048;
        v45 = v16;
        v46 = 1024;
        v47 = v17;
        v48 = 1024;
        v49 = v18;
        v50 = 2048;
        v51 = objc_msgSend(v19, "count");
        v52 = 2048;
        v53 = v9 + 32;
        v54 = 2048;
        v55 = v10;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Non-final quantity sample generated %{public}@, value=%f, count=%lld, frozen=%{BOOL}d, final=%{BOOL}d, datumsCount=%lu, estimatedSize=%ld, maxSize=%ld", buf, 0x4Au);

      }
      v20 = (void *)MEMORY[0x1E0CB6A70];
      objc_msgSend(v11, "sample");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataTypeWithCode:", objc_msgSend(v21, "dataType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "dataObjectClass");
      v24 = objc_msgSend(v11, "count");
      objc_msgSend(v11, "quantitySeriesDatas");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDAutoBugCaptureReporter reportNotFinalSeriesSampleWithClass:count:datumCount:reason:](HDAutoBugCaptureReporter, "reportNotFinalSeriesSampleWithClass:count:datumCount:reason:", v23, v24, objc_msgSend(v25, "count"), CFSTR("generate"));

    }
    v26 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v27 = 0;
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = 0;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (v26 == 1)
      goto LABEL_11;
    if (v26 == 2)
    {
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v33 = *(void **)(v30 + 40);
      v32 = (id *)(v30 + 40);
      v31 = v33;
      if (v27)
        v31 = objc_retainAutorelease(v27);
      objc_storeStrong(v32, v31);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
LABEL_11:

      return 0;
    }

  }
  v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v35)
  {
    v36 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 96);
    v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  v39 = objc_alloc_init(HDCodableQuantitySeriesDatum);
  -[HDCodableQuantitySeriesDatum setValue:](v39, "setValue:", a3);
  if (a4 != -1.0)
  {
    -[HDCodableQuantitySeriesDatum setStartDate:](v39, "setStartDate:", a2);
    a2 = a2 + a4;
  }
  -[HDCodableQuantitySeriesDatum setEndDate:](v39, "setEndDate:", a2);
  objc_msgSend(v35, "addQuantitySeriesData:", v39);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += 32;
  return 1;
}

@end
