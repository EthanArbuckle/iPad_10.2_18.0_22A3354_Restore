@implementation NTKCompanionSyncedComplication

- (NTKCompanionSyncedComplication)initWithRemoteApplication:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  NTKCompanionSyncedComplication *v8;
  NTKCompanionSyncedComplication *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *clientIdentifier;
  uint64_t v14;
  NSString *appBundleIdentifier;
  uint64_t v16;
  NSString *companionBundleIdentifier;
  uint64_t v18;
  NSString *fallbackName;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NTKCompanionSyncedComplication;
  v8 = -[NTKCompanionSyncedComplication init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_descriptor, a4);
    objc_msgSend(v6, "watchKitAppExtensionBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v6, "bundleIdentifier");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = v12;

    objc_msgSend(v6, "bundleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    appBundleIdentifier = v9->_appBundleIdentifier;
    v9->_appBundleIdentifier = (NSString *)v14;

    objc_msgSend(v6, "companionAppBundleID");
    v16 = objc_claimAutoreleasedReturnValue();
    companionBundleIdentifier = v9->_companionBundleIdentifier;
    v9->_companionBundleIdentifier = (NSString *)v16;

    objc_msgSend(v6, "applicationName");
    v18 = objc_claimAutoreleasedReturnValue();
    fallbackName = v9->_fallbackName;
    v9->_fallbackName = (NSString *)v18;

  }
  return v9;
}

- (NSString)localizedName
{
  NSString *localizedName;
  id *p_localizedName;
  void *v5;
  id v6;
  NSString *companionBundleIdentifier;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSString *v15;
  id v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  NTKCompanionSyncedComplication *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_localizedName = (id *)&self->_localizedName;
  localizedName = self->_localizedName;
  if (localizedName)
    return localizedName;
  v5 = (void *)MEMORY[0x1BCCA7FA8](0, a2);
  v6 = objc_alloc(MEMORY[0x1E0CA5870]);
  companionBundleIdentifier = self->_companionBundleIdentifier;
  v16 = 0;
  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:allowPlaceholder:error:", companionBundleIdentifier, 1, &v16);
  v9 = v16;
  if (!v8)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_companionBundleIdentifier;
      *(_DWORD *)buf = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = self;
      v21 = 2114;
      v22 = v9;
      _os_log_error_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_ERROR, "Manager could not find record with bundle ID %@ for complication %@ - %{public}@", buf, 0x20u);
    }
    goto LABEL_7;
  }
  objc_msgSend(v8, "localizedName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *p_localizedName;
  *p_localizedName = (id)v10;

  if (!objc_msgSend(*p_localizedName, "length"))
  {
    objc_msgSend(v8, "localizedShortName");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *p_localizedName;
    *p_localizedName = (id)v12;
LABEL_7:

  }
  objc_autoreleasePoolPop(v5);
  if (!objc_msgSend(*p_localizedName, "length"))
    objc_storeStrong(p_localizedName, self->_fallbackName);

  localizedName = (NSString *)*p_localizedName;
  return localizedName;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CLKComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_fallbackName, 0);
  objc_storeStrong((id *)&self->_companionBundleIdentifier, 0);
}

@end
