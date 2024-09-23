@implementation INSExtensionService

- (INSExtensionService)init
{
  return -[INSExtensionService initWithOptions:](self, "initWithOptions:", MEMORY[0x24BDBD1B8]);
}

- (INSExtensionService)initWithOptions:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INSExtensionService;
  v5 = -[INSExtensionService init](&v16, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("INSExtensionServiceQueue", v6);
    v8 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v7;

    dispatch_async(*((dispatch_queue_t *)v5 + 1), &__block_literal_global_324);
    v9 = dispatch_queue_create("com.apple.intents.INSExtensionService.request-delegate", 0);
    v10 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v9;

    v11 = objc_msgSend(v4, "copy");
    v12 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v11;

    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v5);

    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataSource:", v5);

  }
  return (INSExtensionService *)v5;
}

- (NSString)groupIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE82270];
}

- (NSArray)commandIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[10];

  v7[9] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE822B8];
  v7[0] = *MEMORY[0x24BE82278];
  v7[1] = v2;
  v3 = *MEMORY[0x24BE82290];
  v7[2] = *MEMORY[0x24BE82240];
  v7[3] = v3;
  v4 = *MEMORY[0x24BE822B0];
  v7[4] = *MEMORY[0x24BE82298];
  v7[5] = v4;
  v5 = *MEMORY[0x24BE822A8];
  v7[6] = *MEMORY[0x24BE82288];
  v7[7] = v5;
  v7[8] = *MEMORY[0x24BE82268];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 9);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)handleCommand:(id)a3 completionHandler:(id)a4
{
  -[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:](self, "handleCommand:fromRemoteDevice:completionHandler:", a3, 0, a4);
}

- (void)handleCommand:(id)a3 fromRemoteDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  INSExtensionService *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke;
  v15[3] = &unk_24C4B9958;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)resetExternalResources
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__INSExtensionService_resetExternalResources__block_invoke;
  block[3] = &unk_24C4B98C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (INExtensionContext)extensionContext
{
  INExtensionContext *extensionContext;
  INExtensionContext *v4;
  INExtensionContext *v5;

  extensionContext = self->_extensionContext;
  if (!extensionContext)
  {
    v4 = (INExtensionContext *)objc_alloc_init(MEMORY[0x24BDD9D28]);
    v5 = self->_extensionContext;
    self->_extensionContext = v4;

    extensionContext = self->_extensionContext;
  }
  return extensionContext;
}

- (void)setAirPlayRouteIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSExtensionService extensionContext](self, "extensionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAirPlayRouteIdentifiers:", v4);

}

- (NSArray)airPlayRouteIdentifiers
{
  void *v2;
  void *v3;

  -[INSExtensionService extensionContext](self, "extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_airPlayRouteIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_errorImpliesCloudRelay:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD9910]))
    v5 = objc_msgSend(v3, "code") == 2005;
  else
    v5 = 0;

  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD98D0]))
    v7 = objc_msgSend(v3, "code") == 3001;
  else
    v7 = 0;
  v8 = v7 || v5;

  return v8;
}

- (BOOL)_isVoiceShortcutsRemoteExecutionUnavailable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _INVCVoiceShortcutErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
    v6 = objc_msgSend(v3, "code") == 9001;
  else
    v6 = 0;

  return v6;
}

- (void)_extensionRequestWillStartForIntent:(id)a3
{
  id v4;
  NSObject *requestDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  requestDelegateQueue = self->_requestDelegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__INSExtensionService__extensionRequestWillStartForIntent___block_invoke;
  v7[3] = &unk_24C4B9828;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(requestDelegateQueue, v7);

}

- (void)_extensionRequestDidFinishForIntent:(id)a3 error:(id)a4
{
  id v5;
  NSObject *requestDelegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  requestDelegateQueue = self->_requestDelegateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__INSExtensionService__extensionRequestDidFinishForIntent_error___block_invoke;
  v8[3] = &unk_24C4B9828;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(requestDelegateQueue, v8);

}

- (id)_extensionInputItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD1618];
  -[INSExtensionService extensionContext](self, "extensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, *MEMORY[0x24BDDA3C8]);
  -[INSExtensionService _siriLanguageCode](self, "_siriLanguageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, *MEMORY[0x24BDDA3D0]);

  v8 = objc_alloc_init(MEMORY[0x24BDD1560]);
  objc_msgSend(v8, "setUserInfo:", v3);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_updatedEventContextWithExtensionLoadType:(id)a3 wasPrewarmed:(BOOL)a4
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (a4)
    v5 = CFSTR("Warm");
  else
    v5 = CFSTR("Cold");
  v6 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("Extension"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[INSExtensionService _updatedEventContextWithExtensionLoadType:wasPrewarmed:]";
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_20BAA8000, v8, OS_LOG_TYPE_INFO, "%s Extension load type = %@", buf, 0x16u);
  }
  v9 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("ExtensionLoadType"));
  return v9;
}

