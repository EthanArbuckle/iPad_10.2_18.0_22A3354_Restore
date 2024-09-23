@implementation CDMEmbeddingServiceGraph

+ (id)requiredDAGServices
{
  void *v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
      v9 = "+[CDMEmbeddingServiceGraph getUsageForAssetSetName:withLocale:]";
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v8, 0x16u);

    }
    return 0;
  }
  else
  {
    +[CDMAssetsUtils getNLUsages:](CDMAssetsUtils, "getNLUsages:", a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 4;
}

+ (BOOL)requiresAssets
{
  return 1;
}

+ (id)responseFeatureStoreStreamId
{
  __CFString *v2;
  __CFString *v3;
  NSObject *v4;
  const char *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
LABEL_7:

      v2 = 0;
      return v2;
    }
    v7 = 136315138;
    v8 = "+[CDMEmbeddingServiceGraph responseFeatureStoreStreamId]";
    v5 = "%s Device not on internal build. Not inserting SubwordEmbeddingResponse to FeatureStore.";
LABEL_10:
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v7, 0xCu);
    goto LABEL_7;
  }
  if (!+[CDMUserDefaultsUtils isInsertEmbeddingOutputsToFeatureStoreEnabled](CDMUserDefaultsUtils, "isInsertEmbeddingOutputsToFeatureStoreEnabled"))
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    v7 = 136315138;
    v8 = "+[CDMEmbeddingServiceGraph responseFeatureStoreStreamId]";
    v5 = "%s UserDefault for inserting CDMEmbeddingGraph outputs to FeatureStore is not enabled. Not inserting SubwordEmb"
         "eddingResponse to FeatureStore.";
    goto LABEL_10;
  }
  v2 = CFSTR("SubwordEmbeddingResponse");
  v3 = CFSTR("SubwordEmbeddingResponse");
  return v2;
}

+ (id)serializeFeatureStoreWithResponseCmd:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "convertResponseToSubwordResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeExternalSubwordEmbeddingResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeExternalSubwordEmbeddingResponseWithResponse:formatType:", v3, CFSTR("json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  id location;

  objc_initWeak(&location, self);
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__9615;
  v33[4] = __Block_byref_object_dispose__9616;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__9615;
  v31[4] = __Block_byref_object_dispose__9616;
  v32 = 0;
  -[CDMServiceGraph getGraphInput](self, "getGraphInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getLanguage](self, "getLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__9615;
  v29[4] = __Block_byref_object_dispose__9616;
  objc_msgSend(v5, "text");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke;
  v24[3] = &unk_24DCACFE8;
  v27 = v29;
  v9 = v6;
  v25 = v9;
  v28 = v33;
  v10 = v3;
  v26 = v10;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCurrentTokenize"), v10, v7, v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "requestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = 3221225472;
  v17 = __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke_336;
  v18 = &unk_24DCAD018;
  v20 = v33;
  v21 = v29;
  v22 = v31;
  v13 = v4;
  v19 = v13;
  objc_copyWeak(&v23, &location);
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doEmbedding"), v13, v12, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addDependency:", v11, v15, v16, v17, v18);
  objc_destroyWeak(&v23);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
  objc_destroyWeak(&location);
}

void __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke(uint64_t a1)
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
    v8 = "-[CDMEmbeddingServiceGraph buildGraph]_block_invoke";
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

void __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke_336(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  CDMEmbeddingProtoRequestCommand *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CDMEmbeddingGraphResponseCommand *v10;
  id WeakRetained;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMEmbeddingServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v12, 0xCu);
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
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = -[CDMEmbeddingGraphResponseCommand initWithEmbeddingProtoResponseCommand:]([CDMEmbeddingGraphResponseCommand alloc], "initWithEmbeddingProtoResponseCommand:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "setGraphOutput:", v10);

}

@end
