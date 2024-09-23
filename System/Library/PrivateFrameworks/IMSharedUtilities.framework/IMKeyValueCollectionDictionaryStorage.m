@implementation IMKeyValueCollectionDictionaryStorage

- (NSDictionary)dictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_dictionary, "copy");
}

- (IMKeyValueCollectionDictionaryStorage)initWithDictionary:(id)a3
{
  id v4;
  IMKeyValueCollectionDictionaryStorage *v5;
  uint64_t v6;
  NSMutableDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMKeyValueCollectionDictionaryStorage;
  v5 = -[IMKeyValueCollectionDictionaryStorage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (IMKeyValueCollectionDictionaryStorage)init
{
  return -[IMKeyValueCollectionDictionaryStorage initWithDictionary:](self, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", self->_dictionary);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMKeyValueCollectionDictionaryStorage;
  -[IMKeyValueCollectionDictionaryStorage description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ :%@]"), v4, self->_dictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