- (id)_connectionForIntent:(id)a3
{
  INCExtensionConnection *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id *p_currentConnection;
  INCExtensionConnection *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  os_log_t v14;
  _BOOL4 v15;
  INCExtensionConnection *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  INCExtensionConnection *currentConnection;
  const char *v21;
  INCExtensionConnection *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  INCExtensionConnection *v27;
  NSObject *v28;
  INCExtensionConnection *v30;
  int v31;
  const char *v32;
  __int16 v33;
  INCExtensionConnection *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (INCExtensionConnection *)a3;
  v5 = (os_log_t *)MEMORY[0x24BDD9A30];
  v6 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_20BAA8000, v6, OS_LOG_TYPE_INFO, "%s Getting connection for intent: %@", (uint8_t *)&v31, 0x16u);
  }
  if (!v4)
  {
    v19 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      p_currentConnection = (id *)&self->_currentConnection;
      goto LABEL_16;
    }
    currentConnection = self->_currentConnection;
    v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    v33 = 2112;
    v34 = currentConnection;
    v21 = "%s Using the current connection %@ because the intent is nil.";
LABEL_20:
    _os_log_error_impl(&dword_20BAA8000, v19, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v31, 0x16u);
    goto LABEL_12;
  }
  -[INCExtensionConnection identifier](v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v19 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v30 = self->_currentConnection;
    v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    v33 = 2112;
    v34 = v30;
    v21 = "%s Using the current connection %@ because the intent identifier is nil.";
    goto LABEL_20;
  }
  v9 = self->_currentConnection;
  p_currentConnection = (id *)&self->_currentConnection;
  -[INCExtensionConnection intent](v9, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCExtensionConnection identifier](v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  v14 = *v5;
  v15 = os_log_type_enabled(*v5, OS_LOG_TYPE_INFO);
  if ((v13 & 1) != 0)
  {
    if (v15)
    {
      v16 = (INCExtensionConnection *)*p_currentConnection;
      v17 = v14;
      -[INCExtensionConnection identifier](v4, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 136315650;
      v32 = "-[INSExtensionService _connectionForIntent:]";
      v33 = 2112;
      v34 = v16;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_20BAA8000, v17, OS_LOG_TYPE_INFO, "%s Using the current connection %@ because the intent identifier matches intent identifier: %@.", (uint8_t *)&v31, 0x20u);

    }
    objc_msgSend(*p_currentConnection, "setIntent:", v4);
  }
  else
  {
    if (v15)
    {
      v22 = (INCExtensionConnection *)*p_currentConnection;
      v23 = v14;
      -[INCExtensionConnection identifier](v4, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 136315650;
      v32 = "-[INSExtensionService _connectionForIntent:]";
      v33 = 2112;
      v34 = v22;
      v35 = 2112;
      v36 = v24;
      _os_log_impl(&dword_20BAA8000, v23, OS_LOG_TYPE_INFO, "%s Replacing the current connection %@ because the intent identifier is %@.", (uint8_t *)&v31, 0x20u);

    }
    objc_msgSend(*p_currentConnection, "reset");
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE5B900]), "initWithIntent:", v4);
    v26 = *p_currentConnection;
    *p_currentConnection = (id)v25;

  }
LABEL_16:
  v27 = (INCExtensionConnection *)*p_currentConnection;
  v28 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    v31 = 136315394;
    v32 = "-[INSExtensionService _connectionForIntent:]";
    v33 = 2112;
    v34 = v27;
    _os_log_impl(&dword_20BAA8000, v28, OS_LOG_TYPE_INFO, "%s Returning connection: %@", (uint8_t *)&v31, 0x16u);
  }

  return v27;
}

- (BOOL)_prewarmExtensionWithIntent:(id)a3 applicationIdentifier:(id)a4 command:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char isKindOfClass;
  os_log_t *v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  uint64_t v31;
  NSObject *log;
  _QWORD v33[4];
  id v34;
  id v35;
  INSExtensionService *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = (os_log_t *)MEMORY[0x24BDD9A30];
  if ((isKindOfClass & 1) != 0)
  {
    kdebug_trace();
    objc_msgSend(v10, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
      {
        log = v19;
        objc_msgSend(v10, "_className");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "launchId");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        v23 = CFSTR("no launchId");
        if (v21)
          v23 = (const __CFString *)v21;
        objc_msgSend(v10, "extensionBundleId", v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        *(_DWORD *)buf = 136316162;
        v26 = CFSTR("no extensionBundleId");
        v40 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]";
        v41 = 2112;
        if (v24)
          v26 = (const __CFString *)v24;
        v42 = v20;
        v43 = 2112;
        v44 = v31;
        v45 = 2112;
        v46 = v26;
        v47 = 2112;
        v48 = v18;
        _os_log_impl(&dword_20BAA8000, log, OS_LOG_TYPE_INFO, "%s About to prewarm an extension for %@ (%@:%@) without an identifier. Assigning a new identifier: %@", buf, 0x34u);

        v15 = (os_log_t *)MEMORY[0x24BDD9A30];
      }
      objc_msgSend(v10, "setIdentifier:", v18);

    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5B900]), "initWithIntent:", v10);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke;
    v33[3] = &unk_24C4B9878;
    v34 = v12;
    v38 = v13;
    v35 = v10;
    v36 = self;
    v37 = v11;
    objc_msgSend(v27, "resumeWithCompletionHandler:", v33);

  }
  v28 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
  {
    v29 = CFSTR("NO");
    if ((isKindOfClass & 1) != 0)
      v29 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v40 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]";
    v41 = 2112;
    v42 = v29;
    _os_log_impl(&dword_20BAA8000, v28, OS_LOG_TYPE_INFO, "%s Is prewarm: %@.", buf, 0x16u);
  }

  return isKindOfClass & 1;
}

