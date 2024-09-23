@implementation CDMClient

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD0E70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("successFromSetup")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = CFSTR("successFromSetup");
LABEL_7:
      -[CDMClient setValue:forKey:](self, "setValue:forKey:", v10, v11);
    }
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("errorFromSetup")))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("daemonKilled")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_15;
        -[CDMClient setValue:forKey:](self, "setValue:forKey:", v10, CFSTR("daemonKilled"));
        CDMOSLoggerForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = 136315394;
          v14 = "-[CDMClient observeValueForKeyPath:ofObject:change:context:]";
          v15 = 2112;
          v16 = v10;
          _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Setting daemonKilled to: %@", (uint8_t *)&v13, 0x16u);
        }
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = 136315394;
          v14 = "-[CDMClient observeValueForKeyPath:ofObject:change:context:]";
          v15 = 2112;
          v16 = v8;
          _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Not expecting keyPath %@", (uint8_t *)&v13, 0x16u);
        }
      }

      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = CFSTR("errorFromSetup");
      goto LABEL_7;
    }
  }
LABEL_15:

}

- (void)setupWithLocale:(id)a3 embeddingVersion:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  CDMClientSetup *v14;
  void *v15;
  CDMClientSetup *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = objc_msgSend(v9, "length");
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      v18 = 136315650;
      v19 = "-[CDMClient(Embedding) setupWithLocale:embeddingVersion:completionHandler:]";
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDM Embedding client graph setup, locale=%@, version=%@", (uint8_t *)&v18, 0x20u);
    }

    v14 = [CDMClientSetup alloc];
    +[CDMClient graphNameForEmbedding](CDMClient, "graphNameForEmbedding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CDMClientSetup initWithLocaleIdentifier:embeddingVersion:sandboxId:activeServiceGraph:](v14, "initWithLocaleIdentifier:embeddingVersion:sandboxId:activeServiceGraph:", v8, v9, 0, v15);

    -[CDMClient setup:completionHandler:](self, "setup:completionHandler:", v16, v10);
  }
  else
  {
    if (v13)
    {
      v18 = 136315138;
      v19 = "-[CDMClient(Embedding) setupWithLocale:embeddingVersion:completionHandler:]";
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDM Embedding client embedding version cannot be empty. Setup is failed.", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CDM Embedding client embedding version cannot be empty. Setup is failed."));
    v16 = (CDMClientSetup *)objc_claimAutoreleasedReturnValue();
    -[CDMClientInterface createNSError:errorCode:](self, "createNSError:errorCode:", v16, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17);

    v10 = (void (**)(id, uint64_t))v17;
  }

}

- (void)setup:(id)a3 completionHandler:(id)a4
{
  -[CDMClientInterface setup:completionHandler:](self->_client, "setup:completionHandler:", a3, a4);
}

- (void)initProxyObject:(BOOL)a3 delegate:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  CDMXPCClient *v8;
  void *client;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  CDMFoundationClient *v13;
  CDMClientInterface *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v4)
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315138;
      v16 = "-[CDMClient initProxyObject:delegate:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Creating CDMXPCClient", (uint8_t *)&v15, 0xCu);
    }

    v8 = -[CDMXPCClient initWithDelegate:]([CDMXPCClient alloc], "initWithDelegate:", v6);
    client = self->_client;
    self->_client = &v8->super;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315138;
      v16 = "-[CDMClient initProxyObject:delegate:]";
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Creating CDMFoundationClient", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    client = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315394;
      v16 = "-[CDMClient initProxyObject:delegate:]";
      v17 = 2112;
      v18 = client;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Calling bundle ID %@", (uint8_t *)&v15, 0x16u);
    }

    v13 = -[CDMFoundationClient initWithDelegate:withCallingBundleId:]([CDMFoundationClient alloc], "initWithDelegate:withCallingBundleId:", v6, client);
    v14 = self->_client;
    self->_client = &v13->super;

  }
}

