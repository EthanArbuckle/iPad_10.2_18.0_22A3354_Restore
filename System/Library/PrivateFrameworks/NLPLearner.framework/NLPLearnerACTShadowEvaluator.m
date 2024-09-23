@implementation NLPLearnerACTShadowEvaluator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLPLearner", "NLPLearnerACTShadowEvaluator");
    v3 = (void *)sLog_7;
    sLog_7 = (uint64_t)v2;

  }
}

- (NLPLearnerACTShadowEvaluator)initWithLocale:(id)a3 andMetricParameters:(id)a4
{
  id v7;
  id v8;
  os_log_t v9;
  void *v10;
  NLPLearnerACTShadowEvaluator *v11;
  objc_super v13;

  v7 = a4;
  v8 = a3;
  v9 = os_log_create("com.apple.NLPLearner", "NLPLearnerACTShadowEvaluator");
  v10 = (void *)sLog_7;
  sLog_7 = (uint64_t)v9;

  v13.receiver = self;
  v13.super_class = (Class)NLPLearnerACTShadowEvaluator;
  v11 = -[NLPLearnerShadowEvaluator initWithLocale:andTask:](&v13, sel_initWithLocale_andTask_, v8, 7);

  if (v11)
    objc_storeStrong((id *)&v11->_metricParameters, a4);

  return v11;
}

+ (id)actParamFilesAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
      +[NLPLearnerACTShadowEvaluator actParamFilesAtPath:].cold.2();
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("pathExtension MATCHES 'json'"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "stringByDeletingPathExtension");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          supportedMetrics();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v13);

          if ((v15 & 1) == 0)
          {
            v16 = (void *)sLog_7;
            if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
              +[NLPLearnerACTShadowEvaluator actParamFilesAtPath:].cold.1((uint64_t)v13, v16);

            v7 = 0;
            goto LABEL_17;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = v8;
LABEL_17:

  }
  return v7;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  __CFString *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id obj;
  uint64_t v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;
  const __CFString *v69;
  _BYTE v70[128];
  uint64_t v71;
  const __CFString *v72;
  uint8_t buf[4];
  const __CFString *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v58 = a3;
  v11 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("skip_if_ondevice_autocorrection_disabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)sLog_7;
      if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        v15 = objc_msgSend(v12, "BOOLValue");
        v16 = CFSTR("NO");
        if (v15)
          v16 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v74 = v16;
        _os_log_impl(&dword_22630F000, v14, OS_LOG_TYPE_INFO, "skip_if_ondevice_autocorrection_disabled is set to %@", buf, 0xCu);

      }
      if (objc_msgSend(v12, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isAutoCorrectionAllowed");

        if ((v18 & 1) == 0)
        {
          v49 = (void *)sLog_7;
          if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
          {
            -[NLPLearnerACTShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.2(v49, self);
            if (a7)
              goto LABEL_43;
          }
          else if (a7)
          {
LABEL_43:
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 10, &unk_24EDBCA38);
            v31 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
          v31 = 0;
          goto LABEL_40;
        }
      }
    }
  }
  -[NLPLearnerShadowEvaluator prepareDataFromRecords:](self, "prepareDataFromRecords:", v11);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "numSamples"))
  {
    v19 = (id)objc_opt_new();
    -[NLPLearnerACTShadowEvaluator metricParameters](self, "metricParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v51 = v12;
      v53 = v11;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      -[NLPLearnerACTShadowEvaluator metricParameters](self, "metricParameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v64 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
            -[NLPLearnerACTShadowEvaluator metricParameters](self, "metricParameters");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            -[NLPLearnerACTShadowEvaluator runACTWithParams:modelPath:data:](self, "runACTWithParams:modelPath:data:", v28, v58, v57);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[NLPLearnerACTShadowEvaluator processACTResults:metric:](NLPLearnerACTShadowEvaluator, "processACTResults:metric:", v29, v26);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addEntriesFromDictionary:", v30);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        }
        while (v23);
      }

      v19 = v19;
      v31 = v19;
      v12 = v51;
      v11 = v53;
      goto LABEL_38;
    }
    objc_msgSend(v58, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[NLPLearnerACTShadowEvaluator actParamFilesAtPath:](NLPLearnerACTShadowEvaluator, "actParamFilesAtPath:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v34, "count"))
    {
      v52 = v12;
      v54 = v11;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v50 = v34;
      obj = v34;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v35)
      {
        v36 = v35;
        v56 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v60 != v56)
              objc_enumerationMutation(obj);
            v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            objc_msgSend(v58, "URLByAppendingPathComponent:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            +[NLPLearnerACTShadowEvaluator actParametersFromConfig:](NLPLearnerACTShadowEvaluator, "actParametersFromConfig:", v39);
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v41 = sLog_7;
            if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v40;
              _os_log_impl(&dword_22630F000, v41, OS_LOG_TYPE_INFO, "Run ACT with params : %@", buf, 0xCu);
            }
            -[NLPLearnerACTShadowEvaluator runACTWithParams:modelPath:data:](self, "runACTWithParams:modelPath:data:", v40, v58, v57);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringByDeletingPathExtension");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            +[NLPLearnerACTShadowEvaluator processACTResults:metric:](NLPLearnerACTShadowEvaluator, "processACTResults:metric:", v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addEntriesFromDictionary:", v44);

          }
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v36);
      }

      v31 = v19;
      v34 = v50;
      v12 = v52;
      v11 = v54;
      goto LABEL_37;
    }
    v45 = (void *)sLog_7;
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
    {
      -[NLPLearnerACTShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.1(v45, v58);
      if (!a7)
        goto LABEL_36;
    }
    else if (!a7)
    {
LABEL_36:
      v31 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v46 = (void *)MEMORY[0x24BDD1540];
    v68 = *MEMORY[0x24BDD0FC8];
    v69 = CFSTR("Cannot load params file for ACT evaluation");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 6, v47);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_36;
  }
  if (a7)
  {
    v32 = (void *)MEMORY[0x24BDD1540];
    v71 = *MEMORY[0x24BDD0FC8];
    v72 = CFSTR("missing evaluation data for ACT");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 9, v19);
    v31 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

    goto LABEL_39;
  }
  v31 = 0;
