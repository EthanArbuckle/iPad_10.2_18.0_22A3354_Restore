@implementation SPCacheAsset

- (SPCacheAsset)initWithName:(id)a3 size:(unint64_t)a4 state:(unint64_t)a5 accessDate:(id)a6
{
  id v11;
  id v12;
  SPCacheAsset *v13;
  SPCacheAsset *v14;
  double v15;
  objc_super v17;

  v11 = a3;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SPCacheAsset;
  v13 = -[SPCacheAsset init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_state = a5;
    v14->_size = a4;
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14->_accessDate = v15;
  }

  return v14;
}

+ (id)toProto:(id)a3
{
  id v3;
  SPProtoCacheAsset *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  v4 = objc_alloc_init(SPProtoCacheAsset);
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoCacheAsset setKey:](v4, "setKey:", v5);

  -[SPProtoCacheAsset setSize:](v4, "setSize:", objc_msgSend(v3, "size"));
  -[SPProtoCacheAsset setState:](v4, "setState:", objc_msgSend(v3, "state"));
  objc_msgSend(v3, "accessDate");
  v7 = v6;

  -[SPProtoCacheAsset setAccessDate:](v4, "setAccessDate:", v7);
  return v4;
}

+ (id)fromProto:(id)a3
{
  id v3;
  SPCacheAsset *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  v4 = objc_alloc_init(SPCacheAsset);
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCacheAsset setKey:](v4, "setKey:", v5);

  -[SPCacheAsset setState:](v4, "setState:", objc_msgSend(v3, "state"));
  -[SPCacheAsset setSize:](v4, "setSize:", objc_msgSend(v3, "size"));
  objc_msgSend(v3, "accessDate");
  v7 = v6;

  -[SPCacheAsset setAccessDate:](v4, "setAccessDate:", v7);
  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (double)accessDate
{
  return self->_accessDate;
}

- (void)setAccessDate:(double)a3
{
  self->_accessDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
