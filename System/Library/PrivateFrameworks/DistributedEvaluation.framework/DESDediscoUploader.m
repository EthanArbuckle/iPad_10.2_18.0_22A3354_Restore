@implementation DESDediscoUploader

+ (BOOL)uploadViaDedisco:(id)a3 jsonResult:(id)a4 recipe:(id)a5 bundleIdentifier:(id)a6 submissionCount:(unsigned int *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  DESDediscoUploader *v17;
  void *v18;
  DESDPFloatValueRecorder *v19;
  unsigned int v20;
  void *v21;
  DESDPFloatValueRecorder *v22;
  DESFedStatsRecorder *v23;
  BOOL v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  DESDPBitValueRecorder *v29;
  void *v30;
  char v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  BOOL v40;
  NSObject *v41;
  void *v42;
  void *v43;
  BOOL v44;
  NSObject *v45;
  void *v46;
  id *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id *v69;
  void *v70;
  void *v71;
  void **v72;
  uint64_t *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  id v79;
  void *v80;
  id *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint8_t buf[4];
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const __CFString *v103;
  uint64_t v104;
  _QWORD v105[3];

  v105[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v88 = a4;
  v15 = a5;
  v16 = a6;
  v17 = -[DESDediscoUploader initWithBundleIdentifier:recipe:]([DESDediscoUploader alloc], "initWithBundleIdentifier:recipe:", v16, v15);
  if (v17)
  {
    v82 = a1;
    v102 = *MEMORY[0x1E0D1D358];
    v103 = &stru_1E706F800;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v19 = objc_alloc_init(DESDPFloatValueRecorder);
      v20 = -[DESDediscoUploader donateResult:dediscoMetadata:recorder:](v17, "donateResult:dediscoMetadata:recorder:", v14, v18, v19);
      if (a7)
        *a7 += v20;
      if (!v20)
      {
        v83 = v15;
        v47 = a8;
        v48 = v18;
        v49 = (void *)MEMORY[0x1E0CB3940];
        -[DESDediscoUploader key](v17, "key");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "resultsKeyString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR("Failed to submit result to Dedisco for %@, skip metadata submission"), v51);
        v52 = objc_claimAutoreleasedReturnValue();

        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.1();

        v18 = v48;
        if (!v47)
        {
          v44 = 0;
          v21 = (void *)v52;
          v15 = v83;
          goto LABEL_54;
        }
        v54 = (void *)MEMORY[0x1E0CB35C8];
        v100 = *MEMORY[0x1E0CB2D68];
        v101 = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2006, v55);
        v44 = 0;
        *v47 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (void *)v52;
        v15 = v83;
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }

    }
    v81 = a8;
    v91 = 0;
    +[DESFedStatsDataType extractFedStatsDataTypeFrom:forKey:](DESFedStatsDataType, "extractFedStatsDataTypeFrom:forKey:", v15, &v91);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (DESDPFloatValueRecorder *)v91;
    v19 = v22;
    v85 = v16;
    v86 = v18;
    if (v21 && v22)
    {
      v23 = objc_alloc_init(DESFedStatsRecorder);
      v90 = 0;
      v24 = -[DESDediscoUploader donateFedStatsMetrics:dataKey:dataTypeContent:dediscoMetadata:error:recorder:](v17, "donateFedStatsMetrics:dataKey:dataTypeContent:dediscoMetadata:error:recorder:", v88, v19, v21, v18, &v90, v23);
      v87 = v90;
      -[DESDediscoUploader key](v17, "key");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "metadataEncodedMetricsKeyString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (!v24)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.5();

        if (v81)
        {
          v80 = (void *)MEMORY[0x1E0CB35C8];
          v98 = *MEMORY[0x1E0CB2D68];
          objc_msgSend(v87, "localizedDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v57;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
          v58 = v15;
          v59 = v21;
          v60 = v14;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2012, v61);
          *v81 = (id)objc_claimAutoreleasedReturnValue();

          v14 = v60;
          v21 = v59;
          v15 = v58;

        }
        v44 = 0;
        goto LABEL_51;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v97 = v26;
        _os_log_impl(&dword_1B96E5000, v28, OS_LOG_TYPE_INFO, "Donated data for: %@ using FedStats encoding", buf, 0xCu);
      }

      v16 = v85;
      if (a7)
        ++*a7;

      v18 = v86;
    }
    v89 = 0;
    +[DESAggregatableMetadata encodeMetadata:recipe:error:](DESAggregatableMetadata, "encodeMetadata:recipe:error:", v88, v15, &v89);
    v23 = (DESFedStatsRecorder *)objc_claimAutoreleasedReturnValue();
    v87 = v89;
    if (!v23)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.2(v17, v56);

      v44 = 0;
      if (v81)
      {
        v87 = objc_retainAutorelease(v87);
        *v81 = v87;
      }
      goto LABEL_52;
    }
    v79 = v14;
    -[DESFedStatsRecorder objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("encodedNumericMetadata"));
    v29 = (DESDPBitValueRecorder *)objc_claimAutoreleasedReturnValue();
    if (-[DESDPBitValueRecorder length](v29, "length"))
    {
      -[DESFedStatsRecorder objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("encodedNumericMetadata"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v82, "hasAllZeroData:", v30);

      if ((v31 & 1) != 0)
      {
LABEL_24:
        -[DESFedStatsRecorder objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("encodedCategoricalMetadata"));
        v29 = (DESDPBitValueRecorder *)objc_claimAutoreleasedReturnValue();
        if (!-[DESDPBitValueRecorder length](v29, "length"))
        {
LABEL_31:

          goto LABEL_32;
        }
        -[DESFedStatsRecorder objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("encodedCategoricalMetadata"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v82, "hasAllZeroData:", v37);

        if ((v38 & 1) != 0)
        {
LABEL_32:
          v44 = 1;
          v14 = v79;
LABEL_51:
          v16 = v85;
          v18 = v86;
LABEL_52:

          v55 = v87;
          goto LABEL_53;
        }
        v29 = objc_alloc_init(DESDPBitValueRecorder);
        -[DESFedStatsRecorder objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("encodedCategoricalMetadata"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[DESDediscoUploader donateCategoricalMetadata:dediscoMetadata:recorder:](v17, "donateCategoricalMetadata:dediscoMetadata:recorder:", v39, v86, v29);

        if (v40)
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            -[DESDediscoUploader key](v17, "key");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "metadataKeyString");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v97 = v43;
            _os_log_impl(&dword_1B96E5000, v41, OS_LOG_TYPE_INFO, "Donated categorical metadata for: %@", buf, 0xCu);

          }
          if (a7)
            ++*a7;
          goto LABEL_31;
        }
        v84 = v15;
        v63 = v21;
        v74 = (void *)MEMORY[0x1E0CB3940];
        -[DESDediscoUploader key](v17, "key");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "metadataKeyString");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "stringWithFormat:", CFSTR("Failed to donate categorical metadata for: %@"), v76);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.1();

        v69 = v81;
        if (!v81)
        {
LABEL_68:

          v44 = 0;
          v14 = v79;
          v16 = v85;
          v18 = v86;
          v21 = v63;
          v15 = v84;
          goto LABEL_52;
        }
        v70 = (void *)MEMORY[0x1E0CB35C8];
        v92 = *MEMORY[0x1E0CB2D68];
        v93 = v67;
        v71 = (void *)MEMORY[0x1E0C99D80];
        v72 = &v93;
        v73 = &v92;
LABEL_67:
        objc_msgSend(v71, "dictionaryWithObjects:forKeys:count:", v72, v73, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2006, v78);
        *v69 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_68;
      }
      v29 = objc_alloc_init(DESDPFloatValueRecorder);
      -[DESFedStatsRecorder objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("encodedNumericMetadata"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[DESDediscoUploader donateMetrics:dediscoMetadata:recorder:](v17, "donateMetrics:dediscoMetadata:recorder:", v32, v86, v29);

      if (!v33)
      {
        v84 = v15;
        v63 = v21;
        v64 = (void *)MEMORY[0x1E0CB3940];
        -[DESDediscoUploader key](v17, "key");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "metricsKeyString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringWithFormat:", CFSTR("Failed to donate aggregatable metrics for: %@"), v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.1();

        v69 = v81;
        if (!v81)
          goto LABEL_68;
        v70 = (void *)MEMORY[0x1E0CB35C8];
        v94 = *MEMORY[0x1E0CB2D68];
        v95 = v67;
        v71 = (void *)MEMORY[0x1E0C99D80];
        v72 = &v95;
        v73 = &v94;
        goto LABEL_67;
      }
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        -[DESDediscoUploader key](v17, "key");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "metricsKeyString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v97 = v36;
        _os_log_impl(&dword_1B96E5000, v34, OS_LOG_TYPE_INFO, "Donated aggregatable metrics for: %@", buf, 0xCu);

      }
      if (a7)
        ++*a7;
    }

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create DESDediscoUploader for: %@"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.1();

  if (a8)
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v104 = *MEMORY[0x1E0CB2D68];
    v105[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
    v19 = (DESDPFloatValueRecorder *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2006, v19);
    v44 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

    goto LABEL_56;
  }
  v44 = 0;
