@implementation NMSSubscriptionManager

+ (NMSSubscriptionManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NMSSubscriptionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, block);
  return (NMSSubscriptionManager *)(id)sharedManager_instance;
}

void __39__NMSSubscriptionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = v0;

}

- (NMSSubscriptionManager)init
{
  NMSSubscriptionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _QWORD block[4];
  NMSSubscriptionManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NMSSubscriptionManager;
  v2 = -[NMSSubscriptionManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NanoMusicSync.NMSSubscriptionManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__NMSSubscriptionManager_init__block_invoke;
    block[3] = &unk_24D646F30;
    v9 = v2;
    dispatch_async(v6, block);

  }
  return v2;
}

void __30__NMSSubscriptionManager_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDB4398], "ic_sharedAccountStore");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ic_activeStoreAccount");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("CachedICSubscriptionStatusType"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (uint64_t)v15;
  if (v15)
    v9 = objc_msgSend(v15, "integerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v9;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CachedSubscriptionCapabilitiesKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = objc_msgSend(v11, "unsignedIntegerValue");
  else
    v12 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v12;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleSubscriptionStatusDidChangeNotification_, *MEMORY[0x24BEC85E8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleAccountStoreDidChangeNotification_, *MEMORY[0x24BDB41E0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  objc_msgSend(*(id *)(a1 + 32), "_updateSubscriptionStatus");
}

- (int64_t)subscriptionType
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__NMSSubscriptionManager_subscriptionType__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__NMSSubscriptionManager_subscriptionType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (unint64_t)subscriptionCapabilities
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__NMSSubscriptionManager_subscriptionCapabilities__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__NMSSubscriptionManager_subscriptionCapabilities__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~-[NMSSubscriptionManager subscriptionCapabilities](self, "subscriptionCapabilities")) == 0;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(v4, "isRemoteServerLikelyReachable")
    && objc_msgSend(v4, "isCurrentNetworkLinkHighQuality"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__NMSSubscriptionManager_environmentMonitorDidChangeNetworkReachability___block_invoke;
    block[3] = &unk_24D646F30;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

uint64_t __73__NMSSubscriptionManager_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v2 + 32) || *(_QWORD *)(v2 + 48))
  {
    NMLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[Subscription] Retrying get subscription status after remote server likely becoming reachable.", v4, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_updateSubscriptionStatus");
  }
  return result;
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__NMSSubscriptionManager__handleSubscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__NMSSubscriptionManager__handleSubscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Subscription] Received subscription status did change notification.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateSubscriptionStatus");
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NMSSubscriptionManager__handleAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __67__NMSSubscriptionManager__handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "[Subscription] Received account store did change notification.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateActiveAccount");
}

- (void)_updateActiveAccount
{
  ACAccount *v3;
  uint64_t v4;
  NSObject *v5;
  ACAccount *activeAccount;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  ACAccount *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  ACAccount *v19;
  __int16 v20;
  ACAccount *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ACAccountStore ic_activeStoreAccount](self->_accountStore, "ic_activeStoreAccount");
  v3 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  -[ACAccount ic_DSID](v3, "ic_DSID");
  v4 = objc_claimAutoreleasedReturnValue();
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[Subscription] Active account is %@", buf, 0xCu);
  }

  activeAccount = self->_activeAccount;
  if (v3 != activeAccount)
  {
    -[ACAccount ic_DSID](activeAccount, "ic_DSID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7 | v4)
    {
      v10 = v7 == 0;
      if (v4)
      {
        v11 = 1;
      }
      else
      {
        v10 = 0;
        v11 = v7 == 0;
      }
      if (!v11 || v10 || (objc_msgSend((id)v4, "isEqualToNumber:", v7) & 1) == 0)
      {
        NMLogForCategory(5);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_activeAccount;
          *(_DWORD *)buf = 138412546;
          v19 = v13;
          v20 = 2112;
          v21 = v3;
          _os_log_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEFAULT, "[Subscription] Active account has changed from %@ to %@. Clearing subscription status.", buf, 0x16u);
        }

        objc_storeStrong((id *)&self->_activeAccount, v3);
        dispatch_get_global_queue(21, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __46__NMSSubscriptionManager__updateActiveAccount__block_invoke;
        block[3] = &unk_24D646F30;
        block[4] = self;
        dispatch_async(v14, block);

        self->_subscriptionType = 0;
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("CachedICSubscriptionStatusType"));

        self->_subscriptionCapabilities = 0;
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObjectForKey:", CFSTR("CachedSubscriptionCapabilitiesKey"));

        -[NMSSubscriptionManager _updateSubscriptionStatus](self, "_updateSubscriptionStatus");
      }
    }
    else
    {
      NMLogForCategory(5);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[Subscription] currentActiveAccountDSID == nil && newActiveAccountDSID == nil, exiting early", buf, 2u);
      }

    }
  }

}

