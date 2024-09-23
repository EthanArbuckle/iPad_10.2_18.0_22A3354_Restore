@implementation GDViewRemoteAccessRequesterGuardedData

- (GDViewRemoteAccessRequesterGuardedData)init
{
  GDViewRemoteAccessRequesterGuardedData *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSMapTable *strongWeakCache;
  uint64_t v8;
  NSMutableDictionary *persistentTokens;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GDViewRemoteAccessRequesterGuardedData;
  v2 = -[GDViewRemoteAccessRequesterGuardedData init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1AF45451C]();
    objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x1E0CB3748], v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    strongWeakCache = v2->_strongWeakCache;
    v2->_strongWeakCache = (NSMapTable *)v6;

    v8 = objc_opt_new();
    persistentTokens = v2->_persistentTokens;
    v2->_persistentTokens = (NSMutableDictionary *)v8;

    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  objc_msgSend_objectForKey_(self->_strongWeakCache, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend_objectForKey_(self->_persistentTokens, v7, (uint64_t)v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (NSMapTable)strongWeakCache
{
  return self->_strongWeakCache;
}

- (void)setStrongWeakCache:(id)a3
{
  objc_storeStrong((id *)&self->_strongWeakCache, a3);
}

- (NSMutableDictionary)persistentTokens
{
  return self->_persistentTokens;
}

- (void)setPersistentTokens:(id)a3
{
  objc_storeStrong((id *)&self->_persistentTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentTokens, 0);
  objc_storeStrong((id *)&self->_strongWeakCache, 0);
}

@end
