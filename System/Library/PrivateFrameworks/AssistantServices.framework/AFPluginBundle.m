@implementation AFPluginBundle

- (AFPluginBundle)init
{
  AFPluginBundle *v2;
  uint64_t v3;
  NSMutableDictionary *classIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFPluginBundle;
  v2 = -[AFPluginBundle init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    classIdentifiers = v2->_classIdentifiers;
    v2->_classIdentifiers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerClassIdentifier:(id)a3 forDomain:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (v14 && v8 && v9)
  {
    -[AFPluginBundle classIdentifiers](self, "classIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFPluginBundle classIdentifiers](self, "classIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v9);
    }
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (BOOL)supportsClassIdentifier:(id)a3 forDomainKey:(id)a4 groupIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if (!a3 || !a4 || !a5)
    return 0;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AFPluginBundle classIdentifiers](self, "classIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v13, "containsObject:", v10);
  return (char)v8;
}

- (Class)factoryClass
{
  return self->_factoryClass;
}

- (void)setFactoryClass:(Class)a3
{
  objc_storeStrong((id *)&self->_factoryClass, a3);
}

- (id)factoryInstance
{
  return self->_factoryInstance;
}

- (void)setFactoryInstance:(id)a3
{
  objc_storeStrong(&self->_factoryInstance, a3);
}

- (NSMutableDictionary)classIdentifiers
{
  return self->_classIdentifiers;
}

- (void)setClassIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_classIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classIdentifiers, 0);
  objc_storeStrong(&self->_factoryInstance, 0);
  objc_storeStrong((id *)&self->_factoryClass, 0);
}

@end
