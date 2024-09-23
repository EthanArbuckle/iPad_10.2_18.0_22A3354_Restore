@implementation CDMComposerService

- (void)updateServices:(id)a3
{
  objc_storeStrong((id *)&self->_servicesArray, a3);
}

- (void)updateServiceGraphRunner:(id)a3
{
  objc_storeStrong((id *)&self->_serviceGraphRunner, a3);
}

- (CDMComposerService)initWithConfig:(id)a3
{
  id v4;
  CDMComposerService *v5;
  CDMComposerService *v6;
  NSLock *v7;
  NSLock *aneLock;
  uint64_t v9;
  NSOrderedSet *availableServiceGraphs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMComposerService;
  v5 = -[CDMBaseService initWithConfig:](&v12, sel_initWithConfig_, v4);
  v6 = v5;
  if (v5)
  {
    v5->super._serviceState = 2;
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    aneLock = v6->_aneLock;
    v6->_aneLock = v7;

    objc_msgSend(v4, "availableServiceGraphs");
    v9 = objc_claimAutoreleasedReturnValue();
    availableServiceGraphs = v6->_availableServiceGraphs;
    v6->_availableServiceGraphs = (NSOrderedSet *)v9;

  }
  return v6;
}

- (void)handleCommand:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "commandName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v12 = "-[CDMComposerService handleCommand:withCallback:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s Composer get [%@]", buf, 0x16u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CDMComposerService _handleListGraphs:withCallback:](self, "_handleListGraphs:withCallback:", v6, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CDMComposerService _handleSetupRequest:withCallback:](self, "_handleSetupRequest:withCallback:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CDMComposerService _handleNLUPreprocessRequest:withCallback:](self, "_handleNLUPreprocessRequest:withCallback:", v6, v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CDMComposerService _handleNLURequest:withCallback:](self, "_handleNLURequest:withCallback:", v6, v7);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CDMComposerService _handleEmbeddingRequest:withCallback:](self, "_handleEmbeddingRequest:withCallback:", v6, v7);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[CDMComposerService _handleSsuInferenceRequest:withCallback:](self, "_handleSsuInferenceRequest:withCallback:", v6, v7);
            }
            else
            {
              v10.receiver = self;
              v10.super_class = (Class)CDMComposerService;
              -[CDMBaseService handleCommand:withCallback:](&v10, sel_handleCommand_withCallback_, v6, v7);
            }
          }
        }
      }
    }
  }

}

- (void)_handleSetupRequest:(id)a3 withCallback:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  NSString *v10;
  NSString *languageCode;
  NSObject *v12;
  NSOrderedSet *availableServiceGraphs;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  CDMSetupResponseCommand *v25;
  objc_class *v26;
  void *v27;
  CDMSetupResponseCommand *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  objc_msgSend(v6, "dynamicConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageCode");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  self->_languageCode = v10;

  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "dynamicConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "graphName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
    v36 = 2112;
    v37 = v30;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s DynamicConfig's graphName=%@", buf, 0x16u);

  }
  availableServiceGraphs = self->_availableServiceGraphs;
  objc_msgSend(v6, "dynamicConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "graphName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(availableServiceGraphs) = -[NSOrderedSet containsObject:](availableServiceGraphs, "containsObject:", v15);

  if ((availableServiceGraphs & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "dynamicConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "graphName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = self->_languageCode;
      *(_DWORD *)buf = 136315650;
      v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
      v36 = 2112;
      v37 = v32;
      v38 = 2112;
      v39 = v33;
      _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Ready for graph %@ and locale %@", buf, 0x20u);

    }
    self->super._serviceState = 2;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17, 0);
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "dynamicConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "graphName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid graph=%@; Leaving CDM as-is. List of available graphs=%@"),
      v20,
      self->_availableServiceGraphs);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[CDMComposerService _handleSetupRequest:withCallback:]";
      v36 = 2112;
      v37 = v17;
      _os_log_error_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v22 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    v41[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("CDMComposerService"), -4, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    self->super._serviceState = 3;
    v25 = [CDMSetupResponseCommand alloc];
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[CDMSetupResponseCommand initWithServiceState:serviceName:](v25, "initWithServiceState:serviceName:", 3, v27);

    -[CDMBaseCommand setCmdError:](v28, "setCmdError:", v24);
    ((void (**)(id, void *, void *))v7)[2](v7, v28, v24);

  }
}