LABEL_56:

  return v44;
}

- (DESDediscoUploader)initWithBundleIdentifier:(id)a3 recipe:(id)a4
{
  id v6;
  id v7;
  DESDediscoUploader *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DESDediscoKey *v19;
  DESDediscoKey *key;
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DESDediscoUploader;
  v8 = -[DESDediscoUploader init](&v23, sel_init);
  if (v8)
  {
    v9 = DESIsInternalInstall();
    v10 = CFSTR("production");
    if (v9)
      v10 = CFSTR("carry");
    v11 = v10;
    objc_msgSend(v7, "privacyIdentifierExt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v6;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v6;
    }
    v14 = v13;
    objc_msgSend(v7, "recipeUserInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ramsayRecipeID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "recipeUserInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ramsayRecipeID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "recipeID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v19 = -[DESDediscoKey initWithPrivacyID:environment:recipeID:]([DESDediscoKey alloc], "initWithPrivacyID:environment:recipeID:", v14, v11, v18);
    key = v8->_key;
    v8->_key = v19;

    objc_storeStrong((id *)&v8->_recipe, a4);
    v6 = v22;
  }

  return v8;
}

- (unsigned)donateResult:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5
{
  id v8;
  id v9;
  DESDediscoUploader *v10;
  id v11;
  void *v12;
  void *v13;
  DESGaussianAlgorithmParameters *v14;
  DESGaussianAlgorithmParameters *v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  DESSparsification *v20;
  DESSparsification *v21;
  DESRecipe *recipe;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  unsigned int v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  DESDediscoUploader *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  DESGaussianAlgorithmParameters *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  DESSparsification *v63;
  unsigned int v64;
  DESDediscoUploader *v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint8_t v73[4];
  uint64_t v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = v9;
  v66 = a5;
  -[DESDediscoUploader key](self, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resultsKeyString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[DESGaussianAlgorithmParameters initWith:recipe:]([DESGaussianAlgorithmParameters alloc], "initWith:recipe:", v13, self->_recipe);
  v15 = v14;
  if (v14)
  {
    -[DESGaussianAlgorithmParameters clippingBound](v14, "clippingBound");
    v17 = v16;
    v18 = objc_msgSend(v11, "mutableCopy");
    -[DESRecipe federatedBufferDownScalingFactor](self->_recipe, "federatedBufferDownScalingFactor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.2(v25);
      goto LABEL_46;
    }
    if (-[DESRecipe useSparsification](self->_recipe, "useSparsification"))
    {
      v20 = objc_alloc_init(DESSparsification);
      if (!v20)
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.3(self, v25);
        goto LABEL_46;
      }
      v21 = v20;
      recipe = v10->_recipe;
      v65 = v10;
      -[DESDediscoUploader key](v10, "key");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v63 = v21;
      -[DESSparsification splitResultToChunksWithResult:recipe:baseKey:error:](v21, "splitResultToChunksWithResult:recipe:baseKey:error:", v8, recipe, v23, &v72);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v72;

      if (v25)
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.5(v65, v25);

        goto LABEL_45;
      }
      if (!-[DESGaussianAlgorithmParameters calculateAndVerifyPerChunkClippingBoundsIn:withOverallClippingBound:](v15, "calculateAndVerifyPerChunkClippingBoundsIn:withOverallClippingBound:", v24, v17))
      {
LABEL_45:

        goto LABEL_46;
      }
      v59 = 0;
      v60 = v13;
      v61 = v11;
      v62 = v8;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v35 = v24;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      if (!v36)
      {
        v64 = 0;
        goto LABEL_50;
      }
      v37 = v36;
      v64 = 0;
      v67 = *(_QWORD *)v69;
      v38 = v65;
LABEL_30:
      v39 = 0;
      while (1)
      {
        if (*(_QWORD *)v69 != v67)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v39);
        objc_msgSend(v40, "clippingBound", v59, v60, v61, v62);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "doubleValue");
        v43 = v42;

        objc_msgSend(v19, "doubleValue");
        v45 = v43 * v44;
        -[DESGaussianAlgorithmParameters addPerChunkParametersWith:numChunks:](v15, "addPerChunkParametersWith:numChunks:", objc_msgSend(v35, "count"), v43);
        -[DESGaussianAlgorithmParameters parameters](v15, "parameters");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v46, CFSTR("AlgorithmParameters"));

        objc_msgSend(v40, "data");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[DESDediscoUploader scaleData:withScalingFactor:](v38, "scaleData:withScalingFactor:", v47, v45);

        if (v48)
        {
          v49 = v19;
          v50 = v15;
          objc_msgSend(v40, "key");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "data");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v18;
          v54 = objc_msgSend(v66, "record:data:metadata:", v51, v52, v18);

          if (!v54)
          {
            v18 = v53;
            v15 = v50;
            v19 = v49;
            v38 = v65;
            goto LABEL_42;
          }
          ++v64;
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.4(v73, v40, &v74, v55);
          v18 = v53;
          v15 = v50;
          v19 = v49;
          v38 = v65;
        }
        else
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "key");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v76 = v56;
            v77 = 2112;
            v78 = v57;
            _os_log_error_impl(&dword_1B96E5000, v55, OS_LOG_TYPE_ERROR, "Failed to scale chunk data by %@, for key: %@", buf, 0x16u);

          }
        }

