@implementation IPFeatureTextMessageScanner

- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  -[IPFeatureTextMessageScanner scanEventsInMessageUnits:contextMessageUnits:synchronously:completionHandler:](self, "scanEventsInMessageUnits:contextMessageUnits:synchronously:completionHandler:", a3, MEMORY[0x24BDBD1A8], a4, a5);
}

- (void)scanEventsInMessageUnits:(id)a3 contextMessageUnits:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, uint64_t);
  IPFeatureTextMessageScanner *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[5];
  void (**v30)(id, _QWORD, uint64_t);
  __int128 *p_buf;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, uint64_t))a6;
  v13 = self;
  objc_sync_enter(v13);
  -[IPFeatureTextMessageScanner resetScanState](v13, "resetScanState");
  objc_sync_exit(v13);

  -[IPFeatureScanner setBodyMessageUnits:](v13, "setBodyMessageUnits:", v10);
  -[IPFeatureTextMessageScanner setContextMessageUnits:](v13, "setContextMessageUnits:", v11);
  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v14 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v14 = _IPLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      objc_msgSend(v10, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_219581000, v15, OS_LOG_TYPE_INFO, "Start with message units: %@ #FeatureManager", (uint8_t *)&buf, 0xCu);

    }
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v17 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v17 = _IPLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      -[IPFeatureTextMessageScanner contextMessageUnits](v13, "contextMessageUnits");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_219581000, v18, OS_LOG_TYPE_INFO, "Context: %lu message units #FeatureManager", (uint8_t *)&buf, 0xCu);

    }
  }
  objc_msgSend(v10, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length") == 0;

  if (v23)
  {
    -[IPFeatureScanner setResultType:](v13, "setResultType:", 0);
    v27 = -[IPFeatureScanner resultType](v13, "resultType");
    v12[2](v12, MEMORY[0x24BDBD1A8], v27);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    objc_msgSend(v10, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "originalMessage");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __108__IPFeatureTextMessageScanner_scanEventsInMessageUnits_contextMessageUnits_synchronously_completionHandler___block_invoke;
    v29[3] = &unk_24DAA5090;
    v29[4] = v13;
    v30 = v12;
    p_buf = &buf;
    v25 = MEMORY[0x219A2F888](v29);
    v26 = (void *)v25;
    if (v7)
    {
      (*(void (**)(uint64_t))(v25 + 16))(v25);
    }
    else
    {
      dispatch_get_global_queue(17, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v28, v26);

    }
    _Block_object_dispose(&buf, 8);

  }
}

