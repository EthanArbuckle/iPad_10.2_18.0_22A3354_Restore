@implementation NUANFRenderingConfigurationProvider

- (NUANFRenderingConfigurationProvider)initWithAppConfigurationManager:(id)a3
{
  id v5;
  NUANFRenderingConfigurationProvider *v6;
  NUANFRenderingConfigurationProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFRenderingConfigurationProvider;
  v6 = -[NUANFRenderingConfigurationProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);

  return v7;
}

- (SXRenderingConfiguration)configuration
{
  SXRenderingConfiguration *configuration;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  SXRenderingConfiguration *v9;
  SXRenderingConfiguration *v10;
  id v12;

  configuration = self->_configuration;
  if (!configuration)
  {
    -[FCNewsAppConfigurationManager possiblyUnfetchedAppConfiguration](self->_appConfigurationManager, "possiblyUnfetchedAppConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anfRenderingConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    objc_msgSend(MEMORY[0x24BDBCE70], "fc_dictionaryFromJSON:error:", v5, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (!v7 && v6)
    {
      v8 = objc_alloc(MEMORY[0x24BE90710]);
      v9 = (SXRenderingConfiguration *)objc_msgSend(v8, "initWithJSONObject:andVersion:", v6, *MEMORY[0x24BE90730]);
      v10 = self->_configuration;
      self->_configuration = v9;

    }
    configuration = self->_configuration;
  }
  return configuration;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
