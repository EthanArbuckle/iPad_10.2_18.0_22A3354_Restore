@implementation WDUserDefaults

- (WDUserDefaults)initWithHealthStore:(id)a3
{
  id v4;
  WDUserDefaults *v5;
  uint64_t v6;
  HKKeyValueDomain *keyValueDomain;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDUserDefaults;
  v5 = -[WDUserDefaults init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD3C98], "healthAppDefaultsDomainWithHealthStore:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    keyValueDomain = v5->_keyValueDomain;
    v5->_keyValueDomain = (HKKeyValueDomain *)v6;

  }
  return v5;
}

- (void)valueForKey:(id)a3 callback:(id)a4
{
  -[HKKeyValueDomain propertyListValueForKey:completion:](self->_keyValueDomain, "propertyListValueForKey:completion:", a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  -[HKKeyValueDomain setPropertyListValue:forKey:completion:](self->_keyValueDomain, "setPropertyListValue:forKey:completion:", a3, a4, a5);
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (void)setKeyValueDomain:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
}

@end
