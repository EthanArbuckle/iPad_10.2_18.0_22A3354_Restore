@implementation FedStatsCohortQueryLocale

- (FedStatsCohortQueryLocale)init
{
  FedStatsCohortQueryLocale *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *deviceLocale;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FedStatsCohortQueryLocale;
  v2 = -[FedStatsCohortQueryLocale init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@"), v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    deviceLocale = v2->_deviceLocale;
    v2->_deviceLocale = (NSString *)v8;

  }
  return v2;
}

+ (id)cohortInstance
{
  return objc_alloc_init((Class)a1);
}

- (NSString)deviceLocale
{
  return self->_deviceLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLocale, 0);
}

@end
