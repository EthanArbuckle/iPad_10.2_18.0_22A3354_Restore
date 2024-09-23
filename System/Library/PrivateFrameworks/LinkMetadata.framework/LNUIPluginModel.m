@implementation LNUIPluginModel

- (LNUIPluginModel)initWithPluginModelData:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  LNUIPluginModel *v9;
  LNUIPluginModel *v10;
  LNUIPluginModel *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNUIPluginModel;
  v9 = -[LNUIPluginModel init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pluginModelData, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNUIPluginModel pluginModelData](self, "pluginModelData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pluginModelData"));

  -[LNUIPluginModel bundleIdentifier](self, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

}

- (LNUIPluginModel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  LNUIPluginModel *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pluginModelData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[LNUIPluginModel initWithPluginModelData:bundleIdentifier:](self, "initWithPluginModelData:bundleIdentifier:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSData)pluginModelData
{
  return self->_pluginModelData;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginModelData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
