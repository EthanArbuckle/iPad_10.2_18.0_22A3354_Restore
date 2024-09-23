@implementation CDMHelloWorldServiceGraph

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

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 2;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  return 0;
}

+ (id)getAssetsForSetup:(id)a3
{
  return objc_alloc_init(CDMAssetsInfo);
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  id location[2];

  objc_initWeak(location, self);
  -[CDMServiceGraph getGraphInput](self, "getGraphInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriNLUTypeObj");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph validateRequest:](self, "validateRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__6147;
  v18[4] = __Block_byref_object_dispose__6148;
  objc_msgSend(v5, "utterance");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke;
  v17[3] = &unk_24DCAC6F8;
  v17[4] = v18;
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("doDummyTokenize"), v6, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_386;
  v15[3] = &unk_24DCAC720;
  v15[4] = v18;
  objc_copyWeak(&v16, location);
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("mockErrorInGraph"), v9, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "requestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_2;
  v13[3] = &unk_24DCAC720;
  v13[4] = v18;
  objc_copyWeak(&v14, location);
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("doDummyPostProcess"), v11, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addDependency:", v10);
  objc_msgSend(v12, "addDependency:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  _Block_object_dispose(v18, 8);
  objc_destroyWeak(location);
}

void __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = 136315394;
    v5 = "-[CDMHelloWorldServiceGraph buildGraph]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_INFO, "%s Dummy tokenize step as an example, utterance=%@", (uint8_t *)&v4, 0x16u);
  }

}

void __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_386(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(CFSTR("hello world: COVID happened 😢"), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    v2 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD0FC8];
    v7[0] = CFSTR("Testing that CDMHelloWorldServiceGraph produced error");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("mock error domain"), 23, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setError:", v4);

  }
}

void __39__CDMHelloWorldServiceGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  CDMAssistantNLUResponse *v6;
  id WeakRetained;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CDMHelloWorldServiceGraph buildGraph]_block_invoke_2";
    _os_log_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_INFO, "%s Dummy postProcess step which creates a dummy SIRINLUEXTERNALCDMNluResponse", (uint8_t *)&v8, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
  objc_msgSend(v3, "setIdA:", CFSTR("✋ Welcome to this dummy Hello World service graph. Have a nice day! ✅"));
  objc_msgSend(v3, "setConnectionId:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  v5 = objc_alloc_init(MEMORY[0x24BE9E088]);
  objc_msgSend(v5, "setRequestId:", v3);
  objc_msgSend(v5, "setParses:", v4);
  v6 = -[CDMAssistantNLUResponse initWithNLUResponse:requestId:]([CDMAssistantNLUResponse alloc], "initWithNLUResponse:requestId:", v5, CFSTR("✋ Welcome to this dummy Hello World service graph. Have a nice day! ✅"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setGraphOutput:", v6);

}

@end
