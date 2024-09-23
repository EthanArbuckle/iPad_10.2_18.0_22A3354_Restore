@implementation HMHome(Announce)

- (BOOL)isAnnounceSupported
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "homePodsIncludingCurrentAccessorySupportingAnnounce");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (uint64_t)isAnnounceAvailable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  +[ANHomeManager shared](ANHomeManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
  {
LABEL_5:
    if (!objc_msgSend(a1, "announceAccessAllowedForCurrentUser"))
      goto LABEL_4;
LABEL_6:
    v8 = objc_msgSend(a1, "isAnnounceEnabledForAnyAccessoryOrUser");
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "an_isAnnounceEnabled") & 1) != 0)
    goto LABEL_6;
LABEL_4:
  v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)isAnnounceEnabledForAnyAccessory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  _BOOL8 v18;
  int v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[ANHomeManager shared](ANHomeManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(a1, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBA1A8], "hmu_accessoriesExcludingCurrentAccessoryFromAccessories:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBA1A8], "hmu_accessoriesFromAccessories:excludingStereoCompanionForAccessory:", v11, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v13 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(a1, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  ANLogHandleHome_Announce();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v12, "count");
    v16 = objc_msgSend(v12, "count");
    v17 = "ies";
    v21 = &stru_1E93913D0;
    v20 = 138412802;
    if (v16 == 1)
      v17 = "y";
    v22 = 2048;
    v23 = v15;
    v24 = 2080;
    v25 = v17;
    _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "%@%lu accessor%s with announce enabled", (uint8_t *)&v20, 0x20u);
  }

  v18 = objc_msgSend(v12, "count") != 0;
  return v18;
}

- (BOOL)isAnnounceEnabledForAnyAccessoryOrUser
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _BOOL8 v22;
  int v24;
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  +[ANHomeManager shared](ANHomeManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(a1, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBA1A8], "hmu_accessoriesExcludingCurrentAccessoryFromAccessories:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBA1A8], "hmu_accessoriesFromAccessories:excludingStereoCompanionForAccessory:", v11, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "usersIncludingCurrentUserWithAnnounceEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v14 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(a1, "accessories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "usersWithAnnounceEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  ANLogHandleHome_Announce();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v12, "count");
    if (objc_msgSend(v12, "count") == 1)
      v18 = "y";
    else
      v18 = "ies";
    v19 = objc_msgSend(v13, "count");
    v20 = objc_msgSend(v13, "count");
    v24 = 138413314;
    v25 = &stru_1E93913D0;
    v21 = "s";
    v27 = v17;
    v26 = 2048;
    v28 = 2080;
    if (v20 == 1)
      v21 = "";
    v29 = v18;
    v30 = 2048;
    v31 = v19;
    v32 = 2080;
    v33 = v21;
    _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "%@%lu accessor%s with announce enabled.  %ld user%s with announce enabled", (uint8_t *)&v24, 0x34u);
  }

  if (objc_msgSend(v12, "count"))
    v22 = 1;
  else
    v22 = objc_msgSend(v13, "count") != 0;

  return v22;
}

- (uint64_t)announceAccessAllowedForCurrentUser
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "announceAccessAllowedForUser:", v2);

  return v3;
}

