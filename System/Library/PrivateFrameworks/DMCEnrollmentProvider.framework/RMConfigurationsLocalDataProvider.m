@implementation RMConfigurationsLocalDataProvider

- (RMConfigurationsLocalDataProvider)initWithRMUIConfigurationInterface:(id)a3
{
  id v5;
  RMConfigurationsLocalDataProvider *v6;
  RMConfigurationsLocalDataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMConfigurationsLocalDataProvider;
  v6 = -[RMConfigurationsLocalDataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rmuiConfigInterface, a3);

  return v7;
}

- (id)profileViewModels
{
  void *v2;
  void *v3;

  -[RMConfigurationsLocalDataProvider rmuiConfigInterface](self, "rmuiConfigInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pluginSectionViewModels
{
  void *v2;
  void *v3;

  -[RMConfigurationsLocalDataProvider rmuiConfigInterface](self, "rmuiConfigInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginSectionViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pluginViewModels
{
  void *v2;
  void *v3;

  -[RMConfigurationsLocalDataProvider rmuiConfigInterface](self, "rmuiConfigInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setConfigurationActivated:(BOOL)a3 forViewModel:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[RMConfigurationsLocalDataProvider rmuiConfigInterface](self, "rmuiConfigInterface");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfigurationActivated:forViewModel:completionHandler:", v6, v9, v8);

}

- (RMUIConfigurationInterface)rmuiConfigInterface
{
  return self->_rmuiConfigInterface;
}

- (void)setRmuiConfigInterface:(id)a3
{
  objc_storeStrong((id *)&self->_rmuiConfigInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmuiConfigInterface, 0);
}

@end
