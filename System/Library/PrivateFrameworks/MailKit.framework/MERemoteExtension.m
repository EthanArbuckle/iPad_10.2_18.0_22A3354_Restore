@implementation MERemoteExtension

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__MERemoteExtension_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (id)log_log_3;
}

void __24__MERemoteExtension_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

- (MERemoteExtension)initWithExtension:(id)a3
{
  id v5;
  MERemoteExtension *v6;
  MERemoteExtension *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *extensionLoadingQueue;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MERemoteExtension;
  v6 = -[MERemoteExtension init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    -[NSExtension _localizedName](v7->_extension, "_localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSExtension _localizedName](v7->_extension, "_localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(CFSTR("com.apple.email.extension."), "stringByAppendingString:", v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v12, v14);
    extensionLoadingQueue = v7->_extensionLoadingQueue;
    v7->_extensionLoadingQueue = (OS_dispatch_queue *)v15;

    *(_QWORD *)&v7->_remoteExtensionProxyLock._os_unfair_lock_opaque = 0;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __39__MERemoteExtension_initWithExtension___block_invoke;
    v18[3] = &unk_24C4D2C50;
    objc_copyWeak(&v19, &location);
    -[NSExtension setRequestInterruptionBlock:](v7->_extension, "setRequestInterruptionBlock:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __39__MERemoteExtension_initWithExtension___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_unfair_lock_s *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  +[MERemoteExtension log](MERemoteExtension, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl(&dword_20BB85000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Extension interrupted", (uint8_t *)&v5, 0xCu);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    +[MERemoteExtension log](MERemoteExtension, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = WeakRetained;
      _os_log_impl(&dword_20BB85000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting extension _remoteExtensionProxyPromise as Extension interrupted.", (uint8_t *)&v5, 0xCu);
    }

    v4 = *(void **)&WeakRetained[22]._os_unfair_lock_opaque;
    *(_QWORD *)&WeakRetained[22]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(WeakRetained + 2);
  }

}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = objc_opt_class();
  -[MERemoteExtension extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %@>"), v4, self, v5);

  return (NSString *)v6;
}

- (NSString)extensionID
{
  void *v2;
  void *v3;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)displayVersion
{
  void *v2;
  void *v3;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)containingAppDisplayName
{
  void *v2;
  void *v3;
  void *v4;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedContainingName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSURL)containingAppURL
{
  void *v2;
  void *v3;
  void *v4;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSString)descriptionText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedInfoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSHumanReadableDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSHumanReadableDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v7, "length"))
    {
      v8 = &stru_24C4D2DE8;
      goto LABEL_8;
    }
    v5 = v7;
  }
  v8 = v5;
  v7 = v8;
LABEL_8:

  return (NSString *)v8;
}

- (BOOL)isEnabled
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  MERemoteExtension *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[MERemoteExtension extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "optedIn");

  +[MEExtensionUserPreferences sharedInstance](MEExtensionUserPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MERemoteExtension extensionID](self, "extensionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isExtensionEnabled:", v6);

  +[MERemoteExtension log](MERemoteExtension, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[MERemoteExtension extensionID](self, "extensionID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("Not Enabled");
    if (v7)
      v11 = CFSTR("Enabled");
    v12 = CFSTR("NO");
    v14 = 134218754;
    v15 = self;
    v16 = 2114;
    v17 = v9;
    if (v4)
      v12 = CFSTR("YES");
    v18 = 2114;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_20BB85000, v8, OS_LOG_TYPE_DEFAULT, "MERemoteExtension<%p>: Extension %{public}@ is userEnabled: %{public}@ and optedIn: %@.", (uint8_t *)&v14, 0x2Au);

  }
  return v4 & v7;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = -[MERemoteExtension isEnabled](self, "isEnabled");
  +[MERemoteExtension log](MERemoteExtension, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MERemoteExtension extensionID](self, "extensionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 1024;
    v20 = v3;
    _os_log_impl(&dword_20BB85000, v6, OS_LOG_TYPE_DEFAULT, "Settting enabled state for extension: %{public}@ to state: %d.", buf, 0x12u);

  }
  if (!v3 || v5)
  {
    v8 = 0;
    if (!v5 || v3)
      goto LABEL_12;
    -[MERemoteExtension extension](self, "extension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v10 = (id *)&v15;
    objc_msgSend(v9, "attemptOptOut:", &v15);
  }
  else
  {
    -[MERemoteExtension extension](self, "extension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v10 = (id *)&v16;
    objc_msgSend(v9, "attemptOptIn:", &v16);
  }
  v8 = *v10;

  if (v8)
  {
    +[MERemoteExtension log](MERemoteExtension, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[MERemoteExtension description](self, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 1024;
      v20 = v3;
      v21 = 2114;
      v22 = v8;
      _os_log_error_impl(&dword_20BB85000, v11, OS_LOG_TYPE_ERROR, "Error settting enabled state for extension: %{public}@ to state: %d. Error: %{public}@", buf, 0x1Cu);

    }
  }
LABEL_12:
  +[MEExtensionUserPreferences sharedInstance](MEExtensionUserPreferences, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MERemoteExtension extensionID](self, "extensionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExtensionEnabled:forExtensionID:", v3, v13);

}

- (NSArray)capabilities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MEExtensionCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_filter:", &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __33__MERemoteExtension_capabilities__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MERemoteExtension allCapabilities](MERemoteExtension, "allCapabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v2);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)allCapabilities
{
  if (allCapabilities_onceToken != -1)
    dispatch_once(&allCapabilities_onceToken, &__block_literal_global_60);
  return (id)allCapabilities_allCapabilities;
}

