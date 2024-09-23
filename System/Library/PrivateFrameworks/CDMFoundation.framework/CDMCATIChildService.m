@implementation CDMCATIChildService

- (CDMCATIChildService)initWithAssetBundle:(id)a3
{
  NSBundle *v4;
  CDMCATIChildService *v5;
  NSBundle *catiAssetBundle;
  objc_super v8;

  v4 = (NSBundle *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CDMCATIChildService;
  v5 = -[CDMCATIChildService init](&v8, sel_init);
  catiAssetBundle = v5->_catiAssetBundle;
  v5->_catiAssetBundle = v4;

  return v5;
}

- (BOOL)isMultiTurnEnabled
{
  return +[CDMFeatureFlags isCATIMultiTurnEnabled](CDMFeatureFlags, "isCATIMultiTurnEnabled");
}

- (id)getProductAreaName
{
  if (-[CDMCATIManifest usoElementId](self->_catiManifest, "usoElementId") == 2550)
    return CFSTR("socialConversation");
  if (-[CDMCATIManifest usoElementId](self->_catiManifest, "usoElementId") == 2612)
    return CFSTR("crisisSupport");
  return CFSTR("oldAssetsOrNewProductArea");
}

- (id)setup:(id)a3 assetVersion:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *manifestPath;
  CDMCATIManifest *v11;
  CDMCATIManifest *catiManifest;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  char *v17;
  CDMCATIManifest *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *posOverridesDirectoryPath;
  void *v24;
  NSString *v25;
  NSString *weightsDirectoryPath;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *usoEntity;
  NSString *v32;
  NSString *usoVerb;
  NSString *v34;
  NSString *usoEdge;
  float v36;
  float v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  unint64_t v42;
  id v43;
  unint64_t v44;
  size_t v45;
  void *v46;
  float *value;
  NSMutableArray *v48;
  NSMutableArray *invocationGUIDs;
  unint64_t numModels;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  CATIBloomFilter *v63;
  CATIBloomFilter *positiveOverridesInvocationBloomFilterLegacy;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  _QWORD v76[4];
  id v77;
  NSObject *v78;
  id v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[NSBundle resourcePath](self->_catiAssetBundle, "resourcePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v81 = "-[CDMCATIChildService setup:assetVersion:]";
    v82 = 2112;
    v83 = v7;
    _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s Setting up child service at this path:%@", buf, 0x16u);

  }
  -[NSBundle resourcePath](self->_catiAssetBundle, "resourcePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("cati_manifest.json"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  manifestPath = self->_manifestPath;
  self->_manifestPath = v9;

  -[CDMCATIChildService getManifestFromPath:](self, "getManifestFromPath:", self->_manifestPath);
  v11 = (CDMCATIManifest *)objc_claimAutoreleasedReturnValue();
  catiManifest = self->_catiManifest;
  self->_catiManifest = v11;

  v13 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v14 = (id)CDMLogContext;
  v15 = v14;
  v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v81 = v17;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CATI", "setupChildService (%@)", buf, 0xCu);

  }
  v18 = self->_catiManifest;
  if (v18 && -[CDMCATIManifest manifestValid](v18, "manifestValid"))
  {
    objc_msgSend(v5, "dynamicConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "embeddingConfigs");
    v72 = objc_claimAutoreleasedReturnValue();

    -[NSObject getEmbeddingConfigForFactor:](v72, "getEmbeddingConfigForFactor:", CFSTR("com.apple.siri.nl.cati"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "embeddingModelDimension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self->_embeddingDimensionCATI = objc_msgSend(v20, "integerValue");

    self->_embeddingDimensionCATIPlusOne = self->_embeddingDimensionCATI + 1;
    -[NSBundle resourcePath](self->_catiAssetBundle, "resourcePath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("positive_overrides"));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    posOverridesDirectoryPath = self->_posOverridesDirectoryPath;
    self->_posOverridesDirectoryPath = v22;

    -[NSBundle resourcePath](self->_catiAssetBundle, "resourcePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("weights"));
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    weightsDirectoryPath = self->_weightsDirectoryPath;
    self->_weightsDirectoryPath = v25;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentsOfDirectoryAtPath:error:", self->_weightsDirectoryPath, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMCATIChildService getPosOverridesDirectoryPath](self, "getPosOverridesDirectoryPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentsOfDirectoryAtPath:error:", v29, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDMCATIManifest usoEntity](self->_catiManifest, "usoEntity");
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    usoEntity = self->_usoEntity;
    self->_usoEntity = v30;

    self->_usoElementId = -[CDMCATIManifest usoElementId](self->_catiManifest, "usoElementId");
    -[CDMCATIManifest usoVerb](self->_catiManifest, "usoVerb");
    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    usoVerb = self->_usoVerb;
    self->_usoVerb = v32;

    -[CDMCATIManifest usoEdge](self->_catiManifest, "usoEdge");
    v34 = (NSString *)objc_claimAutoreleasedReturnValue();
    usoEdge = self->_usoEdge;
    self->_usoEdge = v34;

    -[CDMCATIManifest confidenceScoreThreshold](self->_catiManifest, "confidenceScoreThreshold");
    self->_confidenceThreshold = v36;
    -[CDMCATIManifest multiturnConfidenceScoreThreshold](self->_catiManifest, "multiturnConfidenceScoreThreshold");
    self->_multiturnConfidenceThreshold = v37;
    self->_expectedPositiveUtterances = -[CDMCATIManifest expectedPositiveUtterances](self->_catiManifest, "expectedPositiveUtterances");
    if (objc_msgSend(v74, "count"))
    {
      -[CDMCATIChildService getManifest](self, "getManifest");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "getWeightGuidsForModelType:", 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __42__CDMCATIChildService_setup_assetVersion___block_invoke;
      v76[3] = &unk_24DCABCA0;
      v77 = v74;
      v40 = v70;
      v78 = v40;
      v41 = v39;
      v79 = v41;
      objc_msgSend(v77, "enumerateTaskParallelly:blockCompleteAllTask:", v76, &__block_literal_global_1950);
      v42 = objc_msgSend(v41, "count");
      v43 = v5;
      self->_numModels = v42;
      v44 = self->_embeddingDimensionCATIPlusOne * v42;
      if (v44 >> 62)
        v45 = -1;
      else
        v45 = 4 * v44;
      v46 = (void *)operator new[]();
      bzero(v46, v45);
      value = self->_weightPtr.__ptr_.__value_;
      self->_weightPtr.__ptr_.__value_ = (float *)v46;
      if (value)
        MEMORY[0x220744074](value, 0x1000C8052888210);
      v5 = v43;
      v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      invocationGUIDs = self->_invocationGUIDs;
      self->_invocationGUIDs = v48;

      self->_invocationWeightsEnabled = 0;
      numModels = self->_numModels;
      if (numModels)
        -[CDMCATIChildService constructWeightMatrixForInference:numModels:guids:modelType:](self, "constructWeightMatrixForInference:numModels:guids:modelType:", v41, numModels, self->_invocationGUIDs, 0);

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v81 = "-[CDMCATIChildService setup:assetVersion:]";
        v82 = 2112;
        v83 = v69;
        _os_log_debug_impl(&dword_21A2A0000, v40, OS_LOG_TYPE_DEBUG, "%s %@: There are no weight files for this product area. CATI will run only on overrides, if available", buf, 0x16u);

      }
    }

    self->_invocationOverridesEnabled = 0;
    if (objc_msgSend(v73, "count"))
    {
      -[NSBundle resourcePath](self->_catiAssetBundle, "resourcePath");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringByAppendingPathComponent:", CFSTR("bf_files"));
      v55 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "contentsOfDirectoryAtPath:error:", v55, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = objc_msgSend(v57, "count");
      if (a4 >= 3104 && v58)
      {
        if (!-[CDMCATIChildService getFlatbuffersBFAt:](self, "getFlatbuffersBFAt:", v55)
          && !-[CDMCATIChildService getBloomFilterAt:](self, "getBloomFilterAt:", v55))
        {
          -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "stringByAppendingString:", CFSTR(": Bloom filter setup failed, service is disabled. Check logs for error message"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = (id)CDMLogContext;
          v61 = v60;
          if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v60))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21A2A0000, v61, OS_SIGNPOST_INTERVAL_END, v13, "CATI", ", buf, 2u);
          }

LABEL_43:
          v53 = v72;
          goto LABEL_44;
        }
      }
      else
      {
        -[CDMCATIChildService buildLegacyBloomFilterAndExactMatchDictForInvocation:](self, "buildLegacyBloomFilterAndExactMatchDictForInvocation:", v73);
        v63 = (CATIBloomFilter *)objc_claimAutoreleasedReturnValue();
        positiveOverridesInvocationBloomFilterLegacy = self->_positiveOverridesInvocationBloomFilterLegacy;
        self->_positiveOverridesInvocationBloomFilterLegacy = v63;

      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        -[CDMCATIChildService getPosOverridesDirectoryPath](self, "getPosOverridesDirectoryPath");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v81 = "-[CDMCATIChildService setup:assetVersion:]";
        v82 = 2112;
        v83 = v62;
        _os_log_impl(&dword_21A2A0000, v55, OS_LOG_TYPE_INFO, "%s [WARN]: Not able to find any CATI positive overrides in %@", buf, 0x16u);

      }
    }

    if (-[CDMCATIChildService getInvocationOverridesEnabled](self, "getInvocationOverridesEnabled"))
    {
      v65 = (id)CDMLogContext;
      v55 = v65;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v55, OS_SIGNPOST_INTERVAL_END, v13, "CATI", ", buf, 2u);
      }
      v51 = 0;
    }
    else
    {
      -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringByAppendingString:", CFSTR(": No CATI positive overrides are available, service is disabled."));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = (id)CDMLogContext;
      v55 = v67;
      if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v67))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v55, OS_SIGNPOST_INTERVAL_END, v13, "CATI", ", buf, 2u);
      }
    }
    goto LABEL_43;
  }
  objc_msgSend(CFSTR("CATI manifest not found or invalid at "), "stringByAppendingString:", self->_manifestPath);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (id)CDMLogContext;
  v53 = v52;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v53, OS_SIGNPOST_INTERVAL_END, v13, "CATI", ", buf, 2u);
  }