+ (id)graphNameForEmbedding
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CDMClient)init
{
  -[CDMClient sharedInitTasks](self, "sharedInitTasks");
  -[CDMClient initProxyObject:delegate:](self, "initProxyObject:delegate:", +[CDMClient useXPC](CDMClient, "useXPC"), 0);
  -[CDMClient setupKVOForwarding](self, "setupKVOForwarding");
  return self;
}

- (void)sharedInitTasks
{
  +[CDMLogging CDMLogInitIfNeeded](CDMLogging, "CDMLogInitIfNeeded");
}

- (void)setupKVOForwarding
{
  -[CDMClientInterface addObserver:forKeyPath:options:context:](self->_client, "addObserver:forKeyPath:options:context:", self, CFSTR("successFromSetup"), 1, 0);
  -[CDMClientInterface addObserver:forKeyPath:options:context:](self->_client, "addObserver:forKeyPath:options:context:", self, CFSTR("errorFromSetup"), 1, 0);
  -[CDMClientInterface addObserver:forKeyPath:options:context:](self->_client, "addObserver:forKeyPath:options:context:", self, CFSTR("daemonKilled"), 1, 0);
}

+ (BOOL)useXPC
{
  return +[CDMFeatureFlags isCDMClientXPCEnabled](CDMFeatureFlags, "isCDMClientXPCEnabled");
}

- (CDMClient)initWithDelegate:(id)a3
{
  id v4;

  v4 = a3;
  -[CDMClient sharedInitTasks](self, "sharedInitTasks");
  -[CDMClient initProxyObject:delegate:](self, "initProxyObject:delegate:", +[CDMClient useXPC](CDMClient, "useXPC"), v4);
  -[CDMClient setupKVOForwarding](self, "setupKVOForwarding");

  return self;
}

- (CDMClient)initWithXPCDelegate:(BOOL)a3 withDelegate:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  -[CDMClient sharedInitTasks](self, "sharedInitTasks");
  -[CDMClient initProxyObject:delegate:](self, "initProxyObject:delegate:", v4, v6);
  -[CDMClient setupKVOForwarding](self, "setupKVOForwarding");

  return self;
}

- (CDMClient)initWithXPC:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CDMClient sharedInitTasks](self, "sharedInitTasks");
  -[CDMClient initProxyObject:delegate:](self, "initProxyObject:delegate:", v3, 0);
  -[CDMClient setupKVOForwarding](self, "setupKVOForwarding");
  return self;
}

- (void)dealloc
{
  CDMClientInterface *v3;
  objc_super v4;

  v3 = self->_client;
  objc_sync_enter(v3);
  -[CDMClientInterface removeObserver:forKeyPath:](self->_client, "removeObserver:forKeyPath:", self, CFSTR("successFromSetup"));
  -[CDMClientInterface removeObserver:forKeyPath:](self->_client, "removeObserver:forKeyPath:", self, CFSTR("errorFromSetup"));
  -[CDMClientInterface removeObserver:forKeyPath:](self->_client, "removeObserver:forKeyPath:", self, CFSTR("daemonKilled"));
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)CDMClient;
  -[CDMClient dealloc](&v4, sel_dealloc);
}

- (BOOL)daemonKilled
{
  return -[CDMClientInterface daemonKilled](self->_client, "daemonKilled");
}

- (BOOL)successFromSetup
{
  return -[CDMClientInterface successFromSetup](self->_client, "successFromSetup");
}

- (id)errorFromSetup
{
  return -[CDMClientInterface errorFromSetup](self->_client, "errorFromSetup");
}

- (BOOL)areAssetsAvailable:(id)a3
{
  return -[CDMClientInterface areAssetsAvailable:](self->_client, "areAssetsAvailable:", a3);
}

