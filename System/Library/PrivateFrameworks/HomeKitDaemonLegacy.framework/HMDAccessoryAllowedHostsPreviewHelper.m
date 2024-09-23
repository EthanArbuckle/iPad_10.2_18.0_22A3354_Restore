@implementation HMDAccessoryAllowedHostsPreviewHelper

- (void)fetchAllowedHostsForAccessory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  HMDNetworkRouterFirewallRuleManager *firewallRuleManager;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "metadataIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceForKey:", CFSTR("engraveRulePreviewCacheTimeout"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (double)objc_msgSend(v11, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    if (!self->_expires || objc_msgSend(v13, "compare:") == 1)
      objc_storeStrong((id *)&self->_expires, v13);
    os_unfair_lock_unlock(&self->_lock);
    firewallRuleManager = self->_firewallRuleManager;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke;
    v16[3] = &unk_1E89C1558;
    v18 = v7;
    v16[4] = self;
    v17 = v8;
    -[HMDNetworkRouterFirewallRuleManager startupForClient:completion:](firewallRuleManager, "startupForClient:completion:", self, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

  }
}

- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3
{
  HMDNetworkRouterFirewallRuleManager *v4;
  id WeakRetained;
  void *v6;
  NSDate *v7;
  double v8;
  id v9;
  HMDAccessoryAllowedHostsPreviewHelper *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (HMDNetworkRouterFirewallRuleManager *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  if (WeakRetained && self->_firewallRuleManager == v4)
  {
    os_unfair_lock_lock_with_options();
    v7 = self->_expires;
    os_unfair_lock_unlock(&self->_lock);
    if (v7)
    {
      -[NSDate timeIntervalSinceNow](v7, "timeIntervalSinceNow");
      if (v8 <= 0.0)
      {
        v9 = objc_loadWeakRetained((id *)&self->_home);
        if (v9)
        {
          os_unfair_lock_lock_with_options();
          objc_getAssociatedObject(v9, &HMDAccessoryAllowedHostsPreviewHelperForHome);
          v10 = (HMDAccessoryAllowedHostsPreviewHelper *)objc_claimAutoreleasedReturnValue();
          if (v10 == self)
            objc_setAssociatedObject(v9, &HMDAccessoryAllowedHostsPreviewHelperForHome, 0, (void *)1);

          os_unfair_lock_unlock((os_unfair_lock_t)&HMDAccessoryAllowedHostsPreviewHelperForHome);
        }

      }
    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(WeakRetained, "accessories", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v16, "supportsNetworkProtection"))
          {
            objc_msgSend(v16, "metadataIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v11, "addObject:", v17);

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    v6 = (void *)objc_msgSend(v11, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("home"), WeakRetained);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_firewallRuleManager, 0);
  objc_destroyWeak((id *)&self->_home);
}

void __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke_2;
    v5[3] = &unk_1E89B63A0;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "fetchRulesForAccessories:completion:", v4, v5);

  }
}

void __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:](HMDAccessoryAllowedHost, "allowedHostsFromFirewallRuleConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (id)helperForHome:(id)a3
{
  id v3;
  HMDAccessoryAllowedHostsPreviewHelper *v4;
  void *v5;
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v3 = a3;
  os_unfair_lock_lock_with_options();
  objc_getAssociatedObject(v3, &HMDAccessoryAllowedHostsPreviewHelperForHome);
  v4 = (HMDAccessoryAllowedHostsPreviewHelper *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [HMDAccessoryAllowedHostsPreviewHelper alloc];
    +[HMDNetworkRouterFirewallRuleManager sharedInstance](HMDNetworkRouterFirewallRuleManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v7 = v5;
    if (v4)
    {
      v10.receiver = v4;
      v10.super_class = (Class)HMDAccessoryAllowedHostsPreviewHelper;
      v8 = objc_msgSendSuper2(&v10, sel_init);
      v4 = (HMDAccessoryAllowedHostsPreviewHelper *)v8;
      if (v8)
      {
        objc_storeWeak(v8 + 1, v6);
        objc_storeStrong((id *)&v4->_firewallRuleManager, v5);
      }
    }

    objc_setAssociatedObject(v6, &HMDAccessoryAllowedHostsPreviewHelperForHome, v4, (void *)1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HMDAccessoryAllowedHostsPreviewHelperForHome);

  return v4;
}

@end