- (void)_logPrewarmDidEndWithCommand:(id)a3 applicationIdentifier:(id)a4 wasPrewarmed:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  void (**v10)(id, id, _QWORD);
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v7 = a5;
  v19 = a3;
  v10 = (void (**)(id, id, _QWORD))a6;
  v11 = objc_msgSend(a4, "isEqualToString:", *MEMORY[0x24BE5B8E8]);
  objc_msgSend(v19, "ins_afAnalyticsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[INSExtensionService _updatedEventContextWithExtensionLoadType:wasPrewarmed:](self, "_updatedEventContextWithExtensionLoadType:wasPrewarmed:", v12, v7);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  v14 = objc_alloc_init(MEMORY[0x24BE811B8]);
  if (v10)
    v10[2](v10, v14, 0);
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contextDictionaryForCommand:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v19, "ins_analyticsEndEventType");
  IFMergeDictionaries();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSExtensionService _logEventWithType:context:contextNoCopy:](self, "_logEventWithType:context:contextNoCopy:", v17, v18, 1, v16, 0);

  kdebug_trace();
}

- (void)_logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[INSExtensionService delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "extensionService:logEventWithType:context:contextNoCopy:", self, a3, v8, v5);
  }
  else
  {
    v10 = *MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[INSExtensionService _logEventWithType:context:contextNoCopy:]";
      _os_log_error_impl(&dword_20BAA8000, v10, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:logEventWithType:context:contextNoCopy:", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (id)_siriLanguageCode
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[INSExtensionService delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "siriLanguageCodeForExtensionService:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[INSExtensionService _siriLanguageCode]";
      _os_log_error_impl(&dword_20BAA8000, v5, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to siriLanguageCodeForExtensionService:", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (void)_requiresHandlingCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[INSExtensionService delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "extensionService:requiresHandlingCommand:completion:", self, v6, v7);
  }
  else
  {
    v9 = *MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[INSExtensionService _requiresHandlingCommand:completion:]";
      _os_log_error_impl(&dword_20BAA8000, v9, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:requiresHandlingCommand:completion:", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (BOOL)_shouldPrepareAudioSessionForCommand:(id)a3 intent:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  char v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "extensionBundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "extensionBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.siri.SiriAudioInternal.AudioInternalIntentExtension"));

    if (v10)
    {
      v11 = *MEMORY[0x24BDD9A30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
      {
        v14 = 136315138;
        v15 = "-[INSExtensionService _shouldPrepareAudioSessionForCommand:intent:]";
        _os_log_impl(&dword_20BAA8000, v11, OS_LOG_TYPE_INFO, "%s Suppressing audio session preparation for internal media extension", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = objc_msgSend(v6, "ins_shouldPrepareAudioSession");
LABEL_8:

  return v12;
}

- (void)analytics:(id)a3 needsToLogEventWithType:(int64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6
{
  -[INSExtensionService _logEventWithType:context:contextNoCopy:](self, "_logEventWithType:context:contextNoCopy:", a4, a5, a6);
}

- (id)analytics:(id)a3 contextDictionaryForCommand:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[INSExtensionService delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "extensionService:contextDictionaryForCommand:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[INSExtensionService analytics:contextDictionaryForCommand:]";
      _os_log_error_impl(&dword_20BAA8000, v8, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:contextDictionaryForCommand:", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)analytics:(id)a3 contextDictionaryForError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[INSExtensionService delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "extensionService:contextDictionaryForError:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[INSExtensionService analytics:contextDictionaryForError:]";
      _os_log_error_impl(&dword_20BAA8000, v8, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:contextDictionaryForError:", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)completionHandlerForAppLaunchCommand:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__INSExtensionService_completionHandlerForAppLaunchCommand_withCompletion___block_invoke;
  v11[3] = &unk_24C4B98A0;
  v12 = v5;
  v13 = v6;
  v7 = v5;
  v8 = v6;
  v9 = (void *)MEMORY[0x20BD3AB28](v11);

  return v9;
}

- (NSDictionary)options
{
  return self->_options;
}

- (INSExtensionServiceDelegate)delegate
{
  return (INSExtensionServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_currentBundleIdForDisplay, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_requestDelegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __75__INSExtensionService_completionHandlerForAppLaunchCommand_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v15 = v5;
    v7 = objc_alloc_init(MEMORY[0x24BE811B8]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextDictionaryForCommand:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "ins_analyticsEndEventType");
    objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IFMergeDictionaries();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logEventWithType:context:contextNoCopy:", v11, v13, 1, v9, 0);

LABEL_5:
    v6 = v15;
    goto LABEL_6;
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    v15 = v6;
    (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
    goto LABEL_5;
  }
LABEL_6:

}

void __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BDD9A30];
  v8 = (void *)*MEMORY[0x24BDD9A30];
  v9 = *MEMORY[0x24BDD9A30];
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = v8;
      objc_msgSend(v6, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
      v26 = 2112;
      v27 = v18;
      _os_log_error_impl(&dword_20BAA8000, v17, OS_LOG_TYPE_ERROR, "%s Error finding extension for prewarming: %@", buf, 0x16u);

    }
    v15 = a1[4];
    INSExtensionServiceTraceCompletionHandlerWithCode(a1[8], 722470936);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ins_invokeErrorCompletionHandler:forUnderlyingError:", v16, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v8;
    objc_msgSend(v5, "_extension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_20BAA8000, v10, OS_LOG_TYPE_INFO, "%s Prewarmed extension: %@", buf, 0x16u);

  }
  v12 = objc_msgSend(a1[5], "ins_shouldPrewarmApp");
  v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
    v26 = 1024;
    LODWORD(v27) = v12;
    _os_log_impl(&dword_20BAA8000, v13, OS_LOG_TYPE_INFO, "%s Should prewarm app: %hhd", buf, 0x12u);
  }
  if (!v12)
  {
    objc_msgSend(a1[6], "_logPrewarmDidEndWithCommand:applicationIdentifier:wasPrewarmed:completionHandler:", a1[4], a1[7], 1, a1[8]);
    objc_msgSend(v5, "_connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reset");
LABEL_12:

    goto LABEL_13;
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke_58;
  v19[3] = &unk_24C4B9850;
  v14 = a1[5];
  v19[4] = a1[6];
  v20 = a1[4];
  v21 = a1[7];
  v23 = a1[8];
  v22 = v5;
  objc_msgSend(v22, "prewarmAppWithIntent:completionHandler:", v14, v19);

LABEL_13:
}

void __99__INSExtensionService__prewarmExtensionWithIntent_applicationIdentifier_command_completionHandler___block_invoke_58(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BDD9A30];
  v7 = *MEMORY[0x24BDD9A30];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
      _os_log_impl(&dword_20BAA8000, v6, OS_LOG_TYPE_INFO, "%s Prewarmed app completed successfully", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "-[INSExtensionService _prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_error_impl(&dword_20BAA8000, v6, OS_LOG_TYPE_ERROR, "%s Prewarmed app failed with error: %@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_logPrewarmDidEndWithCommand:applicationIdentifier:wasPrewarmed:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 56), "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reset");

}

void __65__INSExtensionService__extensionRequestDidFinishForIntent_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionService:extensionRequestDidFinishForApplication:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40));

}

void __59__INSExtensionService__extensionRequestWillStartForIntent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "_intents_bundleIdForDisplay");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionService:extensionRequestWillStartForApplication:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

}

void __45__INSExtensionService_resetExternalResources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reset");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke(id *a1)
{
  os_log_t *v2;
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  void *v53;
  float v54;
  void *v55;
  void *v56;
  NSObject *v57;
  os_log_t v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  char v71;
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v2 = (os_log_t *)MEMORY[0x24BDD9A30];
  v3 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v4 = a1[4];
    *(_DWORD *)buf = 136315394;
    v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    v91 = 2112;
    v92 = (uint64_t)v4;
    _os_log_impl(&dword_20BAA8000, v3, OS_LOG_TYPE_INFO, "%s Received handleCommand: %@", buf, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = a1[4];
  else
    v5 = 0;
  v6 = a1[5];
  v7 = objc_msgSend(v5, "ins_analyticsBeginEventType");
  objc_msgSend(v5, "ins_afAnalyticsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_logEventWithType:context:contextNoCopy:", v7, v8, 1);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v5, "ins_aceIntent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "hashedRouteUIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "airPlayRouteIds");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "extensionContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_airPlayRouteIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        v91 = 2112;
        v92 = (uint64_t)v11;
        v93 = 2112;
        v94 = v10;
        v95 = 2112;
        v96 = (uint64_t)v13;
        _os_log_debug_impl(&dword_20BAA8000, v14, OS_LOG_TYPE_DEBUG, "%s Examining AirPlay routes passed with INPlayMediaIntent airPlayRouteIds: %@, hashedRouteUIDs: %@, extensionContextAirPlayRouteIdentifiers: %@", buf, 0x2Au);
      }
      if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
      {
        v15 = 0;
      }
      else
      {
        v57 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
          v91 = 2112;
          v92 = (uint64_t)v13;
          _os_log_debug_impl(&dword_20BAA8000, v57, OS_LOG_TYPE_DEBUG, "%s Setting intent airPlayRouteIds from extension context: %@", buf, 0x16u);
        }
        v15 = v13;
      }

    }
    else
    {
      objc_msgSend(v9, "airPlayRouteIds");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (void *)v16;
      else
        v18 = (void *)MEMORY[0x24BDBD1A8];
      objc_msgSend(a1[5], "extensionContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_airPlayRouteIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v20);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v21 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        v91 = 2112;
        v92 = (uint64_t)v15;
        _os_log_debug_impl(&dword_20BAA8000, v21, OS_LOG_TYPE_DEBUG, "%s Setting intent airPlayRouteIds for non-INPlayMediaIntent: %@", buf, 0x16u);
      }
    }
    v22 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      v91 = 2112;
      v92 = (uint64_t)v15;
      _os_log_debug_impl(&dword_20BAA8000, v22, OS_LOG_TYPE_DEBUG, "%s Setting intent airPlayRouteIds: %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setAirPlayRouteIds:", v24);
    objc_msgSend(a1[5], "extensionContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_recordRoute");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setRecordRoute:", v26);

    objc_msgSend(a1[5], "extensionContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_recordDeviceUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setRecordDeviceUID:", v28);

    objc_msgSend(a1[5], "extensionContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_recordDeviceIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setRecordDeviceIdentifier:", v30);

    objc_msgSend(a1[5], "extensionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setAudioSessionID:", objc_msgSend(v31, "_audioSessionID"));

    if (!objc_msgSend(v9, "_executionContext"))
      objc_msgSend(v9, "_setExecutionContext:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1[5], "_connectionForIntent:", 0);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setIntent:", v9);
      v33 = a1[4];
      objc_msgSend(v33, "userActivityIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ins_launchAppWithConnection:userActivityIdentifier:delegate:completionHandler:", v32, v34, a1[5], a1[7]);

      goto LABEL_70;
    }
    v35 = *v2;
    v36 = *v2;
    if (!v9)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v73 = a1[4];
        *(_DWORD *)buf = 136315394;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        v91 = 2112;
        v92 = (uint64_t)v73;
        _os_log_error_impl(&dword_20BAA8000, v35, OS_LOG_TYPE_ERROR, "%s Unable to get INIntent from command %@", buf, 0x16u);
      }
      INSExtensionServiceTraceCompletionHandlerWithCode(a1[7], 722470896);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v32, 1303, 0);
      goto LABEL_70;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      v91 = 2112;
      v92 = (uint64_t)v9;
      _os_log_impl(&dword_20BAA8000, v35, OS_LOG_TYPE_INFO, "%s Generated intent object %@", buf, 0x16u);
      v35 = *v2;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v37 = v35;
      objc_msgSend(v9, "backingStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      v91 = 2112;
      v92 = (uint64_t)v38;
      _os_log_impl(&dword_20BAA8000, v37, OS_LOG_TYPE_INFO, "%s Raw intent = %@", buf, 0x16u);

    }
    objc_msgSend(v9, "launchId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    INExtractAppInfoFromSiriLaunchId();
    v32 = 0;

    if ((objc_msgSend(a1[5], "_prewarmExtensionWithIntent:applicationIdentifier:command:completionHandler:", v9, v32, v5, a1[7]) & 1) != 0)
    {
LABEL_70:

      goto LABEL_71;
    }
    v40 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_impl(&dword_20BAA8000, v40, OS_LOG_TYPE_INFO, "%s Not prewarm, continuing...", buf, 0xCu);
    }
    if (a1[6] && objc_msgSend(v9, "_type") == 2)
    {
      v41 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        _os_log_impl(&dword_20BAA8000, v41, OS_LOG_TYPE_INFO, "%s This is a remote device, and the intent type is custom. Checking for version incompatibility if the intent is sent from a remote device...", buf, 0xCu);
      }
      objc_msgSend(v9, "typeName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 0;
      v87 = 0;
      INSchemaWithTypeName();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      v45 = 0;

      objc_msgSend(v9, "_className");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "intentCodableDescriptionWithIntentClassName:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = v47;
      objc_msgSend(v47, "versioningHash");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v48, "unsignedLongValue");

      objc_msgSend(v9, "_metadata");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "versioningHash");

      v51 = *MEMORY[0x24BE81A80];
      v52 = INSGetAceVersionNumberFromString((void *)*MEMORY[0x24BE81A80]);
      objc_msgSend(a1[6], "aceVersion");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = INSGetAceVersionNumberFromString(v53);

      if (v52 != 0.0 && v54 != 0.0 && v78 && v50 && v78 != v50 && (float)(v52 - v54) >= 2.0)
      {
        v55 = (void *)*MEMORY[0x24BDD9A30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
        {
          v74 = v55;
          v75 = a1[6];
          v77 = v74;
          objc_msgSend(v75, "aceVersion");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316418;
          v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
          v91 = 2048;
          v92 = v50;
          v93 = 2112;
          v94 = v76;
          v95 = 2048;
          v96 = v78;
          v97 = 2112;
          v98 = v51;
          v99 = 2112;
          v100 = v9;
          _os_log_error_impl(&dword_20BAA8000, v77, OS_LOG_TYPE_ERROR, "%s Intent was sent from an old device with (intentVersionHash=%llu, aceVersion=%@), current device has (intentVersionHash=%llu, aceVersion=%@), intent: %@", buf, 0x3Eu);

        }
        INSExtensionServiceTraceCompletionHandlerWithCode(a1[7], 722470896);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v56, 1316, 0);

LABEL_69:
        goto LABEL_70;
      }

      v2 = (os_log_t *)MEMORY[0x24BDD9A30];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
      {
        v59 = v58;
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        v91 = 2112;
        v92 = (uint64_t)v61;
        _os_log_impl(&dword_20BAA8000, v59, OS_LOG_TYPE_INFO, "%s ins_recordPreInteractionSignals for command: %@", buf, 0x16u);

      }
      objc_msgSend(v9, "ins_recordPreInteractionSignals");
    }
    v62 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v9, "intentId");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeName");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "launchId");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend(v62, "initWithFormat:", CFSTR("%@-%@-%@"), v63, v64, v65);

    objc_msgSend(v44, "dataUsingEncoding:", 4);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v66 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      v91 = 2112;
      v92 = (uint64_t)v44;
      _os_log_impl(&dword_20BAA8000, v66, OS_LOG_TYPE_INFO, "%s Raw intent ID = %@", buf, 0x16u);
      v66 = *v2;
    }
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_impl(&dword_20BAA8000, v66, OS_LOG_TYPE_INFO, "%s Start digesting raw intent ID with in-memory salt...", buf, 0xCu);
    }
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_14;
    v80[3] = &unk_24C4B9800;
    v67 = v9;
    v68 = a1[5];
    v81 = v67;
    v82 = v68;
    v83 = v5;
    v85 = a1[7];
    v84 = a1[4];
    v69 = (void *)MEMORY[0x20BD3AB28](v80);
    objc_msgSend(a1[5], "delegate");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_opt_respondsToSelector();
    v72 = *v2;
    if ((v71 & 1) != 0)
    {
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        _os_log_impl(&dword_20BAA8000, v72, OS_LOG_TYPE_INFO, "%s Extension service delegate responds to extensionService:processDataUsingSHA256WithInMemorySalt:completionHandler:", buf, 0xCu);
      }
      objc_msgSend(v70, "extensionService:processDataUsingSHA256WithInMemorySalt:completionHandler:", a1[5], v45, v69);
    }
    else if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v90 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_error_impl(&dword_20BAA8000, v72, OS_LOG_TYPE_ERROR, "%s Extension service delegate does not respond to extensionService:processDataUsingSHA256WithInMemorySalt:completionHandler:", buf, 0xCu);
    }

    v43 = v81;
    goto LABEL_69;
  }
  objc_msgSend(a1[4], "ins_getIntentDefinitionsWithCompletionHandler:", a1[7]);