- (id)supportedCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)CDMComposerService;
  -[CDMBaseService supportedCommands](&v11, sel_supportedCommands);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseCommand commandName](CDMListGraphsRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  +[CDMBaseCommand commandName](CDMAssistantNLUCommand, "commandName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  +[CDMBaseCommand commandName](CDMNLUPreprocessRequestCommand, "commandName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  +[CDMBaseCommand commandName](CDMEmbeddingGraphRequestCommand, "commandName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  +[CDMBaseCommand commandName](CDMSsuInferenceGraphRequestCommand, "commandName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateGraphServices:(id)a3
{
  objc_storeStrong((id *)&self->_graphServicesArray, a3);
}

- (void)_handleListGraphs:(id)a3 withCallback:(id)a4
{
  CDMListGraphsResponseCommand *v5;
  void (**v6)(id, CDMListGraphsResponseCommand *, _QWORD);

  v6 = (void (**)(id, CDMListGraphsResponseCommand *, _QWORD))a4;
  v5 = -[CDMListGraphsResponseCommand initWithGraphs:]([CDMListGraphsResponseCommand alloc], "initWithGraphs:", self->_availableServiceGraphs);
  v6[2](v6, v5, 0);

}

- (void)failWithError:(id)a3 rawCommand:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  CDMGenericSendCommand *v12;
  void *v13;
  CDMGenericSendCommand *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  CDMNluResponse *v19;
  CDMGenericSendCommand *v20;
  void *v21;
  CDMGenericSendCommand *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    v12 = [CDMGenericSendCommand alloc];
    objc_msgSend(v11, "clientId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CDMGenericSendCommand initWithError:clientId:](v12, "initWithError:clientId:", v8, v13);

    if (v10)
    {
      if (objc_msgSend(v8, "code") == 2)
      {
        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v24 = 136315394;
          v25 = "-[CDMComposerService failWithError:rawCommand:callback:]";
          v26 = 2112;
          v27 = v8;
          _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: In response to an invalid NLUInput (i.e. empty utterance), CDM responding with StatusCode of EMPTY_NLU_REQUEST (code 101). Error:%@", (uint8_t *)&v24, 0x16u);
        }

        objc_msgSend(v11, "siriNLUTypeObj");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "requestId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[SiriNLUTypesUtils createResponse:statusCode:](SiriNLUTypesUtils, "createResponse:statusCode:", v17, 101);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = -[CDMNluResponse initWithObjcProto:]([CDMNluResponse alloc], "initWithObjcProto:", v18);
        v20 = [CDMGenericSendCommand alloc];
        objc_msgSend(v11, "clientId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[CDMGenericSendCommand initWithCDMNluResponse:clientId:](v20, "initWithCDMNluResponse:clientId:", v19, v21);

        CDMOSLoggerForCategory(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v24 = 136315138;
          v25 = "-[CDMComposerService failWithError:rawCommand:callback:]";
          _os_log_debug_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEBUG, "%s Callback below explicitly setting NSError to nil as SiriRequestDispatch (SRD) expects an NLUResponse with status code of EMPTY_NLU_REQUEST", (uint8_t *)&v24, 0xCu);
        }

        v10[2](v10, v22, 0);
      }
      else
      {
        ((void (**)(id, void *, id))v10)[2](v10, v14, v8);
      }
    }
    else
    {
      -[CDMBaseService publish:](self, "publish:", v14);
    }

  }
  else
  {
    -[CDMComposerService failWithError:callback:](self, "failWithError:callback:", v8, v10);
  }

}

- (void)failWithError:(id)a3 callback:(id)a4
{
  void (**v6)(id, CDMGenericSendCommand *, id);
  CDMGenericSendCommand *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, CDMGenericSendCommand *, id))a4;
  v7 = -[CDMGenericSendCommand initWithError:clientId:]([CDMGenericSendCommand alloc], "initWithError:clientId:", v8, CFSTR("CDM-embedding-client"));
  if (v6)
    v6[2](v6, v7, v8);
  else
    -[CDMBaseService publish:](self, "publish:", v7);

}

