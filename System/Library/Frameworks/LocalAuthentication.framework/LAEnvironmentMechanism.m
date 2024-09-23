@implementation LAEnvironmentMechanism

- (LAEnvironmentMechanism)initWithCoreMechanism:(id)a3
{
  id v5;
  LAEnvironmentMechanism *v6;
  LAEnvironmentMechanism *v7;
  LAEnvironmentMechanism *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)LAEnvironmentMechanism;
    v6 = -[LAEnvironmentMechanism init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_coreMechanism, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCoreMechanism:", v5);

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LAEnvironmentMechanism *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (LAEnvironmentMechanism *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LAEnvironmentMechanism coreMechanism](v4, "coreMechanism");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isUsable
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D443F8];
  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availabilityError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "error:hasCode:", v4, *MEMORY[0x1E0D442E0]);

  return (char)v2;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)iconSystemName
{
  void *v2;
  void *v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconSystemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)availabilityError
{
  void *v2;
  void *v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availabilityError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (LACEnvironmentMechanism)coreMechanism
{
  return self->_coreMechanism;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreMechanism, 0);
}

@end