LABEL_44:

  return v51;
}

- (void)constructWeightMatrixForInference:(id)a3 numModels:(unint64_t)a4 guids:(id)a5 modelType:(unint64_t)a6
{
  id v10;
  id i;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CDMCATIChildService *v16;
  id v17;
  unint64_t v18;

  v10 = a3;
  for (i = a5; a4; --a4)
    objc_msgSend(i, "addObject:", CFSTR("0"));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__CDMCATIChildService_constructWeightMatrixForInference_numModels_guids_modelType___block_invoke;
  v14[3] = &unk_24DCABCE8;
  v12 = v10;
  v15 = v12;
  v16 = self;
  v13 = i;
  v17 = v13;
  v18 = a6;
  objc_msgSend(v12, "enumerateTaskParallelly:blockCompleteAllTask:", v14, &__block_literal_global_273);

}

- (BOOL)getFlatbuffersBFAt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/FBBF.bin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BE9E040], "getCATIBloomFiltersFromFileURL:error:", v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v7)
  {
    self->_invocationOverridesEnabled = 1;
    self->_isFlatbuffersCATIOverrideSystem = 1;
    objc_storeStrong((id *)&self->_fbBloomFilters, v7);
  }

  return v7 != 0;
}

- (BOOL)getBloomFilterAt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  _TtC13CDMFoundation27BloomFilterObjectiveCHelper *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _TtC13CDMFoundation27BloomFilterObjectiveCHelper *v15;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("general.bf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v5, 0, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v7)
  {
    v8 = v7;
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CDMCATIChildService getBloomFilterAt:]";
      v24 = 2112;
      v25 = v8;
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI: Error parsing General Bloom Filter: %@", buf, 0x16u);
    }
    v10 = 0;
  }
  else
  {
    v11 = objc_alloc_init(_TtC13CDMFoundation27BloomFilterObjectiveCHelper);
    v20 = 0;
    -[BloomFilterObjectiveCHelper getDecodedBFWithData:error:](v11, "getDecodedBFWithData:error:", v6, &v20);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v20;

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("array.bf"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v12, 0, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    if (v13)
    {
      CDMOSLoggerForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[CDMCATIChildService getBloomFilterAt:]";
        v24 = 2112;
        v25 = v13;
        _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI: Error parsing Array Bloom Filter: %@", buf, 0x16u);
      }
      v10 = 0;
    }
    else
    {
      v15 = objc_alloc_init(_TtC13CDMFoundation27BloomFilterObjectiveCHelper);
      v18 = 0;
      -[BloomFilterObjectiveCHelper getDecodedBFArrayWithData:error:](v15, "getDecodedBFArrayWithData:error:", v17, &v18);
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = v18;

      v10 = 0;
      if (v9 && v14)
      {
        self->_invocationOverridesEnabled = 1;
        objc_storeStrong((id *)&self->_positiveOverridesInvocationBloomFilter, v9);
        objc_storeStrong((id *)&self->_positiveOverridesInvocationIndividualBloomFilters, v14);
        v10 = 1;
      }
    }

  }
  return v10;
}

- (id)buildLegacyBloomFilterAndExactMatchDictForInvocation:(id)a3
{
  id v4;
  uint64_t expectedPositiveUtterances;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  CDMCATIChildService *v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  CATIBloomFilter *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  expectedPositiveUtterances = self->_expectedPositiveUtterances;
  -[CDMCATIChildService getManifest](self, "getManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPositiveOverrideGuidsForModelType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)expectedPositiveUtterances == -1)
    expectedPositiveUtterances = 100 * objc_msgSend(v7, "count");
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1929;
  v29 = __Block_byref_object_dispose__1930;
  v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1929;
  v23 = __Block_byref_object_dispose__1930;
  v24 = -[CATIBloomFilter initWithExceptedNumberOfItems:falsePositiveRate:seed:]([CATIBloomFilter alloc], "initWithExceptedNumberOfItems:falsePositiveRate:seed:", expectedPositiveUtterances, 1234, 0.01);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__CDMCATIChildService_buildLegacyBloomFilterAndExactMatchDictForInvocation___block_invoke;
  v13[3] = &unk_24DCABD30;
  v8 = v4;
  v14 = v8;
  v15 = self;
  v9 = v7;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  objc_msgSend(v8, "enumerateTaskParallelly:blockCompleteAllTask:", v13, &__block_literal_global_284);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v26[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMCATIChildService setPositiveOverridesDictionary:](self, "setPositiveOverridesDictionary:", v10);

  if (-[NSDictionary count](self->_positiveOverridesDictionary, "count"))
  {
    self->_invocationOverridesEnabled = 1;
    self->_isLegacyCATIOverrideSystem = 1;
  }
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (void)buildMultiturnFeatures:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *multiturnEnabledExactMatchIntents;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  size_t v37;
  void *v38;
  float *value;
  NSMutableArray *v40;
  NSMutableArray *multiturnGUIDs;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_multiturnEnabled = 0;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v4, "turnContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasNlContext");

  if (v7)
  {
    objc_msgSend(v4, "turnContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nlContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemDialogActs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "count"))
    {
      for (i = 0; objc_msgSend(v10, "count") > i; ++i)
      {
        objc_msgSend(v10, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "hasGaveOptions"))
        {
          v13 = objc_alloc(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v12, "gaveOptions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDMCATIChildService getMultiturnIntentsFromSystemGaveOptions:](self, "getMultiturnIntentsFromSystemGaveOptions:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "initWithSet:", v15);
        }
        else
        {
          if (!objc_msgSend(v12, "hasInformed"))
            goto LABEL_11;
          v17 = objc_alloc(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v12, "informed");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDMCATIChildService getMultiturnIntentsFromSystemInformed:](self, "getMultiturnIntentsFromSystemInformed:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v17, "initWithSet:", v15);
        }
        v18 = (void *)v16;

        v5 = v18;
LABEL_11:

      }
    }
    -[CDMCATIChildService getManifest](self, "getManifest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "getPositiveOverrideGuidsForModelType:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intersectSet:", v20);

  }
  if (objc_msgSend(v5, "count"))
  {
    self->_multiturnEnabled = 1;
    objc_msgSend(v5, "allObjects");
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    multiturnEnabledExactMatchIntents = self->_multiturnEnabledExactMatchIntents;
    self->_multiturnEnabledExactMatchIntents = v21;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentsOfDirectoryAtPath:error:", self->_weightsDirectoryPath, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDMCATIChildService getManifest](self, "getManifest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "getWeightGuidsForModelType:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v27 = os_signpost_id_generate((os_log_t)CDMLogContext);
    v28 = (id)CDMLogContext;
    v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v30;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "CATI", "processMultiTurnWeightFiles (%@)", buf, 0xCu);

    }
    v31 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke;
    v44[3] = &unk_24DCABD78;
    v32 = v42;
    v45 = v32;
    v33 = v25;
    v46 = v33;
    v47 = v5;
    v34 = v26;
    v48 = v34;
    v43[0] = v31;
    v43[1] = 3221225472;
    v43[2] = __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke_2;
    v43[3] = &__block_descriptor_40_e5_v8__0l;
    v43[4] = v27;
    objc_msgSend(v32, "enumerateTaskParallelly:blockCompleteAllTask:", v44, v43);
    self->_multiturnWeightsEnabled = 0;
    v35 = objc_msgSend(v34, "count");
    self->_numMultiturnModels = v35;
    if (v35)
    {
      v36 = self->_embeddingDimensionCATIPlusOne * v35;
      if (v36 >> 62)
        v37 = -1;
      else
        v37 = 4 * v36;
      v38 = (void *)operator new[]();
      bzero(v38, v37);
      value = self->_multiturnWeightPtr.__ptr_.__value_;
      self->_multiturnWeightPtr.__ptr_.__value_ = (float *)v38;
      if (value)
        MEMORY[0x220744074](value, 0x1000C8052888210);
      v40 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_numMultiturnModels);
      multiturnGUIDs = self->_multiturnGUIDs;
      self->_multiturnGUIDs = v40;

      -[CDMCATIChildService constructWeightMatrixForInference:numModels:guids:modelType:](self, "constructWeightMatrixForInference:numModels:guids:modelType:", v34, self->_numMultiturnModels, self->_multiturnGUIDs, 1);
    }

  }
}

