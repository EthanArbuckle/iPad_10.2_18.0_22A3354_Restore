@implementation MPCPlaybackAccountManager

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  int64_t v22;
  dispatch_time_t v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  _QWORD v30[6];
  _QWORD block[4];
  id v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 32);
  if (v7)
  {
    dispatch_group_leave(v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

    v6 = *(_QWORD *)(a1 + 32);
  }
  v10 = *(unsigned __int8 *)(v6 + 24);
  *(_BYTE *)(v6 + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));
  v12 = MEMORY[0x24BDAC760];
  if ((v11 & 1) != 0)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "accounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v14;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_INFO, "[AccountManager] - Updated accounts [silent]: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accounts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v15;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Updated accounts: %{public}@", buf, 0xCu);
    }

    os_unfair_recursive_lock_lock_with_options();
    v17 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
    os_unfair_recursive_lock_unlock();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_112;
    block[3] = &unk_24CABAA28;
    v18 = *(_QWORD *)(a1 + 32);
    v32 = v17;
    v33 = v18;
    v34 = v15;
    v19 = v15;
    v13 = v17;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (v10)
  {
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "[AccountManager] - Refreshing due to previous timeout", buf, 2u);
    }

    v21 = *(_QWORD *)(a1 + 48);
    if (v21)
      v22 = 1000000000 * (1 << (v21 - 1));
    else
      v22 = 0;
    v23 = dispatch_time(0, v22);
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_113;
    v30[3] = &unk_24CAB90B0;
    v24 = *(_QWORD *)(a1 + 48);
    v30[4] = *(_QWORD *)(a1 + 32);
    v30[5] = v24;
    dispatch_after(v23, MEMORY[0x24BDAC9B8], v30);
  }
  objc_msgSend(*(id *)(a1 + 40), "msv_firstWhere:", &__block_literal_global_116);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 != 0;

  objc_msgSend(*(id *)(a1 + 32), "_setNeedsRefreshDueToMissingBag:", v26);
  if (*(_BYTE *)(a1 + 64))
  {
    v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v28 = v27;
    v29 = *(_QWORD *)(a1 + 56);
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v28, OS_SIGNPOST_INTERVAL_END, v29, "UpdateAccounts", " enableTelemetry=YES ", buf, 2u);
    }

  }
}

- (void)_setNeedsRefreshDueToMissingBag:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 needsRefreshDueToMissingBag;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  needsRefreshDueToMissingBag = self->_needsRefreshDueToMissingBag;
  self->_needsRefreshDueToMissingBag = v3;
  os_unfair_lock_unlock(p_lock);
  if (v3)
  {
    if (!needsRefreshDueToMissingBag)
    {
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Waiting to refresh accounts due to missing bag", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      objc_msgSend(MEMORY[0x24BEC8998], "sharedSecurityInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __61__MPCPlaybackAccountManager__setNeedsRefreshDueToMissingBag___block_invoke;
      v10[3] = &unk_24CABA2F8;
      objc_copyWeak(&v11, buf);
      objc_msgSend(v8, "performBlockAfterFirstUnlock:", v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
  else if (needsRefreshDueToMissingBag)
  {
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unregisterObserver:", self);

  }
}

- (void)_updateAccountsWithAttemptCount:(int64_t)a3
{
  NSObject *v4;
  NSObject *v6;
  os_signpost_id_t v7;
  BOOL v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[7];
  BOOL v13;
  uint8_t buf[4];
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 < 4)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v7 = os_signpost_id_generate(v6);

    v8 = -[MPCPlaybackAccountManager hasLoadedInitialAccounts](self, "hasLoadedInitialAccounts");
    v9 = !v8;
    if (!v8)
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      v11 = v10;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UpdateAccounts", ", buf, 2u);
      }

    }
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke;
    v12[3] = &unk_24CAB9140;
    v12[4] = self;
    v12[5] = a3;
    v13 = v9;
    v12[6] = v7;
    -[MPCPlaybackAccountManager _enumerateIdentitiesWithCompletion:](self, "_enumerateIdentitiesWithCompletion:", v12);
  }
  else
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v15 = a3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "[AccountManager] - Dropped account refresh because too many (%{public}ld) attempts have been made", buf, 0xCu);
    }

  }
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  MPCPlaybackAccountManager *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    if (-[MPCPlaybackAccountManager hasLoadedInitialAccounts](self, "hasLoadedInitialAccounts"))
    {
      -[MPCPlaybackAccountManager accounts](self, "accounts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_recursive_lock_unlock();
      if (v5)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __46__MPCPlaybackAccountManager_registerObserver___block_invoke;
        block[3] = &unk_24CABAA28;
        v8 = v4;
        v9 = self;
        v10 = v5;
        v6 = v5;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
    else
    {
      os_unfair_recursive_lock_unlock();
    }
  }

}

