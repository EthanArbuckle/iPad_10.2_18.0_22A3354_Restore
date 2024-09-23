@implementation CDMSsuInferenceServiceGraph

+ (id)requiredDAGServices
{
  void *v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v9, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)requiresAssets
{
  return 1;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 5;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  NSObject *v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "+[CDMSsuInferenceServiceGraph getUsageForAssetSetName:withLocale:]";
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v8, 0x16u);

    }
    return 0;
  }
  else
  {
    +[CDMAssetsUtils getSsuUsages:](CDMAssetsUtils, "getSsuUsages:", a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

- (void)buildGraph
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  id location[2];

  objc_initWeak(location, self);
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__2015;
  v51[4] = __Block_byref_object_dispose__2016;
  v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__2015;
  v49[4] = __Block_byref_object_dispose__2016;
  v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__2015;
  v47[4] = __Block_byref_object_dispose__2016;
  v48 = 0;
  -[CDMServiceGraph getGraphInput](self, "getGraphInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getLanguage](self, "getLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__2015;
  v45[4] = __Block_byref_object_dispose__2016;
  objc_msgSend(v6, "ssuRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "utterance");
  v46 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ssuRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v37 = MEMORY[0x24BDAC760];
  v38 = 3221225472;
  v39 = __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke;
  v40 = &unk_24DCACFE8;
  v43 = v45;
  v12 = v7;
  v41 = v12;
  v44 = v51;
  v42 = v3;
  v24 = v42;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCurrentTokenize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ssuRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_383;
  v33[3] = &unk_24DCABDC8;
  v35 = v51;
  v36 = v49;
  v16 = v4;
  v34 = v16;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanization"), v16, v15, v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ssuRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_387;
  v25[3] = &unk_24DCABDF0;
  v20 = v6;
  v26 = v20;
  v21 = v12;
  v27 = v21;
  v29 = v49;
  v30 = v45;
  v31 = v47;
  v22 = v5;
  v28 = v22;
  objc_copyWeak(&v32, location);
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSSUMatching"), v22, v19, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addDependency:", v13);
  objc_msgSend(v23, "addDependency:", v17);

  objc_destroyWeak(&v32);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(v51, 8);
  objc_destroyWeak(location);
}

void __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v7, 0xCu);
  }

  +[CDMTokenizerProtoService createProtoTokenRequestWithText:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithText:locale:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "handle:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_383(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  CDMSpanMatcherRequestCommand *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSiriVocabularySpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E0C8]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "responses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequests:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequests:nlContext:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CDMSpanMatcherRequestCommand initWithRequests:]([CDMSpanMatcherRequestCommand alloc], "initWithRequests:", v5);
  objc_msgSend(*(id *)(a1 + 32), "handle:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v12 = 136315394;
    v13 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s SiriVocabularySpanMatchResponse: %@", (uint8_t *)&v12, 0x16u);
  }

}

void __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_387(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CDMSSURequestCommand *v13;
  CDMSSURequestCommand *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  CDMSsuInferenceGraphResponseCommand *v23;
  NSObject *v24;
  id WeakRetained;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v26 = 136315138;
    v27 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Building SSU request for use in CDMSSUService", (uint8_t *)&v26, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E2D0]);
  objc_msgSend(*(id *)(a1 + 32), "ssuRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNluRequestId:", v5);

  v6 = (void *)MEMORY[0x24BE9E320];
  v7 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "convertFromUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAsrId:", v8);

  objc_msgSend(v3, "setLocale:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "spanMatchResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchingSpans");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v3, "setMatchingSpans:", v11);
  objc_msgSend(v3, "setUtterance:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  objc_msgSend(v3, "setSalientEntities:", v12);
  v13 = -[CDMSSURequestCommand initWithParserRequest:]([CDMSSURequestCommand alloc], "initWithParserRequest:", v3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    __assert_rtn("-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke", "CDMSsuInferenceServiceGraph.m", 129, "ssuResponseCommand == nil");
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 48), "handle:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = objc_alloc_init(MEMORY[0x24BE9E110]);
  v19 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "ssuResponse");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hypotheses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithArray:", v21);
  objc_msgSend(v18, "setParses:", v22);

  v23 = -[CDMSsuInferenceGraphResponseCommand initWithSsuResponse:]([CDMSsuInferenceGraphResponseCommand alloc], "initWithSsuResponse:", v18);
  CDMOSLoggerForCategory(0);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v26 = 136315394;
    v27 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    v28 = 2112;
    v29 = v18;
    _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s CDMSsuInferenceGraphResponse: ssuResponse=%@", (uint8_t *)&v26, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "setGraphOutput:", v23);

}

@end
