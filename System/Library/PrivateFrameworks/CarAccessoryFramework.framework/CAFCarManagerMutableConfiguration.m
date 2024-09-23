@implementation CAFCarManagerMutableConfiguration

- (CAFCarManagerMutableConfiguration)initWithIdentifier:(id)a3
{
  void *v4;
  CAFCarManagerMutableConfiguration *v5;

  +[CAFRegistrations registrationDictionaryForIdentifier:](CAFRegistrations, "registrationDictionaryForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFCarManagerMutableConfiguration initWithRegistrationDictionary:](self, "initWithRegistrationDictionary:", v4);

  return v5;
}

- (CAFCarManagerMutableConfiguration)initWithRegistrationFilePath:(id)a3
{
  void *v4;
  CAFCarManagerMutableConfiguration *v5;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFCarManagerMutableConfiguration initWithRegistrationDictionary:](self, "initWithRegistrationDictionary:", v4);

  return v5;
}

- (CAFCarManagerMutableConfiguration)initWithRegistrationDictionary:(id)a3
{
  id v4;
  CAFASCTree *v5;
  CAFCarManagerMutableConfiguration *v6;

  v4 = a3;
  v5 = -[CAFASCTree initWithDictionary:]([CAFASCTree alloc], "initWithDictionary:", v4);

  v6 = -[CAFCarManagerMutableConfiguration initWithASCTree:](self, "initWithASCTree:", v5);
  return v6;
}

- (CAFCarManagerMutableConfiguration)initWithASCTree:(id)a3
{
  id v4;
  CAFCarManagerMutableConfiguration *v5;
  CAFCarManagerMutableConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAFCarManagerMutableConfiguration;
  v5 = -[CAFCarManagerConfiguration init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CAFCarManagerConfiguration setRegistrations:](v5, "setRegistrations:", v4);

  return v6;
}

- (id)registrationFilePath
{
  return &stru_2508FF798;
}

- (void)setRegistrationFilePath:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFCarManagerMutableConfiguration setRegistrationsDictionary:](self, "setRegistrationsDictionary:", v4);

}

- (id)registrationsDictionary
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (void)setRegistrationsDictionary:(id)a3
{
  id v4;
  CAFASCTree *v5;

  v4 = a3;
  v5 = -[CAFASCTree initWithDictionary:]([CAFASCTree alloc], "initWithDictionary:", v4);

  -[CAFCarManagerConfiguration setRegistrations:](self, "setRegistrations:", v5);
}

@end