- (BOOL)hasLoadedInitialAccounts
{
  MPCPlaybackAccountManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_initialAccountGroup == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (MPCPlaybackAccount)activeAccount
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlaybackAccountManager accountForUserIdentity:](self, "accountForUserIdentity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCPlaybackAccount *)v4;
}

- (id)accountForUserIdentity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  os_unfair_lock_s *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSDictionary allValues](self->_accounts, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v19 = p_lock;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "userIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v14 = v4;
        v15 = v12;
        v16 = v15;
        if (v13 == v14)
        {

LABEL_16:
          v7 = (void *)objc_msgSend(v10, "copy");
          goto LABEL_17;
        }
        if (v4 && v13)
        {
          v17 = objc_msgSend(v13, "isEqualToIdentity:inStore:", v14, v15);

          if ((v17 & 1) != 0)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
LABEL_17:
    p_lock = v19;
  }

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSArray)accounts
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary allValues](self->_accounts, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_107_25503);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1A8];
  v8 = v7;

  return v8;
}

+ (MPCPlaybackAccountManager)sharedManager
{
  if (sharedManager_onceToken_25515 != -1)
    dispatch_once(&sharedManager_onceToken_25515, &__block_literal_global_25516);
  return (MPCPlaybackAccountManager *)(id)__sharedManager;
}

- (id)accountForDSID:(id)a3
{
  void *v4;
  void *v5;

  MPCHashedDSIDFromDSID(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlaybackAccountManager accountForHashedDSID:](self, "accountForHashedDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_enumerateIdentitiesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  id v51;
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  objc_msgSend(v4, "userIdentitiesForManageableAccountsWithError:", &v52);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v52;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v6;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get user identities: %{public}@", buf, 0xCu);
    }

    v47 = MEMORY[0x24BDAC760];
    v48 = 3221225472;
    v49 = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke;
    v50 = &unk_24CAB9720;
    v51 = v3;
    msv_dispatch_on_main_queue();
    v9 = v51;
  }
  else
  {
    v27 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v5;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Manageable user identities: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v16 = v9;
          v17 = v4;
          v18 = v17;
          if (v15 == v16)
          {

            v5 = v10;
            goto LABEL_22;
          }
          if (v9 && v15)
          {
            v19 = objc_msgSend(v15, "isEqualToIdentity:inStore:", v16, v17);

            if ((v19 & 1) != 0)
            {
              v5 = v10;
              goto LABEL_23;
            }
          }
          else
          {

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    v10 = (id)v20;
LABEL_22:

LABEL_23:
    v3 = v27;

    if ((MSVDeviceSupportsDelegatedIdentities() & 1) != 0)
    {
      v21 = dispatch_group_create();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v21);
      v23 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_2;
      v35[3] = &unk_24CAB92F8;
      v36 = v22;
      v32[0] = v23;
      v32[1] = 3221225472;
      v32[2] = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_3;
      v32[3] = &unk_24CABA1D0;
      v24 = v36;
      v33 = v24;
      v34 = v21;
      v25 = v21;
      objc_msgSend(v4, "enumerateDelegateTokensWithType:usingBlock:completionHandler:", 1, v35, v32);
      block[0] = v23;
      block[1] = 3221225472;
      block[2] = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_143;
      block[3] = &unk_24CAB98A8;
      v31 = v27;
      v29 = v5;
      v30 = v24;
      v26 = v24;
      dispatch_group_notify(v25, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      v37 = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_140;
      v40 = &unk_24CAB9830;
      v42 = v27;
      v41 = v5;
      msv_dispatch_on_main_queue();

      v25 = v42;
    }

    v6 = 0;
  }

}