LABEL_71:

}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  dispatch_block_t v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "if_hexStringFromData:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSObject **)MEMORY[0x24BDD9A30];
  v8 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    _os_log_impl(&dword_20BAA8000, v8, OS_LOG_TYPE_INFO, "%s Finished digesting raw intent ID with in-memory salt.", buf, 0xCu);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_15;
  block[3] = &unk_24C4B97D8;
  v9 = v6;
  v16 = v9;
  v17 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v22 = *(id *)(a1 + 64);
  v21 = *(id *)(a1 + 56);
  v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  v14 = *v7;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_20BAA8000, v14, OS_LOG_TYPE_INFO, "%s Submitting pkdBlock", buf, 0xCu);
  }
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 8), v13);

}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_15(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id location;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (os_log_t *)MEMORY[0x24BDD9A30];
  v4 = *MEMORY[0x24BDD9A30];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      v49 = 2112;
      v50 = (uint64_t)v2;
      _os_log_impl(&dword_20BAA8000, v4, OS_LOG_TYPE_INFO, "%s Set facade intent identifier = %@", buf, 0x16u);
      v2 = *(void **)(a1 + 32);
    }
    objc_msgSend(*(id *)(a1 + 40), "setIdentifier:", v2);
  }
  else if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315394;
    v48 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    v49 = 2112;
    v50 = v6;
    _os_log_impl(&dword_20BAA8000, v4, OS_LOG_TYPE_INFO, "%s Unable to generate facade intent ID due to %@", buf, 0x16u);
  }
  v7 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    _os_log_impl(&dword_20BAA8000, v7, OS_LOG_TYPE_INFO, "%s About to prepare intent...", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 56), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "extensionService:prepareIntent:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    _os_log_impl(&dword_20BAA8000, v9, OS_LOG_TYPE_INFO, "%s Finished preparing intent", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 56), "_connectionForIntent:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "ins_launchAppWithConnection:delegate:completionHandler:", v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 64), "ins_resolveAppForIntent:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "_extensionInputItems");
      v25 = objc_claimAutoreleasedReturnValue();
      v11 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        v49 = 2112;
        v50 = v25;
        _os_log_impl(&dword_20BAA8000, v11, OS_LOG_TYPE_INFO, "%s Setting extension input items: %@", buf, 0x16u);
      }
      objc_msgSend(v10, "extensionInputItems", v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (v13)
        objc_msgSend(v10, "setExtensionInputItems:", v26);
      objc_initWeak(&location, v10);
      v14 = MEMORY[0x24BDAC760];
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_20;
      v39[3] = &unk_24C4B9678;
      objc_copyWeak(&v45, &location);
      v39[4] = *(_QWORD *)(a1 + 56);
      v40 = *(id *)(a1 + 40);
      v41 = *(id *)(a1 + 72);
      v44 = *(id *)(a1 + 80);
      v15 = v8;
      v42 = v15;
      v43 = *(id *)(a1 + 64);
      objc_msgSend(v10, "setTimeoutHandler:", v39);
      v34[0] = v14;
      v34[1] = 3221225472;
      v34[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_23;
      v34[3] = &unk_24C4B96A0;
      v34[4] = *(_QWORD *)(a1 + 56);
      v35 = *(id *)(a1 + 40);
      v36 = *(id *)(a1 + 64);
      v38 = *(id *)(a1 + 80);
      v16 = v15;
      v37 = v16;
      objc_msgSend(v10, "setInterruptionHandler:", v34);
      v17 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
        _os_log_impl(&dword_20BAA8000, v17, OS_LOG_TYPE_INFO, "%s Configured timeout and interruption handlers", buf, 0xCu);
      }
      kdebug_trace();
      objc_msgSend(*(id *)(a1 + 56), "_extensionRequestWillStartForIntent:", *(_QWORD *)(a1 + 40));
      v18 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "ins_afAnalyticsContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_logEventWithType:context:contextNoCopy:", 601, v19, 0);

      v20 = *v3;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v48 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
        v49 = 2112;
        v50 = (uint64_t)v21;
        _os_log_impl(&dword_20BAA8000, v20, OS_LOG_TYPE_INFO, "%s Resuming connection for intent with identifier: %@", buf, 0x16u);

      }
      v27[0] = v14;
      v27[1] = 3221225472;
      v27[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_24;
      v27[3] = &unk_24C4B97B0;
      v22 = *(id *)(a1 + 40);
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(void **)(a1 + 64);
      v28 = v22;
      v29 = v23;
      v30 = v24;
      v33 = *(id *)(a1 + 80);
      v31 = v16;
      v32 = *(id *)(a1 + 72);
      objc_msgSend(v10, "resumeWithCompletionHandler:", v27);

      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);

    }
  }

}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "_extensionRequestDidFinishForIntent:error:", *(_QWORD *)(a1 + 40), v3);
  v5 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
  {
    v13 = v5;
    objc_msgSend(WeakRetained, "requestTimeoutInterval");
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v17 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
    v18 = 2050;
    v19 = v15;
    v20 = 2112;
    v21 = v14;
    _os_log_error_impl(&dword_20BAA8000, v13, OS_LOG_TYPE_ERROR, "%s Extension Request timed out after %{public}f seconds for command %@", buf, 0x20u);

  }
  INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 72), 722470908);
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BE811A8]);
  ((void (**)(_QWORD, id, id))v6)[2](v6, v7, v3);

  objc_msgSend(*(id *)(a1 + 56), "extensionService:suspendTimeout:", *(_QWORD *)(a1 + 32), 0);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "ins_afAnalyticsContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextDictionaryForError:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IFMergeDictionaries();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_logEventWithType:context:contextNoCopy:", 605, v12, 0, v11, 0);

}