- (void)_handleNLURequest:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  NSString *languageCode;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  CDMServiceGraphRunner *serviceGraphRunner;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  languageCode = self->_languageCode;
  objc_msgSend(v6, "siriNLUTypeObj");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAnalytics recordReceivedNluRequestEvent:withNluRequest:](CDMAnalytics, "recordReceivedNluRequestEvent:withNluRequest:", languageCode, v9);

  objc_msgSend(v6, "siriNLUTypeObj");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CDMComposerServiceUtils logNluRequestForInsights:](CDMComposerServiceUtils, "logNluRequestForInsights:", v6);
  -[CDMComposerService prepareRequestHandler:withCallback:](self, "prepareRequestHandler:withCallback:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    CDMOSLoggerForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);

    CDMOSLoggerForCategory(4);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      objc_msgSend(v12, "handlerId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v17;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "handleNLU", "%{public}@", buf, 0xCu);

    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __53__CDMComposerService__handleNLURequest_withCallback___block_invoke;
    v19[3] = &unk_24DCAC650;
    v24 = v14;
    v20 = v12;
    v21 = v11;
    v22 = v6;
    v23 = v7;
    -[CDMServiceGraphRunner runHandlerAsync:withCompletion:](serviceGraphRunner, "runHandlerAsync:withCompletion:", v20, v19);

  }
}

- (void)_handleNLUPreprocessRequest:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  char *v16;
  CDMServiceGraphRunner *serviceGraphRunner;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "siriNLUTypeObj");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMComposerService prepareRequestHandler:withCallback:](self, "prepareRequestHandler:withCallback:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[CDMComposerService _handleNLUPreprocessRequest:withCallback:]";
      _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Created requestHandler for handleNLUPreprocessRequest", buf, 0xCu);
    }

    CDMOSLoggerForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    CDMOSLoggerForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      objc_msgSend(v10, "handlerId");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleNLUPreproces", "%@", buf, 0xCu);

    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __63__CDMComposerService__handleNLUPreprocessRequest_withCallback___block_invoke;
    v18[3] = &unk_24DCAC678;
    v19 = v10;
    v22 = v13;
    v20 = v9;
    v21 = v7;
    -[CDMServiceGraphRunner runHandlerAsync:withCompletion:](serviceGraphRunner, "runHandlerAsync:withCompletion:", v19, v18);

  }
}

- (void)_handleEmbeddingRequest:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  CDMServiceGraphRunner *serviceGraphRunner;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  os_signpost_id_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  -[CDMComposerService prepareRequestHandler:withCallback:](self, "prepareRequestHandler:withCallback:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CDMOSLoggerForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    CDMOSLoggerForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      objc_msgSend(v9, "handlerId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleEmbeddingGraph", "%@", buf, 0xCu);

    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __59__CDMComposerService__handleEmbeddingRequest_withCallback___block_invoke;
    v18[3] = &unk_24DCAC6A0;
    v24 = v13;
    v19 = v9;
    v25 = v8;
    v20 = v10;
    v21 = v6;
    v22 = v11;
    v23 = v7;
    -[CDMServiceGraphRunner runHandlerAsync:withCompletion:](serviceGraphRunner, "runHandlerAsync:withCompletion:", v19, v18);

  }
}

- (void)_handleSsuInferenceRequest:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  CDMServiceGraphRunner *serviceGraphRunner;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  os_signpost_id_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  objc_msgSend(v6, "loggingRequestID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMComposerService prepareRequestHandler:withCallback:](self, "prepareRequestHandler:withCallback:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CDMOSLoggerForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    CDMOSLoggerForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      objc_msgSend(v11, "handlerId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleSsuInferenceGraph", "%@", buf, 0xCu);

    }
    serviceGraphRunner = self->_serviceGraphRunner;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__CDMComposerService__handleSsuInferenceRequest_withCallback___block_invoke;
    v18[3] = &unk_24DCAC6C8;
    v23 = v13;
    v19 = v11;
    v20 = v10;
    v21 = v6;
    v24 = v8;
    v22 = v7;
    -[CDMServiceGraphRunner runHandlerAsync:withCompletion:](serviceGraphRunner, "runHandlerAsync:withCompletion:", v19, v18);

  }
}