LABEL_39:

LABEL_40:
  return v31;
}

+ (id)processACTResults:(id)a3 metric:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  char v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    v12 = CFSTR("WordErrorCount");
    v27 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        if (!objc_msgSend(v14, "isEqualToString:", v12))
        {
          if (objc_msgSend(v14, "isEqualToString:", CFSTR("InsertedCharacterCount")))
          {
            if (!objc_msgSend(v6, "isEqualToString:", CFSTR("KSR")))
              goto LABEL_22;
            objc_msgSend(v8, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v15, v14);
          }
          else
          {
            objc_msgSend(v7, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v20 = v7;
              v21 = v12;
              v22 = objc_msgSend(v15, "isEqual:", v16);

              if ((v22 & 1) == 0)
              {
                v23 = (void *)sLog_7;
                if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
                {
                  v24 = v23;
                  objc_msgSend(v8, "objectForKeyedSubscript:", v14);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v33 = v6;
                  v34 = 2112;
                  v35 = v14;
                  v36 = 2112;
                  v37 = v15;
                  v38 = 2112;
                  v39 = v25;
                  _os_log_error_impl(&dword_22630F000, v24, OS_LOG_TYPE_ERROR, "In the ACT result for metric: %@, Key: %@, expected Value: %@ where as actual Value: %@", buf, 0x2Au);

                }
              }
              v12 = v21;
              v7 = v20;
              v11 = v27;
            }
            else
            {
              v17 = v7;
              v18 = v16;
              v19 = v14;
LABEL_20:
              objc_msgSend(v17, "setObject:forKey:", v18, v19);

            }
          }

          goto LABEL_22;
        }
        if (overrideWordErrorCountForMetrics_onceToken != -1)
          dispatch_once(&overrideWordErrorCountForMetrics_onceToken, &__block_literal_global_86);
        if (objc_msgSend((id)overrideWordErrorCountForMetrics_overrideWordErrorCountForMetrics, "containsObject:", v6))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v7;
          v18 = v15;
          v19 = v16;
          goto LABEL_20;
        }
