@implementation NLModelImplN

- (NLModelImplN)initWithModelContainer:(void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  NLModelImplN *v17;
  NLModelConfiguration *v18;
  NLModelConfiguration *configuration;
  NSDictionary *v20;
  NSDictionary *labelMap;
  objc_super v23;

  v12 = a4;
  v13 = a5;
  v14 = a9;
  v15 = NLModelCreateWithContainer();
  v16 = unsignedIntegerForKey(v14, 0x1E4A3BC90, 0);

  if (v15)
  {
    v23.receiver = self;
    v23.super_class = (Class)NLModelImplN;
    v17 = -[NLModelImplN init](&v23, sel_init);
    self = v17;
    if (v17)
    {
      v17->_nlModel = (void *)v15;
      v17->_modelContainer = (void *)CFRetain(a3);
      v18 = (NLModelConfiguration *)objc_msgSend(v12, "copy");
      configuration = self->_configuration;
      self->_configuration = v18;

      v20 = (NSDictionary *)objc_msgSend(v13, "copy");
      labelMap = self->_labelMap;
      self->_labelMap = v20;

      self->_numberOfTrainingInstances = v16;
    }
  }

  return self;
}

- (NLModelImplN)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  const void *v24;
  NLModelImplN *v25;
  NLModelImplN *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v32[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v23 = NLModelContainerCreate();
  if (v23)
  {
    v24 = (const void *)v23;
    v25 = -[NLModelImplN initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:](self, "initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:", v23, v17, v18, v19, v20, v21, v22);
    CFRelease(v24);
    self = v25;
    v26 = self;
  }
  else
  {
    if (a10)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = CFSTR("Failed to load model file, invalid CRF model data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v27);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v26 = 0;
  }

  return v26;
}

- (NLModelImplN)initWithModelTrainer:(id)a3 error:(id *)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NLDataEnumerator *v12;
  void *v13;
  NLDataEnumerator *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  id v25;
  const void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NLDataEnumerator *v34;
  NLDataEnumerator *v35;
  uint64_t v36;
  CFTypeRef cf;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[3];
  char v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[4];
  __int128 v53;
  int64x2_t v54;
  __int128 v55;
  __CFString *v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  objc_msgSend(v45, "configuration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "dataSet");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = xmmword_1A36F74D0;
  v54 = vdupq_n_s64(0x400uLL);
  v55 = xmmword_1A36F7900;
  +[NLDataSet dataSetWithDataSet:constraintParameters:modelTrainer:](NLDataSet, "dataSetWithDataSet:constraintParameters:modelTrainer:", v43, &v53, v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "inverseLabelMap");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v43, "numberOfTrainingInstances");
  objc_msgSend(v45, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = unsignedIntegerForKey(v4, (uint64_t)CFSTR("MaximumIterations"), 25);

  if (initWithModelTrainer_error__onceToken != -1)
    dispatch_once(&initWithModelTrainer_error__onceToken, &__block_literal_global_4);
  if (objc_msgSend(v44, "numberOfTrainingInstances"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v40 = v45;
    objc_msgSend(v7, "numberWithInteger:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0D17420]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 20 * v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKey:", v11, *MEMORY[0x1E0D17418]);

    if (v10)
      objc_msgSend(v42, "setObject:forKey:", v10, *MEMORY[0x1E0D17410]);

    cf = (CFTypeRef)NLModelTrainerCreate();
    if (cf)
    {
      v12 = [NLDataEnumerator alloc];
      objc_msgSend(v44, "dataProviderOfType:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[NLDataEnumerator initWithDataProvider:](v12, "initWithDataProvider:", v13);

      *(_QWORD *)&v53 = 0;
      *((_QWORD *)&v53 + 1) = &v53;
      v54 = (int64x2_t)0x2020000000uLL;
      v54.i64[1] = CFAbsoluteTimeGetCurrent();
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      v52[3] = 0;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v51[3] = 0;
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x2020000000;
      v50[3] = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v49[3] = 0;
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v48[3] = 0;
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x2020000000;
      v47 = 0;
      objc_msgSend(v44, "numberOfTrainingInstances");
      if (objc_msgSend(v44, "numberOfValidationInstances"))
      {
        v14 = [NLDataEnumerator alloc];
        objc_msgSend(v44, "dataProviderOfType:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[NLDataEnumerator initWithDataProvider:](v14, "initWithDataProvider:", v15);

      }
      else
      {
        v34 = 0;
      }
      v16 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "internal");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v59 = 0;
        _os_log_impl(&dword_1A36A7000, v18, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v16);
      for (i = 0; i < objc_msgSend(&unk_1E4A47DB8, "count"); ++i)
      {
        v20 = (void *)MEMORY[0x1A8592E0C]();
        NLGetLogCategory(0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "internal");
        v22 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(&unk_1E4A47DB8, "objectAtIndexedSubscript:", i);
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = objc_msgSend(v23, "UTF8String");
          *(_DWORD *)buf = 134218498;
          v59 = 1;
          v60 = 2048;
          v61 = i;
          v62 = 2082;
          v63 = v24;
          _os_log_impl(&dword_1A36A7000, v22, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v20);
      }
      v25 = v40;
      v26 = (const void *)NLModelTrainerTrainAndCopyContainer();
      v27 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "internal");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v59 = 3;
        _os_log_impl(&dword_1A36A7000, v29, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished CRF training in %.2f seconds"), CFAbsoluteTimeGetCurrent() - *(double *)(*((_QWORD *)&v53 + 1) + 24));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:", v30);

      CFRelease(cf);
      _Block_object_dispose(v46, 8);
      _Block_object_dispose(v48, 8);
      _Block_object_dispose(v49, 8);
      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v51, 8);
      _Block_object_dispose(v52, 8);
      _Block_object_dispose(&v53, 8);

      if (v26)
      {
        v56 = CFSTR("NumberOfTrainingInstances");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[NLModelImplN initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:](self, "initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:", v26, v39, v38, 0, 0, 0, v32);

        CFRelease(v26);
      }
    }
    else
    {

    }
  }

  return self;
}

void __43__NLModelImplN_initWithModelTrainer_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithModelTrainer_error__whitespaceAndNewlineCharacterSet;
  initWithModelTrainer_error__whitespaceAndNewlineCharacterSet = v0;

}

