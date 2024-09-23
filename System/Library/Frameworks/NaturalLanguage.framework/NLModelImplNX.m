@implementation NLModelImplNX

- (NLModelImplNX)initWithModelContainer:(void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NLModelImplNX *v20;
  NLModelConfiguration *v21;
  NLModelConfiguration *configuration;
  NSDictionary *v23;
  NSDictionary *labelMap;
  objc_super v26;

  v12 = a4;
  v13 = a5;
  v14 = a9;
  v15 = NLModelCreateWithContainer();
  stringForKey(v14, 0x1E4A3BC50, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  stringForKeyWithDefault(v14, CFSTR("TrainingEmbeddingType"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  stringForKeyWithDefault(v14, CFSTR("EmbeddingModelIdentifier"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = unsignedIntegerForKey(v14, 0x1E4A3BC90, 0);

  if (v15)
  {
    v26.receiver = self;
    v26.super_class = (Class)NLModelImplNX;
    v20 = -[NLModelImplNX init](&v26, sel_init);
    self = v20;
    if (v20)
    {
      v20->_nlModel = (void *)v15;
      v20->_modelContainer = (void *)CFRetain(a3);
      v21 = (NLModelConfiguration *)objc_msgSend(v12, "copy");
      configuration = self->_configuration;
      self->_configuration = v21;

      v23 = (NSDictionary *)objc_msgSend(v13, "copy");
      labelMap = self->_labelMap;
      self->_labelMap = v23;

      self->_numberOfTrainingInstances = v19;
      objc_storeStrong((id *)&self->_trainingLanguage, v16);
      objc_storeStrong((id *)&self->_trainingEmbeddingType, v17);
      objc_storeStrong((id *)&self->_embeddingModelIdentifier, v18);
    }
  }

  return self;
}

- (NLModelImplNX)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const void *v25;
  NLModelImplNX *v26;
  NLModelImplNX *v27;
  NLModelImplNX *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  stringForKeyWithDefault(v18, CFSTR("TrainingEmbeddingType"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  stringForKeyWithDefault(v18, CFSTR("EmbeddingModelIdentifier"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  stringForKey(v18, 0x1E4A3BC50, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("Contextual")))
  {
    if (v20)
    {
      +[NLContextualEmbedding contextualEmbeddingWithIdentifier:](NLContextualEmbedding, "contextualEmbeddingWithIdentifier:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        NSLog(CFSTR("Failed to load contextual embedding for identifier %@"), v20);
LABEL_16:
        if (a10)
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v40 = *MEMORY[0x1E0CB2D50];
          v41[0] = CFSTR("Failed to load model file, could not find contextual embedding");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v32);
          *a10 = (id)objc_claimAutoreleasedReturnValue();

        }
        v28 = 0;
        v23 = v15;
LABEL_19:
        v27 = self;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v21)
        goto LABEL_16;
      +[NLContextualEmbedding contextualEmbeddingWithLanguage:](NLContextualEmbedding, "contextualEmbeddingWithLanguage:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        NSLog(CFSTR("Failed to load contextual embedding for language %@"), v21);
        goto LABEL_16;
      }
    }
    if ((objc_msgSend(v22, "hasAvailableAssets") & 1) == 0)
    {
      NSLog(CFSTR("Assets not available for contextual embedding %@"), v22);
      requestContextualEmbeddingAssetsForEmbedding(v22);
    }

  }
  v23 = v15;
  v24 = NLModelContainerCreateWithContainerData();
  if (!v24)
  {
    if (a10)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39 = CFSTR("Failed to load model file, invalid Transfer model data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v30);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = 0;
    goto LABEL_19;
  }
  v25 = (const void *)v24;
  v26 = -[NLModelImplNX initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:](self, "initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:", v24, v37, v36, v35, v16, v17, v18);
  CFRelease(v25);
  v27 = v26;
  v28 = v27;
LABEL_20:

  return v28;
}

- (NLModelImplNX)initWithModelTrainer:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NLModelImplNX *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NLDataEnumerator *v23;
  void *v24;
  NLDataEnumerator *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  unint64_t i;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  const void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NLModelImplNX *v45;
  void *v47;
  void *v48;
  void *v49;
  NLDataEnumerator *v50;
  NLDataEnumerator *v51;
  CFTypeRef cf;
  uint64_t v53;
  id v54;
  id v55;
  id v57;
  uint64_t v58;
  void *v59;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  _QWORD v73[3];
  char v74;
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[4];
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  void *v81;
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  uint64_t v87;
  _QWORD v88[4];
  __int128 v89;
  int64x2_t v90;
  __int128 v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  objc_msgSend(v68, "configuration");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "language");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  stringForKeyWithDefault(v4, CFSTR("EmbeddingType"), CFSTR("Dynamic"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "dataSet");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = xmmword_1A36F74D0;
  v90 = vdupq_n_s64(0x400uLL);
  v91 = xmmword_1A36F7900;
  +[NLDataSet dataSetWithDataSet:constraintParameters:modelTrainer:](NLDataSet, "dataSetWithDataSet:constraintParameters:modelTrainer:", v66, &v89, v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "inverseLabelMap");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v66, "numberOfTrainingInstances");
  objc_msgSend(v68, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = unsignedIntegerForKey(v5, (uint64_t)CFSTR("MaximumIterations"), 25);

  if (initWithModelTrainer_error__onceToken_0 != -1)
    dispatch_once(&initWithModelTrainer_error__onceToken_0, &__block_literal_global_6);
  if (!v64)
  {
    objc_msgSend(v66, "dataProviderOfType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recognizedLanguage");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v67, "numberOfTrainingInstances"))
  {
    v57 = v68;
    v62 = v64;
    v61 = v63;
    v7 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0D17420]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v58);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x1E0D17418]);

    if (v62)
    {
      objc_msgSend(v9, "setObject:forKey:", v62, *MEMORY[0x1E0D17410]);
      if (objc_msgSend(v61, "isEqualToString:", CFSTR("Contextual")))
      {
        +[NLContextualEmbedding contextualEmbeddingWithLanguage:](NLContextualEmbedding, "contextualEmbeddingWithLanguage:", v62);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasAvailableAssets"))
        {
          objc_msgSend(v11, "assetLocaleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
        objc_msgSend(v11, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_msgSend(v11, "hasAvailableAssets") & 1) == 0)
          requestContextualEmbeddingAssetsForEmbedding(v11);

        if (v12)
        {
          objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x1E0D17408], *MEMORY[0x1E0D17400]);
          objc_msgSend(v9, "setObject:forKey:", v12, *MEMORY[0x1E0D17428]);
          v16 = objc_retainAutorelease(v15);

          goto LABEL_23;
        }
        goto LABEL_24;
      }
    }
    else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("Contextual")) & 1) != 0)
    {
      v15 = 0;
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load contextual embedding for language %@"), v62);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v19);
      objc_msgSend(v57, "logMessage:", v19);
      if (a4)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v88[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)&v89 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, v88, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_27;
    }
    if (objc_msgSend(v61, "isEqualToString:", CFSTR("Dynamic")))
    {
      objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x1E0D173F8], *MEMORY[0x1E0D17400]);
      v16 = 0;
