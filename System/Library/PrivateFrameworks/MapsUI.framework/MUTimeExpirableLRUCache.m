@implementation MUTimeExpirableLRUCache

- (MUTimeExpirableLRUCache)initWithMaxSize:(unint64_t)a3 timeToLive:(double)a4
{
  MUTimeExpirableLRUCache *v6;
  MUTimeExpirableLRUCache *v7;
  MULRUCache *v8;
  MULRUCache *valuesByCacheKeys;
  uint64_t v10;
  NSMutableDictionary *timestampsByCacheKeys;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MUTimeExpirableLRUCache;
  v6 = -[MUTimeExpirableLRUCache init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_maxSize = a3;
    v6->_timeToLiveInSeconds = a4;
    v8 = -[MULRUCache initWithMaxSize:]([MULRUCache alloc], "initWithMaxSize:", a3);
    valuesByCacheKeys = v7->_valuesByCacheKeys;
    v7->_valuesByCacheKeys = v8;

    -[MULRUCache setDelegate:](v7->_valuesByCacheKeys, "setDelegate:", v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
    timestampsByCacheKeys = v7->_timestampsByCacheKeys;
    v7->_timestampsByCacheKeys = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  double Current;
  double v7;
  double v8;
  MULRUCache *valuesByCacheKeys;
  void *v10;

  v4 = a3;
  if (!v4)
  {
    v10 = 0;
    goto LABEL_10;
  }
  -[NSMutableDictionary objectForKey:](self->_timestampsByCacheKeys, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v5, "doubleValue");
    v8 = Current - v7;
    if (v8 < 0.0)
      v8 = 0.0;
    valuesByCacheKeys = self->_valuesByCacheKeys;
    if (v8 <= self->_timeToLiveInSeconds)
    {
      -[MULRUCache objectForKey:](valuesByCacheKeys, "objectForKey:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[MULRUCache removeObjectForKey:](valuesByCacheKeys, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_timestampsByCacheKeys, "removeObjectForKey:", v4);
  }
  v10 = 0;
LABEL_9:

LABEL_10:
  return v10;
}

- (unint64_t)count
{
  return -[MULRUCache count](self->_valuesByCacheKeys, "count");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  MULRUCache *valuesByCacheKeys;
  id v7;
  CFAbsoluteTime Current;
  NSMutableDictionary *timestampsByCacheKeys;
  id v10;

  valuesByCacheKeys = self->_valuesByCacheKeys;
  v7 = a4;
  -[MULRUCache setObject:forKey:](valuesByCacheKeys, "setObject:forKey:", a3, v7);
  Current = CFAbsoluteTimeGetCurrent();
  timestampsByCacheKeys = self->_timestampsByCacheKeys;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Current);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](timestampsByCacheKeys, "setObject:forKey:", v10, v7);

}

- (void)lruCache:(id)a3 willEvictObject:(id)a4 forKey:(id)a5
{
  -[NSMutableDictionary removeObjectForKey:](self->_timestampsByCacheKeys, "removeObjectForKey:", a5, a4);
}

- (id)timestampForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_timestampsByCacheKeys, "objectForKey:", a3);
}

- (unint64_t)numberOfTimestamps
{
  return -[NSMutableDictionary count](self->_timestampsByCacheKeys, "count");
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesByCacheKeys, 0);
  objc_storeStrong((id *)&self->_timestampsByCacheKeys, 0);
}

@end
