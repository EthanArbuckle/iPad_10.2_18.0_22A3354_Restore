@implementation BLSHPresentationEntry

- (BLSHPresentationEntry)initWithEnvironment:(id)a3 userObject:(id)a4
{
  id v7;
  id v8;
  BLSHPresentationEntry *v9;
  BLSHPresentationEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHPresentationEntry;
  v9 = -[BLSHPresentationEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_storeStrong(&v10->_userObject, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  BLSHBacklightSceneHostEnvironment *environment;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  environment = self->_environment;
  -[BLSHBacklightSceneHostEnvironment identifier](environment, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p:%@>"), environment, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("environment"));

  if (!self->_userObject)
    objc_msgSend(v3, "appendString:withName:", CFSTR("<nil>"), CFSTR("userObject"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_environment, CFSTR("environment"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_userObject, CFSTR("userObject"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return -[BLSHBacklightSceneHostEnvironment hash](self->_environment, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BLSHBacklightSceneHostEnvironment *environment;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    environment = self->_environment;
    objc_msgSend(v4, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BLSHBacklightSceneHostEnvironment isEqual:](environment, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BLSHEnvironmentDateSpecifier)currentSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  -[BLSHBacklightSceneHostEnvironment presentationDate](self->_environment, "presentationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BLSHBacklightSceneHostEnvironment visualState](self->_environment, "visualState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLSHEnvironmentDateSpecifier specifierWithPresentationDate:fidelity:environment:](BLSHEnvironmentDateSpecifier, "specifierWithPresentationDate:fidelity:environment:", v3, objc_msgSend(v4, "updateFidelity"), self->_environment);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (BLSHEnvironmentDateSpecifier *)v5;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (id)userObject
{
  return self->_userObject;
}

- (void)setUserObject:(id)a3
{
  objc_storeStrong(&self->_userObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userObject, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