void __108__IPFeatureTextMessageScanner_scanEventsInMessageUnits_contextMessageUnits_synchronously_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "doSynchronousScanWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)doSynchronousScanWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  NSObject *v59;
  int64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void (**v65)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IPFeatureTextMessageScanner contextMessageUnits](self, "contextMessageUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 1)
  {
    v7 = 0;
    v8 = v6;
    do
    {
      -[IPFeatureTextMessageScanner contextMessageUnits](self, "contextMessageUnits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[IPFeatureTextMessageScanner contextMessageUnits](self, "contextMessageUnits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "subarrayWithRange:", 0, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[IPFeatureTextMessageScanner processScanOfMainMessageUnit:contextMessageUnits:](self, "processScanOfMainMessageUnit:contextMessageUnits:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        -[IPFeatureTextMessageScanner detectedEventsInContext](self, "detectedEventsInContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

      }
      ++v7;
    }
    while (v8 != v7);
  }
  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureTextMessageScanner contextMessageUnits](self, "contextMessageUnits");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureTextMessageScanner processScanOfMainMessageUnit:contextMessageUnits:](self, "processScanOfMainMessageUnit:contextMessageUnits:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  -[IPFeatureScanner setDetectedEvents:](self, "setDetectedEvents:", v19);

  v20 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v20 = _IPLogHandle;
  }
  v65 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = v20;
    -[IPFeatureScanner detectedEvents](self, "detectedEvents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v67 = objc_msgSend(v22, "count");
    _os_log_impl(&dword_219581000, v21, OS_LOG_TYPE_INFO, "%lu detected events #FeatureManager", buf, 0xCu);

  }
  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v23 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v23 = _IPLogHandle;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      -[IPFeatureScanner detectedEvents](self, "detectedEvents");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "valueForKey:", CFSTR("ipsos_betterDescription"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = (uint64_t)v26;
      _os_log_impl(&dword_219581000, v24, OS_LOG_TYPE_INFO, "Detected Events: %@ #FeatureManager", buf, 0xCu);

    }
  }
  -[IPFeatureScanner detectedEvents](self, "detectedEvents");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner stitchedEventsFromEvents:](self, "stitchedEventsFromEvents:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setStitchedEvents:](self, "setStitchedEvents:", v28);

  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v29 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v29 = _IPLogHandle;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = v29;
      -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "valueForKey:", CFSTR("ipsos_betterDescription"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = (uint64_t)v32;
      _os_log_impl(&dword_219581000, v30, OS_LOG_TYPE_INFO, "Stitched Events: %@ #FeatureManager", buf, 0xCu);

    }
  }
  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureTextMessageScanner dataFeaturesExtractedInContextAndMain](self, "dataFeaturesExtractedInContextAndMain");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner enrichEvents:messageUnits:dateInSubject:dataFeatures:](self, "enrichEvents:messageUnits:dateInSubject:dataFeatures:", v33, v34, 0, v35);

  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v36 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v36 = _IPLogHandle;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "valueForKey:", CFSTR("ipsos_betterDescription"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = (uint64_t)v39;
      _os_log_impl(&dword_219581000, v37, OS_LOG_TYPE_INFO, "Enriched Events based on Event Type: %@ #FeatureManager", buf, 0xCu);

    }
  }
  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner adjustTimeForEvents:](self, "adjustTimeForEvents:", v40);

  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureTextMessageScanner confidenceForEvents:](self, "confidenceForEvents:", v41);

  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureTextMessageScanner experimentalConfidenceForEvents:](self, "experimentalConfidenceForEvents:", v42);

  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "originalMessage");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dateSent");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner filteredEventsForDetectedEvents:referenceDate:](self, "filteredEventsForDetectedEvents:referenceDate:", v43, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner setFilteredDetectedEvents:](self, "setFilteredDetectedEvents:", v48);

  v49 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v49 = _IPLogHandle;
  }
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = v49;
    -[IPFeatureScanner filteredDetectedEvents](self, "filteredDetectedEvents");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");
    *(_DWORD *)buf = 134217984;
    v67 = v52;
    _os_log_impl(&dword_219581000, v50, OS_LOG_TYPE_INFO, "%lu detected events after filtering #FeatureManager", buf, 0xCu);

  }
  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v53 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v53 = _IPLogHandle;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = v53;
      -[IPFeatureScanner filteredDetectedEvents](self, "filteredDetectedEvents");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "valueForKey:", CFSTR("ipsos_betterDescription"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = (uint64_t)v56;
      _os_log_impl(&dword_219581000, v54, OS_LOG_TYPE_INFO, "Filtered Events: %@ #FeatureManager", buf, 0xCu);

    }
  }
  -[IPFeatureScanner filteredDetectedEvents](self, "filteredDetectedEvents");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");

  if (v58 < 2)
  {
    -[IPFeatureScanner filteredDetectedEvents](self, "filteredDetectedEvents");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner normalizedEvents:](self, "normalizedEvents:", v61);

    -[IPFeatureScanner filteredDetectedEvents](self, "filteredDetectedEvents");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "count");

    -[IPFeatureScanner filteredDetectedEvents](self, "filteredDetectedEvents");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, BOOL))v65)[2](v65, v64, v63 != 0);

  }
  else
  {
    v59 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v59 = _IPLogHandle;
    }
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v59, OS_LOG_TYPE_INFO, "Bailing out because more than 1 EVENT are detected #FeatureManager", buf, 2u);
    }
    -[IPFeatureScanner setResultType:](self, "setResultType:", -68);
    v60 = -[IPFeatureScanner resultType](self, "resultType");
    v65[2](v65, MEMORY[0x24BDBD1A8], v60);
  }

}

- (unint64_t)mainSentencePolarityFrom:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = 0.0;
    v8 = 1;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v11, "fragments", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "mainPolarity");
              switch(v17)
              {
                case 2:
                  v7 = v7 + 1.0;
                  break;
                case 3:
                  v9 = v9 + 1.0;
                  break;
                case 4:
                  v8 = 4;
                  goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v14);
        }