- (id)getMultiturnIntentsFromSystemGaveOptions:(id)a3
{
  id v3;
  void *v4;
  unint64_t j;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  unint64_t k;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t m;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t n;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t i;
  void *v36;
  id obj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v30, "choices");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33 && objc_msgSend(v33, "count", v30))
  {
    for (i = 0; objc_msgSend(v33, "count") > i; ++i)
    {
      objc_msgSend(v33, "objectAtIndex:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "hasUserStatedTask"))
        goto LABEL_44;
      objc_msgSend(v32, "userStatedTask");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "task");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "nodes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38 || !objc_msgSend(v38, "count"))
        goto LABEL_43;
      v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (j = 0; objc_msgSend(v38, "count") > j; ++j)
      {
        objc_msgSend(v38, "objectAtIndex:", j);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "usoElementId") == self->_usoElementId
          || (objc_msgSend(v6, "entityLabel"),
              v7 = (void *)objc_claimAutoreleasedReturnValue(),
              v8 = objc_msgSend(v7, "isEqualToString:", self->_usoEntity),
              v7,
              v8))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", j);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v9);

        }
      }
      objc_msgSend(v31, "identifiers");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; objc_msgSend(v36, "count") > k; ++k)
      {
        objc_msgSend(v36, "objectAtIndex:", k);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "nodeIndex"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "containsObject:", v12))
        {
          v13 = objc_msgSend(v11, "hasValue");

          if (!v13)
            goto LABEL_20;
          objc_msgSend(v11, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);
        }

LABEL_20:
      }
      if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v31, "spans");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v14)
        {
          v39 = *(_QWORD *)v47;
          do
          {
            v40 = v14;
            for (m = 0; m != v40; ++m)
            {
              if (*(_QWORD *)v47 != v39)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v16, "nodeIndex"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v41, "containsObject:", v17);

              if ((v18 & 1) != 0)
              {
                v44 = 0u;
                v45 = 0u;
                v42 = 0u;
                v43 = 0u;
                objc_msgSend(v16, "properties");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                if (v20)
                {
                  v21 = *(_QWORD *)v43;
                  do
                  {
                    for (n = 0; n != v20; ++n)
                    {
                      if (*(_QWORD *)v43 != v21)
                        objc_enumerationMutation(v19);
                      v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * n);
                      if (objc_msgSend(v23, "hasValueString"))
                      {
                        objc_msgSend(v23, "valueString");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v24, "value");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        v26 = objc_msgSend(v3, "containsObject:", v25);

                        if ((v26 & 1) == 0)
                        {
                          objc_msgSend(v23, "valueString");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v27, "value");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v3, "addObject:", v28);

                        }
                      }
                    }
                    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                  }
                  while (v20);
                }

              }
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v14);
        }

      }
LABEL_43:

LABEL_44:
    }
  }

  return v3;
}

- (id)getMultiturnIntentsFromSystemInformed:(id)a3
{
  id v3;
  unint64_t j;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t k;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t m;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t n;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  unint64_t i;
  void *v36;
  id obj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v31, "entities");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33 && objc_msgSend(v33, "count"))
  {
    for (i = 0; objc_msgSend(v33, "count") > i; ++i)
    {
      objc_msgSend(v33, "objectAtIndex:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "nodes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38 || !objc_msgSend(v38, "count"))
        goto LABEL_42;
      v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (j = 0; objc_msgSend(v38, "count") > j; ++j)
      {
        objc_msgSend(v38, "objectAtIndex:", j);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "usoElementId") == self->_usoElementId)
          goto LABEL_11;
        objc_msgSend(v5, "entityLabel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDMCATIChildService getManifest](self, "getManifest");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "usoEntity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "isEqualToString:", v8);

        if (v9)
        {
LABEL_11:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", j);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v10);

        }
      }
      objc_msgSend(v32, "identifiers");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; objc_msgSend(v36, "count") > k; ++k)
      {
        objc_msgSend(v36, "objectAtIndex:", k);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "nodeIndex"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "containsObject:", v13))
        {
          v14 = objc_msgSend(v12, "hasValue");

          if (!v14)
            goto LABEL_19;
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);
        }

LABEL_19:
      }
      if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v32, "spans");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v15)
        {
          v39 = *(_QWORD *)v47;
          do
          {
            v40 = v15;
            for (m = 0; m != v40; ++m)
            {
              if (*(_QWORD *)v47 != v39)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v17, "nodeIndex"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v41, "containsObject:", v18);

              if ((v19 & 1) != 0)
              {
                v44 = 0u;
                v45 = 0u;
                v42 = 0u;
                v43 = 0u;
                objc_msgSend(v17, "properties");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                if (v21)
                {
                  v22 = *(_QWORD *)v43;
                  do
                  {
                    for (n = 0; n != v21; ++n)
                    {
                      if (*(_QWORD *)v43 != v22)
                        objc_enumerationMutation(v20);
                      v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * n);
                      if (objc_msgSend(v24, "hasValueString"))
                      {
                        objc_msgSend(v24, "valueString");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "value");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        v27 = objc_msgSend(v3, "containsObject:", v26);

                        if ((v27 & 1) == 0)
                        {
                          objc_msgSend(v24, "valueString");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v28, "value");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v3, "addObject:", v29);

                        }
                      }
                    }
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                  }
                  while (v21);
                }

              }
            }
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v15);
        }

      }
LABEL_42:

    }
  }

  return v3;
}

- (id)handle:(id)a3 assetVersion:(int64_t)a4
{
  id v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  char *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  float v30;
  int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  float v36;
  uint64_t v37;
  int v38;
  double v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  void *v52;
  void *v53;
  __CFString *v54;
  __CFString *v55;
  os_signpost_id_t spid;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v8 = (id)CDMLogContext;
  v9 = v8;
  spid = v7;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v58 = v11;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CATI", "invokeHandle (%@)", buf, 0xCu);

  }
  if (-[CDMCATIChildService isMultiTurnEnabled](self, "isMultiTurnEnabled"))
  {
    v12 = os_signpost_id_generate((os_log_t)CDMLogContext);
    v13 = (id)CDMLogContext;
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v15;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CATI", "buildMultiTurnFeatures (%@)", buf, 0xCu);

    }
    objc_msgSend(v6, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "turnInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMCATIChildService buildMultiturnFeatures:](self, "buildMultiturnFeatures:", v17);

    v18 = (id)CDMLogContext;
    v19 = v18;
    if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v19, OS_SIGNPOST_INTERVAL_END, v12, "CATI", ", buf, 2u);
    }

    if (self->_multiturnEnabled)
      goto LABEL_23;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CDMCATIChildService handle:assetVersion:]";
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Multiturn is disabled", buf, 0xCu);
    }

    self->_multiturnEnabled = 0;
  }
  objc_msgSend(v6, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "turnInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CDMCATIChildService shouldSuppressCATIInvocationDueTo:](self, "shouldSuppressCATIInvocationDueTo:", v22);

  if (v23)
  {
    v24 = (id)CDMLogContext;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v58 = "-[CDMCATIChildService handle:assetVersion:]";
      v59 = 2112;
      v60 = CFSTR("cati");
      v61 = 2112;
      v62 = v52;
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@: CATI suppressed due to previous non-CATI turn info, return empty hypothesis", buf, 0x20u);

    }
    v25 = (id)CDMLogContext;
    v26 = v25;
    if (v10 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v25))
      goto LABEL_57;
    *(_WORD *)buf = 0;
LABEL_22:
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v26, OS_SIGNPOST_INTERVAL_END, spid, "CATI", ", buf, 2u);
LABEL_57:
    v40 = 0;
    goto LABEL_58;
  }
