@implementation EMFAnchoredSearchAnchorsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_4);
  return (id)sharedCache___sharedCache;
}

void __44__EMFAnchoredSearchAnchorsCache_sharedCache__block_invoke()
{
  EMFAnchoredSearchAnchorsCache *v0;
  void *v1;

  v0 = objc_alloc_init(EMFAnchoredSearchAnchorsCache);
  v1 = (void *)sharedCache___sharedCache;
  sharedCache___sharedCache = (uint64_t)v0;

}

- (EMFAnchoredSearchAnchorsCache)init
{
  EMFAnchoredSearchAnchorsCache *v2;
  NSCache *v3;
  NSCache *anchorsCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EMFAnchoredSearchAnchorsCache;
  v2 = -[EMFAnchoredSearchAnchorsCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    anchorsCache = v2->_anchorsCache;
    v2->_anchorsCache = v3;

    -[NSCache setDelegate:](v2->_anchorsCache, "setDelegate:", v2);
  }
  return v2;
}

- (id)anchorCollectionForLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMFAnchoredSearchAnchorsCache anchorsCache](self, "anchorsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAnchorCollection:(id)a3 forLocaleIdentifier:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a4;
  if ((unint64_t)a3 | v6)
  {
    v7 = a3;
    -[EMFAnchoredSearchAnchorsCache anchorsCache](self, "anchorsCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

    emf_logging_get_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1B3DE1000, v9, OS_LOG_TYPE_INFO, "Caching search anchors for locale identifier '%{public}@'", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)removeAnchorCollectionForLocaleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EMFAnchoredSearchAnchorsCache anchorsCache](self, "anchorsCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)purgeAllCachedAnchorCollections
{
  id v2;

  -[EMFAnchoredSearchAnchorsCache anchorsCache](self, "anchorsCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  emf_logging_get_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B3DE1000, v5, OS_LOG_TYPE_INFO, "Evicting '%@' from collections cache", (uint8_t *)&v6, 0xCu);
  }

}

- (NSCache)anchorsCache
{
  return self->_anchorsCache;
}

- (void)setAnchorsCache:(id)a3
{
  objc_storeStrong((id *)&self->_anchorsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorsCache, 0);
}

@end