LABEL_19:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
    if (v7 <= 0.0)
    {
      if (v9 > 0.0)
        v8 = 3;
    }
    else
    {
      v8 = 2;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)processScanOfMainMessageUnit:(id)a3 contextMessageUnits:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t n;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  IPFeatureTextMessageScanner *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t m;
  void *v70;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  unint64_t v84;
  id v85;
  id v86;
  IPFeatureTextMessageScanner *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  const __CFString *v110;
  void *v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v7, "count");
  v10 = -[IPFeatureTextMessageScanner mainSentencePolarityFromMessageUnit:index:](self, "mainSentencePolarityFromMessageUnit:index:", v6, v8);
  if (v10 != 4)
  {
    v84 = v10;
    v14 = (id)objc_opt_new();
    v20 = (void *)objc_opt_new();
    v90 = v9;
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", i);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[IPFeatureTextMessageScanner mainSentencePolarityFromMessageUnit:index:](self, "mainSentencePolarityFromMessageUnit:index:", v22, i) & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          objc_msgSend(v22, "text");
          v23 = self;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "appendString:", v24);

          objc_msgSend(v20, "appendString:", CFSTR("\n"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v25);

          self = v23;
          v9 = v90;
        }

      }
    }
    -[IPFeatureTextMessageScanner keywordFeaturesForMessageUnit:](self, "keywordFeaturesForMessageUnit:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");
    -[IPFeatureScanner setBodyKeywordFeatures:](self, "setBodyKeywordFeatures:", v27);

    if (objc_msgSend(v20, "length"))
    {
      v110 = CFSTR("IPFeatureExtractorContextText");
      v111 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    v80 = (void *)v28;
    -[IPFeatureTextMessageScanner dataDetectorsFeaturesForMessageUnit:context:](self, "dataDetectorsFeaturesForMessageUnit:context:", v6, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");
    -[IPFeatureScanner setBodyDataDetectorsFeatures:](self, "setBodyDataDetectorsFeatures:", v30);

    -[IPFeatureTextMessageScanner dataFeaturesExtractedInContextAndMain](self, "dataFeaturesExtractedInContextAndMain");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner bodyDataDetectorsFeatures](self, "bodyDataDetectorsFeatures");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v32);

    v33 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[IPFeatureScanner bodyDataDetectorsFeatures](self, "bodyDataDetectorsFeatures");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithArray:", v34);

    -[IPFeatureScanner bodySentenceFeatures](self, "bodySentenceFeatures");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v36);

    -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v37);

    v83 = v35;
    -[IPFeatureScanner setBodyAllFeatures:](self, "setBodyAllFeatures:", v35);
    v38 = v90;
    v82 = v6;
    if ((v84 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "count"))
      {

      }
      else
      {
        -[IPFeatureScanner bodyDataDetectorsFeatures](self, "bodyDataDetectorsFeatures");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (!v41)
        {
          -[IPFeatureTextMessageScanner detectedEventsInContext](self, "detectedEventsInContext");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "count");

          if (!v73)
          {
            v19 = (void *)MEMORY[0x24BDBD1A8];
            goto LABEL_45;
          }
          -[IPFeatureTextMessageScanner detectedEventsInContext](self, "detectedEventsInContext");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "lastObject");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v61 = v75;
          v76 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v100;
            do
            {
              for (j = 0; j != v77; ++j)
              {
                if (*(_QWORD *)v100 != v78)
                  objc_enumerationMutation(v61);
                objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * j), "setIpsos_eventStatus:", -[IPFeatureScanner eventStatusFromPolarity:](self, "eventStatusFromPolarity:", v84));
              }
              v77 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
            }
            while (v77);
            v19 = v61;
          }
          else
          {
            v19 = v61;
          }
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }
      }
    }
    v87 = self;
    v81 = v20;
    v88 = (void *)objc_opt_new();
    if (v90)
    {
      v42 = 0;
      v43 = 0;
      v44 = MEMORY[0x24BDBD1C8];
      v85 = v14;
      v86 = v7;
      do
      {
        v45 = v7;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v14, "containsObject:", v47);

        if (v48)
        {
          v89 = v46;
          -[IPFeatureTextMessageScanner keywordFeaturesForMessageUnit:](v87, "keywordFeaturesForMessageUnit:", v46);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v96;
            do
            {
              for (k = 0; k != v51; ++k)
              {
                if (*(_QWORD *)v96 != v52)
                  objc_enumerationMutation(v49);
                v54 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * k);
                v55 = objc_msgSend(v54, "matchRange") + v42;
                objc_msgSend(v54, "matchRange");
                objc_msgSend(v54, "setMatchRange:", v55, v56);
                objc_msgSend(v54, "contextDictionary");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "setObject:forKeyedSubscript:", v44, CFSTR("extractedInSubject"));

              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
            }
            while (v51);
          }
          objc_msgSend(v88, "addObjectsFromArray:", v49);

          v14 = v85;
          v45 = v86;
          v46 = v89;
          v38 = v90;
        }
        objc_msgSend(v46, "text");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v42 += objc_msgSend(v58, "length");

        ++v43;
        v7 = v45;
      }
      while (v43 != v38);
    }
    -[IPFeatureScanner bodyKeywordFeatures](v87, "bodyKeywordFeatures");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "mutableCopy");

    v61 = v88;
    objc_msgSend(v60, "addObjectsFromArray:", v88);
    -[IPFeatureScanner analyzeFeatures:messageUnit:checkPolarity:polarity:](v87, "analyzeFeatures:messageUnit:checkPolarity:polarity:", v83, v6, 0, v84);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v6, "originalMessage");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setSubject:", v81);

      -[IPFeatureScanner bodyDataDetectorsFeatures](v87, "bodyDataDetectorsFeatures");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      +[IPEventClassificationType eventClassificationTypeFromMessageUnit:keywordFeatures:datafeatures:](IPEventClassificationType, "eventClassificationTypeFromMessageUnit:keywordFeatures:datafeatures:", v6, v60, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v65 = v19;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v92;
        do
        {
          for (m = 0; m != v67; ++m)
          {
            if (*(_QWORD *)v92 != v68)
              objc_enumerationMutation(v65);
            v70 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * m);
            objc_msgSend(v70, "setIpsos_eventClassificationType:", v64);
            objc_msgSend(v70, "setIpsos_eventAttributes:", objc_msgSend(v70, "ipsos_eventAttributes") | 4);
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
        }
        while (v67);
      }

      v6 = v82;
      v61 = v88;
    }

    v20 = v81;
    goto LABEL_44;
  }
  -[IPFeatureTextMessageScanner detectedEventsInContext](self, "detectedEventsInContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v104;
    do
    {
      for (n = 0; n != v16; ++n)
      {
        if (*(_QWORD *)v104 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * n), "setIpsos_eventStatus:", 3);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
    }
    while (v16);
  }
  v19 = v14;