void __43__NLModelImplN_initWithModelTrainer_error___block_invoke_11(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("***** Iteration #")))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    i = *(_QWORD *)(v8 + 24) + 1;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * i, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      v10 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "internal");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *(_QWORD *)(a1 + 96) - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134218496;
        v34 = 2;
        v35 = 2048;
        v36 = 0;
        v37 = 2048;
        v38 = v13;
        _os_log_impl(&dword_1A36A7000, v12, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %ld", buf, 0x20u);
      }

      objc_autoreleasePoolPop(v10);
      v14 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "internal");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        *(_DWORD *)buf = 134218496;
        v34 = 2;
        v35 = 2048;
        v36 = 1;
        v37 = 2048;
        v38 = v17;
        _os_log_impl(&dword_1A36A7000, v16, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
      }

      objc_autoreleasePoolPop(v14);
      v18 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Iteration %llu validation accuracy %.6f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:", v19);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      i = *(_QWORD *)(v8 + 24) + 1;
    }
LABEL_8:
    *(_QWORD *)(v8 + 24) = i;
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("Total seconds required for training:")))
  {
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 2) >= 0xCCCCCCCCCCCCCCDuLL)
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Iteration %llu validation accuracy %.6f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:", v21);

    }
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("Item accuracy: ")))
  {
    v22 = objc_msgSend(v5, "rangeOfString:", CFSTR("("));
    v24 = v23;
    v25 = objc_msgSend(v5, "rangeOfString:", CFSTR(")"));
    if (!v24)
      goto LABEL_22;
    if (!v26)
      goto LABEL_22;
    v6 = v22 + v24;
    v7 = v25 - (v22 + v24);
    if (v25 <= v22 + v24)
      goto LABEL_22;
    objc_msgSend(v5, "substringWithRange:", v6, v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v28;
LABEL_17:

    goto LABEL_22;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_22;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("Number of features")))
  {
    v29 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting CRF training with %llu samples"), *(_QWORD *)(a1 + 104));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logMessage:", v30);

    *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    goto LABEL_22;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", initWithModelTrainer_error__whitespaceAndNewlineCharacterSet);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "length") != 1)
      goto LABEL_17;
    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);

    if (v31 <= 0x31)
    {
      v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v6 = *(_QWORD *)(a1 + 104);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      for (i = *(_QWORD *)(v8 + 24) + 1; 50 * v32 < (unint64_t)(i * v6); i = *(_QWORD *)(v8 + 24) + 1)
      {
        reportInstanceCompletionToTrainer(*(void **)(a1 + 32), v32, v6, 2);
        v32 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        v6 = *(_QWORD *)(a1 + 104);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      }
      goto LABEL_8;
    }
  }
