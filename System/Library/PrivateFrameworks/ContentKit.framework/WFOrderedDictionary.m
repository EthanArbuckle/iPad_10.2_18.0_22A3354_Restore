@implementation WFOrderedDictionary

- (WFOrderedDictionary)initWithQueryItems:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  WFOrderedDictionary *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOrderedDictionary+URLQueryItems.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryItems"));

  }
  objc_msgSend(v5, "if_map:", &__block_literal_global_20486);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_map:", &__block_literal_global_6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFOrderedDictionary initWithObjects:forKeys:](self, "initWithObjects:forKeys:", v7, v6);

  return v8;
}

__CFString *__57__WFOrderedDictionary_URLQueryItems__initWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "value");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C4E3948;
  v4 = v2;

  return v4;
}

uint64_t __57__WFOrderedDictionary_URLQueryItems__initWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[WFOrderedDictionary dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFOrderedDictionary dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyEnumerator
{
  void *v2;
  void *v3;

  -[WFOrderedDictionary keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFOrderedDictionary)init
{
  WFOrderedDictionary *v2;
  uint64_t v3;
  NSOrderedSet *keys;
  uint64_t v5;
  NSDictionary *dictionary;
  WFOrderedDictionary *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFOrderedDictionary;
  v2 = -[WFOrderedDictionary init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSOrderedSet *)v3;

    v5 = objc_opt_new();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (WFOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  WFOrderedDictionary *v8;
  uint64_t v9;
  NSOrderedSet *keys;
  uint64_t v11;
  NSDictionary *dictionary;
  WFOrderedDictionary *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFOrderedDictionary;
  v8 = -[WFOrderedDictionary init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithObjects:count:", a4, a5);
    keys = v8->_keys;
    v8->_keys = (NSOrderedSet *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:count:", a3, a4, a5);
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)allKeys
{
  void *v2;
  void *v3;

  -[WFOrderedDictionary keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFOrderedDictionary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  WFOrderedDictionary *v11;
  id v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *dictionary;
  WFOrderedDictionary *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("keys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("objects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10
    || (v18.receiver = self,
        v18.super_class = (Class)WFOrderedDictionary,
        v11 = -[WFOrderedDictionary init](&v18, sel_init),
        (self = v11) == 0))
  {
    v16 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v11->_keys, v8);
    v12 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(v8, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSDictionary *)objc_msgSend(v12, "initWithObjects:forKeys:", v9, v13);
    dictionary = self->_dictionary;
    self->_dictionary = v14;

    self = self;
    v16 = self;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFOrderedDictionary keys](self, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keys"));

  -[WFOrderedDictionary allValues](self, "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("objects"));

}

- (NSOrderedSet)keys
{
  return self->_keys;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
