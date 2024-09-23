@implementation CDMSetupRequestCommand

- (CDMDynamicConfig)dynamicConfig
{
  return self->_dynamicConfig;
}

- (CDMDataDispatcherContext)dataDispatcherContext
{
  return self->_dataDispatcherContext;
}

- (BOOL)shouldPerformWarmup
{
  return self->_shouldPerformWarmup;
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5
{
  return -[CDMSetupRequestCommand initWithDynamicConfig:selfMetadata:dataDispatcherContext:shouldPerformWarmup:](self, "initWithDynamicConfig:selfMetadata:dataDispatcherContext:shouldPerformWarmup:", a3, a4, a5, 1);
}

- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5 shouldPerformWarmup:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CDMSetupRequestCommand *v14;
  CDMSetupRequestCommand *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CDMSetupRequestCommand;
  v14 = -[CDMBaseCommand init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dynamicConfig, a3);
    objc_storeStrong((id *)&v15->_selfMetadata, a4);
    objc_storeStrong((id *)&v15->_dataDispatcherContext, a5);
    v15->_shouldPerformWarmup = a6;
  }

  return v15;
}

- (void)setDataDispatcherContext:(id)a3
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_dynamicConfig, 0);
}

- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3
{
  return -[CDMSetupRequestCommand initWithDynamicConfig:selfMetadata:dataDispatcherContext:](self, "initWithDynamicConfig:selfMetadata:dataDispatcherContext:", a3, 0, 0);
}

- (void)setShouldPerformWarmup:(BOOL)a3
{
  self->_shouldPerformWarmup = a3;
}

+ (id)setupWithLanguageCode:(id)a3
{
  id v3;
  CDMDynamicConfig *v4;
  CDMSetupRequestCommand *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[CDMDynamicConfig initWithLanguageCode:graphName:sandboxId:assetPaths:]([CDMDynamicConfig alloc], "initWithLanguageCode:graphName:sandboxId:assetPaths:", v3, 0, 0, 0);
    v5 = -[CDMSetupRequestCommand initWithDynamicConfig:]([CDMSetupRequestCommand alloc], "initWithDynamicConfig:", v4);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "+[CDMSetupRequestCommand setupWithLanguageCode:]";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s ERROR: Invalid setup: Lang:%@", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

@end
