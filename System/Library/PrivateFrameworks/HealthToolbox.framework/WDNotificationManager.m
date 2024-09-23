@implementation WDNotificationManager

+ (BOOL)suppressBadgeNotifications
{
  return _suppressBadgeNotifications;
}

+ (void)setSuppressBadgeNotifications:(BOOL)a3
{
  _suppressBadgeNotifications = a3;
}

+ (void)initialize
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215814000, log, OS_LOG_TYPE_ERROR, "Failed to register for BadgesDidUpdate notification", v1, 2u);
}

void __35__WDNotificationManager_initialize__block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "suppressBadgeNotifications") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("WDNotificationManagerBadgesDidUpdateNotificationName"), 0);

  }
}

- (WDNotificationManager)initWithHealthStore:(id)a3
{
  id v5;
  WDNotificationManager *v6;
  WDNotificationManager *v7;
  uint64_t v8;
  HKNotificationStore *notificationStore;
  NSMutableDictionary *v10;
  NSMutableDictionary *domainsToPolicies;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDNotificationManager;
  v6 = -[WDNotificationManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3DA0]), "initWithHealthStore:", v5);
    notificationStore = v7->_notificationStore;
    v7->_notificationStore = (HKNotificationStore *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    domainsToPolicies = v7->_domainsToPolicies;
    v7->_domainsToPolicies = v10;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5
{
  -[HKNotificationStore setBadge:forDomain:completion:](self->_notificationStore, "setBadge:forDomain:completion:", a3, a4, a5);
}

- (void)setPolicy:(id)a3 forDomain:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSMutableDictionary *domainsToPolicies;
  void *v9;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  domainsToPolicies = self->_domainsToPolicies;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](domainsToPolicies, "setObject:forKeyedSubscript:", v7, v9);

  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_policyForNotification:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  objc_msgSend(v5, "wd_userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD46A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_domainsToPolicies, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
    -[WDNotificationManager _lock_policyForNotification:](self, "_lock_policyForNotification:", v6);
  else
    -[NSMutableDictionary objectForKeyedSubscript:](self->_domainsToPolicies, "objectForKeyedSubscript:", &unk_24D3A5D80);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "userNotificationCenter:openSettingsForNotification:", v9, v6);

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  os_unfair_lock_s *p_lock;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WDNotificationManager _lock_policyForNotification:](self, "_lock_policyForNotification:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "userNotificationCenter:willPresentNotification:withCompletionHandler:", v12, v8, v9);
  else
    v9[2](v9, 27);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  os_unfair_lock_s *p_lock;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v8, "notification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDNotificationManager _lock_policyForNotification:](self, "_lock_policyForNotification:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", v13, v8, v9);
  else
    v9[2](v9);

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_notificationStore, 0);
  objc_storeStrong((id *)&self->_domainsToPolicies, 0);
}

- (void)resetEmergencySOSBadge
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD3960], "zeroBadge");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WDNotificationManager setBadge:forDomain:completion:](self, "setBadge:forDomain:completion:", v3, 0, &__block_literal_global_13);

}

void __60__WDNotificationManager_Convenience__resetEmergencySOSBadge__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD3020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3020], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_215814000, v5, OS_LOG_TYPE_DEFAULT, "Failed to reset Emergency SOS badge with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)resetHealthRecordsDataBadge
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD3960], "zeroBadge");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WDNotificationManager setBadge:forDomain:completion:](self, "setBadge:forDomain:completion:", v3, 3, &__block_literal_global_184);

}

void __65__WDNotificationManager_Convenience__resetHealthRecordsDataBadge__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __65__WDNotificationManager_Convenience__resetHealthRecordsDataBadge__block_invoke_cold_1((uint64_t)v4, v5);
  }

}

void __65__WDNotificationManager_Convenience__resetHealthRecordsDataBadge__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215814000, a2, OS_LOG_TYPE_ERROR, "Failed to reset Health Records badge with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