- (BOOL)registerWithAssetsDelegate:(id)a3
{
  CDMClient *v4;
  CDMClientInterface *v5;
  id v6;

  v4 = self;
  v5 = self->_client;
  v6 = a3;
  objc_sync_enter(v5);
  LOBYTE(v4) = -[CDMClientInterface registerWithAssetsDelegate:](v4->_client, "registerWithAssetsDelegate:", v6);

  objc_sync_exit(v5);
  return (char)v4;
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  CDMClientInterface *v7;
  id v8;

  v7 = self->_client;
  v8 = a3;
  objc_sync_enter(v7);
  LOBYTE(a4) = -[CDMClientInterface registerWithAssetsDelegate:withType:](self->_client, "registerWithAssetsDelegate:withType:", v8, a4);

  objc_sync_exit(v7);
  return a4;
}

- (void)setup:(id)a3
{
  -[CDMClientInterface setup:](self->_client, "setup:", a3);
}

- (void)warmupWithCompletionHandler:(id)a3
{
  -[CDMClientInterface warmupWithCompletionHandler:](self->_client, "warmupWithCompletionHandler:", a3);
}

- (void)processCDMNluRequest:(id)a3
{
  -[CDMClientInterface processCDMNluRequest:](self->_client, "processCDMNluRequest:", a3);
}

- (void)processCDMNluRequest:(id)a3 completionHandler:(id)a4
{
  -[CDMClientInterface processCDMNluRequest:completionHandler:](self->_client, "processCDMNluRequest:completionHandler:", a3, a4);
}

- (void)setDataDispatcherContext:(id)a3
{
  -[CDMClientInterface setDataDispatcherContext:](self->_client, "setDataDispatcherContext:", a3);
}

- (void)waitForDataDispatcherCompletion
{
  -[CDMClientInterface waitForDataDispatcherCompletion](self->_client, "waitForDataDispatcherCompletion");
}

- (void)doServiceCenterInitWithConfig:(id)a3
{
  -[CDMClientInterface doServiceCenterInitWithConfig:](self->_client, "doServiceCenterInitWithConfig:", a3);
}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
  -[CDMClientInterface doHandleCommand:forCallback:](self->_client, "doHandleCommand:forCallback:", a3, a4);
}

- (BOOL)isLighthouseAPIEnabled
{
  return -[CDMClientInterface isLighthouseAPIEnabled](self->_client, "isLighthouseAPIEnabled");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setupWithLocale:(id)a3 forGraph:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  CDMClientSetup *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = a3;
  +[CDMClient defaultGraphNameForPlanner](CDMClient, "defaultGraphNameForPlanner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v11 = v13;

    v10 = v11;
  }
  v12 = -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:]([CDMClientSetup alloc], "initWithLocaleIdentifier:sandboxId:activeServiceGraph:", v9, 0, v10);

  -[CDMClient setup:completionHandler:](self, "setup:completionHandler:", v12, v8);
}

- (void)processPlannerRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, CDMPlannerGraphRequestCommand *);
  NSObject *v8;
  void *v9;
  void *v10;
  CDMPlannerGraphRequestCommand *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  CDMPlannerGraphRequestCommand *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  CDMClient *v20;
  void (**v21)(id, _QWORD, CDMPlannerGraphRequestCommand *);
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  CDMPlannerGraphRequestCommand *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, CDMPlannerGraphRequestCommand *))a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "jsonTranscript");
    v15 = (CDMPlannerGraphRequestCommand *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]";
    v26 = 2112;
    v27 = v15;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s processPlannerRequest for %@", buf, 0x16u);

  }
  if (-[CDMClient daemonKilled](self, "daemonKilled"))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23 = CFSTR("assistant_cdmd has been killed. Please call setup to ensure CDM can handle requests.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("CDMXPCClientErrorDomain"), 0, v10);
    v11 = (CDMPlannerGraphRequestCommand *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]";
      v26 = 2112;
      v27 = v11;
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v7[2](v7, 0, v11);
  }
  else
  {
    v11 = -[CDMPlannerGraphRequestCommand initWithPlannerRequest:]([CDMPlannerGraphRequestCommand alloc], "initWithPlannerRequest:", v6);
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]";
      v26 = 2112;
      v27 = v11;
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Created CDMPlannerGraphRequestCommand to pass into CDMPlannerServiceGraph, %@", buf, 0x16u);
    }

    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __62__CDMClient_Planner__processPlannerRequest_completionHandler___block_invoke;
    v19 = &unk_24DCAC880;
    v20 = self;
    v21 = v7;
    v14 = _Block_copy(&v16);
    -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v11, v14, v16, v17, v18, v19);

  }
}

