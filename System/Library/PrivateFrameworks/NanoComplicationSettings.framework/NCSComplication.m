@implementation NCSComplication

- (NCSComplication)initWithDictionary:(id)a3
{
  id v4;
  NCSComplication *v5;
  void *v6;
  uint64_t v7;
  NSString *appBundleIdentifier;
  void *v9;
  uint64_t v10;
  NSString *complicationBundleIdentifier;
  void *v12;
  uint64_t v13;
  NSString *sockPuppetIdentifier;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCSComplication;
  v5 = -[NCSComplication init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("complicationBundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    complicationBundleIdentifier = v5->_complicationBundleIdentifier;
    v5->_complicationBundleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sockPuppetIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    sockPuppetIdentifier = v5->_sockPuppetIdentifier;
    v5->_sockPuppetIdentifier = (NSString *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("active"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_active = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("installState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("installState"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_installState = objc_msgSend(v17, "integerValue");

    }
    else
    {
      v5->_installState = 2;
    }
  }

  return v5;
}

- (NSString)complicationIdentifier
{
  NSString *sockPuppetIdentifier;
  NSString *v3;

  sockPuppetIdentifier = self->_sockPuppetIdentifier;
  if (sockPuppetIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), self->_complicationBundleIdentifier, sockPuppetIdentifier);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_complicationBundleIdentifier;
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("name: %@, appBundleIdentifier: %@, complicationBundleIdentifier: %@, sockPuppetIdentifier: %@, isActive: %d, installState: %lu"), self->_name, self->_appBundleIdentifier, self->_complicationBundleIdentifier, self->_sockPuppetIdentifier, self->_active, self->_installState);
}

- (BOOL)isInstalled
{
  return self->_installState == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NCSComplication name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[NCSComplication appBundleIdentifier](self, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppBundleIdentifier:", v6);

  -[NCSComplication complicationBundleIdentifier](self, "complicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComplicationBundleIdentifier:", v7);

  objc_msgSend(v4, "setCannotBeDisabled:", -[NCSComplication cannotBeDisabled](self, "cannotBeDisabled"));
  objc_msgSend(v4, "setActive:", -[NCSComplication isActive](self, "isActive"));
  -[NCSComplication sockPuppetIdentifier](self, "sockPuppetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSockPuppetIdentifier:", v8);

  objc_msgSend(v4, "setInstallState:", -[NCSComplication installState](self, "installState"));
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)complicationBundleIdentifier
{
  return self->_complicationBundleIdentifier;
}

- (void)setComplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sockPuppetIdentifier
{
  return self->_sockPuppetIdentifier;
}

- (void)setSockPuppetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)cannotBeDisabled
{
  return self->_cannotBeDisabled;
}

- (void)setCannotBeDisabled:(BOOL)a3
{
  self->_cannotBeDisabled = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (unint64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(unint64_t)a3
{
  self->_installState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sockPuppetIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
