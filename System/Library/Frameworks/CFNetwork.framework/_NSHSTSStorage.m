@implementation _NSHSTSStorage

- (_CFHSTSPolicy)_policyRef
{
  return self->_policy;
}

+ (id)sharedPersistentStore
{
  if (+[_NSHSTSStorage sharedPersistentStore]::sOnce != -1)
    dispatch_once(&+[_NSHSTSStorage sharedPersistentStore]::sOnce, &__block_literal_global_3138);
  return (id)+[_NSHSTSStorage sharedPersistentStore]::store;
}

- (id)initInMemoryStore
{
  _NSHSTSStorage *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSHSTSStorage;
  v2 = -[_NSHSTSStorage init](&v4, sel_init);
  if (v2)
    v2->_policy = (_CFHSTSPolicy *)_CFHSTSPolicyCreateWithStorageLocation(0);
  return v2;
}

- (id)initPersistentStoreWithURL:(id)a3
{
  _NSHSTSStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSHSTSStorage;
  v4 = -[_NSHSTSStorage init](&v6, sel_init);
  if (v4)
    v4->_policy = (_CFHSTSPolicy *)_CFHSTSPolicyCreateWithStorageLocation((CFURLRef)a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_policy);
  v3.receiver = self;
  v3.super_class = (Class)_NSHSTSStorage;
  -[_NSHSTSStorage dealloc](&v3, sel_dealloc);
}

- (NSURL)path
{
  _CFHSTSPolicy *policy;
  char *v3;

  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
  v3 = (char *)policy + 16;
  if (!policy)
    v3 = 0;
  return *(NSURL **)(*((_QWORD *)v3 + 2) + 64);
}

- (BOOL)shouldPromoteHostToHTTPS:(id)a3
{
  _CFHSTSPolicy *policy;
  HSTSPolicy *v5;
  unsigned __int8 v7;

  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
  if (policy)
    v5 = (HSTSPolicy *)((char *)policy + 16);
  else
    v5 = 0;
  return HSTSPolicy::isKnownHSTSHost(v5, (NSString *)a3, &v7) != 0;
}

- (BOOL)shouldPromoteHostToHTTPS:(id)a3 isPreload:(BOOL *)a4
{
  _CFHSTSPolicy *policy;
  HSTSPolicy *v7;
  unsigned int v8;
  unsigned __int8 v10;

  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
  v10 = 0;
  if (policy)
    v7 = (HSTSPolicy *)((char *)policy + 16);
  else
    v7 = 0;
  v8 = HSTSPolicy::isKnownHSTSHost(v7, (NSString *)a3, &v10);
  if (a4)
    *a4 = v10 != 0;
  return v8 != 0;
}

- (id)nonPreloadedHosts
{
  void *v3;
  _CFHSTSPolicy *policy;
  HSTSPolicy *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
  if (policy)
    v5 = (HSTSPolicy *)((char *)policy + 16);
  else
    v5 = 0;
  v6 = HSTSPolicy::copyExternalRepresentationOfHSTSPolicies(v5);
  if (v6)
  {
    v7 = v6;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (!objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v12), "objectForKeyedSubscript:", CFSTR("_kCFNetworkHSTSPreloaded")))objc_msgSend(v3, "addObject:", v12);
        }
        v9 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  return v3;
}

- (void)resetHSTSForHost:(id)a3
{
  _CFHSTSPolicy *policy;
  HSTSCache **v5;

  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
  v5 = (HSTSCache **)((char *)policy + 16);
  if (!policy)
    v5 = 0;
  HSTSCache::modifyHSTSStore(v5[2], a3, 0, 0);
}

- (void)resetHSTSHostsSinceDate:(id)a3
{
  _CFHSTSPolicy *policy;
  HSTSCache **v5;

  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
  v5 = (HSTSCache **)((char *)policy + 16);
  if (!policy)
    v5 = 0;
  HSTSCache::modifyHSTSStore(v5[2], 0, 0, a3);
}

- (void)handleSTSHeader:(id)a3 forURL:(id)a4
{
  _CFHSTSPolicy *policy;
  HSTSPolicy *v7;

  policy = self->_policy;
  if (HSTSPolicy::Class(void)::sOnce_HSTSPolicy != -1)
    dispatch_once(&HSTSPolicy::Class(void)::sOnce_HSTSPolicy, &__block_literal_global_313);
  if (policy)
    v7 = (HSTSPolicy *)((char *)policy + 16);
  else
    v7 = 0;
  HSTSPolicy::handleSTSHeader(v7, (const __CFString *)a3, (const __CFURL *)a4);
}

@end