void __62__CDMClient_Planner__processPlannerRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = (uint64_t)v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s CDM Planner client graph finished processing, output=%@, error=%@", buf, 0x20u);
  }

  if (v6)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v19 = "-[CDMClient(Planner) processPlannerRequest:completionHandler:]_block_invoke";
      v20 = 2080;
      v21 = v17;
      _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v5;
      objc_msgSend(v9, "plannerResponse");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "plannerResponse");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "commandName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Expecting CDMGenericSendCommand, but got %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "createNSError:errorCode:", v14, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

+ (id)defaultGraphNameForPlanner
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)graphNamesForPlanner
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)processNLUPreprocessRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CDMNLUPreprocessRequestCommand *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  CDMClient *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = -[CDMNLUPreprocessRequestCommand initWithNLURequest:]([CDMNLUPreprocessRequestCommand alloc], "initWithNLURequest:", v7);

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __74__CDMClient_NLUPreprocess__processNLUPreprocessRequest_completionHandler___block_invoke;
  v14 = &unk_24DCAC880;
  v15 = self;
  v16 = v6;
  v9 = v6;
  v10 = _Block_copy(&v11);
  -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v8, v10, v11, v12, v13, v14, v15);

}

void __74__CDMClient_NLUPreprocess__processNLUPreprocessRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v15 = "-[CDMClient(NLUPreprocess) processNLUPreprocessRequest:completionHandler:]_block_invoke";
      v16 = 2080;
      v17 = objc_msgSend(v13, "UTF8String");
      _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "preprocessingWrapper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "commandName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Expecting CDMNLUPreprocessResponseCommand, but got %@"), v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "createNSError:errorCode:", v9, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

- (void)setupNLUWithLocale:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CDMClientSetup *v9;
  void *v10;
  CDMClientSetup *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315394;
    v13 = "-[CDMClient(NLU) setupNLUWithLocale:completionHandler:]";
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s CDM NLU client graph setup, locale=%@", (uint8_t *)&v12, 0x16u);
  }

  v9 = [CDMClientSetup alloc];
  +[CDMClient graphNameForNLU](CDMClient, "graphNameForNLU");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:](v9, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:", v6, 0, v10);

  -[CDMClient setup:completionHandler:](self, "setup:completionHandler:", v11, v7);
}

- (void)processText:(id)a3 completionHandler:(id)a4
{
  -[CDMClient processText:requestConnectionId:completionHandler:](self, "processText:requestConnectionId:completionHandler:", a3, 0, a4);
}

- (void)processText:(id)a3 requestConnectionId:(id)a4 completionHandler:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  CDMNluRequest *v25;
  id v27;

  v7 = (objc_class *)MEMORY[0x24BE9E078];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v27 = objc_alloc_init(v7);
  objc_msgSend(v27, "setUtterance:", v10);

  objc_msgSend(v27, "setProbability:", 0.0);
  v11 = (void *)MEMORY[0x24BE9E320];
  v12 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v11, "convertFromUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setIdA:", v13);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v27);
  v15 = objc_alloc_init(MEMORY[0x24BE9E148]);
  objc_msgSend(v15, "setAsrOutputs:", v14);
  v16 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@:0"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIdA:", v20);

  objc_msgSend(v16, "setConnectionId:", v9);
  v21 = (void *)MEMORY[0x24BE9E320];
  v22 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v21, "convertFromUUID:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNluRequestId:", v23);

  v24 = objc_alloc_init(MEMORY[0x24BE9E080]);
  objc_msgSend(v24, "setRequestId:", v16);
  objc_msgSend(v24, "setCurrentTurnInput:", v15);
  v25 = -[CDMNluRequest initWithObjcProto:]([CDMNluRequest alloc], "initWithObjcProto:", v24);
  -[CDMClient processCDMNluRequest:completionHandler:](self, "processCDMNluRequest:completionHandler:", v25, v8);

}