LABEL_23:
  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "request");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMCATIChildService checkExactMatchForUtterances:](self, "checkExactMatchForUtterances:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v30 = 1.0;
    v31 = 1;
  }
  else
  {
    if (!self->_invocationWeightsEnabled && !self->_multiturnWeightsEnabled)
    {
      CDMOSLoggerForCategory(0);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v58 = "-[CDMCATIChildService handle:assetVersion:]";
        v59 = 2112;
        v60 = v55;
        _os_log_debug_impl(&dword_21A2A0000, v48, OS_LOG_TYPE_DEBUG, "%s %@: There were no override matches and no weights to run inference on so we are returning an empty response.", buf, 0x16u);

      }
      v49 = (id)CDMLogContext;
      v50 = v49;
      if (v10 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v50, OS_SIGNPOST_INTERVAL_END, spid, "CATI", ", buf, 2u);
      }

      goto LABEL_57;
    }
    objc_msgSend(v6, "request");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "embeddings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMCATIChildService runCATIModelInferenceWithWeights:](self, "runCATIModelInferenceWithWeights:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      CDMOSLoggerForCategory(0);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v58 = "-[CDMCATIChildService handle:assetVersion:]";
        v59 = 2112;
        v60 = v54;
        _os_log_debug_impl(&dword_21A2A0000, v46, OS_LOG_TYPE_DEBUG, "%s %@: There were no override matches and the inference results were below the threshold, so we are returning an empty response.", buf, 0x16u);

      }
      v47 = (id)CDMLogContext;
      v26 = v47;
      if (v10 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v47))
        goto LABEL_57;
      *(_WORD *)buf = 0;
      goto LABEL_22;
    }
    -[NSObject valueForKey:](v34, "valueForKey:", self->_usoEdge);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject valueForKey:](v34, "valueForKey:", CFSTR("confidence_score"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "floatValue");
    v30 = v36;

    v31 = 2;
    v26 = v34;
  }
  self->_algoType = v31;
  if (a4 > 3199)
  {
    v38 = -[CDMCATIManifest usoElementId](self->_catiManifest, "usoElementId");
    if (v38 == 2550)
    {
      *(float *)&v39 = v30;
      -[CDMCATIChildService buildSocialConversationUserParse:confidenceScore:](self, "buildSocialConversationUserParse:confidenceScore:", v28, v39);
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *(float *)&v39 = v30;
      if (v38 == 2612)
        -[CDMCATIChildService buildCrisisSupportUserParse:confidenceScore:](self, "buildCrisisSupportUserParse:confidenceScore:", v28, v39);
      else
        -[CDMCATIChildService buildUserParse:confidenceScore:](self, "buildUserParse:confidenceScore:", v28, v39);
      v37 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    *(float *)&v29 = v30;
    -[CDMCATIChildService buildUserParse:confidenceScore:](self, "buildUserParse:confidenceScore:", v28, v29);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v37;
  v41 = (id)CDMLogContext;
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG);
  if (v40)
  {
    if (v42)
    {
      -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v58 = "-[CDMCATIChildService handle:assetVersion:]";
      v59 = 2112;
      v60 = CFSTR("cati");
      v61 = 2112;
      v62 = v43;
      v63 = 2112;
      v64 = v40;
      _os_log_debug_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@ CATI hypothesis: %@", buf, 0x2Au);

    }
  }
  else if (v42)
  {
    -[CDMCATIChildService getProductAreaName](self, "getProductAreaName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v58 = "-[CDMCATIChildService handle:assetVersion:]";
    v59 = 2112;
    v60 = CFSTR("cati");
    v61 = 2112;
    v62 = v53;
    _os_log_debug_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@: no CATI hypothesis", buf, 0x20u);

  }
  v44 = (id)CDMLogContext;
  v45 = v44;
  if (v10 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v45, OS_SIGNPOST_INTERVAL_END, spid, "CATI", ", buf, 2u);
  }

LABEL_58:
  return v40;
}

- (id)checkExactMatchForUtterances:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "normalisedUtterance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[CDMCATIChildService checkExactMatchForUtterances:]";
    v19 = 2112;
    v20 = v15;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s CATI normalized utterance: %@", (uint8_t *)&v17, 0x16u);

  }
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "originalUtterance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[CDMCATIChildService checkExactMatchForUtterances:]";
    v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s CATI original utterance: %@", (uint8_t *)&v17, 0x16u);

  }
  if (objc_msgSend(v4, "hasOriginalUtterance"))
  {
    objc_msgSend(v4, "originalUtterance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDMCATIChildService checkExactMatch:](self, "checkExactMatch:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v4, "hasNormalisedUtterance");
  if (v9)
    v11 = 0;
  else
    v11 = v10;
  if (v11 == 1)
  {
    objc_msgSend(v4, "normalisedUtterance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDMCATIChildService checkExactMatch:](self, "checkExactMatch:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)checkFBBloomFilter:(id)a3 contains:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  id v13;
  char v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD v21[3];
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  v7 = +[MurmurHash3 hash128WithKey:length:seed:](MurmurHash3, "hash128WithKey:length:seed:", objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), objc_msgSend(v5, "seed"));
  v9 = v8;
  v16 = v6;
  v10 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v11 = MEMORY[0x24BDAC760];
  while (objc_msgSend(v5, "number_of_hashes", v16) > (unint64_t)v10)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v22 = (v7 + v9 * (unint64_t)v10) % objc_msgSend(v5, "number_of_bits");
    objc_msgSend(v5, "bit_vector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __51__CDMCATIChildService_checkFBBloomFilter_contains___block_invoke;
    v17[3] = &unk_24DCABDA0;
    v19 = v21;
    v13 = v12;
    v18 = v13;
    v20 = &v23;
    objc_msgSend(v13, "data:", v17);

    _Block_object_dispose(v21, 8);
    ++v10;
  }
  v14 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (id)checkExactMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_multiturnEnabled
    || (-[CDMCATIChildService checkExactMatchFromPossibleGuids:forUtterance:modelType:](self, "checkExactMatchFromPossibleGuids:forUtterance:modelType:", self->_multiturnEnabledExactMatchIntents, v4, 1), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (self->_isLegacyCATIOverrideSystem
      && -[CATIBloomFilter contains:](self->_positiveOverridesInvocationBloomFilterLegacy, "contains:", v5))
    {
      -[NSDictionary valueForKey:](self->_positiveOverridesDictionary, "valueForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (self->_isFlatbuffersCATIOverrideSystem)
    {
      CDMOSLoggerForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[CDMCATIChildService checkExactMatch:]";
        _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Using Flatbuffers BF override system", buf, 0xCu);
      }

      -[FLTCDMCATIBloomFilters general_bf](self->_fbBloomFilters, "general_bf");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CDMCATIChildService checkFBBloomFilter:contains:](self, "checkFBBloomFilter:contains:", v9, v5);

      if (!v10)
        goto LABEL_33;
      -[FLTCDMCATIBloomFilters array_bf](self->_fbBloomFilters, "array_bf");
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (-[CDMCATIChildService checkFBBloomFilter:contains:](self, "checkFBBloomFilter:contains:", v15, v5))
            {
              objc_msgSend(v15, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v16);

            }
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v12);
      }

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[CDMCATIChildService checkExactMatch:]";
        _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Using JSON BF override system", buf, 0xCu);
      }

      if (!-[BloomFilter containsWithData:](self->_positiveOverridesInvocationBloomFilter, "containsWithData:", v5))
        goto LABEL_33;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = self->_positiveOverridesInvocationIndividualBloomFilters;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v11);
            v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
            if (objc_msgSend(v21, "containsWithData:", v5, (_QWORD)v24))
            {
              objc_msgSend(v21, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v22);

            }
          }
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v18);
      }
    }

LABEL_33:
    -[CDMCATIChildService checkExactMatchFromPossibleGuids:forUtterance:modelType:](self, "checkExactMatchFromPossibleGuids:forUtterance:modelType:", v7, v4, 0, (_QWORD)v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_34:

  return v6;
}

