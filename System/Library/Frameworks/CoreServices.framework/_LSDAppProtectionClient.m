@implementation _LSDAppProtectionClient

- (_LSDAppProtectionClient)initWithXPCConnection:(id)a3
{
  id v4;
  void *v5;
  _LSDAppProtectionClient *v6;
  objc_super v8;

  v4 = a3;
  getAppProtectionServiceQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v5);

  v8.receiver = self;
  v8.super_class = (Class)_LSDAppProtectionClient;
  v6 = -[_LSDClient initWithXPCConnection:](&v8, sel_initWithXPCConnection_, v4);

  return v6;
}

- (void)setHiddenApplications:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient setHiddenApplications:completion:]");
  v8 = (void *)MEMORY[0x1E0C99E08];
  +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v9, "readFromDBWithError:", &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  objc_msgSend(v8, "dictionaryWithDictionary:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _LSAppProtectionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_LSDAppProtectionClient setHiddenApplications:completion:].cold.3();

    v7[2](v7, v11);
  }
  else
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("hiddenBundleIDs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    computeAddedAndRemovedBundleIDs(&v22, &v21, v14, v6);
    v15 = v22;
    v16 = v21;
    _LSAppProtectionLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_LSDAppProtectionClient setHiddenApplications:completion:].cold.2((uint64_t)v24, objc_msgSend(v15, "count"), objc_msgSend(v16, "count"));

    objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("hiddenBundleIDs"));
    +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "writeToDB:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _LSAppProtectionLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_LSDAppProtectionClient setHiddenApplications:completion:].cold.1();

      v7[2](v7, v11);
    }
    else
    {
      v20 = 0;
      notifyLSObservers(v15, v16, 1, &v20);
      v11 = v20;
      -[_LSDAppProtectionClient sendPluginNotificationsFor:notification:](self, "sendPluginNotificationsFor:notification:", v15, CFSTR("com.apple.LaunchServices.pluginsunregistered"));
      -[_LSDAppProtectionClient sendPluginNotificationsFor:notification:](self, "sendPluginNotificationsFor:notification:", v16, CFSTR("com.apple.LaunchServices.pluginsregistered"));
      v7[2](v7, v11);
    }

  }
}

- (void)setLockedApplications:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, id);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient setLockedApplications:completion:]");
  v7 = (void *)MEMORY[0x1E0C99E08];
  +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v8, "readFromDBWithError:", &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  objc_msgSend(v7, "dictionaryWithDictionary:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _LSAppProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_LSDAppProtectionClient setHiddenApplications:completion:].cold.3();

    v6[2](v6, v10);
  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("lockedBundleIDs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = 0;
    computeAddedAndRemovedBundleIDs(&v21, &v20, v13, v5);
    v14 = v21;
    v15 = v20;
    _LSAppProtectionLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[_LSDAppProtectionClient setLockedApplications:completion:].cold.2((uint64_t)v23, objc_msgSend(v14, "count"), objc_msgSend(v15, "count"));

    objc_msgSend(v11, "setObject:forKey:", v5, CFSTR("lockedBundleIDs"));
    +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "writeToDB:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _LSAppProtectionLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_LSDAppProtectionClient setHiddenApplications:completion:].cold.1();

      v6[2](v6, v10);
    }
    else
    {
      v19 = 0;
      notifyLSObservers(v14, v15, 0, &v19);
      v10 = v19;
      v6[2](v6, v10);
    }

  }
}

+ (void)cleanupDeletedApplication:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;

  v3 = a3;
  _LSAssertRunningInServer((uint64_t)"+[_LSDAppProtectionClient cleanupDeletedApplication:]");
  v4 = (void *)MEMORY[0x1E0C99E08];
  +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "readFromDBWithError:", &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("lockedBundleIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject containsObject:](v9, "containsObject:", v3);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != %@"), v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject filteredArrayUsingPredicate:](v9, "filteredArrayUsingPredicate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("lockedBundleIDs"));

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("hiddenBundleIDs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsObject:", v3))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != %@"), v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("hiddenBundleIDs"));

    }
    else if (!v10)
    {
      v7 = 0;
LABEL_14:

      goto LABEL_15;
    }
    +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeToDB:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _LSAppProtectionLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[_LSDAppProtectionClient cleanupDeletedApplication:].cold.1();

    }
    goto LABEL_14;
  }
  _LSAppProtectionLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[_LSDAppProtectionClient cleanupDeletedApplication:].cold.2();
LABEL_15:

}

+ (id)hiddenApplicationsForLSDUseOnly
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  _LSAssertRunningInServer((uint64_t)"+[_LSDAppProtectionClient hiddenApplicationsForLSDUseOnly]");
  +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readFromDBWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("hiddenBundleIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

+ (id)lockedApplicationsForLSDUseOnly
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  _LSAssertRunningInServer((uint64_t)"+[_LSDAppProtectionClient lockedApplicationsForLSDUseOnly]");
  +[_LSDAppProtectionAccessManager sharedInstance](_LSDAppProtectionAccessManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readFromDBWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("lockedBundleIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

- (void)getHiddenApplicationsWithCompletion:(id)a3
{
  void *v3;
  void (**v4)(id, void *);

  v4 = (void (**)(id, void *))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient getHiddenApplicationsWithCompletion:]");
  +[_LSDAppProtectionClient hiddenApplicationsForLSDUseOnly](_LSDAppProtectionClient, "hiddenApplicationsForLSDUseOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)getLockedApplicationsWithCompletion:(id)a3
{
  void *v3;
  void (**v4)(id, void *);

  v4 = (void (**)(id, void *))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient getLockedApplicationsWithCompletion:]");
  +[_LSDAppProtectionClient lockedApplicationsForLSDUseOnly](_LSDAppProtectionClient, "lockedApplicationsForLSDUseOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)sendPluginNotificationsFor:(id)a3 notification:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[LSDBExecutionContext sharedServerInstance]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67___LSDAppProtectionClient_sendPluginNotificationsFor_notification___block_invoke;
    v10[3] = &unk_1E1042BD0;
    v11 = v5;
    v9 = v7;
    v12 = v9;
    v13 = v6;
    -[LSDBExecutionContext performAsyncRead:]((uint64_t)v8, v10);

  }
}

- (void)setHiddenApplications:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Error writing to appProtectionStoreFile error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setHiddenApplications:(uint64_t)a3 completion:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_5_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "App Protection hidden subjects changed. added: %lu removed: %lu", v3, v4);
}

- (void)setHiddenApplications:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Error opening appProtectionStoreFile error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setLockedApplications:(uint64_t)a3 completion:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_5_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "App Protection locked subjects changed. added: %lu removed: %lu", v3, v4);
}

+ (void)cleanupDeletedApplication:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Error writing to appProtectionStoreFile error: %{public}@ while cleaning up deleted app %{private}@");
  OUTLINED_FUNCTION_1();
}

+ (void)cleanupDeletedApplication:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Error opening appProtectionStoreFile error: %{public}@ while cleaning up deleted app %{private}@");
  OUTLINED_FUNCTION_1();
}

@end
