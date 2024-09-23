@implementation PKHandwritingTranscriptionCache

- (PKHandwritingTranscriptionCache)init
{
  PKHandwritingTranscriptionCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKHandwritingTranscriptionCache;
  v2 = -[PKHandwritingTranscriptionCache init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  cache = v2->_cache;
  v2->_cache = (NSMutableDictionary *)v3;

  return v2;
}

- (void)addCachedTranscription:(id)a3 forStrokeGroup:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)clearCacheForStrokeGroup:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", a3);
}

- (id)cachedTranscriptionForStrokeGroup:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allCachedGroups
{
  return (id)-[NSMutableDictionary allKeys](self->_cache, "allKeys");
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKHandwritingTranscriptionCache *v4;
  uint64_t v5;
  NSMutableDictionary *cache;

  v4 = objc_alloc_init(PKHandwritingTranscriptionCache);
  v5 = -[NSMutableDictionary copy](self->_cache, "copy");
  cache = v4->_cache;
  v4->_cache = (NSMutableDictionary *)v5;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