- (id)createServiceGraphForCommand:(id)a3 withSelfMetadata:(id)a4 withCallback:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  NSArray *servicesArray;
  NSArray *graphServicesArray;
  NSString *languageCode;
  void *v14;
  NSLock *aneLock;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v28 = a4;
  v29 = a5;
  objc_msgSend((id)objc_opt_class(), "serviceGraphName");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(NSClassFromString(v9));
  servicesArray = self->_servicesArray;
  graphServicesArray = self->_graphServicesArray;
  languageCode = self->_languageCode;
  objc_msgSend(v8, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  aneLock = self->_aneLock;
  objc_msgSend(v8, "dataDispatcherContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v10, "initWithServices:graphServices:graphInput:languageCode:handlerId:aneLock:dataDispatcherContext:", servicesArray, graphServicesArray, v8, languageCode, v14, aneLock, v16);

  objc_msgSend(v17, "getError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && objc_msgSend(v18, "code") == 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create service graph with type %@!"), v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[CDMComposerService createServiceGraphForCommand:withSelfMetadata:withCallback:]";
      v34 = 2112;
      v35 = v20;
      _os_log_error_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v22 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("CDMComposerService"), -3, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataDispatcherContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmFailed:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmFailed:metadata:logMessage:dataDispatcherContext:", 10, v28, CFSTR("SELF CDM Request failed message emitted"), v25);

    -[CDMComposerService failWithError:rawCommand:callback:](self, "failWithError:rawCommand:callback:", v24, v8, v29);
    v26 = 0;
  }
  else
  {
    v26 = v17;
  }

  return v26;
}

- (id)prepareRequestHandler:(id)a3 withCallback:(id)a4
{
  id v6;
  Class v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CDMBaseRequestHandler *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CDMBaseRequestHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v30;
  CDMBaseRequestHandler *v31;
  NSString *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = a4;
  objc_msgSend((id)objc_opt_class(), "serviceGraphName");
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(v32);
  objc_msgSend(v6, "loggingRequestID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataDispatcherContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchSELFRequestLink:dataDispatcherContext:](CDMDataDispatcher, "dispatchSELFRequestLink:dataDispatcherContext:", v8, v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = v6;
    objc_msgSend(v10, "siriNLUTypeObj");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataDispatcherContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMDataDispatcher dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:](CDMDataDispatcher, "dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:", v11, v8, v32, v12);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "dataDispatcherContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class dispatchServiceGraphRequestLogging:dataDispatcherContext:](v7, "dispatchServiceGraphRequestLogging:dataDispatcherContext:", v6, v27);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      v37 = 2112;
      v38 = (const __CFString *)v32;
      _os_log_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_INFO, "%s [WARN]: Graph [%@] does not support dispatchServiceGraphRequestLogging", buf, 0x16u);
    }

  }
  if (!self->_serviceGraphRunner)
  {
    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      v37 = 2112;
      v38 = CFSTR("ServiceGraphRunner not initialized!");
      _os_log_error_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v24 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    v42[0] = CFSTR("ServiceGraphRunner not initialized!");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("CDMComposerService"), -1, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dataDispatcherContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmFailed:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmFailed:metadata:logMessage:dataDispatcherContext:", 8, v33, CFSTR("SELF CDM Request failed message emitted"), v26);

    -[CDMComposerService failWithError:rawCommand:callback:](self, "failWithError:rawCommand:callback:", v13, v6, v34);
    goto LABEL_13;
  }
  -[CDMComposerService createServiceGraphForCommand:withSelfMetadata:withCallback:](self, "createServiceGraphForCommand:withSelfMetadata:withCallback:", v6, v33, v34);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_13:
    v22 = 0;
    goto LABEL_20;
  }
  v14 = [CDMBaseRequestHandler alloc];
  objc_msgSend(v6, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[CDMBaseRequestHandler initWithId:serviceGraph:](v14, "initWithId:serviceGraph:", v15, v13);

  -[CDMBaseRequestHandler getError](v31, "getError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      v37 = 2112;
      v38 = CFSTR("summary");
      v39 = 2112;
      v40 = v16;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nFailing early as graph set an error before even running it. Error:%@", buf, 0x20u);
    }
    objc_msgSend(v16, "domain", v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "code");
    +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataDispatcherContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:", 11, v18, v19, v20, CFSTR("SELF CDM Request failed message emitted"), v21);

    -[CDMComposerService failWithError:rawCommand:callback:](self, "failWithError:rawCommand:callback:", v16, v6, v34);
    v22 = 0;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CDMComposerService prepareRequestHandler:withCallback:]";
      v37 = 2112;
      v38 = (const __CFString *)v32;
      _os_log_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_INFO, "%s Created %@", buf, 0x16u);
    }

    v22 = v31;
  }