LABEL_46:

  return v19;
}

- (id)dataDetectorsFeaturesForMessageUnit:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "dataDetectorsFeatureExtractor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v11, v6, v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataFeatures:", v12);

  }
  objc_msgSend(v6, "dataFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)sentenceFeaturesForMessageUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "sentenceFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "sentenceFeatureExtractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v7, v4, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setSentenceFeatures:", v9);
  }
  objc_msgSend(v4, "sentenceFeatures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)keywordFeaturesForMessageUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "keywordFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "keywordFeatureExtractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseTextTruncated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v7, v4, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setKeywordFeatures:", v9);
  }
  objc_msgSend(v4, "keywordFeatures");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)mainSentencePolarityFromMessageUnit:(id)a3 index:(unint64_t)a4
{
  void *v5;
  unint64_t v6;

  -[IPFeatureTextMessageScanner sentenceFeaturesForMessageUnit:](self, "sentenceFeaturesForMessageUnit:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IPFeatureTextMessageScanner mainSentencePolarityFrom:](self, "mainSentencePolarityFrom:", v5);

  return v6;
}

- (void)resetScanState
{
  void *v3;
  void *v4;
  objc_super v5;

  -[IPFeatureTextMessageScanner setContextMessageUnits:](self, "setContextMessageUnits:", MEMORY[0x24BDBD1A8]);
  v3 = (void *)objc_opt_new();
  -[IPFeatureTextMessageScanner setDetectedEventsInContext:](self, "setDetectedEventsInContext:", v3);

  v4 = (void *)objc_opt_new();
  -[IPFeatureTextMessageScanner setDataFeaturesExtractedInContextAndMain:](self, "setDataFeaturesExtractedInContextAndMain:", v4);

  -[IPFeatureTextMessageScanner setFollowProposal:](self, "setFollowProposal:", 0);
  v5.receiver = self;
  v5.super_class = (Class)IPFeatureTextMessageScanner;
  -[IPFeatureScanner resetScanState](&v5, sel_resetScanState);
}

- (void)confidenceForEvents:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  double v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  double v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IPFeatureScanner detectedEvents](self, "detectedEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= 4)
  {
    -[IPFeatureScanner detectedEvents](self, "detectedEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= 3)
    {
      -[IPFeatureScanner detectedEvents](self, "detectedEvents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 <= 2)
        v7 = 1.0;
      else
        v7 = 0.95;
    }
    else
    {
      v7 = 0.9;
    }
  }
  else
  {
    v7 = 0.7;
  }
  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >= 4)
  {
    v14 = 0.75;
LABEL_12:
    v7 = v7 * v14;
    goto LABEL_15;
  }
  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 >= 3)
  {
    v14 = 0.85;
    goto LABEL_12;
  }
  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 > 1)
    v7 = v7 * 0.95;
