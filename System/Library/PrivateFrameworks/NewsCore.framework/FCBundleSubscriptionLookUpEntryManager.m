@implementation FCBundleSubscriptionLookUpEntryManager

void __71__FCBundleSubscriptionLookUpEntryManager_bundleSubscriptionLookUpEntry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_bundleSubscriptionLookUpEntry");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (FCBundleSubscriptionLookUpEntry)_bundleSubscriptionLookUpEntry
{
  return self->__bundleSubscriptionLookUpEntry;
}

- (FCBundleSubscriptionLookUpEntryManager)initWithLocalStore:(id)a3
{
  id v4;
  FCBundleSubscriptionLookUpEntryManager *v5;
  uint64_t v6;
  NFUnfairLock *lock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCBundleSubscriptionLookUpEntryManager;
  v5 = -[FCBundleSubscriptionLookUpEntryManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v5->_lock;
    v5->_lock = (NFUnfairLock *)v6;

    -[FCBundleSubscriptionLookUpEntryManager setLocalStore:](v5, "setLocalStore:", v4);
    -[FCBundleSubscriptionLookUpEntryManager loadLocalCachesFromStore](v5, "loadLocalCachesFromStore");
  }

  return v5;
}

- (void)setLocalStore:(id)a3
{
  objc_storeStrong((id *)&self->_localStore, a3);
}

- (void)loadLocalCachesFromStore
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  FCBundleSubscriptionLookUpEntry *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FCBundleSubscriptionLookUpEntryManager localStore](self, "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        -[FCBundleSubscriptionLookUpEntryManager localStore](self, "localStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        v14 = FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v13;
          _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_INFO, "Bundle subscription lookup entries loaded from cache, entries=%{public}@", buf, 0xCu);
        }
        if (v13 && objc_msgSend(v9, "hasPrefix:", CFSTR("bd-")))
        {
          v15 = -[FCBundleSubscriptionLookUpEntry initWithEntryID:dictionaryRepresentation:]([FCBundleSubscriptionLookUpEntry alloc], "initWithEntryID:dictionaryRepresentation:", v9, v13);
          if (v15)
            -[FCBundleSubscriptionLookUpEntryManager setBundleSubscriptionLookUpEntry:](self, "setBundleSubscriptionLookUpEntry:", v15);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

}

- (FCKeyValueStore)localStore
{
  return self->_localStore;
}

- (FCBundleSubscriptionLookUpEntry)bundleSubscriptionLookUpEntry
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  -[FCBundleSubscriptionLookUpEntryManager lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__FCBundleSubscriptionLookUpEntryManager_bundleSubscriptionLookUpEntry__block_invoke;
  v6[3] = &unk_1E463AD80;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithLockSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (FCBundleSubscriptionLookUpEntry *)v4;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (id)_bundleSubscriptionLookupEntryForPurchaseID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bd-"), a3);
}

- (void)addBundleChannelIDs:(id)a3 bundleChannelIDsVersion:(id)a4 purchaseID:(id)a5 inTrialPeriod:(BOOL)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  FCBundleSubscriptionLookUpEntry *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a10;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "purchaseID");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCBundleSubscriptionLookUpEntryManager addBundleChannelIDs:bundleChannelIDsVersion:purchaseID:inTrialPeriod:"
          "isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:]";
    v33 = 2080;
    v34 = "FCBundleSubscriptionLookUpEntryManager.m";
    v35 = 1024;
    v36 = 77;
    v37 = 2114;
    v38 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelIDs");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCBundleSubscriptionLookUpEntryManager addBundleChannelIDs:bundleChannelIDsVersion:purchaseID:inTrialPeriod:"
          "isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:]";
    v33 = 2080;
    v34 = "FCBundleSubscriptionLookUpEntryManager.m";
    v35 = 1024;
    v36 = 78;
    v37 = 2114;
    v38 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCBundleSubscriptionLookUpEntryManager _bundleSubscriptionLookupEntryForPurchaseID:](self, "_bundleSubscriptionLookupEntryForPurchaseID:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v29) = a11;
  LOBYTE(v29) = a9;
  BYTE2(v28) = a7;
  BYTE1(v28) = a6;
  LOBYTE(v28) = 0;
  v22 = -[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:]([FCBundleSubscriptionLookUpEntry alloc], "initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:", v21, v16, v17, v18, 0, 0, v28, v19, v29, v20);
  -[FCBundleSubscriptionLookUpEntryManager setBundleSubscriptionLookUpEntry:](self, "setBundleSubscriptionLookUpEntry:", v22);
  -[FCBundleSubscriptionLookUpEntryManager localStore](self, "localStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionLookUpEntry dictionaryRepresentation](v22, "dictionaryRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionLookUpEntry identifier](v22, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v24, v25);

}

- (void)updateEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[FCBundleSubscriptionLookUpEntryManager setBundleSubscriptionLookUpEntry:](self, "setBundleSubscriptionLookUpEntry:", v5);

  -[FCBundleSubscriptionLookUpEntryManager localStore](self, "localStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v6, v7);
}

- (void)cleanupStaleExpiredEntry
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[FCBundleSubscriptionLookUpEntryManager bundleSubscriptionLookUpEntry](self, "bundleSubscriptionLookUpEntry");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "purchaseValidationState") == 1)
  {
    -[FCBundleSubscriptionLookUpEntryManager bundleSubscriptionLookUpEntry](self, "bundleSubscriptionLookUpEntry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateOfExpiration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fc_isWithinTimeInterval:ofDate:", v5, 864000.0);

    if ((v6 & 1) == 0)
    {
      -[FCBundleSubscriptionLookUpEntryManager localStore](self, "localStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCBundleSubscriptionLookUpEntryManager bundleSubscriptionLookUpEntry](self, "bundleSubscriptionLookUpEntry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v9);

      -[FCBundleSubscriptionLookUpEntryManager setBundleSubscriptionLookUpEntry:](self, "setBundleSubscriptionLookUpEntry:", 0);
    }
  }
  else
  {

  }
}

- (void)setBundleSubscriptionLookUpEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FCBundleSubscriptionLookUpEntryManager lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__FCBundleSubscriptionLookUpEntryManager_setBundleSubscriptionLookUpEntry___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithLockSync:", v7);

}

uint64_t __75__FCBundleSubscriptionLookUpEntryManager_setBundleSubscriptionLookUpEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set_bundleSubscriptionLookUpEntry:", *(_QWORD *)(a1 + 40));
}

- (void)set_bundleSubscriptionLookUpEntry:(id)a3
{
  objc_storeStrong((id *)&self->__bundleSubscriptionLookUpEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->__bundleSubscriptionLookUpEntry, 0);
}

@end