LABEL_20:
  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableServiceGraphs, 0);
  objc_storeStrong((id *)&self->_aneLock, 0);
  objc_storeStrong((id *)&self->_serviceGraphRunner, 0);
  objc_storeStrong((id *)&self->_graphServicesArray, 0);
  objc_storeStrong((id *)&self->_servicesArray, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

void __62__CDMComposerService__handleSsuInferenceRequest_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CDMGenericSendCommand *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  CDMGenericSendCommand *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "handleSsuInferenceGraph", ", (uint8_t *)&v19, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "getResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getError");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315650;
      v20 = "-[CDMComposerService _handleSsuInferenceRequest:withCallback:]_block_invoke";
      v21 = 2112;
      v22 = CFSTR("summary");
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nServiceGraphError: %@", (uint8_t *)&v19, 0x20u);
    }
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[CDMComposerService _handleSsuInferenceRequest:withCallback:]_block_invoke";
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Sending Error via callback in CDMClient, Error:%@", (uint8_t *)&v19, 0x16u);
    }

    -[__CFString domain](v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[__CFString code](v6, "code");
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "dataDispatcherContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:", 12, v9, v10, v11, CFSTR("SELF CDM Request failed message emitted"), v12);

    v13 = -[CDMGenericSendCommand initWithError:clientId:]([CDMGenericSendCommand alloc], "initWithError:clientId:", v6, CFSTR("CDM-embedding-client"));
  }
  else
  {
    v14 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 48), "loggingRequestID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "dataDispatcherContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dispatchServiceGraphResponseLogging:requestId:dataDispatcherContext:", v5, v15, v16);

    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315138;
      v20 = "-[CDMComposerService _handleSsuInferenceRequest:withCallback:]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Sending CDMSsuInferenceGraphResponseCommand via callback in CDMClient", (uint8_t *)&v19, 0xCu);
    }

    v13 = -[CDMGenericSendCommand initWithSsuInferenceGraphResponse:]([CDMGenericSendCommand alloc], "initWithSsuInferenceGraphResponse:", v5);
  }
  v18 = v13;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __59__CDMComposerService__handleEmbeddingRequest_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  CDMGenericSendCommand *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  CDMGenericSendCommand *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "handleEmbeddingGraph", ", (uint8_t *)&v19, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "getResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getError");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315650;
      v20 = "-[CDMComposerService _handleEmbeddingRequest:withCallback:]_block_invoke";
      v21 = 2112;
      v22 = CFSTR("summary");
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nServiceGraphError: %@", (uint8_t *)&v19, 0x20u);
    }
    -[__CFString domain](v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[__CFString code](v6, "code");
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "dataDispatcherContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:", 12, v8, v9, v10, CFSTR("SELF CDM Request failed message emitted"), v11);

    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[CDMComposerService _handleEmbeddingRequest:withCallback:]_block_invoke";
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Sending Error via callback in CDMClient, Error:%@", (uint8_t *)&v19, 0x16u);
    }

    v13 = -[CDMGenericSendCommand initWithError:clientId:]([CDMGenericSendCommand alloc], "initWithError:clientId:", v6, CFSTR("CDM-embedding-client"));
  }
  else
  {
    v14 = *(void **)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "dataDispatcherContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dispatchServiceGraphResponseLogging:requestId:dataDispatcherContext:", v5, v15, v16);

    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315138;
      v20 = "-[CDMComposerService _handleEmbeddingRequest:withCallback:]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Sending CDMEmbeddingGraphResponseCommand via callback in CDMClient", (uint8_t *)&v19, 0xCu);
    }

    v13 = -[CDMGenericSendCommand initWithEmbeddingGraphResponse:]([CDMGenericSendCommand alloc], "initWithEmbeddingGraphResponse:", v5);
  }
  v18 = v13;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __63__CDMComposerService__handleNLUPreprocessRequest_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "getResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[CDMComposerService _handleNLUPreprocessRequest:withCallback:]_block_invoke";
    v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Get _handleNLUPreprocessRequest:%@", (uint8_t *)&v12, 0x16u);

  }
  CDMOSLoggerForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v4, OS_SIGNPOST_INTERVAL_END, v5, "handleNLUPreproces", ", (uint8_t *)&v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "getResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315394;
    v13 = "-[CDMComposerService _handleNLUPreprocessRequest:withCallback:]_block_invoke";
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Get CDMNLUPreprocessResponseCommand:%@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "getError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "preprocessingWrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMDataDispatcher dispatchCdmPreprocessingWrapperData:requestId:](CDMDataDispatcher, "dispatchCdmPreprocessingWrapperData:requestId:", v9, *(_QWORD *)(a1 + 40));

  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v6, v8);

}

