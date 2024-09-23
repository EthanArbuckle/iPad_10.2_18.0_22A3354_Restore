@implementation CAFCachedDescription

- (CAFCachedDescription)initWithCacheable:(id)a3
{
  return -[CAFCachedDescription initWithCacheable:lazyRefreshDescription:](self, "initWithCacheable:lazyRefreshDescription:", a3, 0);
}

- (CAFCachedDescription)initWithCacheable:(id)a3 lazyRefreshDescription:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CAFCachedDescription *v7;
  CAFCachedDescription *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFCachedDescription;
  v7 = -[CAFCachedDescription init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_cacheLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v7->_cacheable, v6);
    if (v4)
    {
      v8->_lazyRefreshDescription = 1;
    }
    else
    {
      CAFGeneralLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      v8->_lazyRefreshDescription = !os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

    }
    -[CAFCachedDescription setNeedsRefreshDescription](v8, "setNeedsRefreshDescription");
  }

  return v8;
}

- (void)setNeedsRefreshDescription
{
  os_unfair_lock_s *p_cacheLock;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[CAFCachedDescription setNeedsRefresh:](self, "setNeedsRefresh:", 1);
  if (!-[CAFCachedDescription lazyRefreshDescription](self, "lazyRefreshDescription"))
    -[CAFCachedDescription _lock_refreshDescriptionIfNeeded](self, "_lock_refreshDescriptionIfNeeded");
  os_unfair_lock_unlock(p_cacheLock);
}

- (id)description
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[CAFCachedDescription _lock_refreshDescriptionIfNeeded](self, "_lock_refreshDescriptionIfNeeded");
  -[CAFCachedDescription cachedDescription](self, "cachedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_cacheLock);
  return v4;
}

- (void)_lock_refreshDescriptionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CAFCachedDescription needsRefresh](self, "needsRefresh"))
  {
    -[CAFCachedDescription cacheable](self, "cacheable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentDescriptionForCache:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    -[CAFCachedDescription setCachedDescription:](self, "setCachedDescription:", v5);

  }
  -[CAFCachedDescription setNeedsRefresh:](self, "setNeedsRefresh:", 0);
}

- (BOOL)lazyRefreshDescription
{
  return self->_lazyRefreshDescription;
}

- (void)setLazyRefreshDescription:(BOOL)a3
{
  self->_lazyRefreshDescription = a3;
}

- (CAFCacheableDescription)cacheable
{
  return (CAFCacheableDescription *)objc_loadWeakRetained((id *)&self->_cacheable);
}

- (void)setCacheable:(id)a3
{
  objc_storeWeak((id *)&self->_cacheable, a3);
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (NSString)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDescription, a3);
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_destroyWeak((id *)&self->_cacheable);
}

@end
