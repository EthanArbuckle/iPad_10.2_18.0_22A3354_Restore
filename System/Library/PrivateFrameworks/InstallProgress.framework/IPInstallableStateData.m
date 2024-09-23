@implementation IPInstallableStateData

- (IPInstallableStateData)initWithIdentity:(id)a3 isInstalling:(BOOL)a4
{
  id v7;
  IPInstallableStateData *v8;
  IPInstallableStateData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPInstallableStateData;
  v8 = -[IPInstallableStateData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identity, a3);
    v9->_installing = a4;
  }

  return v9;
}

- (id)description
{
  const char *v2;

  if (self->_installing)
    v2 = "YES";
  else
    v2 = "NO";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p %@ installing: %s>"), self, self, self->_identity, v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IPInstallableStateData)initWithCoder:(id)a3
{
  id v4;
  IPInstallableStateData *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPInstallableStateData;
  v5 = -[IPInstallableStateData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("installing"));
    if (v6)
    {
      v8 = v7;
      objc_storeStrong((id *)&v5->_identity, v6);
      v5->_installing = v8;
    }
    else
    {
      _IPMakeNSErrorImpl((void *)*MEMORY[0x24BDD0B88], 4864, (uint64_t)"-[IPInstallableStateData initWithCoder:]", 85, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v9);

      v5 = 0;
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  LSApplicationIdentity *identity;
  id v5;

  identity = self->_identity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identity, CFSTR("identity"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_installing, CFSTR("installing"));

}

- (LSApplicationIdentity)identity
{
  return self->_identity;
}

- (BOOL)isInstalling
{
  return self->_installing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