uint64_t __34__MPCPlaybackAccountManager_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccounts");
}

- (void)_updateAccounts
{
  -[MPCPlaybackAccountManager _updateAccountsWithAttemptCount:](self, "_updateAccountsWithAttemptCount:", 0);
}

- (id)accountForHashedDSID:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  objc_msgSend(a3, "substringToIndex:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary objectForKeyedSubscript:](self->_accounts, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(p_lock);
  return v7;
}

uint64_t __46__MPCPlaybackAccountManager_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accountManager:didChangeAccounts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id obj;
  _QWORD block[5];
  id v24;
  __int128 v25;
  char v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  _QWORD *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  int v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2810000000;
  v43[3] = &unk_210F335CD;
  v44 = 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  v8 = dispatch_group_create();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v40;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v11);
        dispatch_group_enter(v8);
        v13 = *(void **)(a1 + 32);
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_2;
        v35[3] = &unk_24CAB9088;
        v38 = v43;
        v36 = v7;
        v37 = v8;
        objc_msgSend(v13, "_buildAccountFromLocalIdentity:completion:", v12, v35, v20);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v9);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v20;
  v14 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v21);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v16);
        dispatch_group_enter(v8);
        v18 = *(void **)(a1 + 32);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_3;
        v27[3] = &unk_24CAB9088;
        v30 = v43;
        v28 = v7;
        v29 = v8;
        objc_msgSend(v18, "_buildAccountFromDelegatedIdentity:completion:", v17, v27);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v14);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_4;
  block[3] = &unk_24CAB9118;
  block[4] = *(_QWORD *)(a1 + 32);
  v24 = v7;
  v26 = *(_BYTE *)(a1 + 56);
  v25 = *(_OWORD *)(a1 + 40);
  v19 = v7;
  dispatch_group_notify(v8, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v43, 8);
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;

  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
    v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "hashedDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_buildAccountFromLocalIdentity:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;
  uint64_t quot;
  uint64_t v11;
  char *v12;
  lldiv_t v13;
  uint64_t v14;
  const UInt8 *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  lldiv_t v23;
  uint64_t v24;
  const UInt8 *v25;
  __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  OS_dispatch_group *initialAccountGroup;
  id v35;
  id v36;
  double v37;
  unint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  id v57;
  void *v58;
  dispatch_group_t group;
  void *v60;
  void *v61;
  id v62;
  __CFString *v64;
  _QWORD block[4];
  id v66;
  __CFString *v67;
  __CFString *v68;
  id v69;
  id v70;
  void (**v71)(id, _QWORD);
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  _BYTE *v75;
  _QWORD *v76;
  _QWORD v77[4];
  id v78;
  id v79;
  NSObject *v80;
  _QWORD *v81;
  _QWORD v82[4];
  id v83;
  MPCPlaybackAccountManager *v84;
  NSObject *v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  NSObject *v91;
  _QWORD *v92;
  _QWORD v93[4];
  id v94;
  id v95;
  MPCPlaybackAccountManager *v96;
  NSObject *v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  BOOL v103;
  _QWORD v104[4];
  id v105;
  dispatch_group_t v106;
  _QWORD *v107;
  _QWORD *v108;
  _BYTE *v109;
  _QWORD v110[3];
  char v111;
  _QWORD v112[3];
  char v113;
  id v114;
  id v115;
  _BYTE buf[24];
  _QWORD v117[2];
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = 0;
  objc_msgSend(v7, "DSIDForUserIdentity:outError:", v5, &v115);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v115;
  quot = objc_msgSend(v8, "longLongValue");
  v11 = quot;
  v12 = (char *)v117 + 1;
  do
  {
    v13 = lldiv(quot, 10);
    quot = v13.quot;
    if (v13.rem >= 0)
      LOBYTE(v14) = v13.rem;
    else
      v14 = -v13.rem;
    *(v12 - 2) = v14 + 48;
    v15 = (const UInt8 *)(v12 - 2);
    --v12;
  }
  while (v13.quot);
  if (v11 < 0)
  {
    *(v12 - 2) = 45;
    v15 = (const UInt8 *)(v12 - 2);
  }
  v64 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)v117 - (char *)v15, 0x8000100u, 0);

  if (v9)
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get DSID for identity: %{public}@ error: %{public}@", buf, 0x16u);
    }

    v6[2](v6, 0);
  }
  else
  {
    MPCHashedDSIDFromDSID(v64);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v61;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[AccountManager] - DSID found for %{public}@ [%{public}@]", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = 0;
    objc_msgSend(v7, "DSIDForUserIdentity:outError:", v18, &v114);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v114;
    v20 = objc_msgSend(v19, "longLongValue");
    v21 = v20;
    v22 = (char *)v117 + 1;
    do
    {
      v23 = lldiv(v20, 10);
      v20 = v23.quot;
      if (v23.rem >= 0)
        LOBYTE(v24) = v23.rem;
      else
        v24 = -v23.rem;
      *(v22 - 2) = v24 + 48;
      v25 = (const UInt8 *)(v22 - 2);
      --v22;
    }
    while (v23.quot);
    if (v21 < 0)
    {
      *(v22 - 2) = 45;
      v25 = (const UInt8 *)(v22 - 2);
    }
    v26 = (__CFString *)CFStringCreateWithBytes(0, v25, (char *)v117 - (char *)v25, 0x8000100u, 0);

    v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v28 = v27;
    if (v62)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v62;
        _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get DSID for active identity error: %{public}@", buf, 0xCu);
      }

      v6[2](v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "DSID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        MPCHashedDSIDFromDSID(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[AccountManager] - DSID found for %{public}@ [%{public}@]", buf, 0x16u);

      }
      v32 = dispatch_group_create();
      dispatch_group_enter(v32);
      v112[0] = 0;
      v112[1] = v112;
      v112[2] = 0x2020000000;
      v113 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v117[0] = __Block_byref_object_copy__25444;
      v117[1] = __Block_byref_object_dispose__25445;
      v118 = 0;
      v110[0] = 0;
      v110[1] = v110;
      v110[2] = 0x2020000000;
      v111 = 1;
      v104[0] = MEMORY[0x24BDAC760];
      v104[1] = 3221225472;
      v104[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke;
      v104[3] = &unk_24CAB9168;
      v33 = v5;
      v105 = v33;
      v107 = v110;
      v108 = v112;
      v109 = buf;
      group = v32;
      v106 = group;
      objc_msgSend(v7, "getPropertiesForUserIdentity:completionHandler:", v33, v104);
      os_unfair_lock_lock(&self->_lock);
      initialAccountGroup = self->_initialAccountGroup;
      -[NSDictionary objectForKeyedSubscript:](self->_accounts, "objectForKeyedSubscript:", v61);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      v35 = objc_alloc(MEMORY[0x24BEC89F8]);
      v100[0] = MEMORY[0x24BDAC760];
      v100[1] = 3221225472;
      v100[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_121;
      v100[3] = &unk_24CAB9190;
      v101 = v7;
      v36 = v33;
      v102 = v36;
      v103 = initialAccountGroup == 0;
      v58 = (void *)objc_msgSend(v35, "initWithBlock:", v100);
      v98[0] = 0;
      v98[1] = v98;
      if (initialAccountGroup)
        v37 = 2.0;
      else
        v37 = 20.0;
      v98[2] = 0x3032000000;
      v98[3] = __Block_byref_object_copy__25444;
      v98[4] = __Block_byref_object_dispose__25445;
      objc_msgSend(v60, "subscriptionStatus");
      v99 = (id)objc_claimAutoreleasedReturnValue();
      v38 = 0x24BE65000;
      if ((ICCurrentApplicationIsSystemApp() & 1) == 0)
      {
        v57 = v36;
        dispatch_group_enter(group);
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC88C8]), "initWithStoreRequestContext:", v58);
        objc_msgSend(v39, "setAllowsFallbackToExpiredStatus:", 1);
        objc_msgSend(v39, "setAllowsFallbackToStatusNeedingReload:", 1);
        objc_msgSend(v39, "setShouldReturnLastKnownStatusOnly:", initialAccountGroup != 0);
        v40 = objc_alloc(MEMORY[0x24BE65C40]);
        v93[0] = MEMORY[0x24BDAC760];
        v93[1] = 3221225472;
        v93[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2;
        v93[3] = &unk_24CAB91B8;
        v41 = v36;
        v94 = v41;
        v42 = v39;
        v95 = v42;
        v96 = self;
        v43 = group;
        v97 = v43;
        v44 = (void *)objc_msgSend(v40, "initWithTimeout:interruptionHandler:", v93, v37);
        objc_msgSend(MEMORY[0x24BEC88B8], "sharedStatusController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = MEMORY[0x24BDAC760];
        v88[1] = 3221225472;
        v88[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_129;
        v88[3] = &unk_24CAB91E0;
        v89 = v41;
        v92 = v98;
        v46 = v44;
        v90 = v46;
        v91 = v43;
        objc_msgSend(v45, "performSubscriptionStatusRequest:withCompletionHandler:", v42, v88);

        v36 = v57;
        v38 = 0x24BE65000uLL;
      }
      dispatch_group_enter(group);
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x3032000000;
      v86[3] = __Block_byref_object_copy__25444;
      v86[4] = __Block_byref_object_dispose__25445;
      objc_msgSend(v60, "bag");
      v87 = (id)objc_claimAutoreleasedReturnValue();
      v47 = objc_alloc(*(Class *)(v38 + 3136));
      v82[0] = MEMORY[0x24BDAC760];
      v82[1] = 3221225472;
      v82[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_131;
      v82[3] = &unk_24CAB9208;
      v48 = v36;
      v83 = v48;
      v84 = self;
      v49 = group;
      v85 = v49;
      v50 = (void *)objc_msgSend(v47, "initWithTimeout:interruptionHandler:", v82, v37);
      objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_133;
      v77[3] = &unk_24CAB9230;
      v52 = v48;
      v78 = v52;
      v81 = v86;
      v53 = v50;
      v79 = v53;
      v54 = v49;
      v80 = v54;
      objc_msgSend(v51, "getBagForRequestContext:withCompletionHandler:", v58, v77);

      dispatch_get_global_queue(25, 0);
      v55 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_135;
      block[3] = &unk_24CAB9258;
      v66 = v52;
      v72 = v98;
      v67 = v26;
      v68 = v64;
      v73 = v112;
      v74 = v110;
      v75 = buf;
      v76 = v86;
      v69 = v61;
      v70 = v60;
      v71 = v6;
      v56 = v60;
      dispatch_group_notify(v54, v55, block);

      _Block_object_dispose(v86, 8);
      _Block_object_dispose(v98, 8);

      _Block_object_dispose(v110, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v112, 8);
    }

  }
}