- (uint64_t)announceAccessAllowedForUser:()Announce
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAnnounceAccessAllowed");

  ANLogHandleHome_Announce();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = &stru_1E93913D0;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Announce Access Allowed For User (Name = %@, ID = %@): %@", (uint8_t *)&v18, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForDefault:", *MEMORY[0x1E0CF7B58]);

  if ((_DWORD)v12)
  {
    ANLogHandleHome_Announce();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = &stru_1E93913D0;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v16 = "%@[Override] Force Allow Announce For User (Name = %@, ID = %@) Enabled";
LABEL_10:
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0x20u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ((v6 & 1) == 0)
  {
    ANLogHandleHome_Announce();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = &stru_1E93913D0;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v16 = "%@Announce is DISABLED For User (Name = %@, ID = %@)";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (uint64_t)usersIncludingCurrentUserWithAnnounceEnabled
{
  return objc_msgSend(a1, "_usersWithAnnounceEnabledIncludingCurrentUser:", 1);
}

- (uint64_t)usersWithAnnounceEnabled
{
  return objc_msgSend(a1, "_usersWithAnnounceEnabledIncludingCurrentUser:", 0);
}

- (id)usersIncludingCurrentUserWithAnnounceAndRemoteAccessEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(a1, "announceAccessAllowedForUser:", v8)
          && objc_msgSend(a1, "hmu_isRemoteAccessAllowedForUser:", v8))
        {
          objc_msgSend(v2, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (uint64_t)homePodsIncludingCurrentAccessorySupportingAnnounce
{
  return objc_msgSend(a1, "_homePodsSupportingAnnounceIncludingCurrentAccessory:", 1);
}

- (uint64_t)homePodsIncludingCurrentAccessoryWithAnnounceEnabled
{
  return objc_msgSend(a1, "_homePodsWithAnnounceEnabledIncludingCurrentAccessory:", 1);
}

- (uint64_t)an_announceNotificationsEnabledForCurrentUserWithOverrideHomeLocationStatus:()Announce
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t result;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "homeLocationStatus");
  ANLogHandleHome_Announce();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138413058;
    v17 = &stru_1E93913D0;
    v18 = 2048;
    v19 = (uint64_t)a3;
    v20 = 2048;
    v21 = v5;
    v22 = 2112;
    v23 = a1;
    _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@Override Home Location Status: %ld, Current Home Location Status: %ld, Home: %@", (uint8_t *)&v16, 0x2Au);
  }

  objc_msgSend(a1, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "announceUserSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceNotificationMode");

  ANLogHandleHome_Announce();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = &stru_1E93913D0;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Current User Announce Notification Mode: %ld", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForDefault:", *MEMORY[0x1E0CF7B60]);

  if (v12)
  {
    ANLogHandleHome_Announce();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@[Override] Force Announce Notifications Enabled", (uint8_t *)&v16, 0xCu);
    }

    return 1;
  }
  if (v9 == 3)
    return 1;
  if (v9 != 2)
    return 0;
  result = 1;
  if (a3 != (void *)1 && v5 != 1)
  {
    ANLogHandleHome_Announce();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = &stru_1E93913D0;
      v18 = 2112;
      v19 = (uint64_t)a1;
      v20 = 2048;
      v21 = v5;
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_ERROR, "%@Current User is not in Home %@ (Current Home Location Status = %ld). Not posting user notification.", (uint8_t *)&v16, 0x20u);
    }

    return 0;
  }
  return result;
}

- (id)_usersWithAnnounceEnabledIncludingCurrentUser:()Announce
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  else
    objc_msgSend(a1, "users");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HMHome_Announce___usersWithAnnounceEnabledIncludingCurrentUser___block_invoke;
  v12[3] = &unk_1E938FF30;
  v12[4] = a1;
  objc_msgSend(v5, "na_filter:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleHome_Announce();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v5, "count");
    if (a3)
      v9 = " (including current user)";
    else
      v9 = "";
    v10 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413058;
    v14 = &stru_1E93913D0;
    v15 = 2048;
    v16 = v8;
    v17 = 2080;
    v18 = v9;
    v19 = 2048;
    v20 = v10;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_INFO, "%@Home has %ld users%s, %ld have intercom enabled", buf, 0x2Au);
  }

  return v6;
}

- (id)_homePodsWithAnnounceEnabledIncludingCurrentAccessory:()Announce
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "hmu_homePodsIncludingCurrentAccessoryDictionary");
  else
    objc_msgSend(a1, "hmu_homePodsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "an_isAnnounceAccessory", (_QWORD)v13)
          && objc_msgSend(v11, "an_isAnnounceEnabled"))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_homePodsSupportingAnnounceIncludingCurrentAccessory:()Announce
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "hmu_homePodsIncludingCurrentAccessoryDictionary");
  else
    objc_msgSend(a1, "hmu_homePodsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "an_isAnnounceAccessory", (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

@end
