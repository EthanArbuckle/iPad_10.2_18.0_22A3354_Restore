@implementation _CRSearchCollectionPredicate

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collection, CFSTR("collection"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (_CRSearchCollectionPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _CRSearchCollectionPredicate *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("collection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_CRSearchCollectionPredicate initWithKey:collection:](self, "initWithKey:collection:", v5, v6);
  return v7;
}

- (_CRSearchCollectionPredicate)initWithKey:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  _CRSearchCollectionPredicate *v8;
  uint64_t v9;
  NSString *key;
  uint64_t v11;
  NSArray *collection;
  _CRSearchCollectionPredicate *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CRSearchCollectionPredicate;
  v8 = -[CRSearchPredicate init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    key = v8->_key;
    v8->_key = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    collection = v8->_collection;
    v8->_collection = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)asNSPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), self->_key, self->_collection);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _CRSearchCollectionPredicate *v4;
  NSString *key;
  NSArray *collection;
  BOOL v7;

  v4 = (_CRSearchCollectionPredicate *)a3;
  v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (key = self->_key, (unint64_t)key | (unint64_t)v4->_key)
      && !-[NSString isEqual:](key, "isEqual:")
      || (collection = self->_collection, (unint64_t)collection | (unint64_t)v4->_collection)
      && !-[NSArray isEqual:](collection, "isEqual:"))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_key);
  return objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", self->_collection) - v3 + 32 * v3 + 16337;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)collection
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end
