@implementation MTInMemoryDefaults

- (MTInMemoryDefaults)init
{
  MTInMemoryDefaults *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTInMemoryDefaults;
  v2 = -[MTInMemoryDefaults init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    storage = v2->_storage;
    v2->_storage = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)objectForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[MTInMemoryDefaults objectForKey:](self, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v6;
  v9 = v7;

  return v9;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTInMemoryDefaults storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (float)floatForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  float v9;
  float v10;

  v4 = a3;
  objc_opt_class();
  -[MTInMemoryDefaults storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTInMemoryDefaults storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  double v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MTInMemoryDefaults storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTInMemoryDefaults storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