uint64_t __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_23(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_extensionRequestDidFinishForIntent:error:", *(_QWORD *)(a1 + 40), a2);
  v3 = *(void **)(a1 + 48);
  INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 64), 722470912);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v4, 1306, 0);

  return objc_msgSend(*(id *)(a1 + 56), "extensionService:suspendTimeout:", *(_QWORD *)(a1 + 32), 0);
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_24(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2;
  v41[3] = &unk_24C4B96C8;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v42 = v8;
  v43 = v9;
  v44 = v10;
  v45 = a1[9];
  v11 = MEMORY[0x20BD3AB28](v41);
  v12 = (void *)v11;
  if (!v5 || v6)
  {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
  }
  else
  {
    v13 = (void *)*MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
    {
      v14 = a1[4];
      v15 = v13;
      objc_msgSend(v14, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v47 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      v48 = 2112;
      v49 = v16;
      _os_log_impl(&dword_20BAA8000, v15, OS_LOG_TYPE_INFO, "%s Resumed connection for intent with identifier: %@", buf, 0x16u);

    }
    kdebug_trace();
    v17 = a1[5];
    objc_msgSend(a1[6], "ins_afAnalyticsContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_logEventWithType:context:contextNoCopy:", 602, v18, 0);

    objc_msgSend(a1[7], "extensionService:suspendTimeout:", a1[5], objc_msgSend(v5, "_isExtensionBeingDebugged"));
    v38[0] = v7;
    v38[1] = 3221225472;
    v38[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_25;
    v38[3] = &unk_24C4B96F0;
    v19 = a1[7];
    v20 = a1[5];
    v39 = v19;
    v40 = v20;
    objc_msgSend(v5, "setImageProcessingHandler:", v38);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2_27;
    block[3] = &unk_24C4B97D8;
    v21 = a1[6];
    block[4] = a1[5];
    v32 = v21;
    v33 = a1[4];
    v34 = v5;
    v35 = a1[8];
    v36 = a1[7];
    v37 = a1[9];
    v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    if (objc_msgSend(a1[5], "_shouldPrepareAudioSessionForCommand:intent:", a1[8], a1[4]))
    {
      v26[0] = v7;
      v26[1] = 3221225472;
      v26[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_3;
      v26[3] = &unk_24C4B9788;
      v23 = a1[4];
      v24 = a1[5];
      v27 = v23;
      v28 = v24;
      v30 = v22;
      v29 = a1[7];
      v25 = (void *)MEMORY[0x20BD3AB28](v26);
      objc_msgSend(a1[7], "extensionService:prepareForStartPlaybackWithDestination:intent:completion:", a1[5], 1, a1[4], v25);

    }
    else
    {
      dispatch_async(*((dispatch_queue_t *)a1[5] + 1), v22);
    }

  }
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
  {
    v14 = *(void **)(a1 + 32);
    v15 = v4;
    objc_msgSend(v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315650;
    v18 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
    v19 = 2112;
    v20 = v16;
    v21 = 2112;
    v22 = v3;
    _os_log_error_impl(&dword_20BAA8000, v15, OS_LOG_TYPE_ERROR, "%s Error resuming connection for intent with id: %@ - %@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_extensionRequestDidFinishForIntent:error:", *(_QWORD *)(a1 + 32), v3);
  if (!v3)
  {
    v6 = *(void **)(a1 + 48);
    INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 56), 722470900);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD9910]))
  {
    objc_msgSend(v3, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD98D0]);

    if (v12)
      goto LABEL_8;
    v13 = *(void **)(a1 + 48);
    INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 56), 722470896);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = v7;
    v10 = v3;
