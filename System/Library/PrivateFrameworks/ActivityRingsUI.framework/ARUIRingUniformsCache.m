@implementation ARUIRingUniformsCache

- (id)uniformsForRing:(id)a3 renderedInContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ARUIRingUniforms *v9;

  v6 = a3;
  v7 = a4;
  +[ARUIRingUniformsCacheKey keyForRing:context:](ARUIRingUniformsCacheKey, "keyForRing:context:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v8);
  v9 = (ARUIRingUniforms *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[ARUIRingUniforms initWithRing:inContext:]([ARUIRingUniforms alloc], "initWithRing:inContext:", v6, v7);
    -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v9, v8);
  }

  return v9;
}

+ (id)defaultCache
{
  return -[ARUIRingUniformsCache initWithLimit:]([ARUIRingUniformsCache alloc], "initWithLimit:", 10);
}

- (ARUIRingUniformsCache)initWithLimit:(unint64_t)a3
{
  ARUIRingUniformsCache *v4;
  NSCache *v5;
  NSCache *cache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARUIRingUniformsCache;
  v4 = -[ARUIRingUniformsCache init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v4->_cache;
    v4->_cache = v5;

    -[NSCache setCountLimit:](v4->_cache, "setCountLimit:", a3);
  }
  return v4;
}

+ (id)cacheWithLimit:(unint64_t)a3
{
  return -[ARUIRingUniformsCache initWithLimit:]([ARUIRingUniformsCache alloc], "initWithLimit:", a3);
}

- (void)clearCache
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
