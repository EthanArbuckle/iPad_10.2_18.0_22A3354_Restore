@implementation FCCNotificationSuppressionStore

- (BOOL)notificationsSuppressed
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[FCCNotificationSuppressionStore allRequests](self, "allRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "expirationDate", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hk_isAfterDate:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)allRequests
{
  void *v2;
  void *v3;
  void *v4;

  -[FCCNotificationSuppressionStore _requestsMap](self, "_requestsMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_requestsMap
{
  os_unfair_lock_s *p_unfairLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[FCCNotificationSuppressionStore _userDefaults](self, "_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("NotificationSuppressionRequests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCCNotificationSuppressionStore _requestsMap].cold.1(v7);
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "hk_map:", &__block_literal_global);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.FitnessCoaching"));
}

- (FCCNotificationSuppressionStore)init
{
  FCCDateProvider *v3;
  FCCNotificationSuppressionStore *v4;

  v3 = objc_alloc_init(FCCDateProvider);
  v4 = -[FCCNotificationSuppressionStore initWithDateProvider:](self, "initWithDateProvider:", v3);

  return v4;
}

- (FCCNotificationSuppressionStore)initWithDateProvider:(id)a3
{
  id v5;
  FCCNotificationSuppressionStore *v6;
  FCCNotificationSuppressionStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCNotificationSuppressionStore;
  v6 = -[FCCNotificationSuppressionStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateProvider, a3);
    v7->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)addNotificationSuppressionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[FCCNotificationSuppressionStore _requestsMap](self, "_requestsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v11 = v8;

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, v9);

  v10 = (void *)objc_msgSend(v11, "copy");
  -[FCCNotificationSuppressionStore _updateStoredRequests:](self, "_updateStoredRequests:", v10);

}

- (void)removeNotificationSuppressionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[FCCNotificationSuppressionStore _requestsMap](self, "_requestsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v11 = v8;

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeObjectForKey:", v9);
  v10 = (void *)objc_msgSend(v11, "copy");
  -[FCCNotificationSuppressionStore _updateStoredRequests:](self, "_updateStoredRequests:", v10);

}

- (BOOL)lastNotifiedSuppressionState
{
  os_unfair_lock_s *p_unfairLock;
  void *v4;
  char v5;

  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[FCCNotificationSuppressionStore _userDefaults](self, "_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("NotificationSuppressionLastNotifiedState"));
  os_unfair_lock_unlock(p_unfairLock);

  return v5;
}

- (void)setLastNotifiedSuppressionState:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_unfairLock;
  id v6;

  v3 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[FCCNotificationSuppressionStore _userDefaults](self, "_userDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, CFSTR("NotificationSuppressionLastNotifiedState"));
  os_unfair_lock_unlock(p_unfairLock);

}

void __47__FCCNotificationSuppressionStore__requestsMap__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (**v6)(id, id, FCCNotificationSuppressionRequest *);
  id v7;
  FCCNotificationSuppressionRequest *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  v7 = a3;
  v8 = -[FCCNotificationSuppressionRequest initWithTransportData:]([FCCNotificationSuppressionRequest alloc], "initWithTransportData:", v7);

  if (v8)
    v6[2](v6, v9, v8);

}

- (void)_updateStoredRequests:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCCNotificationSuppressionStore _userDefaults](self, "_userDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_map:", &__block_literal_global_188);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("NotificationSuppressionRequests"));
}

void __57__FCCNotificationSuppressionStore__updateStoredRequests___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void (**v8)(id, id, void *);
  void *v9;
  NSObject *v10;
  uint64_t v11;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "transportData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8[2](v8, v6, v9);
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      __57__FCCNotificationSuppressionStore__updateStoredRequests___block_invoke_cold_1((uint64_t)v7, v10, v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

- (void)_requestsMap
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_1B0C58000, v1, v4, "Loaded suppression requests object is not a dictionary %@", (uint8_t *)&v5);

}

void __57__FCCNotificationSuppressionStore__updateStoredRequests___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1B0C58000, a2, a3, "Failed to create request data for request: %@", (uint8_t *)&v3);
}

@end
