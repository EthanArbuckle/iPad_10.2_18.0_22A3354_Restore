@implementation HDQuantitySampleAttenuationProvider

- (HDQuantitySampleAttenuationProvider)initWithQuantityType:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  HDQuantitySampleAttenuationProvider *v9;
  HDQuantitySampleAttenuationProvider *v10;
  HDQuantitySampleOverlapProcessor *v11;
  HDQuantitySampleOverlapProcessor *overlapProcessor;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDQuantitySampleAttenuationProvider;
  v9 = -[HDQuantitySampleAttenuationProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_quantityType, a3);
    objc_storeStrong((id *)&v10->_profile, a4);
    v11 = -[HDQuantitySampleOverlapProcessor initWithOverlapFunction:]([HDQuantitySampleOverlapProcessor alloc], "initWithOverlapFunction:", 0);
    overlapProcessor = v10->_overlapProcessor;
    v10->_overlapProcessor = v11;

  }
  return v10;
}

- (int64_t)loadAttenuationSamples:(id *)a3 anchorTime:(double)a4 errorOut:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDProfile *profile;
  id v14;
  void *v15;
  int64_t v16;
  void *v17;
  HDQuantitySampleOverlapProcessor *overlapProcessor;
  uint64_t v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint8_t *v23;
  $A3DB90B81A8072650F44011264F9C29D *v24;
  __int128 v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[8];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t v44[4];
  void *v45;
  uint8_t buf[4];
  void *v47;
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  -[HDQuantitySampleOverlapProcessor resetAnchorTime:](self->_overlapProcessor, "resetAnchorTime:");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataType(self->_quantityType);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate(5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityType _earliestAllowedStartDateForSampleOverlappingDate:](self->_quantityType, "_earliestAllowedStartDateForSampleOverlappingDate:", v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate(5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D29840];
  v48[0] = v35;
  v48[1] = v34;
  v48[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  profile = self->_profile;
  v39 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __82__HDQuantitySampleAttenuationProvider_loadAttenuationSamples_anchorTime_errorOut___block_invoke;
  v38[3] = &unk_1E6CF1DE8;
  *(double *)&v38[6] = a4;
  v38[4] = self;
  v38[5] = &v40;
  v38[7] = a3;
  LOBYTE(v10) = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:profile:options:error:handler:](HDQuantitySampleValueEnumerator, "orderedQuantityValuesForPredicate:profile:options:error:handler:", v12, profile, 4, &v39, v38);
  v14 = v39;
  v15 = v14;
  if ((v10 & 1) == 0)
  {
    v26 = v14;
    v27 = v26;
    if (v26)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v26);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v30 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v27;
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "Unable to fetch hearing protection samples: %{public}@", buf, 0xCu);
    }
LABEL_26:
    v16 = -1;
    goto LABEL_27;
  }
  v16 = v41[3];
  if (v16 <= 1023)
  {
    v17 = 0;
    while (1)
    {
      overlapProcessor = self->_overlapProcessor;
      v37 = v17;
      v19 = -[HDQuantitySampleOverlapProcessor finishWithRemainingSamples:error:](overlapProcessor, "finishWithRemainingSamples:error:", buf, &v37);
      v20 = v37;

      if (v19 == -1)
        break;
      if (!v19)
      {

        v16 = v41[3];
        goto LABEL_27;
      }
      v17 = v20;
      if (v19 >= 1)
      {
        v21 = v41;
        v22 = v41[3];
        v23 = buf;
        do
        {
          if (v22 <= 1023)
          {
            v24 = &a3[v22];
            v25 = *((_OWORD *)v23 + 1);
            *(_OWORD *)&v24->var0 = *(_OWORD *)v23;
            *(_OWORD *)&v24->var2 = v25;
            v24->var4 = *((_QWORD *)v23 + 4);
            v22 = v21[3] + 1;
            v21[3] = v22;
          }
          v23 += 40;
          --v19;
        }
        while (v19);
        v17 = v20;
      }
    }
    v28 = v20;
    v29 = v28;
    if (v28)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v28);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v31 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138543362;
      v45 = v29;
      _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Unable to fetch hearing protection samples: %{public}@", v44, 0xCu);
    }

    goto LABEL_26;
  }
LABEL_27:
  _Block_object_dispose(&v40, 8);

  return v16;
}

uint64_t __82__HDQuantitySampleAttenuationProvider_loadAttenuationSamples_anchorTime_errorOut___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13)
{
  _BOOL8 v13;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _QWORD v29[5];
  id v30;
  _BYTE v31[320];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(double *)(a1 + 48) <= a6)
  {
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v29[4] = 0;
    v30 = 0;
    *(double *)v29 = a5;
    *(double *)&v29[1] = a6;
    *(double *)&v29[2] = a4;
    v29[3] = 0;
    v17 = objc_msgSend(v16, "addSample:outputSamples:error:", v29, v31, &v30);
    v18 = v30;
    v19 = v18;
    if (v17 == -1)
    {
      v27 = v18;
      if (v27)
      {
        if (a13)
          *a13 = objc_retainAutorelease(v27);
        else
          _HKLogDroppedError();
      }

    }
    else
    {
      if (v17 < 1)
      {
        v13 = 1;
LABEL_17:

        return v13;
      }
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v20 <= 1023)
      {
        v21 = v31;
        v22 = 1;
        do
        {
          v23 = v22;
          v24 = *(_QWORD *)(a1 + 56) + 40 * v20;
          v25 = *(_OWORD *)v21;
          v26 = *((_OWORD *)v21 + 1);
          *(_QWORD *)(v24 + 32) = *((_QWORD *)v21 + 4);
          *(_OWORD *)v24 = v25;
          *(_OWORD *)(v24 + 16) = v26;
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          if (v17 == v22)
            break;
          v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v21 += 40;
          ++v22;
        }
        while (v20 <= 1023);
        v13 = v23 >= v17;
        goto LABEL_17;
      }
    }
    v13 = 0;
    goto LABEL_17;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlapProcessor, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end
