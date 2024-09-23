@implementation CRKUserDefaultsObject

- (CRKUserDefaultsObject)initWithKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CRKUserDefaultsObject *v7;

  v4 = (void *)MEMORY[0x24BDBCF50];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKUserDefaultsObject initWithStore:key:](self, "initWithStore:key:", v6, v5);

  return v7;
}

- (CRKUserDefaultsObject)initWithStore:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  CRKUserDefaultsObject *v9;
  CRKUserDefaultsObject *v10;
  uint64_t v11;
  NSString *key;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKUserDefaultsObject;
  v9 = -[CRKUserDefaultsObject init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    v11 = objc_msgSend(v8, "copy");
    key = v10->_key;
    v10->_key = (NSString *)v11;

  }
  return v10;
}

- (id)value
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKUserDefaultsObject store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKUserDefaultsObject key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRKUserDefaultsObject store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKUserDefaultsObject key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, v5);
  else
    objc_msgSend(v4, "removeObjectForKey:", v5);

}

- (void)registerDefaultValue:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRKUserDefaultsObject store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKUserDefaultsObject store](self, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKUserDefaultsObject key](self, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerDefaults:", v9);

  }
}

- (NSString)key
{
  return self->_key;
}

- (CRKKeyObjectStoring)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