LABEL_23:
      v55 = v9;
      goto LABEL_28;
    }
    NSLog(CFSTR("%@"), CFSTR("Unsupported embedding type"));
    objc_msgSend(v57, "logMessage:", CFSTR("Unsupported embedding type"));
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v88[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)&v89 = CFSTR("Unsupported embedding type");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, v88, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_27:
    v16 = 0;
    v55 = 0;
LABEL_28:

    v54 = v16;
    v22 = v55;
    if (!v55)
    {
      v14 = 0;
      goto LABEL_53;
    }
    cf = (CFTypeRef)NLModelTrainerCreate();
    if (!cf)
    {
      v14 = 0;
      v22 = v55;
      goto LABEL_53;
    }
    v23 = [NLDataEnumerator alloc];
    objc_msgSend(v67, "dataProviderOfType:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[NLDataEnumerator initWithDataProvider:](v23, "initWithDataProvider:", v24);

    *(_QWORD *)&v89 = 0;
    *((_QWORD *)&v89 + 1) = &v89;
    v90 = (int64x2_t)0x2020000000uLL;
    v90.i64[1] = CFAbsoluteTimeGetCurrent();
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v88[3] = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x2020000000;
    v77[3] = 0;
    v76[0] = 0;
    v76[1] = v76;
    v76[2] = 0x2020000000;
    v76[3] = 0;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x2020000000;
    v75[3] = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2020000000;
    v74 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
    if (objc_msgSend(v67, "numberOfValidationInstances"))
    {
      v25 = [NLDataEnumerator alloc];
      objc_msgSend(v67, "dataProviderOfType:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[NLDataEnumerator initWithDataProvider:](v25, "initWithDataProvider:", v26);

    }
    else
    {
      v50 = 0;
    }
    v27 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "internal");
    v29 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v83 = 0;
      _os_log_impl(&dword_1A36A7000, v29, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v27);
    for (i = 0; i < objc_msgSend(&unk_1E4A47DD0, "count"); ++i)
    {
      v31 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "internal");
      v33 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(&unk_1E4A47DD0, "objectAtIndexedSubscript:", i);
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = objc_msgSend(v34, "UTF8String");
        *(_DWORD *)buf = 134218498;
        v83 = 1;
        v84 = 2048;
        v85 = i;
        v86 = 2082;
        v87 = v35;
        _os_log_impl(&dword_1A36A7000, v33, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v31);
    }
    v36 = v57;
    v37 = (const void *)NLModelTrainerTrainAndCopyContainer();
    v38 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "internal");
    v40 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v83 = 3;
      _os_log_impl(&dword_1A36A7000, v40, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v38);
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished transfer training in %.2f seconds"), CFAbsoluteTimeGetCurrent() - *(double *)(*((_QWORD *)&v89 + 1) + 24));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:", v41);
    }
    else if (*((_BYTE *)v70 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load dynamic embedding for language %@"), v62);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v41);
      objc_msgSend(v36, "logMessage:", v41);
      if (a4)
      {
        v47 = (void *)MEMORY[0x1E0CB35C8];
        v80 = *MEMORY[0x1E0CB2D50];
        v81 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v48);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      NSLog(CFSTR("%@"), CFSTR("Transfer training failed"));
      objc_msgSend(v36, "logMessage:", CFSTR("Transfer training failed"));
      if (!a4)
        goto LABEL_47;
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v78 = *MEMORY[0x1E0CB2D50];
      v79 = CFSTR("Transfer training failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 9, v41);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_47:
    CFRelease(cf);

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(v73, 8);
    _Block_object_dispose(v75, 8);
    _Block_object_dispose(v76, 8);
    _Block_object_dispose(v77, 8);
    _Block_object_dispose(v88, 8);
    _Block_object_dispose(&v89, 8);

    if (!v37)
    {
      v14 = 0;
      goto LABEL_54;
    }
    v42 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v53);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v43, 0x1E4A3BC90, v61, 0x1E4A3BCD0, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
      objc_msgSend(v44, "setObject:forKey:", v62, 0x1E4A3BC50);
    if (v54)
      objc_msgSend(v44, "setObject:forKey:", v54, 0x1E4A3BCF0);
    v45 = -[NLModelImplNX initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:](self, "initWithModelContainer:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:", v37, v65, v59, 0, 0, 0, v44);
    CFRelease(v37);
    v14 = v45;
    self = v14;
    v22 = v44;
LABEL_53:

LABEL_54:
    v13 = v54;
    goto LABEL_55;
  }
  v13 = 0;
  v14 = 0;
LABEL_55:

  return v14;
}