- (id)checkExactMatchFromPossibleGuids:(id)a3 forUtterance:(id)a4 modelType:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;
  __int128 v24;
  id v25;
  id v26;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v26 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    v25 = 0;
    goto LABEL_22;
  }
  -[CDMCATIChildService getManifest](self, "getManifest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getPositiveOverrideGuidsForModelType:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  *(_QWORD *)&v11 = 136315650;
  v24 = v11;
  while (1)
  {
    if (objc_msgSend(v7, "count", v24) <= v10)
    {
      v25 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", v12))
      break;
LABEL_17:

    ++v10;
  }
  objc_msgSend(v12, "stringByAppendingString:", CFSTR(".json"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMCATIChildService getPosOverridesDirectoryPath](self, "getPosOverridesDirectoryPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v15, 0, &v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  v18 = v17;
  if (!v16 || v17)
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v24;
      v31 = "-[CDMCATIChildService checkExactMatchFromPossibleGuids:forUtterance:modelType:]";
      v32 = 2112;
      v33 = v15;
      v34 = 2112;
      v35 = v18;
      _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to find or process file (%@) due to %@", buf, 0x20u);
    }
  }
  else
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v16, 0, &v28);
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = v28;
    if (v19)
    {
      -[NSObject valueForKey:](v19, "valueForKey:", v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        -[NSObject valueForKey:](v19, "valueForKey:", v26);
        v25 = (id)objc_claimAutoreleasedReturnValue();

        v21 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v24;
        v31 = "-[CDMCATIChildService checkExactMatchFromPossibleGuids:forUtterance:modelType:]";
        v32 = 2112;
        v33 = v15;
        v34 = 2112;
        v35 = v18;
        _os_log_error_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_ERROR, "%s [ERR]: Error parsing JSON in file %@: %@", buf, 0x20u);
      }

    }
  }
  v21 = 1;
LABEL_16:

  if ((v21 & 1) != 0)
    goto LABEL_17;

LABEL_21:
LABEL_22:

  return v25;
}

- (id)runCATIModelInferenceWithWeights:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  NSObject *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  float v17;
  float v18;
  NSObject *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  NSObject *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  NSObject *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  NSObject *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *__p;
  void *v80;
  uint64_t v81;
  void *v82;
  _BYTE *v83;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  -[CDMCATIChildService getCATIEmbeddingTensor:](self, "getCATIEmbeddingTensor:", a3);
  if (!self->_multiturnEnabled || !self->_multiturnWeightsEnabled)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v73 = 0;
    v74 = 0;
    v75 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v73, v82, (uint64_t)v83, (v83 - (_BYTE *)v82) >> 2);
    -[CDMCATIChildService getInvocationInferenceResults:](self, "getInvocationInferenceResults:", &v73);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      v74 = v73;
      operator delete(v73);
    }
    objc_msgSend(v4, "valueForKey:", CFSTR("confidence_score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    if (v18 > self->_confidenceThreshold)
    {
      CDMOSLoggerForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(float *)&v20 = v18;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v23 = self->_confidenceThreshold;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
        v86 = 2112;
        v87 = v22;
        v88 = 2112;
        v89 = v25;
        _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s Invocation inference score is over the threshold: %@ > %@.", buf, 0x20u);

      }
      goto LABEL_15;
    }
    CDMOSLoggerForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(float *)&v28 = v18;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v31 = self->_confidenceThreshold;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      v86 = 2112;
      v87 = v30;
      v88 = 2112;
      v89 = v33;
      _os_log_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_INFO, "%s Invocation inference score is under the threshold: %@ < %@.", buf, 0x20u);

    }
    goto LABEL_19;
  }
  __p = 0;
  v80 = 0;
  v81 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v82, (uint64_t)v83, (v83 - (_BYTE *)v82) >> 2);
  -[CDMCATIChildService getMultiturnInferenceResults:](self, "getMultiturnInferenceResults:", &__p);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v80 = __p;
    operator delete(__p);
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("confidence_score"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  if (v7 > self->_multiturnConfidenceThreshold)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(float *)&v9 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v12 = self->_multiturnConfidenceThreshold;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      v86 = 2112;
      v87 = v11;
      v88 = 2112;
      v89 = v14;
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s Multiturn inference score is over the threshold: %@ > %@.", buf, 0x20u);

    }
LABEL_15:
    v4 = v4;
    v26 = v4;
    goto LABEL_34;
  }
  if (!self->_invocationWeightsEnabled)
  {
    CDMOSLoggerForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(float *)&v51 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringValue");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v54 = self->_multiturnConfidenceThreshold;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringValue");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      v86 = 2112;
      v87 = v53;
      v88 = 2112;
      v89 = v56;
      _os_log_impl(&dword_21A2A0000, v50, OS_LOG_TYPE_INFO, "%s CATI multiturn inference score is under the threshold: %@ < %@. Inference for invocation is not enabled.", buf, 0x20u);

    }
LABEL_19:
    v26 = 0;
    goto LABEL_34;
  }
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v76 = 0;
  v77 = 0;
  v78 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v76, v82, (uint64_t)v83, (v83 - (_BYTE *)v82) >> 2);
  -[CDMCATIChildService getInvocationInferenceResults:](self, "getInvocationInferenceResults:", &v76);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  objc_msgSend(v35, "valueForKey:", CFSTR("confidence_score"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v38 = v37;

  if (v38 <= self->_confidenceThreshold)
  {
    CDMOSLoggerForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(float *)&v58 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v58);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "stringValue");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v59 = self->_multiturnConfidenceThreshold;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "stringValue");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v62 = v38;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringValue");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v65 = self->_confidenceThreshold;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringValue");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      v86 = 2112;
      v87 = v72;
      v88 = 2112;
      v89 = v61;
      v90 = 2112;
      v91 = v64;
      v92 = 2112;
      v93 = v67;
      _os_log_impl(&dword_21A2A0000, v57, OS_LOG_TYPE_INFO, "%s Multiturn inference score is under the threshold: %@ < %@. CATI invocation inference score is also under the threshold: %@ < %@.", buf, 0x34u);

    }
    v26 = 0;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(float *)&v40 = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "stringValue");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v41 = self->_multiturnConfidenceThreshold;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringValue");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v44 = v38;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringValue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v47 = self->_confidenceThreshold;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringValue");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      v86 = 2112;
      v87 = v71;
      v88 = 2112;
      v89 = v43;
      v90 = 2112;
      v91 = v46;
      v92 = 2112;
      v93 = v49;
      _os_log_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_INFO, "%s Multiturn inference score is under the threshold: %@ < %@. CATI invocation inference score is over the threshold: %@ > %@.", buf, 0x34u);

    }
    v26 = v35;
  }

LABEL_34:
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  return v26;
}

- (vector<float,)getCATIEmbeddingTensor:(CDMCATIChildService *)self
{
  id v6;
  unint64_t embeddingDimensionCATI;
  float *var1;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  float v13;
  float *var0;
  uint64_t v15;
  float v16;
  uint64_t v17;
  NSObject *v18;
  vector<float, std::allocator<float>> *result;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  embeddingDimensionCATI = self->_embeddingDimensionCATI;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (embeddingDimensionCATI)
  {
    std::vector<float>::__vallocate[abi:ne180100](retstr, embeddingDimensionCATI);
    var1 = retstr->var1;
    bzero(var1, 4 * embeddingDimensionCATI);
    retstr->var1 = &var1[embeddingDimensionCATI];
  }
  if ((objc_msgSend(v6, "hasNumToken") & 1) != 0)
  {
    v9 = objc_msgSend(v6, "numToken");
    v10 = self->_embeddingDimensionCATI;
    if (v10 >= 1)
    {
      v11 = v9;
      v12 = 0;
      v13 = (float)v9;
      var0 = retstr->var0;
      do
      {
        if (v11)
        {
          v15 = 0;
          v16 = 0.0;
          do
          {
            v17 = objc_msgSend(v6, "values");
            v10 = self->_embeddingDimensionCATI;
            v16 = v16 + *(float *)(v17 + 4 * (v12 + v10 * v15++));
          }
          while (v11 != v15);
        }
        else
        {
          v16 = 0.0;
        }
        var0[v12++] = v16 / v13;
      }
      while (v10 > v12);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315138;
      v21 = "-[CDMCATIChildService getCATIEmbeddingTensor:]";
      _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: NLv4EmbeddingTensor has numToken with a value of zero, returning empty CATI embeddingTensor.", (uint8_t *)&v20, 0xCu);
    }

  }
  return result;
}

- (id)getInvocationInferenceResults:()vector<float
{
  CATILogisticsRegressionModel *v5;
  void *v6;
  void *__p;
  void *v9;
  uint64_t v10;

  v5 = objc_alloc_init(CATILogisticsRegressionModel);
  v9 = 0;
  v10 = 0;
  __p = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, a3->var0, (uint64_t)a3->var1, a3->var1 - a3->var0);
  -[CATILogisticsRegressionModel getBestIntent:numberOfModels:weightMatrix:guids:usoEdgeKey:](v5, "getBestIntent:numberOfModels:weightMatrix:guids:usoEdgeKey:", &__p, self->_numModels, &self->_weightPtr, self->_invocationGUIDs, self->_usoEdge);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }

  return v6;
}

