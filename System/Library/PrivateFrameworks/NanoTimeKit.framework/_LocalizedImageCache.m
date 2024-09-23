@implementation _LocalizedImageCache

- (_LocalizedImageCache)init
{
  _LocalizedImageCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LocalizedImageCache;
  v2 = -[_LocalizedImageCache init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__localeChanged, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

- (id)imageForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", a3);
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)_LocalizedImageCache;
  -[_LocalizedImageCache dealloc](&v4, sel_dealloc);
}

- (void)removeAllObjects
{
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