void __44__NLModelImplNX_initWithModelTrainer_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithModelTrainer_error__whitespaceAndNewlineCharacterSet_0;
  initWithModelTrainer_error__whitespaceAndNewlineCharacterSet_0 = v0;

}

void __44__NLModelImplNX_initWithModelTrainer_error___block_invoke_19(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("Average Tag Accuracy")))
  {
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("="));
    v8 = v7;
    v9 = objc_msgSend(v5, "rangeOfString:", CFSTR(","));
    if (v8 && v10 && v9 > v6 + v8)
    {
      objc_msgSend(v5, "substringWithRange:", v6 + v8, v9 - (v6 + v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;

    }
    v13 = (void *)MEMORY[0x1A8592E0C](v9);
    NLGetLogCategory(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "internal");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 96) - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218496;
      v33 = 2;
      v34 = 2048;
      v35 = 0;
      v36 = 2048;
      v37 = v16;
      _os_log_impl(&dword_1A36A7000, v15, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %lu", buf, 0x20u);
    }

    objc_autoreleasePoolPop(v13);
    v17 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "internal");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 134218496;
      v33 = 2;
      v34 = 2048;
      v35 = 1;
      v36 = 2048;
      v37 = v20;
      _os_log_impl(&dword_1A36A7000, v19, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
    }

    objc_autoreleasePoolPop(v17);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v21 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Iteration %llu validation accuracy %.6f"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logMessage:", v22);

    goto LABEL_23;
  }
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("Embedding Creation Failed")))
  {
    v23 = *(_QWORD *)(a1 + 56);
LABEL_13:
    *(_BYTE *)(*(_QWORD *)(v23 + 8) + 24) = 1;
    goto LABEL_23;
  }
  objc_msgSend(v5, "rangeOfString:options:", CFSTR("failed"), 1);
  if (v24)
  {
    NSLog(CFSTR("%@"), v5);
    goto LABEL_23;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v26 = *(_QWORD *)(v25 + 24);
    if (v26 <= 1)
    {
      v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v28 = *(_QWORD *)(a1 + 104);
      while (1)
      {
        v29 = v26 + 1;
        if (v29 * v28 <= 2 * v27)
          break;
        reportInstanceCompletionToTrainer(*(void **)(a1 + 32), v27, v28, 2);
        v27 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v28 = *(_QWORD *)(a1 + 104);
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v26 = *(_QWORD *)(v25 + 24);
      }
      *(_QWORD *)(v25 + 24) = v29;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 2)
      {
        v30 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting transfer training with %llu samples"), *(_QWORD *)(a1 + 104));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:", v31);

        *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = CFAbsoluteTimeGetCurrent();
        v23 = *(_QWORD *)(a1 + 64);
        goto LABEL_13;
      }
    }
  }
