@implementation EMCachingContactStore

- (EMCachingContactStore)init
{
  return -[EMCachingContactStore initWithOptions:](self, "initWithOptions:", 1);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EMCachingContactStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, block);
  return (id)log_log_5;
}

void __28__EMCachingContactStore_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;

}

- (EMCachingContactStore)initWithOptions:(unint64_t)a3
{
  id v5;
  EMCachingContactStore *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v6 = -[EMCachingContactStore initWithStore:options:](self, "initWithStore:options:", v5, a3);

  return v6;
}

- (EMCachingContactStore)initWithStore:(id)a3 options:(unint64_t)a4
{
  id v7;
  EMCachingContactStore *v8;
  EMCachingContactStore *v9;
  uint64_t v10;
  EFLazyCache *displayNameCache;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  EFScheduler *addressCacheScheduler;
  void *v17;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EMCachingContactStore;
  v8 = -[EMCachingContactStore init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cnStore, a3);
    v9->_options = a4;
    if ((a4 & 1) != 0)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 100);
      displayNameCache = v9->_displayNameCache;
      v9->_displayNameCache = (EFLazyCache *)v10;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__invalidateDisplayNameCache, *MEMORY[0x1E0C96870], 0);

    }
    if ((a4 & 2) != 0)
    {
      v13 = (void *)MEMORY[0x1E0D1F070];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.%@.%p"), objc_opt_class(), v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serialDispatchQueueSchedulerWithName:qualityOfService:", v14, 9);
      v15 = objc_claimAutoreleasedReturnValue();
      addressCacheScheduler = v9->_addressCacheScheduler;
      v9->_addressCacheScheduler = (EFScheduler *)v15;

      -[EMCachingContactStore _populateEmailAddressCache](v9, "_populateEmailAddressCache");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel__invalidateEmailAddressCache, *MEMORY[0x1E0C96870], 0);

    }
  }

  return v9;
}

- (id)displayNameForEmailAddress:(id)a3
{
  -[EMCachingContactStore displayNameForEmailAddress:abbreviated:](self, "displayNameForEmailAddress:abbreviated:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)displayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if (v4)
      v7 = CFSTR("short:");
    else
      v7 = CFSTR("full:");
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMCachingContactStore displayNameCache](self, "displayNameCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__EMCachingContactStore_displayNameForEmailAddress_abbreviated___block_invoke;
    v12[3] = &unk_1E70F23A0;
    v12[4] = self;
    v13 = v6;
    v14 = v4;
    objc_msgSend(v9, "objectForKey:generator:", v8, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __64__EMCachingContactStore_displayNameForEmailAddress_abbreviated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDisplayNameForEmailAddress:abbreviated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (id)_fetchDisplayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  _QWORD v19[2];

  v4 = a4;
  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    v7 = 1000;
  else
    v7 = 0;
  -[EMCachingContactStore cnStore](self, "cnStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v6, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v11, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(v6, "ea_addressComment");
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v13;
  }
  if (v12 == v6)
  {
    objc_msgSend(v6, "ea_uncommentedAddress");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v14;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("Hide My Email")))
  {
    objc_msgSend(v6, "ea_uncommentedAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasSuffix:", CFSTR("icloud.com"));

    if (v16)
    {
      _EFLocalizedString();
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v17;
    }
  }

  return v12;
}

- (id)contactFutureForCachedEmailAddressOnScheduler:(id)a3 forEmailAddress:(id)a4 keysToFetch:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_emailAddressCacheLock);
  -[EMCachingContactStore emailAddressCache](self, "emailAddressCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  os_unfair_lock_unlock(&self->_emailAddressCacheLock);
  if ((v13 & 1) != 0)
  {
    -[EMCachingContactStore cnStore](self, "cnStore");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "em_onScheduler:contactFutureForEmailAddress:keysToFetch:", v8, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "emailAddressValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D1EEC0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__EMCachingContactStore_contactFutureForCachedEmailAddressOnScheduler_forEmailAddress_keysToFetch___block_invoke;
    v19[3] = &unk_1E70F23C8;
    v20 = v16;
    v14 = v16;
    objc_msgSend(v17, "onScheduler:futureWithBlock:", v8, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

id __99__EMCachingContactStore_contactFutureForCachedEmailAddressOnScheduler_forEmailAddress_keysToFetch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ec_personNameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "simpleAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v4, v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)contactExistsForEmailAddress:(id)a3
{
  id v4;
  os_unfair_lock_s *p_emailAddressCacheLock;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_emailAddressCacheLock = &self->_emailAddressCacheLock;
  os_unfair_lock_lock(&self->_emailAddressCacheLock);
  -[EMCachingContactStore emailAddressCache](self, "emailAddressCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EMCachingContactStore emailAddressCache](self, "emailAddressCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    os_unfair_lock_unlock(p_emailAddressCacheLock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_emailAddressCacheLock);
    -[EMCachingContactStore cnStore](self, "cnStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = *MEMORY[0x1E0C966E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v4, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12 != 0;

  }
  return v9;
}

- (void)_invalidateDisplayNameCache
{
  id v2;

  -[EMCachingContactStore displayNameCache](self, "displayNameCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_invalidateEmailAddressCache
{
  os_unfair_lock_s *p_emailAddressCacheLock;

  p_emailAddressCacheLock = &self->_emailAddressCacheLock;
  os_unfair_lock_lock(&self->_emailAddressCacheLock);
  -[EMCachingContactStore setEmailAddressCache:](self, "setEmailAddressCache:", 0);
  os_unfair_lock_unlock(p_emailAddressCacheLock);
  -[EMCachingContactStore _populateEmailAddressCache](self, "_populateEmailAddressCache");
}

- (void)_populateEmailAddressCache
{
  void *v3;
  _QWORD v4[5];

  -[EMCachingContactStore addressCacheScheduler](self, "addressCacheScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__EMCachingContactStore__populateEmailAddressCache__block_invoke;
  v4[3] = &unk_1E70F1FA0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __51__EMCachingContactStore__populateEmailAddressCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  os_unfair_lock_s *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "cnStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "allContactEmailAddressesWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v4)
  {
    +[EMCachingContactStore log](EMCachingContactStore, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__EMCachingContactStore__populateEmailAddressCache__block_invoke_cold_1((uint64_t)v4, v5);

  }
  else
  {
    v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
    os_unfair_lock_lock(v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
    objc_msgSend(*(id *)(a1 + 32), "setEmailAddressCache:", v7);

    os_unfair_lock_unlock(v6);
  }

}

- (CNContactStore)cnStore
{
  return self->_cnStore;
}

- (EFLazyCache)displayNameCache
{
  return self->_displayNameCache;
}

- (void)setDisplayNameCache:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameCache, a3);
}

- (NSSet)emailAddressCache
{
  return self->_emailAddressCache;
}

- (void)setEmailAddressCache:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddressCache, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (EFScheduler)addressCacheScheduler
{
  return self->_addressCacheScheduler;
}

- (void)setAddressCacheScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_addressCacheScheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressCacheScheduler, 0);
  objc_storeStrong((id *)&self->_emailAddressCache, 0);
  objc_storeStrong((id *)&self->_displayNameCache, 0);
  objc_storeStrong((id *)&self->_cnStore, 0);
}

void __51__EMCachingContactStore__populateEmailAddressCache__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "Failed to populate email address cache: %@", (uint8_t *)&v2, 0xCu);
}

@end
