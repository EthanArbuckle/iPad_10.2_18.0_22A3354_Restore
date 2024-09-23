@implementation _DKKeyValueStore

- (_DKKeyValueStore)initWithSimpleKeyValueStore:(id)a3
{
  id v5;
  _DKKeyValueStore *v6;
  _DKKeyValueStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKKeyValueStore;
  v6 = -[_DKKeyValueStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

+ (id)standardUserDefaultsKeyValueStore
{
  void *v2;
  _DKKeyValueStore *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_DKKeyValueStore initWithSimpleKeyValueStore:]([_DKKeyValueStore alloc], "initWithSimpleKeyValueStore:", v2);

  return v3;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_DKKeyValueStore objectForKey:havingClass:](self, "objectForKey:havingClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[_DKKeyValueStore numberForKey:](self, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKKeyValueStore setNumber:forKey:](self, "setNumber:forKey:", v8, v7);

}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_DKKeyValueStore objectForKey:havingClass:](self, "objectForKey:havingClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_DKKeyValueStore objectForKey:havingClass:](self, "objectForKey:havingClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_DKKeyValueStore objectForKey:havingClass:](self, "objectForKey:havingClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_DKKeyValueStore objectForKey:havingClass:](self, "objectForKey:havingClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_DKKeyValueStore objectForKey:havingClass:](self, "objectForKey:havingClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectForKey:(id)a3
{
  return (id)-[_DKSimpleKeyValueStore objectForKey:](self->_store, "objectForKey:", a3);
}

- (id)objectForKey:(id)a3 havingClass:(Class)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  Class v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_DKSimpleKeyValueStore objectForKey:](self->_store, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_opt_class();
    else
      v8 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = 138413058;
      v11 = objc_opt_class();
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = a4;
      _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@: Object %@ of wrong class, found %@ instead of %@", (uint8_t *)&v10, 0x2Au);
    }

    v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[_DKSimpleKeyValueStore setObject:forKey:](self->_store, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[_DKSimpleKeyValueStore removeObjectForKey:](self->_store, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