uint64_t __42__MPCPlaybackAccountManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPCPlaybackAccountManager _init]([MPCPlaybackAccountManager alloc], "_init");
  v1 = (void *)__sharedManager;
  __sharedManager = (uint64_t)v0;

  return objc_msgSend((id)__sharedManager, "start");
}

- (id)_init
{
  MPCPlaybackAccountManager *v2;
  MPCPlaybackAccountManager *v3;
  dispatch_group_t v4;
  OS_dispatch_group *initialAccountGroup;
  uint64_t v6;
  NSDictionary *accounts;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPCPlaybackAccountManager;
  v2 = -[MPCPlaybackAccountManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_group_create();
    initialAccountGroup = v3->_initialAccountGroup;
    v3->_initialAccountGroup = (OS_dispatch_group *)v4;

    dispatch_group_enter((dispatch_group_t)v3->_initialAccountGroup);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    accounts = v3->_accounts;
    v3->_accounts = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v8;

    v3->_observersLock = 0;
  }
  return v3;
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get properties for identity: %{public}@ error: %{public}@", (uint8_t *)&v16, 0x16u);
    }

  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory"))
    {
      v9 = (void *)MEMORY[0x24BDDC750];
      objc_msgSend(v5, "homeUserIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userMonitorWithHomeIdentifiers:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v12 = objc_msgSend(v11, "isPrivateListeningEnabledForCurrentAccessory");
      else
        v12 = *MEMORY[0x24BDDBAC0] != 0;
    }
    else
    {
      objc_msgSend(v5, "privateListeningEnabled");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "isActiveLocker");
    objc_msgSend(v5, "storefrontIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)performAfterLoadingAccounts:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(_QWORD);
  OS_dispatch_group *v6;

  p_lock = &self->_lock;
  v5 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v6 = self->_initialAccountGroup;
  os_unfair_lock_unlock(p_lock);
  if (v6)
    dispatch_group_notify((dispatch_group_t)self->_initialAccountGroup, MEMORY[0x24BDAC9B8], v5);
  else
    v5[2](v5);

}

- (void)start
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((ICCurrentApplicationIsSystemApp() & 1) == 0)
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangedNotification_, *MEMORY[0x24BEC85E8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__userIdentityStoreChangedNotification_, *MEMORY[0x24BEC8728], 0);
  if (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory"))
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__homeUserSettingsChangeNotification_, *MEMORY[0x24BDDBAB8], 0);
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__MPCPlaybackAccountManager_start__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)getDelegateTokenBWithTokenA:(id)a3 forDSID:(unint64_t)a4 error:(id *)a5
{
  id v6;
  MPCPlaybackAccountManager *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_210C9217C((uint64_t)v6);

  return v8;
}