- (id)getMultiturnInferenceResults:()vector<float
{
  CATILogisticsRegressionModel *v5;
  void *v6;
  void *__p;
  void *v9;
  uint64_t v10;

  v5 = objc_alloc_init(CATILogisticsRegressionModel);
  v9 = 0;
  v10 = 0;
  __p = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, a3->var0, (uint64_t)a3->var1, a3->var1 - a3->var0);
  -[CATILogisticsRegressionModel getBestIntent:numberOfModels:weightMatrix:guids:usoEdgeKey:](v5, "getBestIntent:numberOfModels:weightMatrix:guids:usoEdgeKey:", &__p, self->_numMultiturnModels, &self->_multiturnWeightPtr, self->_multiturnGUIDs, self->_usoEdge);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }

  return v6;
}

- (id)buildUserParse:(id)a3 confidenceScore:(float)a4
{
  id v6;
  NSString *usoEntity;
  NSString *usoVerb;
  NSString *usoEdge;
  siri::ontology *v10;
  uint64_t *SharedUsoVocabManager;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  siri::ontology::oname::graph::ontology_init *TaskNode;
  siri::ontology::oname::graph::ontology_init *EntityNode;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v25;
  char v26;
  NSObject *v27;
  double v28;
  void *v29;
  BOOL v30;
  id v31;
  void *v32;
  void **v33;
  double v34;
  void *v35;
  BOOL v36;
  id v37;
  void *v38;
  void **v39;
  double v40;
  id v41;
  void **v42;
  void **v43;
  double v44;
  void *v45;
  char v46;
  id v47;
  void *v48;
  void *v49;
  BOOL v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void **v56;
  uint64_t v57;
  uint64_t v58;
  PB::Writer *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  double v67;
  void *v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  char v73;
  __n128 v74;
  char v75;
  char v76;
  void **v77;
  __n128 v78;
  char v79;
  char v80;
  void **v81;
  __n128 v82;
  char v83;
  char v84;
  void **v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  void *v91;
  char v92;
  char v93;
  void *v94[2];
  char v95;
  __n128 v96;
  char v97;
  char v98;
  void **v99;
  std::string v100;
  _BYTE v101[88];
  void *v102;
  char v103;
  void *v104;
  char v105;
  void *__p;
  char v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  std::string buf;
  char v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  usoEntity = self->_usoEntity;
  if (!usoEntity || !-[NSString length](usoEntity, "length"))
  {
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
      _os_log_error_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI did not have a valid usoEntity. Please check the manifest to ensure that this value exists", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_28;
  }
  usoVerb = self->_usoVerb;
  if (!usoVerb || !-[NSString length](usoVerb, "length"))
  {
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
      _os_log_error_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI did not have a valid usoVerb. Please check the manifest to ensure that this value exists", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_28;
  }
  usoEdge = self->_usoEdge;
  if (!usoEdge || (v10 = -[NSString length](usoEdge, "length")) == 0)
  {
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
      _os_log_error_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI did not have a valid usoEdge. Please check the manifest to ensure that this value exists", (uint8_t *)&buf, 0xCu);
    }
LABEL_28:

    v23 = 0;
    goto LABEL_29;
  }
  SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v10);
  v12 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
  v108 = *SharedUsoVocabManager;
  v109 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](self->_usoEntity, "UTF8String"));
  siri::ontology::UsoVocabManager::createCustomEntityName();
  if (v107 < 0)
    operator delete(__p);
  std::string::basic_string[abi:ne180100]<0>(&v104, (char *)-[NSString UTF8String](self->_usoVerb, "UTF8String"));
  siri::ontology::UsoVocabManager::createCustomVerbName();
  if (v105 < 0)
    operator delete(v104);
  std::string::basic_string[abi:ne180100]<0>(&v102, (char *)-[NSString UTF8String](self->_usoEdge, "UTF8String"));
  siri::ontology::UsoVocabManager::createCustomEdgeName();
  if (v103 < 0)
    operator delete(v102);
  buf.__r_.__value_.__r.__words[0] = 0;
  LODWORD(buf.__r_.__value_.__r.__words[1]) = 0;
  MEMORY[0x220743D50](v101, &buf);
  TaskNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createTaskNode();
  siri::ontology::oname::graph::ontology_init::Argument_task(TaskNode);
  siri::ontology::UsoGraphNode::setSuccessor();
  EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
  siri::ontology::oname::graph::ontology_init::Argument_target(EntityNode);
  siri::ontology::UsoGraphNode::setSuccessor();
  memset(&v100, 0, sizeof(v100));
  -[CDMCATIChildService getIntentLookup](self, "getIntentLookup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18
    || (objc_msgSend(v18, "intentName"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = v19 == 0,
        v19,
        v20))
  {
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(&stru_24DCAE158, "UTF8String"));
    v111 = 1;
    siri::ontology::UsoGraph::createStringNode();
    if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    siri::ontology::UsoGraphNode::setSuccessor();
    -[CDMCATIChildService getManifest](self, "getManifest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isPreGuidVersion");

    if ((v26 & 1) != 0)
    {
      CDMOSLoggerForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
        _os_log_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_INFO, "%s No intent GUIDs available in assets to attach to CATIResponse.", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      std::string::basic_string[abi:ne180100]<0>(&v91, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend((id)*MEMORY[0x24BEA38C0], "UTF8String"));
      v111 = 1;
      v88 = 0;
      v90 = 0;
      LOBYTE(v99) = 0;
      BYTE4(v99) = 0;
      siri::ontology::UsoEntityNode::addIdentifier();
      if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      if (v93 < 0)
        operator delete(v91);
      if (v95 < 0)
        operator delete(v94[0]);
    }
    if (!v18)
      goto LABEL_116;
    objc_msgSend(v18, "intentName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (!v30)
    {
      objc_msgSend(v18, "intentName");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      MEMORY[0x220743F9C](&v100, objc_msgSend(v31, "UTF8String"));

      std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
      v32 = (void *)*MEMORY[0x24BEA38E0];
      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend((id)*MEMORY[0x24BEA38E0], "UTF8String"));
      v111 = 1;
      LOBYTE(v91) = 0;
      v92 = 0;
      v88 = 0;
      v89 = 0;
      siri::ontology::UsoEntityNode::addIdentifier();
      if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      if (v95 < 0)
        operator delete(v94[0]);
      if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
      {
        std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>((uint64_t *)v94);
        v33 = (void **)v94[0];
        std::string::basic_string[abi:ne180100]<0>(&v82, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
        v84 = 1;
        *(_QWORD *)&v34 = std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)v33, &v82).n128_u64[0];
        if (v84 && v83 < 0)
          operator delete((void *)v82.n128_u64[0]);
        std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v32, "UTF8String", v34));
        siri::ontology::UsoEntitySpan::addSpanProperty();
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
        v94[0] = 0;
        v81 = v33;
        siri::ontology::UsoEntityNode::addEntitySpan();
        std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&v81);
        std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100]((void ***)v94);
      }
    }
    objc_msgSend(v18, "ensemble");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35 == 0;

    if (v36)
      goto LABEL_116;
    objc_msgSend(v18, "ensemble");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(v37, "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&v91, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
    v38 = (void *)*MEMORY[0x24BEA38B8];
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend((id)*MEMORY[0x24BEA38B8], "UTF8String"));
    v111 = 1;
    v88 = 0;
    v90 = 0;
    LOBYTE(v99) = 0;
    BYTE4(v99) = 0;
    siri::ontology::UsoEntityNode::addIdentifier();
    if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v93 < 0)
      operator delete(v91);
    if (v95 < 0)
      operator delete(v94[0]);

    if (!+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
      goto LABEL_116;
    std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>((uint64_t *)&v91);
    v39 = (void **)v91;
    std::string::basic_string[abi:ne180100]<0>(&v78, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
    v80 = 1;
    *(_QWORD *)&v40 = std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)v39, &v78).n128_u64[0];
    if (v80 && v79 < 0)
      operator delete((void *)v78.n128_u64[0]);
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v38, "UTF8String", v40));
    objc_msgSend(v18, "ensemble");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(v41, "UTF8String"));
    siri::ontology::UsoEntitySpan::addSpanProperty();
    if (v95 < 0)
      operator delete(v94[0]);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v91 = 0;
    v77 = v39;
    siri::ontology::UsoEntityNode::addEntitySpan();
    std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&v77);
    v42 = &v91;
  }
  else
  {
    objc_msgSend(v18, "intentName");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x220743F9C](&v100, objc_msgSend(v21, "UTF8String"));

    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&buf, v100.__r_.__value_.__l.__data_, v100.__r_.__value_.__l.__size_);
    else
      buf = v100;
    v111 = 1;
    siri::ontology::UsoGraph::createStringNode();
    if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    siri::ontology::UsoGraphNode::setSuccessor();
    std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>((uint64_t *)&v99);
    v43 = v99;
    std::string::basic_string[abi:ne180100]<0>(&v96, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
    v98 = 1;
    *(_QWORD *)&v44 = std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)v43, &v96).n128_u64[0];
    if (v98 && v97 < 0)
      operator delete((void *)v96.n128_u64[0]);
    -[CDMCATIChildService getManifest](self, "getManifest", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isPreGuidVersion");

    if ((v46 & 1) == 0)
    {
      v47 = objc_retainAutorelease(v6);
      std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(v47, "UTF8String"));
      std::string::basic_string[abi:ne180100]<0>(&v91, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
      v48 = (void *)*MEMORY[0x24BEA38C0];
      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend((id)*MEMORY[0x24BEA38C0], "UTF8String"));
      v111 = 1;
      v88 = 0;
      v90 = 0;
      v86 = 0;
      v87 = 0;
      siri::ontology::UsoEntityNode::addIdentifier();
      if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      if (v93 < 0)
        operator delete(v91);
      if (v95 < 0)
        operator delete(v94[0]);
      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v48, "UTF8String"));
      std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(objc_retainAutorelease(v47), "UTF8String"));
      siri::ontology::UsoEntitySpan::addSpanProperty();
      if (v95 < 0)
        operator delete(v94[0]);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
    }
    std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend((id)*MEMORY[0x24BEA38E0], "UTF8String"));
    v111 = 1;
    LOBYTE(v91) = 0;
    v92 = 0;
    v88 = 0;
    v89 = 0;
    siri::ontology::UsoEntityNode::addIdentifier();
    if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v95 < 0)
      operator delete(v94[0]);
    objc_msgSend(v18, "ensemble");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49 == 0;

    if (!v50)
    {
      objc_msgSend(v18, "ensemble");
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(v51, "UTF8String"));
      std::string::basic_string[abi:ne180100]<0>(&v91, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
      v52 = (void *)*MEMORY[0x24BEA38B8];
      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend((id)*MEMORY[0x24BEA38B8], "UTF8String"));
      v111 = 1;
      v88 = 0;
      v90 = 0;
      v86 = 0;
      v87 = 0;
      siri::ontology::UsoEntityNode::addIdentifier();
      if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      if (v93 < 0)
        operator delete(v91);
      if (v95 < 0)
        operator delete(v94[0]);

      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v52, "UTF8String"));
      objc_msgSend(v18, "ensemble");
      v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(v53, "UTF8String"));
      siri::ontology::UsoEntitySpan::addSpanProperty();
      if (v95 < 0)
        operator delete(v94[0]);

      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (!+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
    {
      if (v43)
      {
        siri::ontology::UsoEntitySpan::~UsoEntitySpan(v43);
        MEMORY[0x22074408C]();
      }
      goto LABEL_116;
    }
    v99 = 0;
    v85 = v43;
    siri::ontology::UsoEntityNode::addEntitySpan();
    v42 = (void **)&v85;
  }
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100]((void ***)v42);
LABEL_116:
  *(float *)&v28 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "stringValue");
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v94, (char *)objc_msgSend(v55, "UTF8String"));

  std::string::basic_string[abi:ne180100]<0>(&v91, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
  buf.__r_.__value_.__s.__data_[0] = 0;
  v111 = 0;
  v88 = 0;
  v90 = 0;
  LOBYTE(v99) = 0;
  BYTE4(v99) = 0;
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v111 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  if (v93 < 0)
    operator delete(v91);
  if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
  {
    std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>((uint64_t *)&buf);
    v56 = (void **)buf.__r_.__value_.__r.__words[0];
    std::string::basic_string[abi:ne180100]<0>(&v74, (char *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String"));
    v76 = 1;
    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>((uint64_t)v56, &v74);
    if (v76 && v75 < 0)
      operator delete((void *)v74.n128_u64[0]);
    v57 = operator new();
    *(_DWORD *)(v57 + 64) = 0;
    *(_OWORD *)(v57 + 32) = 0u;
    *(_OWORD *)(v57 + 48) = 0u;
    *(_OWORD *)v57 = 0u;
    *(_OWORD *)(v57 + 16) = 0u;
    *(_QWORD *)(v57 + 80) = 0;
    *(_QWORD *)(v57 + 88) = 0;
    *(_QWORD *)(v57 + 72) = 0;
    *(float *)(v57 + 4) = a4;
    *(_BYTE *)(v57 + 8) = 1;
    v72 = v57;
    v73 = 1;
    std::__optional_storage_base<std::unique_ptr<siri::ontology::MatchInfo>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::unique_ptr<siri::ontology::MatchInfo>,false>>((uint64_t)(v56 + 9), &v72);
    if (v73)
    {
      v58 = v72;
      v72 = 0;
      if (v58)
        std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v58);
    }
    buf.__r_.__value_.__r.__words[0] = 0;
    siri::ontology::UsoEntityNode::addEntitySpan();
    if (v56)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v56);
      MEMORY[0x22074408C]();
    }
  }
  sirinluexternal::UsoGraph::UsoGraph((sirinluexternal::UsoGraph *)&buf);
  siri::ontology::UsoGraphProtoWriter::toProtobuf();
  v59 = (PB::Writer *)operator new();
  PB::Writer::Writer(v59);
  v91 = v59;
  sirinluexternal::UsoGraph::writeTo((sirinluexternal::UsoGraph *)&buf, v59);
  v60 = *((_QWORD *)v59 + 1);
  v61 = objc_alloc(MEMORY[0x24BE9E180]);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v60, *(_QWORD *)v59 - *((_QWORD *)v59 + 1));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v61, "initWithData:", v62);

  v64 = objc_alloc_init(MEMORY[0x24BE9E168]);
  objc_msgSend(v64, "setTask:", v63);
  v65 = objc_alloc_init(MEMORY[0x24BE9E158]);
  objc_msgSend(v65, "setUserStatedTask:", v64);
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v65, 0);
  *(float *)&v67 = a4;
  -[CDMCATIChildService createUserParse:](self, "createUserParse:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setUserDialogActs:", v66);
  v23 = v68;

  PB::Writer::~Writer(v59);
  MEMORY[0x22074408C]();
  MEMORY[0x2207436FC](&buf);
  if (v95 < 0)
    operator delete(v94[0]);

  if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v100.__r_.__value_.__l.__data_);
  MEMORY[0x220743D5C](v101);
  v69 = v109;
  if (v109)
  {
    v70 = (unint64_t *)&v109->__shared_owners_;
    do
      v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
      std::__shared_weak_count::__release_weak(v69);
    }
  }