LABEL_15:
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 > 5)
    v7 = v7 * 0.9;
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 >= 4)
  {
    v23 = 1.15;
LABEL_21:
    v7 = v7 * v23;
    goto LABEL_24;
  }
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25 >= 3)
  {
    v23 = 1.1;
    goto LABEL_21;
  }
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 > 1)
    v7 = v7 * 1.05;
LABEL_24:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = v4;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v37 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[IPFeatureTextMessageScanner confidenceForEvent:baseConfidence:](self, "confidenceForEvent:baseConfidence:", v33, v7, (_QWORD)v36);
        v7 = v34;
        v35 = fmin(v34, 1.0);
        if (v35 < 0.0)
          v35 = 0.0;
        objc_msgSend(v33, "setIpsos_confidence:", v35);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v30);
  }

}

- (double)confidenceForEvent:(id)a3 baseConfidence:(double)a4
{
  id v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "isAllDay"))
  {
    v6 = 0.95;
LABEL_5:
    a4 = a4 * v6;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "ipsos_usesDefaultClassificationTypeStartTime"))
  {
    v6 = 0.8;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "ipsos_isTimeApproximate"))
    a4 = a4 * 0.8;
LABEL_8:
  if (objc_msgSend(v5, "ipsos_isDateTimeTenseDependent"))
    a4 = a4 * 0.8;
  if (objc_msgSend(v5, "ipsos_timeNeedsMeridianGuess"))
    a4 = a4 * 0.9;
  v20 = 0u;
  v21 = 0u;
  if (objc_msgSend(v5, "ipsos_isEventTimeOnlyAndReferrengingToSentDate"))
    a4 = a4 * 0.75;
  v22 = 0uLL;
  v23 = 0uLL;
  objc_msgSend(v5, "ipsos_dataFeatures", (_QWORD)v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "contextDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("polarityProbability"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "doubleValue");
          if (v16 <= 0.001)
            v16 = -0.0;
          else
            v11 = v11 + 1.0;
          v12 = v12 + v16;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);

    if (v11 > 0.0)
      a4 = a4 * ((1.0 - v12 / v11) * -0.5 + 1.0);
  }
  else
  {

  }
  objc_msgSend(v5, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (!v18)
    a4 = a4 * 0.85;

  return a4;
}

- (void)experimentalConfidenceForEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IPFeatureTextMessageScanner commonComponentsForConfidence](self, "commonComponentsForConfidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IPFeatureTextMessageScannerConfidenceNormTextLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7 < 27.5;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IPFeatureTextMessageScannerConfidenceNumberOfEventTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 >= 2)
  {
    if (v10 >= 4)
      v11 = dbl_2195AA020[v10 < 6];
    else
      v11 = 0.05;
  }
  else
  {
    v11 = -0.05;
  }
  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = dbl_2195AA010[v8] + v11;
    if (v13 > 1)
      v19 = v19 + -0.02;
    v20 = dbl_2195AA030[v15 == 1];
    if (!v15)
      v20 = -0.04;
    v21 = v19 + v20;
    v22 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v16);
        v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[IPFeatureTextMessageScanner experimentalConfidenceForEvent:experimentalBaseConfidence:](self, "experimentalConfidenceForEvent:experimentalBaseConfidence:", v24, v21, (_QWORD)v26);
        v21 = v25;
        objc_msgSend(v24, "setIpsos_experimentalConfidence:");
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

}

