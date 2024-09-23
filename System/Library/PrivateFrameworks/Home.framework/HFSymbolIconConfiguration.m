@implementation HFSymbolIconConfiguration

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIImageSymbolConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

- (HFSymbolIconConfiguration)initWithSystemImageName:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  HFSymbolIconConfiguration *v9;
  HFSymbolIconConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSymbolIconConfiguration;
  v9 = -[HFSymbolIconConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemImageName, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (HFSymbolIconConfiguration)initWithSystemImageName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HFSymbolIconConfiguration *v7;

  v4 = (void *)MEMORY[0x1E0CEA650];
  v5 = a3;
  objc_msgSend(v4, "configurationPreferringMulticolor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFSymbolIconConfiguration initWithSystemImageName:configuration:](self, "initWithSystemImageName:configuration:", v5, v6);

  return v7;
}

@end