LABEL_29:

  return v23;
}

- (id)buildSocialConversationUserParse:(id)a3 confidenceScore:(float)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;

  v6 = a3;
  -[CDMCATIChildService getIntentLookup](self, "getIntentLookup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "intentName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ensemble");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMCATIUSOParseHelpers buildSocialConversationParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:](_TtC13CDMFoundation22CDMCATIUSOParseHelpers, "buildSocialConversationParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:", CFSTR("com.apple.siri.cati"), v6, v9, v10, +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x24BE9E168]);
    objc_msgSend(v12, "setTask:", v11);
    v13 = objc_alloc_init(MEMORY[0x24BE9E158]);
    objc_msgSend(v13, "setUserStatedTask:", v12);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v13, 0);
    *(float *)&v15 = a4;
    -[CDMCATIChildService createUserParse:](self, "createUserParse:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserDialogActs:", v14);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)buildCrisisSupportUserParse:(id)a3 confidenceScore:(float)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;

  v6 = a3;
  -[CDMCATIChildService getIntentLookup](self, "getIntentLookup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "intentName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ensemble");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMCATIUSOParseHelpers buildCrisisSupportParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:](_TtC13CDMFoundation22CDMCATIUSOParseHelpers, "buildCrisisSupportParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:", CFSTR("com.apple.siri.cati"), v6, v9, v10, +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x24BE9E168]);
    objc_msgSend(v12, "setTask:", v11);
    v13 = objc_alloc_init(MEMORY[0x24BE9E158]);
    objc_msgSend(v13, "setUserStatedTask:", v12);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v13, 0);
    *(float *)&v15 = a4;
    -[CDMCATIChildService createUserParse:](self, "createUserParse:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserDialogActs:", v14);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)createUserParse:(float)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = objc_alloc_init(MEMORY[0x24BE9E160]);
  v6 = (void *)MEMORY[0x24BE9E320];
  v7 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "convertFromUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdA:", v8);

  objc_msgSend(v5, "setProbability:", a3);
  objc_msgSend(v5, "setParserId:", CFSTR("com.apple.siri.cati"));
  v9 = objc_alloc_init(MEMORY[0x24BE9E0D8]);
  objc_msgSend(v9, "setAlgorithm:", self->_algoType);
  objc_msgSend(v9, "setParserId:", 4);
  objc_msgSend(v5, "setParser:", v9);

  return v5;
}