void __36__MERemoteExtension_allCapabilities__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("MEComposeSessionHandler");
  v2[1] = CFSTR("MEMessageSecurityHandler");
  v2[2] = CFSTR("MEMessageActionHandler");
  v2[3] = CFSTR("MEContentBlocker");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allCapabilities_allCapabilities;
  allCapabilities_allCapabilities = v0;

}

+ (id)allCapabilitiesRequiringMessageContentAccess
{
  if (allCapabilitiesRequiringMessageContentAccess_onceToken != -1)
    dispatch_once(&allCapabilitiesRequiringMessageContentAccess_onceToken, &__block_literal_global_62_0);
  return (id)allCapabilitiesRequiringMessageContentAccess_allCapabilitiesRequiringMessageContentAccess;
}

void __65__MERemoteExtension_allCapabilitiesRequiringMessageContentAccess__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("MEComposeSessionHandler");
  v2[1] = CFSTR("MEMessageSecurityHandler");
  v2[2] = CFSTR("MEMessageActionHandler");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allCapabilitiesRequiringMessageContentAccess_allCapabilitiesRequiringMessageContentAccess;
  allCapabilitiesRequiringMessageContentAccess_allCapabilitiesRequiringMessageContentAccess = v0;

}

- (BOOL)outboundNetworkingAllowed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("com.apple.security.network.client"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (BOOL)inboundNetworkingAllowed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("com.apple.security.network.server"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (UIImage)preferencesIcon
{
  return (UIImage *)-[MERemoteExtension _imageForName:](self, "_imageForName:", CFSTR("icon-preferences"));
}

- (UIImage)menuIcon
{
  return (UIImage *)-[MERemoteExtension _imageForName:](self, "_imageForName:", CFSTR("icon-menu"));
}

- (UIImage)toolbarIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MERemoteExtension extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MEComposeSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MEComposeIcon")),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[MERemoteExtension _imageForName:](self, "_imageForName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("puzzlepiece.extension"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIImage *)v7;
}

- (id)_imageForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  -[MERemoteExtension extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:withConfiguration:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("puzzlepiece.extension"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)toolbarIconTooltip
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  -[MERemoteExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MEComposeSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MEComposeIconToolTip"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24C4D2DE8;
  }

  return v5;
}

- (MEMailComposeToolbarItemInfo)composeWindowToolbarButtonInfo
{
  MEMailComposeToolbarItemInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  MEMailComposeToolbarItemInfo *v7;

  v3 = [MEMailComposeToolbarItemInfo alloc];
  -[MERemoteExtension displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MERemoteExtension toolbarIcon](self, "toolbarIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MERemoteExtension toolbarIconTooltip](self, "toolbarIconTooltip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MEMailComposeToolbarItemInfo initWithLabel:image:tooltip:](v3, "initWithLabel:image:tooltip:", v4, v5, v6);

  return v7;
}

- (MEExtensionHostContext)extensionHostContext
{
  void *v3;
  void *v4;
  void *v5;

  -[MERemoteExtension extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MERemoteExtension contextUUID](self, "contextUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_extensionContextForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MEExtensionHostContext *)v5;
}

- (id)_remoteExtensionProxyFuture
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = (void *)objc_opt_new();
  -[MERemoteExtension _loadRemoteExtesionProxyFuture](self, "_loadRemoteExtesionProxyFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke;
  v16[3] = &unk_24C4D2CB8;
  v6 = v3;
  v17 = v6;
  objc_msgSend(v4, "addSuccessBlock:", v16);

  -[MERemoteExtension _loadRemoteExtesionProxyFuture](self, "_loadRemoteExtesionProxyFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = 3221225472;
  v13 = __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke_2;
  v14 = &unk_24C4D27A8;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "addFailureBlock:", &v11);

  objc_msgSend(v8, "future", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:");

}

uint64_t __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)_loadRemoteExtesionProxyFuture
{
  void *v4;
  EFPromise *remoteExtensionProxyPromise;
  EFPromise *v6;
  EFPromise *v7;
  EFPromise *v8;
  EFPromise *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v14;
  _QWORD block[4];
  EFPromise *v16;
  id v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[MERemoteExtension extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MERemoteExtension.m"), 335, CFSTR("Expected non-nil extension for %@"), self);

  }
  os_unfair_lock_lock(&self->_remoteExtensionProxyLock);
  remoteExtensionProxyPromise = self->_remoteExtensionProxyPromise;
  v6 = remoteExtensionProxyPromise;
  if (!remoteExtensionProxyPromise)
  {
    objc_msgSend(MEMORY[0x24BE2E680], "promise");
    v7 = (EFPromise *)objc_claimAutoreleasedReturnValue();
    v8 = self->_remoteExtensionProxyPromise;
    self->_remoteExtensionProxyPromise = v7;

    v6 = self->_remoteExtensionProxyPromise;
  }
  v9 = v6;
  os_unfair_lock_unlock(&self->_remoteExtensionProxyLock);
  if (!remoteExtensionProxyPromise)
  {
    +[MERemoteExtension log](MERemoteExtension, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_20BB85000, v10, OS_LOG_TYPE_DEFAULT, "Starting setting up a new request, extension:%@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke;
    block[3] = &unk_24C4D26E0;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v9;
    dispatch_async(v11, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  -[EFPromise future](v9, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  os_unfair_lock_s *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  os_unfair_lock_s *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[os_unfair_lock_s extension](WeakRetained, "extension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v4, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &v28);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v28;
    v7 = v28;

    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    v27 = 0;
    if (v7)
    {
      objc_storeStrong(&v27, v6);
      +[MERemoteExtension log](MERemoteExtension, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v23[5], "ef_publicDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v5;
        v31 = 2112;
        v32 = v3;
        v33 = 2114;
        v34 = v20;
        _os_log_error_impl(&dword_20BB85000, v8, OS_LOG_TYPE_ERROR, "Error setting up a new request, requestID:%@, extension:%@, error:%{public}@", buf, 0x20u);

      }
      v9 = 0;
    }
    else
    {
      +[MERemoteExtension log](MERemoteExtension, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v5;
        v31 = 2112;
        v32 = v3;
        _os_log_impl(&dword_20BB85000, v10, OS_LOG_TYPE_DEFAULT, "Finished setting up a new request, requestID:%@, extension:%@", buf, 0x16u);
      }

      -[os_unfair_lock_s extension](v3, "extension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_extensionContextForUUID:", v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v5, "copy");
      v13 = *(void **)&v3[26]._os_unfair_lock_opaque;
      *(_QWORD *)&v3[26]._os_unfair_lock_opaque = v12;

      -[NSObject _auxiliaryConnection](v8, "_auxiliaryConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_85;
      v21[3] = &unk_24C4D2CE0;
      v21[4] = v3;
      v21[5] = &v22;
      objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = *(void **)(a1 + 32);
    if (v23[5])
    {
      objc_msgSend(v15, "finishWithError:");
      os_unfair_lock_lock(v3 + 2);
      +[MERemoteExtension log](MERemoteExtension, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[os_unfair_lock_s ef_publicDescription](v3, "ef_publicDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v23[5], "ef_publicDescription");
        v18 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        v31 = 2114;
        v32 = v18;
        _os_log_impl(&dword_20BB85000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting extension _remoteExtensionProxyPromise as Extension start failed with error %{public}@.", buf, 0x16u);

      }
      v19 = *(void **)&v3[22]._os_unfair_lock_opaque;
      *(_QWORD *)&v3[22]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(v3 + 2);
    }
    else
    {
      objc_msgSend(v15, "finishWithResult:", v9);
    }

    _Block_object_dispose(&v22, 8);
  }

}

void __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_85(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    +[MERemoteExtension log](MERemoteExtension, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_85_cold_1(a1, (uint64_t)v4, v5);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)interfaceForExtensionCapability:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MERemoteExtension capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[MERemoteExtension _remoteExtensionProxyFuture](self, "_remoteExtensionProxyFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE2E650];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MEMailExtensionErrorDomain"), 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (MEComposeSessionHandler)composeSessionInterface
{
  return (MEComposeSessionHandler *)-[MERemoteExtension _interfaceForExtensionCapability:](self, "_interfaceForExtensionCapability:", CFSTR("MEComposeSessionHandler"));
}

- (MEComposeSessionHandler_Private)synchronousComposeSessionInterface
{
  return (MEComposeSessionHandler_Private *)-[MERemoteExtension _synchronousInterfaceForExtensionCapability:](self, "_synchronousInterfaceForExtensionCapability:", CFSTR("MEComposeSessionHandler"));
}

- (void)getMailComposeExtensionViewControllerForSession:(id)a3 hostDelegate:(id)a4 completionHandler:(id)a5
{
  void *v6;
  char v7;
  id v8;

  v8 = a5;
  -[MERemoteExtension capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("MEComposeSessionHandler"));

  if ((v7 & 1) == 0)
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);

}

- (MEMessageActionHandler_Private)messageActionProviderInterface
{
  return (MEMessageActionHandler_Private *)-[MERemoteExtension _interfaceForExtensionCapability:](self, "_interfaceForExtensionCapability:", CFSTR("MEMessageActionHandler"));
}

- (MEMessageActionHandler_Private)synchronousMessageActionProviderInterface
{
  void *v5;

  if (pthread_main_np())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MERemoteExtension.m"), 431, CFSTR("Current thread is main"));

  }
  return (MEMessageActionHandler_Private *)-[MERemoteExtension _synchronousInterfaceForExtensionCapability:](self, "_synchronousInterfaceForExtensionCapability:", CFSTR("MEMessageActionHandler"));
}

- (id)contentBlockerInterface
{
  return -[MERemoteExtension _interfaceForExtensionCapability:](self, "_interfaceForExtensionCapability:", CFSTR("MEContentBlocker"));
}

- (MEContentBlocker_Private)synchronousContentBlockerInterface
{
  void *v5;

  if (pthread_main_np())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MERemoteExtension.m"), 441, CFSTR("Current thread is main"));

  }
  return (MEContentBlocker_Private *)-[MERemoteExtension _synchronousInterfaceForExtensionCapability:](self, "_synchronousInterfaceForExtensionCapability:", CFSTR("MEContentBlocker"));
}

- (void)getMailSignatureVerificationExtensionViewControllerForMessageSigners:(id)a3 completionHandler:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a4;
  -[MERemoteExtension capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("MEMessageSecurityHandler"));

  if ((v6 & 1) == 0)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)getDecodedMailViewControllerForMessageContext:(id)a3 completionHandler:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a4;
  -[MERemoteExtension capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("MEMessageSecurityHandler"));

  if ((v6 & 1) == 0)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)primaryActionClickedForMessageContext:(id)a3 completionHandler:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a4;
  -[MERemoteExtension capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("MEMessageSecurityHandler"));

  if ((v6 & 1) == 0)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (id)_interfaceForExtensionCapability:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MERemoteExtension capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[MERemoteExtension _remoteExtensionProxyFuture](self, "_remoteExtensionProxyFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resultWithTimeout:error:", 0, 5.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_synchronousInterfaceForExtensionCapability:(id)a3
{
  -[MERemoteExtension _getInterfaceForExtensionCapability:error:](self, "_getInterfaceForExtensionCapability:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_getInterfaceForExtensionCapability:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[MERemoteExtension capabilities](self, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    -[MERemoteExtension _loadRemoteExtesionProxyFuture](self, "_loadRemoteExtesionProxyFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v21 = 0;
      v10 = (id *)&v21;
      objc_msgSend(v9, "resultIfAvailable:", &v21);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
      v10 = (id *)&v20;
      objc_msgSend(v9, "resultWithTimeout:error:", &v20, 10.0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    v13 = *v10;
    v14 = v13;
    if (!v13)
      goto LABEL_17;
    if (a4)
      *a4 = objc_retainAutorelease(v13);

    objc_msgSend(v14, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE2E5E0]))
    {
      v16 = objc_msgSend(v14, "code") == 1000000;

      if (v16)
      {
        +[MERemoteExtension log](MERemoteExtension, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[MERemoteExtension _getInterfaceForExtensionCapability:error:].cold.1(v17);
LABEL_16:

        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    +[MERemoteExtension log](MERemoteExtension, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "ef_publicDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MERemoteExtension _getInterfaceForExtensionCapability:error:].cold.2(v18, buf, v17);
    }
    goto LABEL_16;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (NSString)dataAccessReason
{
  os_unfair_lock_s *p_accessLevelLock;
  NSString *dataAccessReason;
  NSString *v5;

  p_accessLevelLock = &self->_accessLevelLock;
  os_unfair_lock_lock(&self->_accessLevelLock);
  dataAccessReason = self->_dataAccessReason;
  if (!dataAccessReason)
  {
    -[MERemoteExtension _nts_loadDataAccessReason](self, "_nts_loadDataAccessReason");
    dataAccessReason = self->_dataAccessReason;
  }
  v5 = dataAccessReason;
  os_unfair_lock_unlock(p_accessLevelLock);
  return v5;
}

- (BOOL)bodyAccess
{
  os_unfair_lock_s *p_accessLevelLock;
  unint64_t bodyAccess;
  BOOL v5;

  p_accessLevelLock = &self->_accessLevelLock;
  os_unfair_lock_lock(&self->_accessLevelLock);
  bodyAccess = self->_bodyAccess;
  if (!bodyAccess)
  {
    -[MERemoteExtension _nts_loadBodyAccess](self, "_nts_loadBodyAccess");
    bodyAccess = self->_bodyAccess;
  }
  v5 = bodyAccess == 2;
  os_unfair_lock_unlock(p_accessLevelLock);
  return v5;
}

- (void)_nts_loadDataAccessReason
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[MERemoteExtension extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MailDataAccessRequirements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AccessReason"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&self->_dataAccessReason, v4);

  }
  if (!self->_dataAccessReason)
  {
    self->_dataAccessReason = (NSString *)&stru_24C4D2DE8;

  }
}

- (void)_nts_loadBodyAccess
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  id v8;

  -[MERemoteExtension extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MailDataAccessRequirements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Body"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend(v4, "integerValue");
      v7 = 1;
      if (v6 >= 1)
        v7 = 2;
      self->_bodyAccess = v7;
    }

  }
  if (!self->_bodyAccess)
    self->_bodyAccess = 1;

}

- (BOOL)hasMessageContentAccess
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[MERemoteExtension capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF20];
  +[MERemoteExtension allCapabilitiesRequiringMessageContentAccess](MERemoteExtension, "allCapabilitiesRequiringMessageContentAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v4, "intersectsSet:", v7);
  return (char)v6;
}

- (BOOL)isEqual:(id)a3
{
  MERemoteExtension *v4;
  MERemoteExtension *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MERemoteExtension *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MERemoteExtension extensionID](self, "extensionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MERemoteExtension extensionID](v5, "extensionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MERemoteExtension extensionID](self, "extensionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MERemoteExtension capabilities](self, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[MERemoteExtension extensionID](self, "extensionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MERemoteExtension displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MERemoteExtension displayVersion](self, "displayVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - %@ - %@ - %@"), v8, v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)setExtensionID:(id)a3
{
  objc_storeStrong((id *)&self->_extensionID, a3);
}

- (UIImage)messageSecurityDecoderIcon
{
  return self->_messageSecurityDecoderIcon;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (OS_dispatch_queue)extensionLoadingQueue
{
  return self->_extensionLoadingQueue;
}

- (void)setExtensionLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_extensionLoadingQueue, a3);
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
  objc_storeStrong((id *)&self->_containerPath, a3);
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_containerID, a3);
}

- (BOOL)entitlementVerified
{
  return self->_entitlementVerified;
}

- (void)setEntitlementVerified:(BOOL)a3
{
  self->_entitlementVerified = a3;
}

- (EFPromise)remoteExtensionProxyPromise
{
  return self->_remoteExtensionProxyPromise;
}

- (void)setRemoteExtensionProxyPromise:(id)a3
{
  objc_storeStrong((id *)&self->_remoteExtensionProxyPromise, a3);
}

- (MERemoteExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (NSUUID)contextUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (NSDictionary)headerAccessLevels
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (MEMessageSecurityHandler)synchronousMessageSecurityInterface
{
  return self->_synchronousMessageSecurityInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousMessageSecurityInterface, 0);
  objc_storeStrong((id *)&self->_headerAccessLevels, 0);
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_remoteExtensionProxyPromise, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_extensionLoadingQueue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_messageSecurityDecoderIcon, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_dataAccessReason, 0);
}

void __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_85_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20BB85000, log, OS_LOG_TYPE_ERROR, "XPC Error %@ fetching remote extension proxy %@", (uint8_t *)&v4, 0x16u);
}

- (void)_getInterfaceForExtensionCapability:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20BB85000, log, OS_LOG_TYPE_FAULT, "The remote extension proxy is not available.", v1, 2u);
}

- (void)_getInterfaceForExtensionCapability:(os_log_t)log error:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20BB85000, log, OS_LOG_TYPE_ERROR, "Loading remote extension proxy returned error %{public}@", buf, 0xCu);

}

@end
