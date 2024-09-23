@implementation AVTInMemoryResourceCacheEntry

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTInMemoryResourceCacheEntry;
  -[AVTInMemoryResourceCacheEntry description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendString:", CFSTR(" key: "));
  -[AVTInMemoryResourceCacheEntry key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (AVTInMemoryResourceCacheEntry)initWithResource:(id)a3 changeToken:(id)a4 key:(id)a5 cost:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  AVTInMemoryResourceCacheEntry *v14;
  AVTInMemoryResourceCacheEntry *v15;
  uint64_t v16;
  NSString *key;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTInMemoryResourceCacheEntry;
  v14 = -[AVTInMemoryResourceCacheEntry init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_resource, a3);
    objc_storeStrong((id *)&v15->_changeToken, a4);
    v16 = objc_msgSend(v13, "copy");
    key = v15->_key;
    v15->_key = (NSString *)v16;

    v15->_cost = a6;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[AVTCacheableResourceChangeToken stopObservingChanges](self->_changeToken, "stopObservingChanges");
  v3.receiver = self;
  v3.super_class = (Class)AVTInMemoryResourceCacheEntry;
  -[AVTInMemoryResourceCacheEntry dealloc](&v3, sel_dealloc);
}

- (AVTCachedResource)resource
{
  return self->_resource;
}

- (AVTCacheableResourceChangeToken)changeToken
{
  return self->_changeToken;
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end