LABEL_22:
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)actParametersFromConfig:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCE50];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithContentsOfFile:options:error:", v6, 1, &v18);
  v8 = v18;

  v17 = v8;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;

  v11 = (void *)objc_msgSend(v9, "mutableCopy");
  v12 = (void *)sLog_7;
  if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v11, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_impl(&dword_22630F000, v13, OS_LOG_TYPE_INFO, "Loaded ACT params from config: %@", buf, 0xCu);

  }
  if (!v11 || v10)
  {
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
      +[NLPLearnerACTShadowEvaluator actParametersFromConfig:].cold.1();
    v15 = 0;
  }
  else
  {
    v15 = v11;
  }

  return v15;
}

- (id)runACTWithParams:(id)a3 modelPath:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  dispatch_semaphore_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  dispatch_time_t v31;
  id v32;
  _QWORD block[4];
  id v35;
  dispatch_semaphore_t v36;
  _BYTE *v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CUSTOM_LANGUAGE_MODEL_PATH"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("CUSTOM_LANGUAGE_MODEL_PATH"));
    v14 = (void *)sLog_7;
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CUSTOM_LANGUAGE_MODEL_PATH"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_22630F000, v15, OS_LOG_TYPE_INFO, "Updated CUSTOM_LANGUAGE_MODEL_PATH from '%@' to '%@'", buf, 0x16u);

    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CUSTOM_STATIC_DICTIONARY_PATH"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v12, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("CUSTOM_STATIC_DICTIONARY_PATH"));

    v19 = (void *)sLog_7;
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CUSTOM_STATIC_DICTIONARY_PATH"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_22630F000, v20, OS_LOG_TYPE_INFO, "Updated CUSTOM_STATIC_DICTIONARY_PATH from '%@' to '%@'", buf, 0x16u);

    }
  }
  -[NLPLearnerShadowEvaluator locale](self, "locale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localeIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v23, CFSTR("KEYBOARD_LANGUAGE"));

  objc_msgSend(v10, "getSamples");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v24, CFSTR("INPUT_SAMPLES"));

  objc_msgSend(v8, "setValue:forKey:", CFSTR("0"), CFSTR("WORD_LEARNING_ENABLED"));
  v25 = objc_alloc_init(MEMORY[0x24BEB5AB0]);
  objc_msgSend(v25, "resetOptions:", v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "numSamples"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setObject:forKeyedSubscript:", v26, CFSTR("Samples"));

  v27 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke;
  block[3] = &unk_24EDB9488;
  v36 = v27;
  v37 = buf;
  v35 = v25;
  v29 = v27;
  v30 = v25;
  dispatch_async(v28, block);

  v31 = dispatch_time(0, 600000000000);
  dispatch_semaphore_wait(v29, v31);
  v32 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v32;
}

void __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke_2;
  v4[3] = &unk_24EDB9460;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "runWithObserver:", v4);

}

void __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  if (reporterKeysToKeep_onceToken != -1)
    dispatch_once(&reporterKeysToKeep_onceToken, &__block_literal_global_89);
  v4 = (id)reporterKeysToKeep_keysForCASchema;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)tempCorpusPath
{
  return self->_tempCorpusPath;
}

- (void)setTempCorpusPath:(id)a3
{
  objc_storeStrong((id *)&self->_tempCorpusPath, a3);
}

- (NSDictionary)metricParameters
{
  return self->_metricParameters;
}

- (void)setMetricParameters:(id)a3
{
  objc_storeStrong((id *)&self->_metricParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricParameters, 0);
  objc_storeStrong((id *)&self->_tempCorpusPath, 0);
}

+ (void)actParamFilesAtPath:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  supportedMetrics();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_2_1(&dword_22630F000, v3, v5, "The specified params file name is : %@ but it should be %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_2();
}

+ (void)actParamFilesAtPath:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_2_1(&dword_22630F000, v1, (uint64_t)v1, "Cannot get list of act param files in : %@ with error: %@", v2);
}

- (void)evaluateModel:(void *)a1 onRecords:(void *)a2 options:completion:error:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22630F000, v3, v5, "Cannot load act param files in : %@", v6);

}

- (void)evaluateModel:(void *)a1 onRecords:(void *)a2 options:completion:error:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22630F000, v3, v6, "Autocorrection is disabled for for language: %@", v7);

  OUTLINED_FUNCTION_1_2();
}

+ (void)actParametersFromConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22630F000, v0, v1, "Failed to load parameter config for ACT evaluation: %@", v2);
}

@end