+ (id)graphNameForNLU
{
  return CFSTR("CDMNLUServiceGraph");
}

- (void)processEmbeddingRequest:(id)a3 completionHandler:(id)a4
{
  -[CDMClient processEmbeddingRequest:requestId:completionHandler:](self, "processEmbeddingRequest:requestId:completionHandler:", a3, 0, a4);
}

- (void)processEmbeddingRequest:(id)a3 requestId:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, CDMEmbeddingGraphRequestCommand *);
  void *v11;
  void *v12;
  CDMEmbeddingGraphRequestCommand *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  CDMClient *v21;
  void (**v22)(id, _QWORD, CDMEmbeddingGraphRequestCommand *);
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  CDMEmbeddingGraphRequestCommand *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, CDMEmbeddingGraphRequestCommand *))a5;
  if (-[CDMClient daemonKilled](self, "daemonKilled"))
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("assistant_cdmd has been killed. Please call setup to ensure CDM can handle requests.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CDMXPCClientErrorDomain"), 0, v12);
    v13 = (CDMEmbeddingGraphRequestCommand *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]";
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v10[2](v10, 0, v13);
  }
  else
  {
    v13 = -[CDMEmbeddingGraphRequestCommand initWithText:requestId:]([CDMEmbeddingGraphRequestCommand alloc], "initWithText:requestId:", v8, v9);
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]";
      v25 = 2112;
      v26 = v13;
      _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Created CDMEmbeddingGraphRequestCommand to pass into CDMEmbeddingGraph, %@", buf, 0x16u);
    }

    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __76__CDMClient_Embedding__processEmbeddingRequest_requestId_completionHandler___block_invoke;
    v20 = &unk_24DCAC880;
    v21 = self;
    v22 = v10;
    v16 = _Block_copy(&v17);
    -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v13, v16, v17, v18, v19, v20);

  }
}