- (void)updateCredentialsWithDelegateTokenE:(_MPCProtoDelegateInfoTokenE *)a3 forDSID:(unint64_t)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  _MPCProtoDelegateInfoTokenE *v10;
  MPCPlaybackAccountManager *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = self;
  sub_210C336D8((uint64_t)&unk_254A7E568, (uint64_t)v9);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPCPlaybackAccountManager;
  -[MPCPlaybackAccountManager dealloc](&v4, sel_dealloc);
}

- (MPCPlaybackAccount)anyDelegationHostingAccount
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSDictionary allValues](self->_accounts, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "hasDelegationCapability") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (MPCPlaybackAccount *)v3;
}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

  os_unfair_recursive_lock_unlock();
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  _BOOL4 needsRefreshDueToMissingBag;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a3, "isRemoteServerReachable"))
  {
    os_unfair_lock_lock(&self->_lock);
    needsRefreshDueToMissingBag = self->_needsRefreshDueToMissingBag;
    os_unfair_lock_unlock(&self->_lock);
    if (needsRefreshDueToMissingBag)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Network is reachable - Refreshing due to missing bag", v6, 2u);
      }

      -[MPCPlaybackAccountManager _updateAccounts](self, "_updateAccounts");
    }
  }
}

- (void)_buildAccountFromDelegatedIdentity:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t quot;
  uint64_t v10;
  char *v11;
  lldiv_t v12;
  uint64_t v13;
  const UInt8 *v14;
  CFStringRef v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  OS_dispatch_group *initialAccountGroup;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  void (**v35)(id, _QWORD);
  __CFString *v36;
  id v37;
  void (**v38)(id, _QWORD);
  id v39;
  _QWORD block[4];
  id v41;
  __CFString *v42;
  id v43;
  __int128 *v44;
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  NSObject *v49;
  _QWORD *v50;
  _QWORD v51[4];
  id v52;
  MPCPlaybackAccountManager *v53;
  NSObject *v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[4];
  id v58;
  BOOL v59;
  _QWORD v60[4];
  id v61;
  NSObject *v62;
  __int128 *p_buf;
  id v64;
  __int128 buf;
  uint64_t v66;
  _QWORD v67[2];
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  objc_msgSend(v7, "DSIDForUserIdentity:outError:", v6, &v64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v64;
  quot = objc_msgSend(v8, "longLongValue");
  v10 = quot;
  v11 = (char *)v67 + 1;
  do
  {
    v12 = lldiv(quot, 10);
    quot = v12.quot;
    if (v12.rem >= 0)
      LOBYTE(v13) = v12.rem;
    else
      v13 = -v12.rem;
    *(v11 - 2) = v13 + 48;
    v14 = (const UInt8 *)(v11 - 2);
    --v11;
  }
  while (v12.quot);
  if (v10 < 0)
  {
    *(v11 - 2) = 45;
    v14 = (const UInt8 *)(v11 - 2);
  }
  v15 = CFStringCreateWithBytes(0, v14, (char *)v67 - (char *)v14, 0x8000100u, 0);

  if (v39)
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get DSID for delegated identity: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v38[2](v38, 0);
  }
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v66 = 0x3032000000;
  v67[0] = __Block_byref_object_copy__25444;
  v67[1] = __Block_byref_object_dispose__25445;
  v68 = 0;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke;
  v60[3] = &unk_24CAB9280;
  v20 = v6;
  v61 = v20;
  p_buf = &buf;
  v21 = v17;
  v62 = v21;
  objc_msgSend(v18, "getPropertiesForUserIdentity:completionHandler:", v20, v60);

  os_unfair_lock_lock(&self->_lock);
  initialAccountGroup = self->_initialAccountGroup;
  os_unfair_lock_unlock(&self->_lock);
  v23 = objc_alloc(MEMORY[0x24BEC89F8]);
  v57[0] = v19;
  v57[1] = 3221225472;
  v57[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_137;
  v57[3] = &unk_24CAB92A8;
  v59 = initialAccountGroup == 0;
  v24 = v20;
  v58 = v24;
  v25 = (void *)objc_msgSend(v23, "initWithBlock:", v57);
  dispatch_group_enter(v21);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__25444;
  v55[4] = __Block_byref_object_dispose__25445;
  v56 = 0;
  v26 = objc_alloc(MEMORY[0x24BE65C40]);
  v51[0] = v19;
  v51[1] = 3221225472;
  v51[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_2;
  v51[3] = &unk_24CAB9208;
  v27 = v24;
  v52 = v27;
  v53 = self;
  v28 = v21;
  v54 = v28;
  v29 = (void *)objc_msgSend(v26, "initWithTimeout:interruptionHandler:", v51, 2.0);
  objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v19;
  v46[1] = 3221225472;
  v46[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_138;
  v46[3] = &unk_24CAB9230;
  v31 = v27;
  v47 = v31;
  v50 = v55;
  v32 = v29;
  v48 = v32;
  v33 = v28;
  v49 = v33;
  objc_msgSend(v30, "getBagForRequestContext:withCompletionHandler:", v25, v46);

  v34 = (__CFString *)v15;
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_139;
  block[3] = &unk_24CAB92D0;
  v41 = v31;
  v42 = (__CFString *)v15;
  v44 = &buf;
  v45 = v55;
  v43 = v38;
  v35 = v38;
  v36 = v34;
  v37 = v31;
  dispatch_group_notify(v33, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&buf, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_initialAccountGroup, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

void __61__MPCPlaybackAccountManager__setNeedsRefreshDueToMissingBag___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "registerObserver:", WeakRetained);

    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isRemoteServerLikelyReachable");

    if (v3)
      objc_msgSend(WeakRetained, "_updateAccounts");
  }

}

uint64_t __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1A8]);
}

