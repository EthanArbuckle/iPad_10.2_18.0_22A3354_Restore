@implementation CDMDAGBaseService

- (CDMDAGBaseService)initWithConfig:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDMDAGBaseService;
  return -[CDMBaseService initWithConfig:](&v4, sel_initWithConfig_, a3);
}

- (id)supportedCommands
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  -[CDMDAGBaseService handleRequestCommandTypeNames](self, "handleRequestCommandTypeNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  v13.receiver = self;
  v13.super_class = (Class)CDMDAGBaseService;
  -[CDMBaseService supportedCommands](&v13, sel_supportedCommands);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)getCDMServiceAssetConfig
{
  return 0;
}

+ (BOOL)isEnabled
{
  return 1;
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
    v12 = "-[CDMDAGBaseService handleCommand:withCallback:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CDMDAGBaseService _handleSetupRequest:withCallback:](self, "_handleSetupRequest:withCallback:", v6, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CDMDAGBaseService _handleWarmupRequest:withCallback:](self, "_handleWarmupRequest:withCallback:", v6, v7);
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CDMDAGBaseService;
      -[CDMBaseService handleCommand:withCallback:](&v10, sel_handleCommand_withCallback_, v6, v7);
    }
  }

}

- (void)_handleSetupRequest:(id)a3 withCallback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSString *setupLanguageCode;
  void *v9;
  NSString *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  CDMDynamicConfig *v24;
  CDMDynamicConfig *currentConfig;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id location[3];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if ((objc_msgSend((id)objc_opt_class(), "isEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[CDMBaseService serviceName](self, "serviceName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v37 = "-[CDMDAGBaseService _handleSetupRequest:withCallback:]";
      v38 = 2112;
      v39 = v29;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Skipping handleSetupRequest as this service is DISABLED: %@", buf, 0x16u);

    }
    self->super._serviceState = 4;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (self->super._serviceState != 2)
    goto LABEL_10;
  setupLanguageCode = self->_setupLanguageCode;
  objc_msgSend(v6, "dynamicConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageCode");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (setupLanguageCode != v10)
  {

    goto LABEL_10;
  }
  objc_msgSend(v6, "dynamicConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CDMDAGBaseService isSetupRerunNeededForRequest:](self, "isSetupRerunNeededForRequest:", v14);

  if (!v15)
  {
    CDMOSLoggerForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[CDMBaseService serviceName](self, "serviceName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v37 = "-[CDMDAGBaseService _handleSetupRequest:withCallback:]";
      v38 = 2112;
      v39 = v30;
      _os_log_debug_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_DEBUG, "%s Skipping handleSetupRequest as this service already in READY state, locale does not change, and the service does not need re-setup: %@", buf, 0x16u);

    }
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v12;
    v7[2](v7, v12, 0);

    goto LABEL_17;
  }
LABEL_10:
  CDMOSLoggerForCategory(4);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  CDMOSLoggerForCategory(4);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    -[CDMBaseService serviceName](self, "serviceName");
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v20;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "DAGServiceSetup", "%{public}@ setup", buf, 0xCu);

  }
  objc_msgSend(v6, "dynamicConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "languageCode");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  v23 = self->_setupLanguageCode;
  self->_setupLanguageCode = v22;

  objc_msgSend(v6, "dynamicConfig");
  v24 = (CDMDynamicConfig *)objc_claimAutoreleasedReturnValue();
  currentConfig = self->_currentConfig;
  self->_currentConfig = v24;

  objc_initWeak((id *)buf, self);
  objc_initWeak(location, v7);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __54__CDMDAGBaseService__handleSetupRequest_withCallback___block_invoke;
  v31[3] = &unk_24DCAC5F8;
  objc_copyWeak(&v33, (id *)buf);
  v32 = v6;
  objc_copyWeak(&v34, location);
  +[CDMExceptionUtils runWrappingCppExceptions:](CDMExceptionUtils, "runWrappingCppExceptions:", v31);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)buf);
  CDMOSLoggerForCategory(4);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v27, OS_SIGNPOST_INTERVAL_END, v17, "DAGServiceSetup", ", buf, 2u);
  }

LABEL_17:
}

void __55__CDMDAGBaseService__handleWarmupRequest_withCallback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "warmup:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_handleWarmupRequest:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[CDMBaseService serviceName](self, "serviceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[CDMDAGBaseService _handleWarmupRequest:withCallback:]";
      v22 = 2112;
      v23 = v16;
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Skipping handleWarmupRequest as this service is DISABLED: %@", buf, 0x16u);

    }
    goto LABEL_7;
  }
  if (self->super._serviceState == 4)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[CDMBaseService serviceName](self, "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[CDMDAGBaseService _handleWarmupRequest:withCallback:]";
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping handleWarmupRequest as this service is in failed setup state: %@", buf, 0x16u);

    }
LABEL_7:

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_15;
  }
  v10 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v11 = (id)CDMLogContext;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    -[CDMBaseService serviceName](self, "serviceName");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DAGServiceWarmup", "%{public}@ warmup", buf, 0xCu);

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__CDMDAGBaseService__handleWarmupRequest_withCallback___block_invoke;
  v17[3] = &unk_24DCAC620;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  +[CDMExceptionUtils runWrappingCppExceptions:](CDMExceptionUtils, "runWrappingCppExceptions:", v17);

  v14 = (id)CDMLogContext;
  v15 = v14;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v15, OS_SIGNPOST_INTERVAL_END, v10, "DAGServiceWarmup", ", buf, 2u);
  }

LABEL_15:
}

+ (id)xpcEventStreamsSupported
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

+ (id)xpcActivitySupported
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

void __54__CDMDAGBaseService__handleSetupRequest_withCallback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  void (**v5)(id, id, void *);
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setup:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v3 = (id *)(a1 + 48);
    v4 = objc_loadWeakRetained(v3);

    if (v4)
    {
      v5 = (void (**)(id, id, void *))objc_loadWeakRetained(v3);
      objc_msgSend(v7, "cmdError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7, v6);

    }
  }

}

- (id)handle:(id)a3
{
  -[CDMDAGBaseService doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isSetupRerunNeededForRequest:(id)a3
{
  return !-[CDMDynamicConfig isEqualWithoutSandboxId:](self->_currentConfig, "isEqualWithoutSandboxId:", a3);
}

- (id)setup:(id)a3
{
  -[CDMDAGBaseService doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)handleRequestCommandTypeNames
{
  -[CDMDAGBaseService doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_setupLanguageCode, 0);
}

+ (BOOL)isAssetRequired
{
  return 1;
}

+ (id)getAssetFactorToFoldersMapping
{
  return 0;
}

+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5
{
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "+[CDMDAGBaseService handleXPCActivity:withAssets:withSelfMetadata:]";
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: handleXPCActivity called on a service that does not implement this method.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
}

+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "+[CDMDAGBaseService handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: handleXPCEvent called on a service that does not implement this method.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
}

@end
