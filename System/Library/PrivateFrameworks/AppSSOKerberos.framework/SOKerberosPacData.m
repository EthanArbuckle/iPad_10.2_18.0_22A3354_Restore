@implementation SOKerberosPacData

- (SOKerberosPacData)initWithValidationInfo:(id *)a3
{
  SOKerberosPacData *v4;
  SOKerberosPacData *v5;
  uint64_t v6;
  NSDate *passwordLastSet;
  uint64_t v8;
  NSDate *passwordCanChange;
  NSDate *passwordMustChange;
  char v11;
  uint64_t v12;
  uint64_t v13;
  NSString *homeDirectory;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SOKerberosPacData;
  v4 = -[SOKerberosPacData init](&v22, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SOKerberosPacData convertFromFileTime:](v4, "convertFromFileTime:", a3->var3);
    v6 = objc_claimAutoreleasedReturnValue();
    passwordLastSet = v5->_passwordLastSet;
    v5->_passwordLastSet = (NSDate *)v6;

    -[SOKerberosPacData convertFromFileTime:](v5, "convertFromFileTime:", a3->var4);
    v8 = objc_claimAutoreleasedReturnValue();
    passwordCanChange = v5->_passwordCanChange;
    v5->_passwordCanChange = (NSDate *)v8;

    if (a3->var5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      passwordMustChange = v5->_passwordMustChange;
      v5->_passwordMustChange = 0;
      v11 = 1;
    }
    else
    {
      -[SOKerberosPacData convertFromFileTime:](v5, "convertFromFileTime:");
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
      passwordMustChange = v5->_passwordMustChange;
      v5->_passwordMustChange = (NSDate *)v12;
    }

    v5->_passwordNeverExpires = v11;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", a3->var10.var6, a3->var10.var3);
    homeDirectory = v5->_homeDirectory;
    v5->_homeDirectory = (NSString *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", a3->var6.var6, a3->var6.var3);
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = &stru_24D3EC758;
    objc_storeStrong((id *)&v5->_effectiveName, v17);

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", a3->var7.var6, a3->var7.var3);
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = &stru_24D3EC758;
    objc_storeStrong((id *)&v5->_fullName, v20);

  }
  return v5;
}

- (id)convertFromFileTime:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)((a3 - 116444736000000000) / 0x989680));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SOKerberosPacData passwordLastSet](self, "passwordLastSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosPacData passwordCanChange](self, "passwordCanChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosPacData passwordMustChange](self, "passwordMustChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SOKerberosPacData passwordNeverExpires](self, "passwordNeverExpires"))
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  -[SOKerberosPacData homeDirectory](self, "homeDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("passwordLastSet: %@, passwordCanChange: %@, passwordMustChange: %@, passwordNeverExpires: %@, homeDirectory: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)passwordLastSet
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPasswordLastSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)passwordCanChange
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPasswordCanChange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)passwordMustChange
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPasswordMustChange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)passwordNeverExpires
{
  return self->_passwordNeverExpires;
}

- (void)setPasswordNeverExpires:(BOOL)a3
{
  self->_passwordNeverExpires = a3;
}

- (NSString)homeDirectory
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHomeDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)effectiveName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEffectiveName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFullName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_effectiveName, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_passwordMustChange, 0);
  objc_storeStrong((id *)&self->_passwordCanChange, 0);
  objc_storeStrong((id *)&self->_passwordLastSet, 0);
}

@end