LABEL_22:
  if (objc_msgSend(*(id *)(a1 + 32), "shouldStop", v6, v7))
    *a3 = 1;

}

- (void)dealloc
{
  void *modelContainer;
  void *nlModel;
  objc_super v5;

  modelContainer = self->_modelContainer;
  if (modelContainer)
    CFRelease(modelContainer);
  nlModel = self->_nlModel;
  if (nlModel)
    CFRelease(nlModel);
  v5.receiver = self;
  v5.super_class = (Class)NLModelImplN;
  -[NLModelImplN dealloc](&v5, sel_dealloc);
}

- (id)modelData
{
  const __CFData *v2;
  void *v3;
  const UInt8 *BytePtr;
  void *v5;

  if (self->_modelContainer && NLModelContainerGetModelDataCount() >= 1)
  {
    v2 = (const __CFData *)NLModelContainerCopyModelDataAtIndex();
    v3 = (void *)MEMORY[0x1E0C99D50];
    BytePtr = CFDataGetBytePtr(v2);
    objc_msgSend(v3, "dataWithBytes:length:", BytePtr, CFDataGetLength(v2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v2);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)predictedLabelsDictionaryForString:(id)a3
{
  return (id)NLModelCopyPredictedLabels();
}

- (id)predictedLabelHypothesesDictionaryForString:(id)a3 maximumCount:(unint64_t)a4
{
  return (id)NLModelCopyPredictedLabelsAndProbabilities();
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *i;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v5;
  if (v5)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      v5 = v44;
      objc_msgSend(v8, "appendString:", v10);
      if (++v9 < v44)
        objc_msgSend(v8, "appendString:", CFSTR(" "));

    }
    while (v44 != v9);
  }
  -[NLModelImplN predictedLabelsDictionaryForString:](self, "predictedLabelsDictionaryForString:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v38 = v8;
  v39 = v4;
  v42 = v7;
  if (v13)
  {
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D173C8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D173E8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D173E0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v15;
    v18 = objc_msgSend(v15, "count");
    i = v41;
    if (v5)
    {
      v20 = v18;
      v21 = 0;
      v40 = v6;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue");
        v43 = v21;
        objc_msgSend(v42, "objectAtIndex:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntegerValue");

        if (v20)
        {
          v26 = 0;
          v27 = v25 + v23;
          do
          {
            objc_msgSend(v16, "objectAtIndex:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "unsignedIntegerValue");
            objc_msgSend(v17, "objectAtIndex:", v26);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "unsignedIntegerValue");

            v32 = 0;
            if (v29 < v27 && v23 < v31 + v29)
            {
              objc_msgSend(v45, "objectAtIndex:", v26);
              v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            if (v32)
              break;
            ++v26;
          }
          while (v26 < v20);
          v33 = v32;
          v6 = v40;
          i = v41;
          v34 = v43;
          if (v32)
            goto LABEL_20;
        }
        else
        {
          v32 = 0;
          v34 = v43;
        }
        v33 = &stru_1E4A3BA10;
LABEL_20:
        objc_msgSend(i, "addObject:", v33);

        v21 = v34 + 1;
      }
      while (v21 != v44);
    }
    v14 = v37;
    v35 = v45;
  }
  else
  {
    for (i = v41; v5; --v5)
      objc_msgSend(v41, "addObject:", &stru_1E4A3BA10);
    v35 = 0;
    v16 = 0;
    v17 = 0;
  }

  return i;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v7;
  if (v7)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v48, "length"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObject:", v12);

      v7 = v49;
      objc_msgSend(v48, "appendString:", v10);
      if (++v9 < v49)
        objc_msgSend(v48, "appendString:", CFSTR(" "));

    }
    while (v49 != v9);
  }
  -[NLModelImplN predictedLabelHypothesesDictionaryForString:maximumCount:](self, "predictedLabelHypothesesDictionaryForString:maximumCount:", v48, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D173D0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D173D8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D173E8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D173E0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "count");
    if (v7)
    {
      v20 = v19;
      v41 = v16;
      v42 = v15;
      v39 = v14;
      v40 = v5;
      v21 = 0;
      v43 = v8;
      v44 = v6;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndex:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue");
        v45 = v21;
        objc_msgSend(v50, "objectAtIndex:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntegerValue");

        if (v20)
        {
          v26 = 0;
          v27 = v25 + v23;
          while (1)
          {
            objc_msgSend(v17, "objectAtIndex:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "unsignedIntegerValue");
            objc_msgSend(v18, "objectAtIndex:", v26);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "unsignedIntegerValue");

            if (v29 < v27 && v23 < v31 + v29)
              break;
            if (v20 == ++v26)
              goto LABEL_20;
          }
          objc_msgSend(v42, "objectAtIndex:", v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectAtIndex:", v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v32, "count"))
          {
            v34 = 0;
            do
            {
              if (v34 >= objc_msgSend(v33, "count"))
                break;
              objc_msgSend(v33, "objectAtIndex:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectAtIndex:", v34);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setObject:forKey:", v35, v36);

              ++v34;
            }
            while (v34 < objc_msgSend(v32, "count"));
          }

        }
LABEL_20:
        v6 = v44;
        objc_msgSend(v44, "addObject:", v47);

        v21 = v45 + 1;
        v8 = v43;
      }
      while (v45 + 1 != v49);
      v14 = v39;
      v5 = v40;
      v16 = v41;
      v15 = v42;
    }
  }
  else
  {
    if (v7)
    {
      v37 = MEMORY[0x1E0C9AA70];
      do
      {
        objc_msgSend(v6, "addObject:", v37);
        --v7;
      }
      while (v7);
    }
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }

  return v6;
}