void __46__NMSSubscriptionManager__updateActiveAccount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSActiveAccountDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_updateSubscriptionStatus
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[Subscription] Will get subscription status now", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BEC88B8], "sharedStatusController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke;
  v5[3] = &unk_24D648148;
  v5[4] = self;
  objc_msgSend(v4, "getSubscriptionStatusWithCompletionHandler:", v5);

}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_cold_1((uint64_t)v6, v7);

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_16;
    v16[3] = &unk_24D646F30;
    v16[4] = v8;
    v10 = v16;
  }
  else
  {
    v11 = objc_msgSend(v5, "statusType");
    v12 = objc_msgSend(v5, "capabilities");
    NMLogForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v18 = v11;
      v19 = 2048;
      v20 = v12;
      _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[Subscription] Got subscription status with type: %ld, capabilities: %ld", buf, 0x16u);
    }

    v14 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v14 + 8);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_17;
    v15[3] = &unk_24D648120;
    v15[4] = v14;
    v15[5] = v11;
    v15[6] = v12;
    v10 = v15;
  }
  dispatch_async(v9, v10);

}

uint64_t __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrySubscriptionStatusRequest");
}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_17(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 48))
  {
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", a1[4]);

    v2 = a1[4];
  }
  *(_QWORD *)(v2 + 48) = 0;
  v4 = a1[4];
  if (a1[5] != *(_QWORD *)(v4 + 32))
  {
    NMLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[5];
      v7 = *(_QWORD *)(a1[4] + 32);
      *(_DWORD *)buf = 134218240;
      v19 = v7;
      v20 = 2048;
      v21 = v6;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[Subscription] Subscription status is updated from %ld to %ld", buf, 0x16u);
    }

    *(_QWORD *)(a1[4] + 32) = a1[5];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("CachedICSubscriptionStatusType"));

    v10 = a1[4];
    if (a1[6] == *(_QWORD *)(v10 + 40))
      goto LABEL_12;
    goto LABEL_9;
  }
  if (a1[6] != *(_QWORD *)(v4 + 40))
  {
LABEL_9:
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1[4] + 40);
      v13 = a1[6];
      *(_DWORD *)buf = 134218240;
      v19 = v12;
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "[Subscription] Subscription capabilities is updated from %ld to %ld", buf, 0x16u);
    }

    *(_QWORD *)(a1[4] + 40) = a1[6];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("CachedSubscriptionCapabilitiesKey"));

    v10 = a1[4];
LABEL_12:
    dispatch_get_global_queue(21, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_20;
    block[3] = &unk_24D646F30;
    block[4] = v10;
    dispatch_async(v16, block);

  }
}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_20(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSSubscriptionStatusDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_retrySubscriptionStatusRequest
{
  unint64_t failedGetSubscriptionStatusAttempts;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *queue;
  _QWORD v11[4];
  id v12[2];
  uint8_t buf[4];
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  failedGetSubscriptionStatusAttempts = self->_failedGetSubscriptionStatusAttempts;
  if (!failedGetSubscriptionStatusAttempts)
  {
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerObserver:", self);

    failedGetSubscriptionStatusAttempts = self->_failedGetSubscriptionStatusAttempts;
  }
  v5 = (void *)(failedGetSubscriptionStatusAttempts + 1);
  self->_failedGetSubscriptionStatusAttempts = failedGetSubscriptionStatusAttempts + 1;
  if (failedGetSubscriptionStatusAttempts + 1 < 6)
    v6 = failedGetSubscriptionStatusAttempts + 1;
  else
    v6 = 6;
  v7 = pow(5.0, (double)v6);
  NMLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v7;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Subscription] Will retry get subscription status after %f seconds", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v9 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__NMSSubscriptionManager__retrySubscriptionStatusRequest__block_invoke;
  v11[3] = &unk_24D648170;
  objc_copyWeak(v12, (id *)buf);
  v12[1] = v5;
  dispatch_after(v9, queue, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

void __57__NMSSubscriptionManager__retrySubscriptionStatusRequest__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 6))
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Subscription] Retrying get subscription status (attempt #%lu).", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v3, "_updateSubscriptionStatus");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_216E27000, a2, OS_LOG_TYPE_ERROR, "[Subscription] Failed to get IC subscription status with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