LABEL_42:
        if (v37 == ++v39)
        {
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
          if (!v37)
          {
LABEL_50:

            v11 = v61;
            v8 = v62;
            v25 = v59;
            v13 = v60;
            v27 = v64;
            goto LABEL_47;
          }
          goto LABEL_30;
        }
      }
    }
    if ((unint64_t)objc_msgSend(v8, "length") >= 0xE7EF1)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.6(v8, self, v25);
      goto LABEL_46;
    }
    objc_msgSend(v19, "doubleValue");
    v29 = v17 * v28;
    -[DESGaussianAlgorithmParameters addPerChunkParametersWith:numChunks:](v15, "addPerChunkParametersWith:numChunks:", 1, v17);
    -[DESGaussianAlgorithmParameters parameters](v15, "parameters");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v30, CFSTR("AlgorithmParameters"));

    v25 = objc_msgSend(v8, "mutableCopy");
    if (!-[DESDediscoUploader scaleData:withScalingFactor:](self, "scaleData:withScalingFactor:", v25, v29))
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.7(self);

      goto LABEL_46;
    }
    if (!objc_msgSend(v66, "record:data:metadata:", v13, v25, v18))
    {
LABEL_46:
      v27 = 0;
      goto LABEL_47;
    }
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      -[DESDediscoUploader key](self, "key");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "resultsKeyString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v76 = v33;
      _os_log_impl(&dword_1B96E5000, v31, OS_LOG_TYPE_INFO, "Donated result for key: %@", buf, 0xCu);

    }
    v27 = 1;
