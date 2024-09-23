@implementation INExecutionInfo

- (id)_initWithLaunchableAppBundleId:(id)a3 displayableAppBundleId:(id)a4 containingAppBundleURL:(id)a5 extensionBundleId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INExecutionInfo *v14;
  uint64_t v15;
  NSString *launchableAppBundleId;
  void **p_launchableAppBundleId;
  uint64_t v18;
  NSString *displayableAppBundleId;
  uint64_t v20;
  NSURL *containingAppBundleURL;
  uint64_t v22;
  NSString *extensionBundleId;
  void *v24;
  id v25;
  void *v26;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)INExecutionInfo;
  v14 = -[INExecutionInfo init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    p_launchableAppBundleId = (void **)&v14->_launchableAppBundleId;
    launchableAppBundleId = v14->_launchableAppBundleId;
    v14->_launchableAppBundleId = (NSString *)v15;

    v18 = objc_msgSend(v11, "copy");
    displayableAppBundleId = v14->_displayableAppBundleId;
    v14->_displayableAppBundleId = (NSString *)v18;

    v20 = objc_msgSend(v12, "copy");
    containingAppBundleURL = v14->_containingAppBundleURL;
    v14->_containingAppBundleURL = (NSURL *)v20;

    v22 = objc_msgSend(v13, "copy");
    extensionBundleId = v14->_extensionBundleId;
    v14->_extensionBundleId = (NSString *)v22;

    v24 = v14->_displayableAppBundleId;
    if (v14->_launchableAppBundleId)
    {
      if (!v24)
      {
        v24 = *p_launchableAppBundleId;
        p_launchableAppBundleId = (void **)&v14->_displayableAppBundleId;
LABEL_6:
        v25 = v24;
        v26 = *p_launchableAppBundleId;
        *p_launchableAppBundleId = v25;

      }
    }
    else if (v24)
    {
      goto LABEL_6;
    }
  }

  return v14;
}

- (INAppInfo)_appInfo
{
  INAppInfo *appInfo;
  INAppInfo *v4;
  INAppInfo *v5;
  INAppInfo *v6;

  appInfo = self->_appInfo;
  if (!appInfo)
  {
    -[INExecutionInfo _applicationRecord](self, "_applicationRecord");
    v4 = (INAppInfo *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      +[INAppInfo appInfoWithApplicationRecord:](INAppInfo, "appInfoWithApplicationRecord:", v4);
      v4 = (INAppInfo *)objc_claimAutoreleasedReturnValue();
    }
    v6 = self->_appInfo;
    self->_appInfo = v4;

    appInfo = self->_appInfo;
  }
  return appInfo;
}

- (LSApplicationRecord)_applicationRecord
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[INExecutionInfo launchableAppBundleId](self, "launchableAppBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v7 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v2, 0, &v7);
    v4 = v7;
    if (v4)
    {
      v5 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v9 = "-[INExecutionInfo _applicationRecord]";
        v10 = 2112;
        v11 = v2;
        v12 = 2112;
        v13 = v4;
        _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s Unable to create application record for %@: %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v3 = 0;
  }

  return (LSApplicationRecord *)v3;
}

- (BOOL)canRunOnLocalDevice
{
  return 0;
}

- (NSString)launchableAppBundleId
{
  return self->_launchableAppBundleId;
}

- (NSString)displayableAppBundleId
{
  return self->_displayableAppBundleId;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (NSURL)containingAppBundleURL
{
  return self->_containingAppBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAppBundleURL, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_displayableAppBundleId, 0);
  objc_storeStrong((id *)&self->_launchableAppBundleId, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

@end