- (BOOL)shouldSuppressCATIInvocationDueTo:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v3 = a3;
  if (!objc_msgSend(v3, "hasTurnContext"))
    goto LABEL_7;
  objc_msgSend(v3, "turnContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasLegacyNlContext");

  if (!v5)
    goto LABEL_7;
  objc_msgSend(v3, "turnContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legacyNlContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "dictationPrompt"))
  {
    objc_msgSend(v3, "turnContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legacyNlContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "strictPrompt");

    if ((v10 & 1) != 0)
      goto LABEL_6;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }

LABEL_6:
  v11 = 1;
LABEL_8:

  return v11;
}

- (id)getManifestFromPath:(id)a3
{
  id v3;
  CDMCATIManifest *v4;

  v3 = a3;
  v4 = -[CDMCATIManifest initWithPath:]([CDMCATIManifest alloc], "initWithPath:", v3);

  return v4;
}

- (id)getManifest
{
  return self->_catiManifest;
}

- (id)getPosOverridesDirectoryPath
{
  return self->_posOverridesDirectoryPath;
}

- (id)getIntentLookup
{
  void *v2;
  void *v3;

  -[CDMCATIChildService getManifest](self, "getManifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getPositiveOverrideDictionary
{
  return self->_positiveOverridesDictionary;
}

- (id)getUsoEntity
{
  return self->_usoEntity;
}

- (id)getMultiturnEnabledExactMatchIntents
{
  return self->_multiturnEnabledExactMatchIntents;
}

- (void)setPositiveOverridesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_positiveOverridesDictionary, a3);
}

- (id)getBloomFilter
{
  return self->_positiveOverridesInvocationBloomFilterLegacy;
}

- (id)getNewBloomFilter
{
  return self->_positiveOverridesInvocationBloomFilter;
}

- (BOOL)getInvocationOverridesEnabled
{
  return self->_invocationOverridesEnabled;
}

- (void)setUsoEntity:(id)a3
{
  objc_storeStrong((id *)&self->_usoEntity, a3);
}

- (void)setUsoVerb:(id)a3
{
  objc_storeStrong((id *)&self->_usoVerb, a3);
}

- (void)setUsoEdge:(id)a3
{
  objc_storeStrong((id *)&self->_usoEdge, a3);
}

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

- (void)setMultiturnEnabled:(BOOL)a3
{
  self->_multiturnEnabled = a3;
}

- (void)setMultiturnWeightsEnabled:(BOOL)a3
{
  self->_multiturnWeightsEnabled = a3;
}

- (void)setMultiturnConfidenceThreshold:(float)a3
{
  self->_multiturnConfidenceThreshold = a3;
}

- (void)setInvocationWeightsEnabled:(BOOL)a3
{
  self->_invocationWeightsEnabled = a3;
}

- (void).cxx_destruct
{
  float *value;
  float *v4;

  objc_storeStrong((id *)&self->_usoEdge, 0);
  objc_storeStrong((id *)&self->_usoVerb, 0);
  objc_storeStrong((id *)&self->_usoEntity, 0);
  objc_storeStrong((id *)&self->_multiturnGUIDs, 0);
  objc_storeStrong((id *)&self->_invocationGUIDs, 0);
  value = self->_multiturnWeightPtr.__ptr_.__value_;
  self->_multiturnWeightPtr.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x220744074](value, 0x1000C8052888210);
  v4 = self->_weightPtr.__ptr_.__value_;
  self->_weightPtr.__ptr_.__value_ = 0;
  if (v4)
    MEMORY[0x220744074](v4, 0x1000C8052888210);
  objc_storeStrong((id *)&self->_multiturnEnabledExactMatchIntents, 0);
  objc_storeStrong((id *)&self->_positiveOverridesDictionary, 0);
  objc_storeStrong((id *)&self->_positiveOverridesInvocationIndividualBloomFilters, 0);
  objc_storeStrong((id *)&self->_fbBloomFilters, 0);
  objc_storeStrong((id *)&self->_positiveOverridesInvocationBloomFilter, 0);
  objc_storeStrong((id *)&self->_positiveOverridesInvocationBloomFilterLegacy, 0);
  objc_storeStrong((id *)&self->_catiManifest, 0);
  objc_storeStrong((id *)&self->_weightsDirectoryPath, 0);
  objc_storeStrong((id *)&self->_posOverridesDirectoryPath, 0);
  objc_storeStrong((id *)&self->_manifestPath, 0);
  objc_storeStrong((id *)&self->_modelBundle, 0);
  objc_storeStrong((id *)&self->_catiAssetBundle, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

unint64_t __51__CDMCATIChildService_checkFBBloomFilter_contains___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  unint64_t result;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = *(unsigned __int8 *)(a2 + (v3 >> objc_msgSend(*(id *)(a1 + 32), "bit_shift")));
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "bits_per_block");
  if (((v4 >> (v5 % result)) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  return result;
}

void __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1[4], "objectAtIndex:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "containsObject:", v3)
    && objc_msgSend(a1[6], "containsObject:", v3))
  {
    objc_msgSend(a1[7], "addObject:", v4);
  }

}

void __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = (id)CDMLogContext;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CATI", ", v5, 2u);
  }

}

void __76__CDMCATIChildService_buildLegacyBloomFilterAndExactMatchDictForInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "getPosOverridesDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v18);
  v3 = objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v17 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v3, 0, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  if (v4)
  {
    v23 = v5;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v23);
    v6 = objc_claimAutoreleasedReturnValue();
    v15 = v23;

    if (v6)
    {
      objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("."));
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndex:](v16, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v7, v15))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v8 = v6;
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v20 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setValue:forKey:", v7, v12);
                v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
                objc_msgSend(v12, "dataUsingEncoding:", 4);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "add:", v14);

              }
              v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
            }
            while (v9);
          }

        }
      }

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[CDMCATIChildService buildLegacyBloomFilterAndExactMatchDictForInvocation:]_block_invoke";
        v28 = 2112;
        v29 = v18;
        v30 = 2112;
        v31 = v15;
        _os_log_error_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Error parsing JSON in file %@: %@", buf, 0x20u);
      }
    }

    v5 = v15;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[CDMCATIChildService buildLegacyBloomFilterAndExactMatchDictForInvocation:]_block_invoke";
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v5;
      _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to find or process file (%@) due to %@", buf, 0x20u);
    }
  }

}

void __83__CDMCATIChildService_constructWeightMatrixForInference_numModels_guids_modelType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  _BYTE v32[18];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndex:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v26;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "replaceObjectAtIndex:withObject:", a3, v25);
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject count](v9, "count");
    if (v10 != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
    {
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "getProductAreaName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
        *(_DWORD *)buf = 136315906;
        v28 = "-[CDMCATIChildService constructWeightMatrixForInference:numModels:guids:modelType:]_block_invoke";
        v29 = 2112;
        v30 = v21;
        v31 = 1024;
        *(_DWORD *)v32 = v22;
        *(_WORD *)&v32[4] = 2112;
        *(_QWORD *)&v32[6] = v5;
        _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: %@: Weight vector doesn't have size %d in file %@", buf, 0x26u);

      }
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    }
    if (v10 >= 1)
    {
      v12 = 0;
      while (1)
      {
        -[NSObject objectAtIndex:](v9, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = *(_QWORD *)(a1 + 56);
        if (v15 == 1)
          break;
        if (!v15)
        {
          objc_msgSend(v13, "floatValue");
          v17 = *(_QWORD **)(a1 + 40);
          v18 = v17 + 16;
          v19 = 224;
LABEL_12:
          *(_DWORD *)(*v18 + 4 * (v12 + v17[2] * a3)) = v16;
          *(_BYTE *)(*(_QWORD *)(a1 + 40) + v19) = 1;
        }

        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) <= ++v12)
          goto LABEL_17;
      }
      objc_msgSend(v13, "floatValue");
      v17 = *(_QWORD **)(a1 + 40);
      v18 = v17 + 17;
      v19 = 226;
      goto LABEL_12;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "getProductAreaName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v28 = "-[CDMCATIChildService constructWeightMatrixForInference:numModels:guids:modelType:]_block_invoke";
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      *(_QWORD *)v32 = v5;
      *(_WORD *)&v32[8] = 2112;
      *(_QWORD *)&v32[10] = v24;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s %@: Error parsing JSON for CATI Weight Matrix named %@: %@", buf, 0x2Au);

    }
  }
LABEL_17:

}

void __42__CDMCATIChildService_setup_assetVersion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1[4], "objectAtIndex:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "containsObject:", v3))
    objc_msgSend(a1[6], "addObject:", v4);

}

@end
