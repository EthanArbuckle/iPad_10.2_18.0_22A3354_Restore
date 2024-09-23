@implementation CODefaults

+ (id)coordinationBundleID
{
  return CFSTR("com.apple.coordinated");
}

+ (id)userDefaultsForIdentifer:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.coordinated"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.coordinated"));
  }
  return v6;
}

@end