LABEL_23:
  if (objc_msgSend(*(id *)(a1 + 32), "shouldStop"))
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
  v5.super_class = (Class)NLModelImplNX;
  -[NLModelImplNX dealloc](&v5, sel_dealloc);
}

- (id)modelData
{
  uint64_t v2;
  const void *v3;
  void *v4;

  if (self->_nlModel && (v2 = NLModelCopyContainer()) != 0)
  {
    v3 = (const void *)v2;
    v4 = (void *)NLModelContainerCopyContainerData();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)configuration
{
  return self->_configuration;
}

- (unint64_t)systemVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[NLModelImplNX configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  stringForKeyWithDefault(v4, CFSTR("EmbeddingType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Contextual")))
  {
    -[NLModelImplNX configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = +[NLContextualEmbedding systemVersionForLanguage:](NLContextualEmbedding, "systemVersionForLanguage:", v7);
  }
  else
  {
    v8 = 3;
  }

  return v8;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)trainingInfo
{
  void *v3;
  void *v4;
  void *v5;
  NSString *trainingLanguage;
  NSString *embeddingModelIdentifier;

  v3 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTrainingInstances);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, 0x1E4A3BC90, self->_trainingEmbeddingType, 0x1E4A3BCD0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  trainingLanguage = self->_trainingLanguage;
  if (trainingLanguage)
    objc_msgSend(v5, "setObject:forKey:", trainingLanguage, 0x1E4A3BC50);
  embeddingModelIdentifier = self->_embeddingModelIdentifier;
  if (embeddingModelIdentifier)
    objc_msgSend(v5, "setObject:forKey:", embeddingModelIdentifier, 0x1E4A3BCF0);
  return v5;
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
  -[NLModelImplNX predictedLabelsDictionaryForString:](self, "predictedLabelsDictionaryForString:", v8);
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
  -[NLModelImplNX predictedLabelHypothesesDictionaryForString:maximumCount:](self, "predictedLabelHypothesesDictionaryForString:maximumCount:", v48, a4);
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
  -[NLModelImplNX predictedLabelsDictionaryForString:](self, "predictedLabelsDictionaryForString:");
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
  -[NLModelImplNX predictedLabelHypothesesDictionaryForString:maximumCount:](self, "predictedLabelHypothesesDictionaryForString:maximumCount:", a3);
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
    v44[2] = __64__NLModelImplNX_predictedLabelHypothesesForString_maximumCount___block_invoke;
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

uint64_t __64__NLModelImplNX_predictedLabelHypothesesForString_maximumCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  objc_storeStrong((id *)&self->_embeddingModelIdentifier, 0);
  objc_storeStrong((id *)&self->_trainingEmbeddingType, 0);
  objc_storeStrong((id *)&self->_trainingLanguage, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
