@implementation _HFHomePropertyCacheManagerKey

- (_HFHomePropertyCacheManagerKey)initWithObjectID:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  _HFHomePropertyCacheManagerKey *v9;
  _HFHomePropertyCacheManagerKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HFHomePropertyCacheManagerKey;
  v9 = -[_HFHomePropertyCacheManagerKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectID, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_HFHomePropertyCacheManagerKey objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_HFHomePropertyCacheManagerKey key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSUUID)objectID
{
  return self->_objectID;
}

- (NSString)key
{
  return self->_key;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _HFHomePropertyCacheManagerKey *v4;
  uint64_t v5;
  NSUUID *objectID;
  uint64_t v7;
  NSString *key;

  v4 = objc_alloc_init(_HFHomePropertyCacheManagerKey);
  -[_HFHomePropertyCacheManagerKey objectID](self, "objectID");
  v5 = objc_claimAutoreleasedReturnValue();
  objectID = v4->_objectID;
  v4->_objectID = (NSUUID *)v5;

  -[_HFHomePropertyCacheManagerKey key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  key = v4->_key;
  v4->_key = (NSString *)v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _HFHomePropertyCacheManagerKey *v4;
  _HFHomePropertyCacheManagerKey *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (_HFHomePropertyCacheManagerKey *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_HFHomePropertyCacheManagerKey;
    if (-[_HFHomePropertyCacheManagerKey isEqual:](&v12, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[_HFHomePropertyCacheManagerKey objectID](self, "objectID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HFHomePropertyCacheManagerKey objectID](v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        -[_HFHomePropertyCacheManagerKey key](self, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HFHomePropertyCacheManagerKey key](v5, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v9 == v10;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
