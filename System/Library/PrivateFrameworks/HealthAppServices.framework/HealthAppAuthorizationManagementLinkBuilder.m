@implementation HealthAppAuthorizationManagementLinkBuilder

+ (BOOL)canOpenLinkWithSourceIdentifier:(id)a3 destinationIdentifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v8 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v9 = (void *)objc_msgSend(v8, "initWithSuiteName:", *MEMORY[0x1E0CB7608]);
  objc_msgSend(v9, "stringForKey:", CFSTR("SourceApplicationBundleIdentifierOverride"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v6)
    v12 = v6;
  else
    v12 = v7;
  if (v10)
    v12 = (void *)v10;
  v13 = v12;
  v14 = objc_msgSend(a1, "canOpenAuthorizationManagementWithValidIdentifier:", v13);
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_opt_class();
    v18 = CFSTR("nil");
    v23 = 138544386;
    v24 = v17;
    if (v7)
      v19 = v7;
    else
      v19 = CFSTR("nil");
    v25 = 2048;
    v26 = v14;
    if (v6)
      v20 = v6;
    else
      v20 = CFSTR("nil");
    v27 = 2112;
    v28 = v19;
    if (v13)
      v18 = v13;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v18;
    v21 = v17;
    _os_log_impl(&dword_1D712B000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ [Authorization] Can Open Link: %ld Destination: %@ Source: %@ Derived: %@", (uint8_t *)&v23, 0x34u);

  }
  return v14;
}

+ (BOOL)canOpenAuthorizationManagementWithValidIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = [v3 alloc];
  v10[0] = CFSTR("com.apple.installcoordinationd");
  v10[1] = CFSTR("com.hip.PistoPilot");
  v10[2] = *MEMORY[0x1E0CB77C0];
  v10[3] = CFSTR("com.apple.journal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v8 = objc_msgSend(v7, "containsObject:", v4);
  return v8;
}

- (id)URLForAuthorizationManagementFromLocation:(int64_t)a3
{
  return -[HealthAppAuthorizationManagementLinkBuilder _URLForAuthorizationManagementFromLocation:bundleIdentifier:](self, "_URLForAuthorizationManagementFromLocation:bundleIdentifier:", a3, 0);
}

- (id)_URLForAuthorizationManagementFromLocation:(int64_t)a3 bundleIdentifier:(id)a4
{
  void *v4;
  id v7;
  uint64_t v8;

  v7 = a4;
  switch(a3)
  {
    case 0:
      -[HealthAppAuthorizationManagementLinkBuilder _URLForAuthorizationManagementLocationHealthProfileWithBundleIdentifier:](self, "_URLForAuthorizationManagementLocationHealthProfileWithBundleIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[HealthAppAuthorizationManagementLinkBuilder _URLForAuthorizationManagementLocationHealthSharingWithBundleIdentifier:](self, "_URLForAuthorizationManagementLocationHealthSharingWithBundleIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[HealthAppAuthorizationManagementLinkBuilder _URLForAuthorizationManagementLocationSettingsWithBundleIdentifier:](self, "_URLForAuthorizationManagementLocationSettingsWithBundleIdentifier:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v8;
      break;
  }

  return v4;
}

- (id)_URLForAuthorizationManagementLocationSettingsWithBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  if (v8)
  {
    +[HAServicesDefines nanoInternalSettingsAppURLScheme](HAServicesDefines, "nanoInternalSettingsAppURLScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScheme:", v9);

    +[HAServicesDefines nanoHealthSettingsBundleIdentifier](HAServicesDefines, "nanoHealthSettingsBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHost:", v10);

    v11 = (void *)MEMORY[0x1E0CB3940];
    +[HAServicesDefines authorizationManagementHostName](HAServicesDefines, "authorizationManagementHostName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("/%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HealthAppAuthorizationManagementLinkBuilder appendBundleIdentifierIfNecessary:toPath:](self, "appendBundleIdentifierIfNecessary:toPath:", v5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setPath:", v14);
  }
  else
  {
    +[HAServicesDefines internalSettingsAppURLScheme](HAServicesDefines, "internalSettingsAppURLScheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScheme:", v15);

    v16 = (void *)MEMORY[0x1E0CB3940];
    +[HAServicesDefines healthSettingsSourcesHostName](HAServicesDefines, "healthSettingsSourcesHostName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@&path=%@"), CFSTR("root=HEALTH"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHost:", v18);

    -[HealthAppAuthorizationManagementLinkBuilder appendBundleIdentifierIfNecessary:](self, "appendBundleIdentifierIfNecessary:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setPath:", v13);
  }

  objc_msgSend(v6, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_URLForAuthorizationManagementLocationHealthProfileWithBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  +[HAServicesDefines internalHealthAppURLScheme](HAServicesDefines, "internalHealthAppURLScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScheme:", v7);

  +[HAServicesDefines authorizationManagementHostName](HAServicesDefines, "authorizationManagementHostName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHost:", v8);

  -[HealthAppAuthorizationManagementLinkBuilder appendBundleIdentifierIfNecessary:](self, "appendBundleIdentifierIfNecessary:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPath:", v9);
  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_URLForAuthorizationManagementLocationHealthSharingWithBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  +[HAServicesDefines internalHealthAppURLScheme](HAServicesDefines, "internalHealthAppURLScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScheme:", v7);

  +[HAServicesDefines sharingOverviewHostName](HAServicesDefines, "sharingOverviewHostName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHost:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  +[HAServicesDefines authorizationManagementHostName](HAServicesDefines, "authorizationManagementHostName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("/%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HealthAppAuthorizationManagementLinkBuilder appendBundleIdentifierIfNecessary:toPath:](self, "appendBundleIdentifierIfNecessary:toPath:", v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPath:", v12);
  objc_msgSend(v6, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)appendBundleIdentifierIfNecessary:(id)a3
{
  return -[HealthAppAuthorizationManagementLinkBuilder appendBundleIdentifierIfNecessary:toPath:](self, "appendBundleIdentifierIfNecessary:toPath:", a3, &stru_1E9BE3348);
}

- (id)appendBundleIdentifierIfNecessary:(id)a3 toPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v12[0] = CFSTR("/");
    v12[1] = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a3;
    objc_msgSend(v7, "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "componentsJoinedByString:", &stru_1E9BE3348);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
