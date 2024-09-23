@implementation CDMMDSServiceGraph

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
  return 3;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  return 0;
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
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  id location[2];

  objc_initWeak(location, self);
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__3178;
  v75[4] = __Block_byref_object_dispose__3179;
  v76 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__3178;
  v73[4] = __Block_byref_object_dispose__3179;
  v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__3178;
  v71[4] = __Block_byref_object_dispose__3179;
  v72 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__3178;
  v69[4] = __Block_byref_object_dispose__3179;
  v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__3178;
  v67[4] = __Block_byref_object_dispose__3179;
  v68 = 0;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("\n*** ✅ FOR DEBUGGING (start) ***"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getGraphInput](self, "getGraphInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriNLUTypeObj");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getLanguage](self, "getLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph validateRequest:](self, "validateRequest:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__3178;
  v65[4] = __Block_byref_object_dispose__3179;
  objc_msgSend(v9, "utterance");
  v31 = v9;
  v66 = (id)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph populateRequesterEnumForNluRequest:](self, "populateRequesterEnumForNluRequest:", v7);
  objc_msgSend(v7, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke;
  v58[3] = &unk_24DCABE68;
  v11 = v7;
  v59 = v11;
  v12 = v8;
  v60 = v12;
  v64 = v75;
  v13 = v3;
  v61 = v13;
  v14 = v5;
  v62 = v14;
  v15 = v6;
  v63 = v15;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCurrentTokenize"), v13, v10, v58);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "requestId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke_390;
  v51[3] = &unk_24DCABE90;
  v53 = v75;
  v54 = v65;
  v17 = v4;
  v52 = v17;
  v55 = v71;
  v56 = v69;
  v57 = v73;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doEmbedding"), v17, v16, v51);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v17;

  objc_msgSend(v11, "requestId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke_394;
  v41[3] = &unk_24DCABEB8;
  v20 = v32;
  v42 = v20;
  v21 = v11;
  v43 = v21;
  v45 = v65;
  v22 = v12;
  v44 = v22;
  v46 = v75;
  v47 = v71;
  v48 = v69;
  v49 = v67;
  objc_copyWeak(&v50, location);
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doMDSUaaPNLInference"), v20, v19, v41);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v22;

  objc_msgSend(v21, "requestId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke_2;
  v34[3] = &unk_24DCABEE0;
  v38 = v67;
  v39 = v75;
  v25 = v21;
  v35 = v25;
  v26 = v15;
  v36 = v26;
  v27 = v14;
  v37 = v27;
  objc_copyWeak(&v40, location);
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("doPostProcess"), v24, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addDependency:", v30);
  objc_msgSend(v23, "addDependency:", v18);
  objc_msgSend(v28, "addDependency:", v23);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v50);

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

  _Block_object_dispose(v69, 8);
  _Block_object_dispose(v71, 8);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  objc_destroyWeak(location);
}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMMDSServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asrOutputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithAsrOutputs:locale:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "handle:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  +[CDMServiceGraphUtil addDebugInfo:nluRequest:responseObject:](CDMServiceGraphUtil, "addDebugInfo:nluRequest:responseObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "dataDispatcherContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:](CDMDataDispatcher, "dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:", v9, v10, v11);

}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke_390(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  CDMEmbeddingProtoRequestCommand *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315138;
    v18 = "-[CDMMDSServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v17, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E1D8]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTokenChain:", v5);

  objc_msgSend(v3, "setText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v6 = -[CDMEmbeddingProtoRequestCommand initWithRequest:]([CDMEmbeddingProtoRequestCommand alloc], "initWithRequest:", v3);
  objc_msgSend(*(id *)(a1 + 32), "handle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v7, "embeddingConfigs");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  +[SiriNLUInternalEmbeddingConverter convertFromProtoEmbeddingResponseCommand:](SiriNLUInternalEmbeddingConverter, "convertFromProtoEmbeddingResponseCommand:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke_394(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id obj;
  id v20;

  v17 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v2 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "embeddingTensorOutputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), CFSTR("com.apple.siri.nl.uaap.mds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "currentTurnInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  obj = *(id *)(v9 + 40);
  v20 = 0;
  v18 = 0;
  v10 = (void *)v2;
  LOBYTE(v3) = +[CDMServiceGraphUtil runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTensor:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:](CDMServiceGraphUtil, "runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTensor:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:", v17, v2, v3, v16, v5, MEMORY[0x24BDBD1A8], v7, v8, &v20, &obj, &v18);
  v11 = v20;
  objc_storeStrong((id *)(v9 + 40), obj);
  v12 = v18;

  if ((v3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    objc_msgSend(WeakRetained, "failedWithError:", v12);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:](CDMDataDispatcher, "dispatchUaaPData:withResponse:requestId:", v11, v14, v15);

}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  +[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:](CDMPostProcessUtils, "runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:", 0, 0, 0, 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40),
    0,
    0,
    0,
    *(_QWORD *)(a1 + 32),
    *(_QWORD *)(a1 + 40),
    *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "setGraphOutput:", v3);

}

@end
