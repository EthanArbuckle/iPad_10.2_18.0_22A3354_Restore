@implementation MTFrozenBag

- (MTFrozenBag)initWithProfile:(id)a3 profileVersion:(id)a4 config:(id)a5
{
  id v9;
  id v10;
  id v11;
  MTFrozenBag *v12;
  uint64_t v13;
  NSDictionary *config;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MTFrozenBag;
  v12 = -[MTFrozenBag init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    config = v12->_config;
    v12->_config = (NSDictionary *)v13;

    objc_storeStrong((id *)&v12->_profile, a3);
    objc_storeStrong((id *)&v12->_profileVersion, a4);
  }

  return v12;
}

- (MTFrozenBag)initWithConfig:(id)a3
{
  return -[MTFrozenBag initWithProfile:profileVersion:config:](self, "initWithProfile:profileVersion:config:", CFSTR("frozen"), CFSTR("1.0"), a3);
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[MTFrozenBag expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4 < 0.0;

  return v5;
}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithTimeInterval:sinceDate:", v3, 86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MTFrozenBag config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no array value for key %@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("MTFrozenBag"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x24BE08068], "frozenBagValueWithKey:value:valueType:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MTFrozenBag config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no BOOLean value for key %@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("MTFrozenBag"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x24BE08068], "frozenBagValueWithKey:value:valueType:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MTFrozenBag config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no double value for key %@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("MTFrozenBag"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x24BE08068], "frozenBagValueWithKey:value:valueType:", v4, v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)integerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MTFrozenBag config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no integer value for key %@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("MTFrozenBag"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x24BE08068], "frozenBagValueWithKey:value:valueType:", v4, v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MTFrozenBag config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no string value for key %@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("MTFrozenBag"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x24BE08068], "frozenBagValueWithKey:value:valueType:", v4, v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MTFrozenBag config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no url value for key %@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("MTFrozenBag"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x24BE08068], "frozenBagValueWithKey:value:valueType:", v4, v6, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MTFrozenBag config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no dictionary value for key %@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", CFSTR("MTFrozenBag"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x24BE08068], "frozenBagValueWithKey:value:valueType:", v4, v6, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
