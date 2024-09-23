@implementation _PHDictionaryKeyValueWrapper

- (_PHDictionaryKeyValueWrapper)initWithFetchedPropertyNamesByEntityName:(id)a3
{
  id v5;
  _PHDictionaryKeyValueWrapper *v6;
  _PHDictionaryKeyValueWrapper *v7;
  NSMutableSet *v8;
  NSMutableSet *missingPropertyNames;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PHDictionaryKeyValueWrapper;
  v6 = -[_PHDictionaryKeyValueWrapper init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchedPropertyNamesByEntityName, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    missingPropertyNames = v7->_missingPropertyNames;
    v7->_missingPropertyNames = v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p: dictionary:%@ missingKeys:%@>"), v5, self, self->_dictionary, self->_missingPropertyNames);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObjectID:(id)a3 dictionary:(id)a4
{
  id v7;
  NSDictionary *v8;
  NSDictionary *dictionary;
  id v10;

  objc_storeStrong((id *)&self->_objectID, a3);
  v10 = a3;
  v7 = a4;
  v8 = (NSDictionary *)objc_msgSend(v7, "copy");

  dictionary = self->_dictionary;
  self->_dictionary = v8;

  -[NSMutableSet removeAllObjects](self->_missingPropertyNames, "removeAllObjects");
}

- (NSSet)missingPropertyNames
{
  void *v3;

  v3 = (void *)-[NSMutableSet count](self->_missingPropertyNames, "count");
  if (v3)
    v3 = (void *)-[NSMutableSet copy](self->_missingPropertyNames, "copy");
  return (NSSet *)v3;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *fetchedPropertyNamesByEntityName;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    fetchedPropertyNamesByEntityName = self->_fetchedPropertyNamesByEntityName;
    -[NSManagedObjectID entity](self->_objectID, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](fetchedPropertyNamesByEntityName, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "containsObject:", v4) & 1) == 0)
      -[NSMutableSet addObject:](self->_missingPropertyNames, "addObject:", v4);

  }
  return v5;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_missingPropertyNames, 0);
  objc_storeStrong((id *)&self->_fetchedPropertyNamesByEntityName, 0);
}

@end
