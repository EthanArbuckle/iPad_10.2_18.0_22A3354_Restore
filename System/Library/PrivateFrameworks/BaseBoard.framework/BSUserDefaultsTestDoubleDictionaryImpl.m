@implementation BSUserDefaultsTestDoubleDictionaryImpl

- (BSUserDefaultsTestDoubleDictionaryImpl)init
{
  BSUserDefaultsTestDoubleDictionaryImpl *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUserDefaultsTestDoubleDictionaryImpl;
  v2 = -[BSUserDefaultsTestDoubleDictionaryImpl init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
}

- (id)stringForKey:(id)a3
{
  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)arrayForKey:(id)a3
{
  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryForKey:(id)a3
{
  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataForKey:(id)a3
{
  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringArrayForKey:(id)a3
{
  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)integerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (float)floatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)doubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)URLForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[BSUserDefaultsTestDoubleDictionaryImpl objectForKey:](self, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUserDefaultsTestDoubleDictionaryImpl setObject:forKey:](self, "setObject:forKey:", v6, v7);

}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  double v6;
  void *v7;
  id v8;

  v8 = a4;
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUserDefaultsTestDoubleDictionaryImpl setObject:forKey:](self, "setObject:forKey:", v7, v8);

}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUserDefaultsTestDoubleDictionaryImpl setObject:forKey:](self, "setObject:forKey:", v6, v7);

}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUserDefaultsTestDoubleDictionaryImpl setObject:forKey:](self, "setObject:forKey:", v6, v7);

}

- (void)setURL:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUserDefaultsTestDoubleDictionaryImpl setObject:forKey:](self, "setObject:forKey:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
