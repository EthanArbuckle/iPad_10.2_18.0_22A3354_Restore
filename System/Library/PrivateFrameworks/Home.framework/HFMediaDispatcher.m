@implementation HFMediaDispatcher

+ (id)sharedDispatcher
{
  if (_MergedGlobals_226 != -1)
    dispatch_once(&_MergedGlobals_226, &__block_literal_global_2_4);
  return (id)qword_1ED378E00;
}

void __37__HFMediaDispatcher_sharedDispatcher__block_invoke_2()
{
  HFMediaDispatcher *v0;
  void *v1;

  v0 = objc_alloc_init(HFMediaDispatcher);
  v1 = (void *)qword_1ED378E00;
  qword_1ED378E00 = (uint64_t)v0;

}

- (HFMediaDispatcher)init
{
  HFMediaDispatcher *v2;
  NSObject *v3;
  uint64_t v4;
  NSHashTable *appleMusicAccountObservers;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFMediaDispatcher;
  v2 = -[HFMediaDispatcher init](&v8, sel_init);
  if (v2)
  {
    HFLogForCategory(0x46uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Initializing HomeKit Media Dispatcher", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    appleMusicAccountObservers = v2->_appleMusicAccountObservers;
    v2->_appleMusicAccountObservers = (NSHashTable *)v4;

  }
  return v2;
}

- (ACAccountStore)appleMusicAccountStore
{
  ACAccountStore *appleMusicAccountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  appleMusicAccountStore = self->_appleMusicAccountStore;
  if (!appleMusicAccountStore)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_appleMusicAccountStore;
    self->_appleMusicAccountStore = v4;

    appleMusicAccountStore = self->_appleMusicAccountStore;
  }
  return appleMusicAccountStore;
}

- (void)addAppleMusicAccountObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMediaDispatcher _setupAppleMusicAccountStoreIfNecessary](self, "_setupAppleMusicAccountStoreIfNecessary");
  -[HFMediaDispatcher appleMusicAccountObservers](self, "appleMusicAccountObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeAppleMusicAccountObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMediaDispatcher appleMusicAccountObservers](self, "appleMusicAccountObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)isUsingiCloud
{
  void *v2;
  char v3;

  -[HFMediaDispatcher appleMusicAccountStore](self, "appleMusicAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "aa_isUsingiCloud");

  return v3;
}

- (BOOL)_reloadAppleMusicMagicAuthCapableAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[HFMediaDispatcher appleMusicAccountStore](self, "appleMusicAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F170]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountsWithAccountType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMediaDispatcher appleMusicMagicAuthCapableAccounts](self, "appleMusicMagicAuthCapableAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
    -[HFMediaDispatcher setAppleMusicMagicAuthCapableAccounts:](self, "setAppleMusicMagicAuthCapableAccounts:", v6);

  return v8 ^ 1;
}

uint64_t __62__HFMediaDispatcher__reloadAppleMusicMagicAuthCapableAccounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_accountsStoreWasUpdated:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[HFMediaDispatcher _reloadAppleMusicMagicAuthCapableAccounts](self, "_reloadAppleMusicMagicAuthCapableAccounts", a3))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[HFMediaDispatcher appleMusicAccountObservers](self, "appleMusicAccountObservers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[HFMediaDispatcher appleMusicMagicAuthCapableAccounts](self, "appleMusicMagicAuthCapableAccounts");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "dispatcher:appleMusicAccountsDidUpdate:", self, v11);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_setupAppleMusicAccountStoreIfNecessary
{
  id v3;

  if (!self->_appleMusicAccountStore)
  {
    -[HFMediaDispatcher _reloadAppleMusicMagicAuthCapableAccounts](self, "_reloadAppleMusicMagicAuthCapableAccounts");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountsStoreWasUpdated_, *MEMORY[0x1E0C8F010], 0);

  }
}

- (NSArray)appleMusicMagicAuthCapableAccounts
{
  return self->_appleMusicMagicAuthCapableAccounts;
}

- (void)setAppleMusicMagicAuthCapableAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSHashTable)appleMusicAccountObservers
{
  return self->_appleMusicAccountObservers;
}

- (void)setAppleMusicAccountObservers:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicAccountObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccountObservers, 0);
  objc_storeStrong((id *)&self->_appleMusicMagicAuthCapableAccounts, 0);
  objc_storeStrong((id *)&self->_appleMusicAccountStore, 0);
}

@end
