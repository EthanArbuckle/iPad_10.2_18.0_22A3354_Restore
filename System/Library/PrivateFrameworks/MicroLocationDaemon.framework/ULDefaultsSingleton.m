@implementation ULDefaultsSingleton

- (NSDictionary)defaultsDictionary
{
  return self->_defaultsDictionary;
}

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ULDefaultsSingleton_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_ul_once_token_0 != -1)
    dispatch_once(&shared_ul_once_token_0, block);
  return (id)shared_ul_once_object_0;
}

void __29__ULDefaultsSingleton_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_ul_once_object_0;
  shared_ul_once_object_0 = (uint64_t)v1;

}

- (ULDefaultsSingleton)init
{
  ULDefaultsSingleton *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ULDefaultsSingleton;
  v2 = -[ULDefaultsSingleton init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.milod"));
    -[ULDefaultsSingleton setDefaults:](v2, "setDefaults:", v3);

    -[ULDefaultsSingleton refresh](v2, "refresh");
  }
  return v2;
}

- (id)settingsString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  ULDefaultsSingleton *v11;

  v3 = (void *)objc_opt_new();
  -[ULDefaultsSingleton defaultsDictionary](self, "defaultsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__ULDefaultsSingleton_settingsString__block_invoke;
  v9[3] = &unk_2511D4590;
  v10 = v3;
  v11 = self;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ULSettingsOverrides:%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __37__ULDefaultsSingleton_settingsString__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("UL")))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "defaultsDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("   %@:%@"), v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
}

- (void)updateTemporaryKey:(id)a3 withObject:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  -[ULDefaultsSingleton defaultsDictionary](self, "defaultsDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("UL"), "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v7, v10);
  v11 = (void *)objc_msgSend(v12, "copy");
  -[ULDefaultsSingleton setDefaultsDictionary:](self, "setDefaultsDictionary:", v11);

}

- (void)resetTemporaryKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  -[ULDefaultsSingleton defaultsDictionary](self, "defaultsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("UL"), "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObjectForKey:", v7);
  v8 = (void *)objc_msgSend(v9, "copy");
  -[ULDefaultsSingleton setDefaultsDictionary:](self, "setDefaultsDictionary:", v8);

}

- (void)_defaultsSync
{
  void *v3;
  void *v4;
  id v5;

  -[ULDefaultsSingleton defaults](self, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  -[ULDefaultsSingleton setDefaultsDictionary:](self, "setDefaultsDictionary:", v4);

}

- (void)setDefaultsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDictionary, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_defaultsDictionary, 0);
}

@end
