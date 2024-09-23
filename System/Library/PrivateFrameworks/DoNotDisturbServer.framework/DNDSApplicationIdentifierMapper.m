@implementation DNDSApplicationIdentifierMapper

- (id)applicationIdentifierForTargetPlatform:(unint64_t)a3 withSourceApplicationIdentifier:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "platform");
  objc_msgSend(v6, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v10 = v9;
  if (a3 == 2 && v7 == 1)
  {
    -[DNDSApplicationIdentifierMapper _macOSBundleIDForiOSBundleID:](self, "_macOSBundleIDForiOSBundleID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;

      v7 = 2;
LABEL_17:

      goto LABEL_18;
    }
    v7 = 1;
    goto LABEL_16;
  }
  if (a3 == 1 && v7 == 2)
  {
    -[DNDSApplicationIdentifierMapper _iOSBundleIDForMacOSBundleID:](self, "_iOSBundleIDForMacOSBundleID:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    if (v14)
    {
      v13 = v14;

      v7 = 1;
      goto LABEL_17;
    }
    v7 = 2;
LABEL_16:
    v13 = v10;
    goto LABEL_17;
  }
  if (v7 == a3)
  {
    v13 = v9;
    v7 = a3;
  }
  else
  {
    v15 = (void *)DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      NSStringFromDNDPlatform();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromDNDPlatform();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138478339;
      v22 = v10;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Cannot map %{private}@ from %{public}@ to %{public}@ on this device", (uint8_t *)&v21, 0x20u);

    }
    v13 = v10;
  }
LABEL_18:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", v13, v7);

  return v19;
}

- (id)applicationIdentifierForFileWithSourceApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[DNDSApplicationIdentifierMapper applicationIdentifierForTargetPlatform:withSourceApplicationIdentifier:](self, "applicationIdentifierForTargetPlatform:withSourceApplicationIdentifier:", DNDPlatformForCurrentDevice(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)applicationIdentifierForSyncWithSourceApplicationIdentifier:(id)a3
{
  return -[DNDSApplicationIdentifierMapper applicationIdentifierForTargetPlatform:withSourceApplicationIdentifier:](self, "applicationIdentifierForTargetPlatform:withSourceApplicationIdentifier:", 1, a3);
}

- (id)_iOSBundleIDForMacOSBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D0D510];
  v4 = a3;
  objc_msgSend(v3, "sharedCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIDForPlatform:fromBundleID:platform:", *MEMORY[0x1E0D0D4F8], v4, *MEMORY[0x1E0D0D500]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_macOSBundleIDForiOSBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D0D510];
  v4 = a3;
  objc_msgSend(v3, "sharedCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIDForPlatform:fromBundleID:platform:", *MEMORY[0x1E0D0D500], v4, *MEMORY[0x1E0D0D4F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