void __76__CDMClient_Embedding__processEmbeddingRequest_requestId_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
    v30 = 2112;
    v31 = (uint64_t)v5;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s CDM Embedding client graph finished processing, output=%@, error=%@", buf, 0x20u);
  }

  if (v6)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = objc_msgSend(v26, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
      v30 = 2080;
      v31 = v27;
      _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v5;
      objc_msgSend(v9, "embeddingResponse");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "embeddingProtoResponseCommand");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_alloc_init(MEMORY[0x24BE9E120]);
      if ((objc_msgSend(v12, "hasSubwordTokenChain") & 1) == 0)
      {
        CDMOSLoggerForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
          _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: CDMEmbeddingGraphResponseCommand output from graph doesn't have SIRINLUINTERNALSubwordTokenChain subwordTokenChain?", buf, 0xCu);
        }

      }
      objc_msgSend(v12, "subwordTokenChain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSubwordTokenChain:", v15);

      objc_msgSend(v12, "subwordEmbeddingTensorOutputs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (!v17)
      {
        CDMOSLoggerForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
          _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: CDMEmbeddingGraphResponseCommand output from graph doesn't have any NSMutableArray<SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *> *_subwordEmbeddingTensorOutputs?", buf, 0xCu);
        }

      }
      objc_msgSend(v12, "subwordEmbeddingTensorOutputs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 >= 2)
      {
        CDMOSLoggerForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[CDMClient(Embedding) processEmbeddingRequest:requestId:completionHandler:]_block_invoke";
          _os_log_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: Did not expect CDMEmbeddingGraphResponseCommand output from graph to include more than 1 NSMutableArray<SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *> *_subwordEmbeddingTensorOutputs. But it's OK, will only propagate the firstObject", buf, 0xCu);
        }

      }
      objc_msgSend(v12, "subwordEmbeddingTensorOutputs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSubwordTokenEmbedding:", v23);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "commandName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("Expecting CDMGenericSendCommand, but got %@"), v25);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "createNSError:errorCode:", v9, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void)setupSsuInference:(id)a3 serviceStateDirectory:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  CDMClientSetup *v16;
  CDMClientSetup *v17;
  id v18;
  void *v19;
  NSObject *v20;
  CDMClientSetup *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if (v9)
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("CDMSiriVocabularySpanMatchService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("sandbox_id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if (v14)
    {
      v23 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v12, 4, &v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (CDMClientSetup *)v23;
      if (v16)
      {
        v17 = v16;
        v10[2](v10, v16);
        goto LABEL_11;
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  v18 = objc_alloc(MEMORY[0x24BDBCEA0]);
  objc_msgSend(v8, "locale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v18, "initWithLocaleIdentifier:", v19);

  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[CDMClient(SsuInference) setupSsuInference:serviceStateDirectory:completionHandler:]";
    v26 = 2112;
    v27 = v12;
    _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s CDM SSU Inference client graph setup, locale=%@", buf, 0x16u);
  }

  v21 = [CDMClientSetup alloc];
  +[CDMClient graphNameForSsuInference](CDMClient, "graphNameForSsuInference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:](v21, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:", v12, v15, v22, 0, 0, v9);

  -[CDMClient setup:completionHandler:](self, "setup:completionHandler:", v17, v10);
LABEL_11:

}

- (void)processSsuInferenceRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CDMSsuInferenceGraphRequestCommand *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  CDMClient *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  CDMSsuInferenceGraphRequestCommand *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = -[CDMSsuInferenceGraphRequestCommand initWithSsuRequest:]([CDMSsuInferenceGraphRequestCommand alloc], "initWithSsuRequest:", v7);

  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]";
    v20 = 2112;
    v21 = v8;
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Create CDMSsuInferenceGraphRequestCommand to pass into CDMSsuInferenceServiceGraph, %@", buf, 0x16u);
  }

  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __72__CDMClient_SsuInference__processSsuInferenceRequest_completionHandler___block_invoke;
  v15 = &unk_24DCAC880;
  v16 = self;
  v17 = v6;
  v10 = v6;
  v11 = _Block_copy(&v12);
  -[CDMClient doHandleCommand:forCallback:](self, "doHandleCommand:forCallback:", v8, v11, v12, v13, v14, v15, v16);

}

void __72__CDMClient_SsuInference__processSsuInferenceRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = (uint64_t)v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s CDM SSU Inference client graph finished processing, output=%@, error=%@", buf, 0x20u);
  }

  if (v6)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]_block_invoke";
      v20 = 2080;
      v21 = v17;
      _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %s", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v5;
      objc_msgSend(v9, "ssuInferenceResponse");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ssuResponse");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[CDMClient(SsuInference) processSsuInferenceRequest:completionHandler:]_block_invoke";
          _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: CDMSsuInferenceGraphResponseCommand output from graph doesn't have SIRINLUEXTERNALSSU_INFERENCESsuInferenceResponse ssuResponse.", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "createNSError:errorCode:", CFSTR("Received an empty response from CDMSsuInferenceServiceGraph"), 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "commandName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Expecting CDMGenericSendCommand, but got %@"), v13);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "createNSError:errorCode:", v9, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

+ (id)graphNameForSsuInference
{
  return CFSTR("CDMSsuInferenceServiceGraph");
}

@end
