@implementation FCCachePolicy

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (double)maximumCachedAge
{
  return self->_maximumCachedAge;
}

+ (id)defaultCachePolicy
{
  if (qword_1ED0F82A0 != -1)
    dispatch_once(&qword_1ED0F82A0, &__block_literal_global_74);
  return (id)_MergedGlobals_167;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCachePolicy:", -[FCCachePolicy cachePolicy](self, "cachePolicy"));
  -[FCCachePolicy maximumCachedAge](self, "maximumCachedAge");
  objc_msgSend(v4, "setMaximumCachedAge:");
  return v4;
}

+ (FCCachePolicy)cachePolicyWithSoftMaxAge:(double)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCachePolicy:", 4);
  objc_msgSend(v4, "setMaximumCachedAge:", a3);
  return (FCCachePolicy *)v4;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void)setMaximumCachedAge:(double)a3
{
  self->_maximumCachedAge = a3;
}

uint64_t __39__FCCachePolicy_ignoreCacheCachePolicy__block_invoke()
{
  FCCachePolicy *v0;
  void *v1;

  v0 = objc_alloc_init(FCCachePolicy);
  v1 = (void *)qword_1ED0F82B8;
  qword_1ED0F82B8 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED0F82B8, "setCachePolicy:", 1);
}

uint64_t __35__FCCachePolicy_defaultCachePolicy__block_invoke()
{
  FCCachePolicy *v0;
  void *v1;

  v0 = objc_alloc_init(FCCachePolicy);
  v1 = (void *)_MergedGlobals_167;
  _MergedGlobals_167 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_167, "setCachePolicy:", 0);
}

+ (id)ignoreCacheCachePolicy
{
  if (qword_1ED0F82C0 != -1)
    dispatch_once(&qword_1ED0F82C0, &__block_literal_global_2_1);
  return (id)qword_1ED0F82B8;
}

+ (id)cachedOnlyCachePolicy
{
  if (qword_1ED0F82B0 != -1)
    dispatch_once(&qword_1ED0F82B0, &__block_literal_global_1_0);
  return (id)qword_1ED0F82A8;
}

uint64_t __38__FCCachePolicy_cachedOnlyCachePolicy__block_invoke()
{
  FCCachePolicy *v0;
  void *v1;

  v0 = objc_alloc_init(FCCachePolicy);
  v1 = (void *)qword_1ED0F82A8;
  qword_1ED0F82A8 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED0F82A8, "setCachePolicy:", 3);
}

- (NSDate)oldestAllowedDate
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v8;

  v3 = -[FCCachePolicy cachePolicy](self, "cachePolicy");
  if (v3 <= 5)
  {
    if (((1 << v3) & 0xD) != 0)
    {
      v4 = (void *)MEMORY[0x1E0C99D68];
    }
    else
    {
      if (((1 << v3) & 0x30) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v3 = objc_claimAutoreleasedReturnValue();
        return (NSDate *)(id)v3;
      }
      -[FCCachePolicy maximumCachedAge](self, "maximumCachedAge");
      v5 = (void *)MEMORY[0x1E0C99D68];
      if (v6 != 1.79769313e308)
      {
        -[FCCachePolicy maximumCachedAge](self, "maximumCachedAge");
        objc_msgSend(v5, "dateWithTimeIntervalSinceNow:", -v8);
        v3 = objc_claimAutoreleasedReturnValue();
        return (NSDate *)(id)v3;
      }
      v4 = (void *)MEMORY[0x1E0C99D68];
    }
    objc_msgSend(v4, "distantPast");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)(id)v3;
}

@end
