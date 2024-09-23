@implementation TESMatcherManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  return (id)sharedManager___sharedManager;
}

void __34__TESMatcherManager_sharedManager__block_invoke()
{
  TESMatcherManager *v0;
  void *v1;

  v0 = objc_alloc_init(TESMatcherManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

- (TESMatcherManager)init
{
  TESMatcherManager *v3;
  NSLock *v4;
  NSLock *matcherCacheLock;
  NSMutableDictionary *v6;
  NSMutableDictionary *matcherCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TESMatcherManager;
  v3 = -[TESMatcherManager init](&v9, sel_init);
  if (v3 == self)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    matcherCacheLock = self->_matcherCacheLock;
    self->_matcherCacheLock = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    matcherCache = self->_matcherCache;
    self->_matcherCache = v6;

  }
  return v3;
}

- (id)_getOrCreateMatcherForLocale:(id)a3
{
  id v4;
  void *v5;
  TESMatcher *v6;

  v4 = a3;
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_matcherCacheLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_matcherCache, "objectForKey:", v5);
  v6 = (TESMatcher *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_matcherCacheLock, "unlock");
  if (!v6)
  {
    v6 = -[TESMatcher initWithLocale:]([TESMatcher alloc], "initWithLocale:", v4);
    -[NSLock lock](self->_matcherCacheLock, "lock");
    -[NSMutableDictionary setObject:forKey:](self->_matcherCache, "setObject:forKey:", v6, v5);
    -[NSLock unlock](self->_matcherCacheLock, "unlock");
  }

  return v6;
}

- (NSMutableDictionary)matcherCache
{
  return self->_matcherCache;
}

- (void)setMatcherCache:(id)a3
{
  objc_storeStrong((id *)&self->_matcherCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherCache, 0);
  objc_storeStrong((id *)&self->_matcherCacheLock, 0);
}

@end