- (double)experimentalConfidenceForEvent:(id)a3 experimentalBaseConfidence:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  void *v23;
  _BOOL4 v24;
  double v25;

  v6 = a3;
  -[IPFeatureTextMessageScanner eventSpecificComponentsForConfidence:](self, "eventSpecificComponentsForConfidence:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IPFeatureTextMessageScannerConfidenceMatchedRatio"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v10 >= 0.02)
  {
    if (v10 >= 0.04)
    {
      if (v10 >= 0.06)
      {
        if (v10 >= 0.11)
          v11 = dbl_2195AA040[v10 < 0.15];
        else
          v11 = 0.03;
      }
      else
      {
        v11 = -0.01;
      }
    }
    else
    {
      v11 = -0.02;
    }
  }
  else
  {
    v11 = -0.13;
  }
  v12 = v11 + a4;
  v13 = objc_msgSend(v6, "ipsos_isTimeApproximate");
  v14 = 0.03;
  if (v13)
    v14 = -0.08;
  v15 = v12 + v14;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IPFeatureTextMessageScannerConfidenceDistanceToDates"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v18 >= 0.97)
    v19 = v15 + 0.1;
  else
    v19 = v15;
  if (objc_msgSend(v6, "ipsos_usesDefaultClassificationTypeStartTime"))
    v19 = v19 + 0.01;
  v20 = objc_msgSend(v6, "isAllDay");
  v21 = -0.24;
  if (!v20)
    v21 = 0.01;
  v22 = v19 + v21;
  objc_msgSend(v6, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "length") == 0;
  v25 = v22 + dbl_2195AA050[v24];

  return v25;
}

- (id)eventSpecificComponentsForConfidence:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEF0];
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[IPFeatureTextMessageScanner contextMessageUnits](self, "contextMessageUnits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "keywordFeatures");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v9);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = v13;
    v17 = 0;
    v18 = *(_QWORD *)v39;
    v19 = 0.0;
    v20 = 0.0;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v22, "eventTypes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ipsos_eventClassificationType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "containsObject:", v24);

        if (v25)
        {
          objc_msgSend(v22, "contextDictionary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("IPFeatureKeywordContextDistanceToDate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          v20 = v20 + v28;

          objc_msgSend(v22, "contextDictionary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("IPFeatureKeywordContextMatchedRatio"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v19 = v19 + v31;

          ++v17;
        }
      }
      v15 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v15);
    v13 = v16;

    v32 = (void *)v36;
    if (v17 >= 1)
      v20 = v20 / (double)v17;
  }
  else
  {

    v19 = 0.0;
    v20 = 0.0;
    v32 = (void *)v36;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("IPFeatureTextMessageScannerConfidenceDistanceToDates"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("IPFeatureTextMessageScannerConfidenceMatchedRatio"));

  return v32;
}

