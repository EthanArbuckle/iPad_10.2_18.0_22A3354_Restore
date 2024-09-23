@implementation EMUserProfileProvider

id __47__EMUserProfileProvider__contactEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "value");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EMUserProfileProvider)init
{
  EMUserProfileProvider *v2;
  EMUserProfileProvider *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *cacheQueue;
  uint64_t v8;
  NSMutableArray *knownToBeMyEmail;
  uint64_t v10;
  NSMutableArray *knownToNotBeMyEmail;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EMUserProfileProvider;
  v2 = -[EMUserProfileProvider init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.mail.user-profile", v5);
    cacheQueue = v3->_cacheQueue;
    v3->_cacheQueue = (OS_dispatch_queue *)v6;

    v3->_outstandingCacheRefreshes = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    knownToBeMyEmail = v3->_knownToBeMyEmail;
    v3->_knownToBeMyEmail = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    knownToNotBeMyEmail = v3->_knownToNotBeMyEmail;
    v3->_knownToNotBeMyEmail = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__accountsChanged_, *MEMORY[0x1E0D1E4F8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v3, sel__contactsChanged_, *MEMORY[0x1E0C96870], 0);

  }
  return v3;
}

- (id)_contactEmailAddresses
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0D1E458]);
  -[EMUserProfileProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "emailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_map:", &__block_literal_global_25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObjectsFromArray:", v7);
  }

  return v3;
}

- (id)contact
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMUserProfileProvider contactWithKeysToFetch:](self, "contactWithKeysToFetch:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contactWithKeysToFetch:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMUserProfileProvider contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_msgSend(MEMORY[0x1E0C97298], "em_authorizedContactStore");
    v4 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

void __44__EMUserProfileProvider_refreshCachedValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  id obj;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "hasAccountsConfigured"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_accountsEmailAddresses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v2, CFSTR("_account"));

    objc_msgSend(*(id *)(a1 + 32), "_contactEmailAddresses");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v3, CFSTR("_contact"));

    v4 = objc_alloc_init(MEMORY[0x1E0D1E458]);
    objc_msgSend(obj, "objectForKeyedSubscript:", CFSTR("_account"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

    objc_msgSend(obj, "objectForKeyedSubscript:", CFSTR("_contact"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v6);

    objc_msgSend(obj, "setObject:forKeyedSubscript:", v4, CFSTR("_all"));
  }
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(v7);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), obj);
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 32), "knownToBeMyEmail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "knownToNotBeMyEmail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  os_unfair_lock_unlock(v7);
}

- (NSMutableArray)knownToNotBeMyEmail
{
  return self->_knownToNotBeMyEmail;
}

- (NSMutableArray)knownToBeMyEmail
{
  return self->_knownToBeMyEmail;
}

- (NSSet)allEmailAddresses
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", CFSTR("_all"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  os_unfair_lock_unlock(p_cacheLock);
  return (NSSet *)v7;
}

- (void)refreshCachedValues
{
  os_unfair_lock_s *p_cacheLock;
  int outstandingCacheRefreshes;
  NSObject *cacheQueue;
  _QWORD block[5];

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  outstandingCacheRefreshes = self->_outstandingCacheRefreshes;
  if (outstandingCacheRefreshes > 1)
  {
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    self->_outstandingCacheRefreshes = outstandingCacheRefreshes + 1;
    os_unfair_lock_unlock(p_cacheLock);
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__EMUserProfileProvider_refreshCachedValues__block_invoke;
    block[3] = &unk_1E70F1FA0;
    block[4] = self;
    dispatch_async(cacheQueue, block);
  }
}

+ (BOOL)doesAddressList:(id)a3 containAddressInSet:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "emailAddressValue", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "simpleAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v11, "stringValue");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        if (v16 && (objc_msgSend(v6, "containsObject:", v16) & 1) != 0)
        {

          LOBYTE(v8) = 1;
          goto LABEL_15;
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

  return v8;
}