- (id)predictedLabelForString:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[NLModelImplN predictedLabelsDictionaryForString:](self, "predictedLabelsDictionaryForString:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0D173C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue");

        v15 = v14 + 1;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14 + 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v16, v12);

        if (v15 > v8)
        {
          v17 = v12;

          v8 = v15;
          v9 = v17;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[NLModelImplN predictedLabelHypothesesDictionaryForString:maximumCount:](self, "predictedLabelHypothesesDictionaryForString:maximumCount:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D173D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v4;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D173D8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v43 = v6;
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    v42 = v5;
    do
    {
      if (v8 >= objc_msgSend(v6, "count"))
        break;
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v11 = 0;
        do
        {
          if (v11 >= objc_msgSend(v10, "count"))
            break;
          objc_msgSend(v9, "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndex:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v13, "doubleValue");
          v17 = v16;
          objc_msgSend(v14, "doubleValue");
          objc_msgSend(v15, "numberWithDouble:", v17 + v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v19, v12);

          ++v11;
        }
        while (v11 < objc_msgSend(v9, "count"));
      }

      ++v8;
      v5 = v42;
      v6 = v43;
    }
    while (v8 < objc_msgSend(v42, "count"));
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = v7;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  v22 = v20;
  if (!v21)
    goto LABEL_22;
  v23 = v21;
  v24 = *(_QWORD *)v47;
  v25 = 0.0;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v47 != v24)
        objc_enumerationMutation(v20);
      objc_msgSend(v20, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v25 = v25 + v28;

    }
    v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  }
  while (v23);

  if (a4 && v25 > 0.0)
  {
    objc_msgSend(v20, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __63__NLModelImplN_predictedLabelHypothesesForString_maximumCount___block_invoke;
    v44[3] = &unk_1E4A3A560;
    v30 = v20;
    v45 = v30;
    objc_msgSend(v29, "sortedArrayUsingComparator:", v44);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    do
    {
      if (v32 >= objc_msgSend(v31, "count"))
        break;
      objc_msgSend(v31, "objectAtIndex:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v34, "doubleValue");
      objc_msgSend(v35, "numberWithDouble:", v36 / v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKey:", v37, v33);

      ++v32;
    }
    while (a4 != v32);

    v22 = v45;
    v6 = v43;
LABEL_22:

  }
  return v41;
}

uint64_t __63__NLModelImplN_predictedLabelHypothesesForString_maximumCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v9 > v12)
    return -1;
  else
    return v9 < v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
