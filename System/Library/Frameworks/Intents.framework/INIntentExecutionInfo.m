@implementation INIntentExecutionInfo

- (INIntentExecutionInfo)initWithIntent:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  INIntentExecutionInfo *v16;
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "launchId");
  v19 = 0;
  v20 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  INExtractAppInfoFromSiriLaunchIdWithoutLaunchServices(v18, &v20, &v19);
  v5 = v20;
  v6 = v19;
  v7 = v4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "preferredCallProvider");
      v9 = v7;
    }
    else
    {

      v8 = 0;
      v9 = 0;
    }
    v11 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v11, "preferredCallProvider");
      v10 = v11;
    }
    else
    {

      v10 = 0;
    }
    v12 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 2;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v8 = 0;
  }

  objc_msgSend(v7, "_className");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionBundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_uiExtensionBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[INIntentExecutionInfo _initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:](self, "_initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:", v13, v8, v5, 0, v14, v15, v6);

  return v16;
}

- (INIntentExecutionInfo)initWithIntentTypeName:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;
  INIntentExecutionInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;

  v4 = a3;
  v13 = 0;
  v14 = 0;
  v5 = INParseCustomIntentTypeName(v4, &v14, &v13);
  v6 = v14;
  v7 = v13;
  if (v5)
  {
    self = -[INIntentExecutionInfo initWithIntentClassName:launchableAppBundleId:](self, "initWithIntentClassName:launchableAppBundleId:", v6, v7);
    v8 = self;
  }
  else
  {
    INIntentSchemaGetIntentDescriptionWithType(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      NSStringFromClass((Class)objc_msgSend(v9, "facadeClass"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self = (INIntentExecutionInfo *)-[INIntentExecutionInfo _initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:](self, "_initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:", v11, 0, 0, 0, 0, 0, 0);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (INIntentExecutionInfo)initWithIntentClassName:(id)a3 launchableAppBundleId:(id)a4
{
  return (INIntentExecutionInfo *)-[INIntentExecutionInfo _initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:](self, "_initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:", a3, 0, a4, 0, 0, 0, 0);
}

- (INIntentExecutionInfo)initWithIntentClassName:(id)a3 extensionBundleId:(id)a4
{
  return (INIntentExecutionInfo *)-[INIntentExecutionInfo _initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:](self, "_initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:", a3, 0, 0, 0, a4, 0, 0);
}

- (id)_initWithIntentClassName:(id)a3 preferredCallProvider:(int64_t)a4 launchableAppBundleId:(id)a5 displayableAppBundleId:(id)a6 extensionBundleId:(id)a7 uiExtensionBundleId:(id)a8 containingAppBundleURL:(id)a9
{
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  objc_super v24;

  v15 = a3;
  v16 = a8;
  v24.receiver = self;
  v24.super_class = (Class)INIntentExecutionInfo;
  v17 = -[INExecutionInfo _initWithLaunchableAppBundleId:displayableAppBundleId:containingAppBundleURL:extensionBundleId:](&v24, sel__initWithLaunchableAppBundleId_displayableAppBundleId_containingAppBundleURL_extensionBundleId_, a5, a6, a9, a7);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    v19 = (void *)v17[8];
    v17[8] = v18;

    v17[9] = a4;
    v20 = objc_msgSend(v16, "copy");
    v21 = (void *)v17[10];
    v17[10] = v20;

    v22 = v17;
  }

  return v17;
}

- (BOOL)hasCustomUIExtension
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  INIntentExecutionInfo *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  -[INIntentExecutionInfo _uiExtensionsWithError:](self, "_uiExtensionsWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = objc_msgSend(v3, "count");
  if (!v5 && !v3)
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "-[INIntentExecutionInfo hasCustomUIExtension]";
      v11 = 2114;
      v12 = self;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s Failed to match UI extensions for execution info %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v5 != 0;
}

- (BOOL)canRunOnLocalDevice
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  INIntentExecutionInfo *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[INExecutionInfo _applicationRecord](self, "_applicationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInstalled");

  if (!v5)
    goto LABEL_4;
  -[INExecutionInfo _appInfo](self, "_appInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentExecutionInfo intentClassName](self, "intentClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
    return 1;
LABEL_4:
  v16 = 0;
  -[INIntentExecutionInfo _extensionsWithError:](self, "_extensionsWithError:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  v13 = objc_msgSend(v11, "count");
  v10 = v13 != 0;
  if (!v13)
  {
    if (v12)
    {
      v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[INIntentExecutionInfo canRunOnLocalDevice]";
        v19 = 2114;
        v20 = self;
        v21 = 2114;
        v22 = v12;
        _os_log_error_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_ERROR, "%s Failed to match extensions for execution info %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }

  return v10;
}

- (id)_matchingAttributesForExtensionPoint:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2A28]);

  -[INIntentExecutionInfo intentClassName](self, "intentClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("IntentsSupported"));

  -[INExecutionInfo containingAppBundleURL](self, "containingAppBundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INExecutionInfo launchableAppBundleId](self, "launchableAppBundleId");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v10 && v11)
  {
    -[INExecutionInfo _applicationRecord](self, "_applicationRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v10 || !v12)
  {
    if (v10)
    {
      objc_msgSend(v10, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D7D448]);

    }
    a4 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot match extensions for \"%@\" because it does not have a bundle URL"), v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2938];
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 2005, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)_extensionsWithError:(id *)a3
{
  NSArray *extensions;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  extensions = self->_extensions;
  if (extensions)
    return extensions;
  -[INExecutionInfo extensionBundleId](self, "extensionBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[INIntentExecutionInfo _matchingAttributesForExtensionPoint:error:](self, "_matchingAttributesForExtensionPoint:error:", CFSTR("com.apple.intents-service"), a3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v11, a3);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = self->_extensions;
      self->_extensions = v13;

      goto LABEL_7;
    }
LABEL_10:

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  v8 = (void *)v7;
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v10 = self->_extensions;
  self->_extensions = v9;

LABEL_7:
  extensions = self->_extensions;
  return extensions;
}

- (id)_uiExtensionsWithError:(id *)a3
{
  NSArray *uiExtensions;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  uiExtensions = self->_uiExtensions;
  if (uiExtensions)
    return uiExtensions;
  -[INIntentExecutionInfo uiExtensionBundleId](self, "uiExtensionBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[INIntentExecutionInfo _matchingAttributesForExtensionPoint:error:](self, "_matchingAttributesForExtensionPoint:error:", CFSTR("com.apple.intents-ui-service"), a3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v11, a3);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = self->_uiExtensions;
      self->_uiExtensions = v13;

      goto LABEL_7;
    }
LABEL_10:

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  v8 = (void *)v7;
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v10 = self->_uiExtensions;
  self->_uiExtensions = v9;

LABEL_7:
  uiExtensions = self->_uiExtensions;
  return uiExtensions;
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSString)uiExtensionBundleId
{
  return self->_uiExtensionBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);
  objc_storeStrong((id *)&self->_uiExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

@end
