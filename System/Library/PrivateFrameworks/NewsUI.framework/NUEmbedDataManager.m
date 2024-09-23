@implementation NUEmbedDataManager

- (void)loadEmbedDataWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[NUEmbedDataManager embedConfigurationLoader](self, "embedConfigurationLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "loadEmbededConfigurationWithCompletion:", v6);

}

- (NUEmbedConfigurationLoader)embedConfigurationLoader
{
  return self->_embedConfigurationLoader;
}

- (NUEmbedDataManager)initWithEmbedConfigurationLoader:(id)a3
{
  id v5;
  NUEmbedDataManager *v6;
  NUEmbedDataManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUEmbedDataManager;
  v6 = -[NUEmbedDataManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_embedConfigurationLoader, a3);

  return v7;
}

- (id)embedForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NUEmbedDataManager embedConfigurationLoader](self, "embedConfigurationLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "embedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (SXJSONDictionary)embedConfiguration
{
  return self->_embedConfiguration;
}

- (void)setEmbedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_embedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedConfiguration, 0);
  objc_storeStrong((id *)&self->_embedConfigurationLoader, 0);
}

@end
