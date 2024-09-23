@implementation SOKerberosExtensionUserData

- (SOKerberosExtensionUserData)init
{
  SOKerberosExtensionUserData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SOKerberosExtensionUserData;
  v2 = -[SOKerberosExtensionUserData init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDefaults:", &unk_24D3F2C30);

  }
  return v2;
}

- (BOOL)useKeychain
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("useKeychain"));

  return v3;
}

- (void)setUseKeychain:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("useKeychain"));

}

- (BOOL)userSetKeychainChoice
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("userSetKeychainChoice"));

  return v3;
}

- (void)setUserSetKeychainChoice:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("userSetKeychainChoice"));

}

- (BOOL)useSmartCard
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("useSmartCard"));

  return v3;
}

- (void)setUseSmartCard:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("useSmartCard"));

}

@end
