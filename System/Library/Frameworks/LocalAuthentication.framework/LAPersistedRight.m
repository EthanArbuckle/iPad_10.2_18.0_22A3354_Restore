@implementation LAPersistedRight

- (LAPersistedRight)initWithIdentifier:(id)a3 accessKey:(id)a4 privateKeys:(id)a5 secrets:(id)a6
{
  id v11;
  id v12;
  LAPersistedRight *v13;
  LAPersistedRight *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)LAPersistedRight;
  v13 = -[LARight initWithIdentifier:accessKey:](&v16, sel_initWithIdentifier_accessKey_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_secrets, a6);
    objc_storeStrong((id *)&v14->_privateKeys, a5);
  }

  return v14;
}

- (LASecret)secret
{
  void *v3;

  if (-[NSArray count](self->_secrets, "count") >= 2)
    -[LAPersistedRight secret].cold.1();
  -[NSArray firstObject](self->_secrets, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRight:", self);
  return (LASecret *)v3;
}

- (LAPrivateKey)key
{
  void *v3;

  if (-[NSArray count](self->_privateKeys, "count") != 1)
    -[LAPersistedRight key].cold.1();
  -[NSArray firstObject](self->_privateKeys, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRight:", self);
  return (LAPrivateKey *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeys, 0);
  objc_storeStrong((id *)&self->_secrets, 0);
}

- (void)secret
{
  __assert_rtn("-[LAPersistedRight secret]", "LAPersistedRight.m", 39, "_secrets.count <= 1");
}

- (void)key
{
  __assert_rtn("-[LAPersistedRight key]", "LAPersistedRight.m", 47, "_privateKeys.count == 1");
}

@end