LABEL_10:
    objc_msgSend(v8, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v9, 1301, v10);

    goto LABEL_11;
  }

LABEL_8:
  objc_msgSend(*(id *)(a1 + 48), "ins_invokeErrorCompletionHandler:forUnderlyingError:", *(_QWORD *)(a1 + 56), v3);
LABEL_11:

}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, _QWORD);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(v4, "extensionService:wantsToCacheImage:", v5, a2);
  v6[2](v6, 0);

}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_2_27(uint64_t a1)
{
  void *v2;
  void *v3;
  INSExtensionServiceIntentExecutor *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logEventWithType:context:contextNoCopy:", 626, v3, 0);

  v4 = -[INSExtensionServiceIntentExecutor initWithIntent:extensionProxy:queue:]([INSExtensionServiceIntentExecutor alloc], "initWithIntent:extensionProxy:queue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 48);
    v7 = v5;
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_2";
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_20BAA8000, v7, OS_LOG_TYPE_INFO, "%s Created intent executor for intent with id %@. Sending intent for execution to execution proxy.", buf, 0x16u);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_29;
  v12[3] = &unk_24C4B9738;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v14 = v11;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v18 = *(id *)(a1 + 40);
  -[INSExtensionServiceIntentExecutor sendAceCommand:completionHandler:](v4, "sendAceCommand:completionHandler:", v9, v12);

}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD9A30];
  v4 = *MEMORY[0x24BDD9A30];
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = v3;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke_3";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_20BAA8000, v5, OS_LOG_TYPE_INFO, "%s Prepared to start playback for %@", buf, 0x16u);

    }
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 8), *(dispatch_block_t *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[INSExtensionService handleCommand:fromRemoteDevice:completionHandler:]_block_invoke";
      _os_log_error_impl(&dword_20BAA8000, v3, OS_LOG_TYPE_ERROR, "%s Failed to prepare for audio playback", buf, 0xCu);
    }
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_33;
    v10[3] = &unk_24C4B9760;
    v10[4] = v9;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v8, "extensionService:handleFailedStartPlaybackWithDestination:completion:", v9, 1, v10);

  }
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_33(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8), *(dispatch_block_t *)(a1 + 40));
}

void __72__INSExtensionService_handleCommand_fromRemoteDevice_completionHandler___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_transaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentIntentResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && objc_msgSend(*(id *)(a1 + 40), "_shouldPrepareAudioSessionForCommand:intent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56))&& (v5 || INIntentResponseIsFailure()))
  {
    objc_msgSend(*(id *)(a1 + 64), "extensionService:handleFailedStartPlaybackWithDestination:completion:", *(_QWORD *)(a1 + 40), 1, &__block_literal_global_31);
  }
  objc_msgSend(*(id *)(a1 + 40), "_extensionRequestDidFinishForIntent:error:", *(_QWORD *)(a1 + 56), v5);
  v9 = *(_QWORD *)(a1 + 80);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v12, v5);
  kdebug_trace();
  kdebug_trace();
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 72), "ins_afAnalyticsContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_logEventWithType:context:contextNoCopy:", 627, v11, 0);

}

@end