LABEL_47:

  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.1(self, v18);
    v27 = 0;
  }

  return v27;
}

- (BOOL)donateMetrics:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DESDediscoUploader key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metricsKeyString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v8, "record:data:metadata:", v12, v10, v9);
  return (char)v11;
}

- (BOOL)donateCategoricalMetadata:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DESDediscoUploader key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadataKeyString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v8, "record:data:metadata:", v12, v10, v9);
  return (char)v11;
}

- (BOOL)donateFedStatsMetrics:(id)a3 dataKey:(id)a4 dataTypeContent:(id)a5 dediscoMetadata:(id)a6 error:(id *)a7 recorder:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  objc_msgSend(v14, "valueForKeyPath:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[DESDediscoUploader key](self, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metadataEncodedMetricsKeyString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "valueForKeyPath:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v18, "record:data:dataTypeContent:metadata:errorOut:", v22, v23, v16, v17, a7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value of key %@ is not array type, cannot use FedStats Encoding"), v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.1();

    if (a7)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D68];
      v31[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2012, v28);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = 0;
  }

  return v24;
}

- (BOOL)scaleData:(id)a3 withScalingFactor:(double)a4
{
  id v5;
  void *v6;
  double v7;
  BOOL v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  float v13;

  v5 = a3;
  v6 = v5;
  v7 = fabs(a4);
  if (a4 <= 2.22507386e-308 || v7 == INFINITY)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_retainAutorelease(v5);
    v11 = objc_msgSend(v10, "mutableBytes");
    if ((unint64_t)objc_msgSend(v10, "length") >= 4)
    {
      v12 = 0;
      do
      {
        v13 = *(float *)(v11 + 4 * v12) / a4;
        *(float *)(v11 + 4 * v12++) = v13;
      }
      while (v12 < (unint64_t)objc_msgSend(v10, "length") >> 2);
    }
    v9 = 1;
  }

  return v9;
}