- (NSSet)accountsEmailAddresses
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", CFSTR("_account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  os_unfair_lock_unlock(p_cacheLock);
  return (NSSet *)v7;
}

- (NSSet)contactEmailAddresses
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", CFSTR("_contact"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  os_unfair_lock_unlock(p_cacheLock);
  return (NSSet *)v7;
}

- (BOOL)isMyEmailAddressContainedInAddressList:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "ef_all:", &__block_literal_global_57))
  {
    v5 = -[EMUserProfileProvider _isMyEmailAddressContainedInAddressStrings:](self, "_isMyEmailAddressContainedInAddressStrings:", v4);
  }
  else
  {
    -[EMUserProfileProvider allEmailAddresses](self, "allEmailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[EMUserProfileProvider doesAddressList:containAddressInSet:](EMUserProfileProvider, "doesAddressList:containAddressInSet:", v4, v6);

  }
  return v5;
}

uint64_t __64__EMUserProfileProvider_isMyEmailAddressContainedInAddressList___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isMyEmailAddressContainedInAddressStrings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = v4;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_cacheLock);
    v5 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke;
    v30[3] = &unk_1E70F6720;
    v30[4] = self;
    if ((objc_msgSend(v4, "ef_any:", v30) & 1) != 0)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v29[0] = v5;
      v29[1] = 3221225472;
      v29[2] = __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke_2;
      v29[3] = &unk_1E70F6720;
      v29[4] = self;
      objc_msgSend(v4, "ef_filter:", v29);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v7;
      if (objc_msgSend(v7, "count"))
      {
        -[NSDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", CFSTR("_all"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = v7;
        v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v6)
        {
          v10 = *(_QWORD *)v26;
          while (2)
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v9);
              v12 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v12, "emailAddressValue");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "simpleAddress");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v14)
              {
                v16 = v14;
              }
              else
              {
                objc_msgSend(v12, "stringValue");
                v16 = (id)objc_claimAutoreleasedReturnValue();
              }
              v17 = v16;

              if (v17 && objc_msgSend(v8, "containsObject:", v17))
              {
                -[EMUserProfileProvider knownToBeMyEmail](self, "knownToBeMyEmail");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v12);

                LOBYTE(v6) = 1;
                goto LABEL_21;
              }
              -[EMUserProfileProvider knownToNotBeMyEmail](self, "knownToNotBeMyEmail");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v12);

            }
            v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
            if (v6)
              continue;
            break;
          }
        }
LABEL_21:

        -[EMUserProfileProvider knownToBeMyEmail](self, "knownToBeMyEmail");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ef_trimToCount:fromStart:", 30, 1);

        -[EMUserProfileProvider knownToNotBeMyEmail](self, "knownToNotBeMyEmail");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "ef_trimToCount:fromStart:", 30, 1);

      }
      else
      {
        LOBYTE(v6) = 0;
      }

    }
    os_unfair_lock_unlock(&self->_cacheLock);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

uint64_t __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "knownToBeMyEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t __68__EMUserProfileProvider__isMyEmailAddressContainedInAddressStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "knownToNotBeMyEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3) ^ 1;

  return v5;
}

- (void)waitForOutstandingCacheRefreshes
{
  dispatch_async_and_wait((dispatch_queue_t)self->_cacheQueue, &__block_literal_global_20);
}

- (id)_accountsEmailAddresses
{
  -[EMUserProfileProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMUserProfileProvider _accountsEmailAddresses]", "EMUserProfileProvider.m", 213, "0");
}

- (BOOL)hasAccountConfigured
{
  -[EMUserProfileProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMUserProfileProvider hasAccountConfigured]", "EMUserProfileProvider.m", 217, "0");
}

- (NSDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (BOOL)hasAccountsConfigured
{
  return self->_hasAccountsConfigured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_knownToNotBeMyEmail, 0);
  objc_storeStrong((id *)&self->_knownToBeMyEmail, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end