void __53__CDMComposerService__handleNLURequest_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CDMGenericSendCommand *v11;
  CDMNluResponse *v12;
  CDMGenericSendCommand *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v25;
  __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  CDMNluResponse *v38;
  void *v39;
  CDMGenericSendCommand *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v1;
  v3 = *(_QWORD *)(a1 + 64);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v1))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v2, OS_SIGNPOST_INTERVAL_END, v3, "handleNLU", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "getResult");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getError");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = CDMLogContext;
  v43 = (__CFString *)v4;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      v53 = 2112;
      v54 = CFSTR("summary");
      v55 = 2112;
      v56 = v43;
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nServiceGraphError: %@", buf, 0x20u);
    }
    -[__CFString domain](v43, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[__CFString code](v43, "code");
    +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "dataDispatcherContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:", 12, v6, v7, v8, CFSTR("SELF CDM Request failed message emitted"), v9);

    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      v53 = 2112;
      v54 = v43;
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Sending Error to SiriRequestDispatch (SRD) via callback in CDMClient, Error:%@", buf, 0x16u);
    }

    v11 = [CDMGenericSendCommand alloc];
    objc_msgSend(*(id *)(a1 + 48), "clientId");
    v12 = (CDMNluResponse *)objc_claimAutoreleasedReturnValue();
    v13 = -[CDMGenericSendCommand initWithError:clientId:](v11, "initWithError:clientId:", v43, v12);
  }
  else
  {
    v14 = (id)CDMLogContext;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)MEMORY[0x24BE9E358];
      objc_msgSend(v42, "siriNLUTypeObj");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "printableResponse:", v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      v53 = 2112;
      v54 = CFSTR("cdmio");
      v55 = 2112;
      v56 = v17;
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nServiceGraphNLUResponse: %@", buf, 0x20u);

    }
    v18 = (id)CDMLogContext;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v42, "requestId");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      v53 = 2112;
      v54 = CFSTR("summary");
      v55 = 2114;
      v56 = v19;
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nRequest for NLUResponse: %{public}@", buf, 0x20u);

    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v42, "siriNLUTypeObj");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "parses");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
          {
            v25 = (id)CDMLogContext;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x24BE9E358], "printableUserParse:", v24);
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
              v53 = 2112;
              v54 = CFSTR("summary");
              v55 = 2112;
              v56 = v26;
              _os_log_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nParses From NLUResponse: %@", buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE9E360], "redactUserParse:", v24);
            v25 = objc_claimAutoreleasedReturnValue();
            v27 = CDMLogContext;
            if (v25)
            {
              v28 = (id)CDMLogContext;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x24BE9E358], "printableUserParse:", v25);
                v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
                v53 = 2112;
                v54 = CFSTR("summary");
                v55 = 2114;
                v56 = v29;
                _os_log_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nParses From NLUResponse: %{public}@", buf, 0x20u);

              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
                v53 = 2112;
                v54 = CFSTR("summary");
                _os_log_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nUnable to redact parse", buf, 0x16u);
              }
              v25 = 0;
            }
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v21);
    }

    objc_msgSend(v42, "siriNLUTypeObj");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "parses");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count") == 0;

    if (v32)
    {
      v33 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
        v53 = 2112;
        v54 = CFSTR("summary");
        _os_log_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\nParses From NLUResponse: None", buf, 0x16u);
      }
    }
    objc_msgSend(v42, "siriNLUTypeObj");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "dataDispatcherContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMDataDispatcher dispatchCdmResponseData:requestId:dataDispatcherContext:](CDMDataDispatcher, "dispatchCdmResponseData:requestId:dataDispatcherContext:", v34, v35, v36);

    CDMOSLoggerForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[CDMComposerService _handleNLURequest:withCallback:]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v37, OS_LOG_TYPE_DEBUG, "%s Sending CDMNluResponse to SiriRequestDispatch (SRD) via callback in CDMClient", buf, 0xCu);
    }

    v38 = [CDMNluResponse alloc];
    objc_msgSend(v42, "siriNLUTypeObj");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CDMNluResponse initWithObjcProto:](v38, "initWithObjcProto:", v39);

    v40 = [CDMGenericSendCommand alloc];
    objc_msgSend(*(id *)(a1 + 48), "clientId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CDMGenericSendCommand initWithCDMNluResponse:clientId:](v40, "initWithCDMNluResponse:clientId:", v12, v41);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

@end