+ (BOOL)hasAllZeroData:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  unint64_t v6;
  int v7;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  if ((unint64_t)objc_msgSend(v3, "length") >= 4)
  {
    v6 = 0;
    do
    {
      v7 = *(_DWORD *)(v4 + 4 * v6);
      v5 = v7 == 0;
      if (v7)
        break;
      ++v6;
    }
    while (v6 < (unint64_t)objc_msgSend(v3, "length") >> 2);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (DESDediscoKey)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

+ (void)uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_1B96E5000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)uploadViaDedisco:(void *)a1 jsonResult:(NSObject *)a2 recipe:bundleIdentifier:submissionCount:error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultsKeyString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, v5, "Failed to encode metadata for: %@", v6);

  OUTLINED_FUNCTION_1_1();
}

+ (void)uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_1B96E5000, v0, v1, "Failed to submit for: %@ using FedStats encoding", v2);
  OUTLINED_FUNCTION_1();
}

- (void)donateResult:(void *)a1 dediscoMetadata:(NSObject *)a2 recorder:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultsKeyString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, v5, "Failed to initialize privacy parameters for key: %@", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)donateResult:(os_log_t)log dediscoMetadata:recorder:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Failed to compute down-scaling factor or staleness is too large", v1, 2u);
}

- (void)donateResult:(void *)a1 dediscoMetadata:(NSObject *)a2 recorder:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultsKeyString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, v5, "Failed to create DESSparsification to split large vectors for key: %@", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)donateResult:(_QWORD *)a3 dediscoMetadata:(NSObject *)a4 recorder:.cold.4(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B96E5000, a4, OS_LOG_TYPE_DEBUG, "Donated result chunk for key: %@", a1, 0xCu);

}

- (void)donateResult:(void *)a1 dediscoMetadata:(void *)a2 recorder:.cold.5(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultsKeyString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v5, v6, "Failed to split large vector to chunks for key: %@, %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)donateResult:(void *)a1 dediscoMetadata:(void *)a2 recorder:(NSObject *)a3 .cold.6(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "length");
  objc_msgSend(a2, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultsKeyString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218498;
  v9 = v5;
  v10 = 1024;
  v11 = 950000;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_1B96E5000, a3, OS_LOG_TYPE_ERROR, "Result length %lu bytes is larger than limit %u but sparsification is not configured properly in recipe for key: %@", (uint8_t *)&v8, 0x1Cu);

}

- (void)donateResult:(void *)a1 dediscoMetadata:recorder:.cold.7(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultsKeyString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v4, v5, "Failed to scale data by %@, for key: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