void __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "identityAllowingDelegation:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[AccountManager] - Delegated user identities: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __64__MPCPlaybackAccountManager__enumerateIdentitiesWithCompletion___block_invoke_143(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "[AccountManager] Unable to get properties for delegated identity: %{public}@ error:%{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    objc_msgSend(a2, "storefrontIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_137(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BEC8A58];
  v8 = a2;
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentity:", v4);

  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentityStore:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
  objc_msgSend(v8, "setClientInfo:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A08]), "initWithUserInteractionLevel:", 1);
  objc_msgSend(v8, "setAuthenticationProvider:", v7);

  objc_msgSend(v8, "setAllowsExpiredBags:", *(_BYTE *)(a1 + 40) == 0);
  objc_msgSend(v8, "setDelegatedIdentity:", *(_QWORD *)(a1 + 32));

}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "[AccountManager] URL bag timed out. identity=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[AccountManager] Failed to get URL bag for identity: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __75__MPCPlaybackAccountManager__buildAccountFromDelegatedIdentity_completion___block_invoke_139(uint64_t a1)
{
  void *v2;
  MPCPlaybackAccount *v3;

  v3 = -[MPCPlaybackAccount initWithDelegatedUserIdentity:]([MPCPlaybackAccount alloc], "initWithDelegatedUserIdentity:", *(_QWORD *)(a1 + 32));
  MPCHashedDSIDFromDSID(*(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlaybackAccount setHashedDSID:](v3, "setHashedDSID:", v2);

  -[MPCPlaybackAccount setHasCloudLibraryEnabled:](v3, "setHasCloudLibraryEnabled:", 1);
  -[MPCPlaybackAccount setStoreFrontIdentifier:](v3, "setStoreFrontIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  -[MPCPlaybackAccount setBag:](v3, "setBag:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_121(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIdentityStore:", v3);
  objc_msgSend(v4, "setIdentity:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
  objc_msgSend(v4, "setClientInfo:", v5);

  objc_msgSend(v4, "setAllowsExpiredBags:", *(_BYTE *)(a1 + 48) == 0);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A08]), "initWithUserInteractionLevel:", 1);
  objc_msgSend(v4, "setAuthenticationProvider:", v6);

}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = objc_msgSend(*(id *)(a1 + 40), "shouldReturnLastKnownStatusOnly");
      v6 = 138543618;
      v7 = v4;
      v8 = 1024;
      v9 = v5;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "[AccountManager] Subscription status timed out. identity=%{public}@ firstLoad=%{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 8));
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[AccountManager] Failed to get subscription status for identity: %{public}@ error: %{public}@", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    objc_msgSend(v5, "subscriptionStatus");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_131(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "[AccountManager] URL bag timed out. identity=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[AccountManager] Failed to get URL bag for identity: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_135(uint64_t a1)
{
  MPCPlaybackAccount *v2;
  id v3;
  id v4;
  MPCPlaybackAccount *v5;
  _QWORD v6[4];
  MPCPlaybackAccount *v7;
  id v8;

  v2 = -[MPCPlaybackAccount initWithUserIdentity:subscriptionStatus:]([MPCPlaybackAccount alloc], "initWithUserIdentity:subscriptionStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  -[MPCPlaybackAccount setActiveAccount:](v2, "setActiveAccount:", objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 48)));
  -[MPCPlaybackAccount setHashedDSID:](v2, "setHashedDSID:", *(_QWORD *)(a1 + 56));
  -[MPCPlaybackAccount setHasCloudLibraryEnabled:](v2, "setHasCloudLibraryEnabled:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  -[MPCPlaybackAccount setPrivateListeningEnabled:](v2, "setPrivateListeningEnabled:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  -[MPCPlaybackAccount setStoreFrontIdentifier:](v2, "setStoreFrontIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
  -[MPCPlaybackAccount setBag:](v2, "setBag:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
  v3 = -[MPCPlaybackAccount _copyStreamerStorage:](v2, "_copyStreamerStorage:", *(_QWORD *)(a1 + 64));
  -[MPCPlaybackAccount set_whaStreamerStorage:](v2, "set_whaStreamerStorage:", v3);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2_136;
  v6[3] = &unk_24CAB9830;
  v4 = *(id *)(a1 + 72);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __71__MPCPlaybackAccountManager__buildAccountFromLocalIdentity_completion___block_invoke_2_136(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_3(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;

  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
    v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "hashedDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_112(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "accountManager:didChangeAccounts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_113(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountsWithAttemptCount:", *(_QWORD *)(a1 + 40) + 1);
}

BOOL __61__MPCPlaybackAccountManager__updateAccountsWithAttemptCount___block_invoke_2_114(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a3, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

uint64_t __37__MPCPlaybackAccountManager_accounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isActiveAccount") && !objc_msgSend(v5, "isActiveAccount"))
    goto LABEL_10;
  if (objc_msgSend(v5, "isActiveAccount") && !objc_msgSend(v4, "isActiveAccount")
    || objc_msgSend(v4, "isDelegated") && !objc_msgSend(v5, "isDelegated"))
  {
    v8 = 1;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "isDelegated") && !objc_msgSend(v4, "isDelegated"))
  {
LABEL_10:
    v8 = -1;
  }
  else
  {
    objc_msgSend(v4, "hashedDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hashedDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:", v7);

  }
LABEL_12:

  return v8;
}

+ (MPCPlaybackAccountManager)sharedManagerIfExists
{
  return (MPCPlaybackAccountManager *)(id)__sharedManager;
}

@end
