@implementation MCUIBridgeRMConfigurationsDataProvider

- (MCUIBridgeRMConfigurationsDataProvider)initWithProfileIdentifier:(id)a3
{
  id v5;
  MCUIBridgeRMConfigurationsDataProvider *v6;
  MCUIBridgeRMConfigurationsDataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCUIBridgeRMConfigurationsDataProvider;
  v6 = -[MCUIBridgeRMConfigurationsDataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_profileIdentifier, a3);

  return v7;
}

- (id)profileViewModels
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[MCUIBridgeRMConfigurationsDataProvider _rmConfigurationViewModels](self, "_rmConfigurationViewModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)pluginSectionViewModels
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[MCUIBridgeRMConfigurationsDataProvider _rmConfigurationViewModels](self, "_rmConfigurationViewModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginSectionViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)pluginViewModels
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[MCUIBridgeRMConfigurationsDataProvider _rmConfigurationViewModels](self, "_rmConfigurationViewModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)_rmConfigurationViewModels
{
  void *v3;
  void *v4;

  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedRMConfigurationViewModelsForIdentifier:", self->_profileIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConfigurationActivated:(BOOL)a3 forViewModel:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0D1C020];
  v8 = (void (**)(id, _QWORD, void *))a5;
  DMCErrorArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DMCErrorWithDomain:code:descriptionArray:errorType:", v7, 15008, v9, *MEMORY[0x1E0D1C030], 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D86F80]), "initWithError:isActivating:", v11, v5);
  v8[2](v8, 0, v10);

}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
}

@end
