@implementation HKSource(HealthDaemon)

+ (id)hd_sourceForClient:()HealthDaemon
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "sourceBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultSourceBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sourceWithBundleIdentifier:defaultBundleIdentifier:appEntitlements:name:", v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "hd_getNameForSource:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "_setName:", v11);

  return v10;
}

+ (id)hd_getNameForSource:()HealthDaemon
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "_isLocalDevice"))
  {
    objc_msgSend(a1, "hd_currentDeviceSourceName");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v5;
    goto LABEL_34;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "hd_isSpartanDeviceBundleIdentifier:", v6);

  if (v7)
  {
    HKConnectedGymSourceName();
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "_isResearchStudy"))
  {
    v9 = v4;
    objc_opt_self();
    v26 = 0;
    objc_msgSend(v9, "_fetchBundleWithError:", &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;
    if (!v10)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v9;
        v29 = 2112;
        v30 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch research study bundle for source %@: %@", buf, 0x16u);
      }
    }
    objc_msgSend(v10, "hk_displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v10, "hk_name");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v15;

  }
  else
  {
    objc_msgSend(v4, "bundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "appState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isValid"))
      {
        objc_msgSend(v17, "localizedName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v9;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't find application proxy for bundle identifier %@", buf, 0xCu);
      }
      v8 = 0;
    }

    if (!v8)
    {
      v20 = v9;
      objc_opt_self();
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForCompanionIdentifier:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "appState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "isValid"))
        {
          objc_msgSend(v22, "localizedName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        _HKInitializeLogging();
        v24 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "Couldn't find application proxy for companion bundle identifier %@", buf, 0xCu);
        }
        v8 = 0;
      }

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB6C20], "aliasNameForSource:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

LABEL_34:
  return v8;
}

+ (id)hd_currentDeviceSourceName
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentDeviceDisplayName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)hd_isSpartanDeviceBundleIdentifier:()HealthDaemon
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CB7588]);
}

@end
