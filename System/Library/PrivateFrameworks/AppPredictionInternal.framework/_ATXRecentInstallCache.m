@implementation _ATXRecentInstallCache

- (id)initTrackingAppsMoreRecentThan:(double)a3 installMonitor:(id)a4 uninstallMonitor:(id)a5
{
  id v10;
  id v11;
  _ATXRecentInstallCache *v12;
  _ATXRecentInstallCache *v13;
  uint64_t v14;
  NSMutableDictionary *recentInstallations;
  _ATXInternalInstallNotification *installNotificationMonitor;
  uint64_t v17;
  _ATXInternalUninstallNotification *uninstallNotificationMonitor;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v10 = a4;
  v11 = a5;
  if (a3 >= 0.0)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXRecentInstallCache.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("installMonitor != nil"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXRecentInstallCache.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ttl >= 0"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXRecentInstallCache.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uninstallMonitor != nil"));

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)_ATXRecentInstallCache;
  v12 = -[_ATXRecentInstallCache init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_ttl = a3;
    v14 = objc_opt_new();
    recentInstallations = v13->_recentInstallations;
    v13->_recentInstallations = (NSMutableDictionary *)v14;

    objc_initWeak(&location, v13);
    objc_storeStrong((id *)&v13->_installNotificationMonitor, a4);
    installNotificationMonitor = v13->_installNotificationMonitor;
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke;
    v25[3] = &unk_1E82DC438;
    objc_copyWeak(&v26, &location);
    -[_ATXInternalInstallNotification registerForNotificationsWithInstallBlock:](installNotificationMonitor, "registerForNotificationsWithInstallBlock:", v25);
    objc_storeStrong((id *)&v13->_uninstallNotificationMonitor, a5);
    uninstallNotificationMonitor = v13->_uninstallNotificationMonitor;
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke_2;
    v23[3] = &unk_1E82DAE98;
    objc_copyWeak(&v24, &location);
    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](uninstallNotificationMonitor, "registerForNotificationsWithUninstallBlock:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)initTrackingAppsMoreRecentThan:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[_ATXRecentInstallCache initTrackingAppsMoreRecentThan:installMonitor:uninstallMonitor:](self, "initTrackingAppsMoreRecentThan:installMonitor:uninstallMonitor:", v5, v6, a3);

  return v7;
}

- (void)_notifiedOfInstalls:(id)a3
{
  id v4;
  _ATXRecentInstallCache *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_recentInstallations, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_notifiedOfUninstalls:(id)a3
{
  _ATXRecentInstallCache *v4;
  NSMutableDictionary *recentInstallations;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  recentInstallations = v4->_recentInstallations;
  objc_msgSend(v7, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](recentInstallations, "removeObjectsForKeys:", v6);

  objc_sync_exit(v4);
}

- (id)allRecentlyInstalledApplications
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -self->_ttl);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXRecentInstallCache _allRecentlyInstalledApplicationsAfterExpirationDate:](self, "_allRecentlyInstalledApplicationsAfterExpirationDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_allRecentlyInstalledApplicationsAfterExpirationDate:(id)a3
{
  id v4;
  void *v5;
  _ATXRecentInstallCache *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSMutableDictionary *obj;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = (id)objc_opt_new();
  v6 = self;
  objc_sync_enter(v6);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v6->_recentInstallations;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v6->_recentInstallations, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "earlierDate:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToDate:", v4);

        if (v13)
          v14 = v17;
        else
          v14 = v5;
        objc_msgSend(v14, "addObject:", v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary removeObjectsForKeys:](v6->_recentInstallations, "removeObjectsForKeys:", v5);
  objc_sync_exit(v6);

  return v17;
}

- (id)_getRecentInstallationsMap
{
  _ATXRecentInstallCache *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_recentInstallations, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)reset
{
  uint64_t v2;
  NSMutableDictionary *recentInstallations;
  _ATXRecentInstallCache *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = objc_opt_new();
  recentInstallations = obj->_recentInstallations;
  obj->_recentInstallations = (NSMutableDictionary *)v2;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentInstallations, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationMonitor, 0);
  objc_storeStrong((id *)&self->_installNotificationMonitor, 0);
}

@end