- (id)commonComponentsForConfidence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t ii;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v86;
  void *v87;
  IPFeatureTextMessageScanner *v88;
  id obj;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  char *v93;
  id v94;
  uint8_t buf[16];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  void *v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEF0];
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v88 = self;
  -[IPFeatureTextMessageScanner contextMessageUnits](self, "contextMessageUnits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v121 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "keywordFeatures");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v117 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * j), "eventTypes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectsFromArray:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
    }
    while (v16);
  }

  v86 = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("IPFeatureTextMessageScannerConfidenceNumberOfEventTypes"));

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = v14;
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
  if (v91)
  {
    v90 = *(_QWORD *)v113;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v113 != v90)
          objc_enumerationMutation(obj);
        v93 = v22;
        v23 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v22);
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        objc_msgSend(v23, "eventTypes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v109;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v109 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
              objc_msgSend(v29, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v31)
              {
                objc_msgSend(v29, "identifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_24DADF5C0, v32);

              }
              v33 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v29, "identifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "numberWithInt:", objc_msgSend(v35, "intValue") + 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v36, v37);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
          }
          while (v26);
        }

        v22 = v93 + 1;
      }
      while (v93 + 1 != (char *)v91);
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
    }
    while (v91);
  }

  objc_msgSend(v21, "allValues");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v38;
  if (objc_msgSend(v38, "count"))
  {
    v39 = (void *)MEMORY[0x24BDD1548];
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v127, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "expressionForFunction:arguments:", CFSTR("stddev:"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "expressionValueWithObject:context:", 0, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    v45 = v44;

  }
  else
  {
    v45 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKeyedSubscript:", v46, CFSTR("IPFeatureTextMessageScannerConfidenceEventVariance"));

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  -[IPFeatureTextMessageScanner contextMessageUnits](v88, "contextMessageUnits");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner bodyMessageUnits](v88, "bodyMessageUnits");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "arrayByAddingObjectsFromArray:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = v49;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
  if (v50)
  {
    v51 = v50;
    v52 = 0;
    v53 = 0;
    v54 = *(_QWORD *)v105;
    do
    {
      for (m = 0; m != v51; ++m)
      {
        if (*(_QWORD *)v105 != v54)
          objc_enumerationMutation(v94);
        v56 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * m);
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        objc_msgSend(v56, "sentenceFeatures");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v101;
          do
          {
            for (n = 0; n != v59; ++n)
            {
              if (*(_QWORD *)v101 != v60)
                objc_enumerationMutation(v57);
              v62 = objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * n), "polarity");
              if (v62 == 4)
              {
                if ((v52 & 0xFFFFFFFFFFFFFFFELL) == 2)
                  v53 = (v53 + 1);
                else
                  v53 = v53;
                v52 = 4;
              }
              else if ((v62 & 0xFFFFFFFFFFFFFFFELL) == 2)
              {
                if (v52 == 4)
                  v53 = (v53 + 1);
                else
                  v53 = v53;
                v52 = v62;
              }
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
          }
          while (v59);
        }

      }
      v51 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
    }
    while (v51);
  }
  else
  {
    v53 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v53);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKeyedSubscript:", v63, CFSTR("IPFeatureTextMessageScannerConfidencePolarityFlips"));

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[IPFeatureScanner bodyMessageUnits](v88, "bodyMessageUnits");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v97;
    v68 = 0.0;
    do
    {
      for (ii = 0; ii != v66; ++ii)
      {
        if (*(_QWORD *)v97 != v67)
          objc_enumerationMutation(v64);
        v70 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * ii);
        objc_msgSend(v70, "text");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "length");
        objc_msgSend(v70, "originalMessage");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "subject");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v68 + (double)(unint64_t)(objc_msgSend(v74, "length") + v72);

      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
    }
    while (v66);
  }
  else
  {
    v68 = 0.0;
  }

  -[IPFeatureScanner bodyMessageUnits](v88, "bodyMessageUnits");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "firstObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bestLanguageID");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(&unk_24DB10128, "objectForKeyedSubscript:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(&unk_24DB10128, "objectForKeyedSubscript:", v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "doubleValue");
    v68 = v68 * v80;

    v81 = v86;
    v82 = v92;
  }
  else
  {
    v83 = _IPLogHandle;
    v81 = v86;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v83 = _IPLogHandle;
    }
    v82 = v92;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219581000, v83, OS_LOG_TYPE_INFO, "No average sentence length information found for this locale #FeatureManager", buf, 2u);
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v68);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKeyedSubscript:", v84, CFSTR("IPFeatureTextMessageScannerConfidenceNormTextLength"));

  return v87;
}

- (NSArray)contextMessageUnits
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContextMessageUnits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)detectedEventsInContext
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDetectedEventsInContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)followProposal
{
  return self->_followProposal;
}

- (void)setFollowProposal:(BOOL)a3
{
  self->_followProposal = a3;
}

- (NSMutableArray)dataFeaturesExtractedInContextAndMain
{
  return self->_dataFeaturesExtractedInContextAndMain;
}

- (void)setDataFeaturesExtractedInContextAndMain:(id)a3
{
  objc_storeStrong((id *)&self->_dataFeaturesExtractedInContextAndMain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFeaturesExtractedInContextAndMain, 0);
  objc_storeStrong((id *)&self->_detectedEventsInContext, 0);
  objc_storeStrong((id *)&self->_contextMessageUnits, 0);
}

@end
