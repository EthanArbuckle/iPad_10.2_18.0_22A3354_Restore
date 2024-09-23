@implementation DMCApplicationProxy

- (DMCApplicationProxy)initWithBundleID:(id)a3 dataSource:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  DMCApplicationProxy *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v12 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, &v12);
  v8 = v12;
  if (v8)
  {
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to create LSApplicationRecord for bundleID %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
  v10 = -[DMCApplicationProxy initWithLSApplicationRecord:dataSource:](self, "initWithLSApplicationRecord:dataSource:", v7, a4);

  return v10;
}

- (DMCApplicationProxy)initWithLSApplicationRecord:(id)a3 dataSource:(unint64_t)a4
{
  void *v6;
  DMCApplicationProxy *v7;

  objc_msgSend(a3, "compatibilityObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMCApplicationProxy initWithLSApplicationProxy:dataSource:](self, "initWithLSApplicationProxy:dataSource:", v6, a4);

  return v7;
}

- (DMCApplicationProxy)initWithLSApplicationProxy:(id)a3 dataSource:(unint64_t)a4
{
  id v7;
  DMCApplicationProxy *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *bundleID;
  void *v13;
  uint64_t v14;
  NSString *bundlePath;
  uint64_t v16;
  NSString *signerID;
  uint64_t v18;
  NSString *appIDEntitlement;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSString *cachedManagedAppConfigurationInfo;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DMCApplicationProxy;
  v8 = -[DMCApplicationProxy init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "localizedName");
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend(v7, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v11;

    objc_msgSend(v7, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = objc_claimAutoreleasedReturnValue();
    bundlePath = v8->_bundlePath;
    v8->_bundlePath = (NSString *)v14;

    objc_msgSend(v7, "signerIdentity");
    v16 = objc_claimAutoreleasedReturnValue();
    signerID = v8->_signerID;
    v8->_signerID = (NSString *)v16;

    objc_msgSend(v7, "entitlementValueForKey:ofClass:", CFSTR("application-identifier"), objc_opt_class());
    v18 = objc_claimAutoreleasedReturnValue();
    appIDEntitlement = v8->_appIDEntitlement;
    v8->_appIDEntitlement = (NSString *)v18;

    objc_msgSend(v7, "appState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isInstalled = objc_msgSend(v20, "isInstalled");

    v8->_isBetaApp = objc_msgSend(v7, "isBetaApp");
    objc_msgSend(v7, "applicationType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isUserApp = objc_msgSend(v21, "isEqualToString:", CFSTR("User"));

    objc_storeStrong((id *)&v8->_lsApp, a3);
    if (!v8->_bundleID)
    {
      v22 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v7;
        _os_log_impl(&dword_216358000, v22, OS_LOG_TYPE_ERROR, "DMCApplicationProxy encountered an LSApplicationProxy with no bundle ID: %{public}@", buf, 0xCu);
      }
    }
    v8->_dataSource = a4;
    if (a4 == 1)
    {
      -[DMCApplicationProxy managedAppConfigurationInfo](v8, "managedAppConfigurationInfo");
      v23 = objc_claimAutoreleasedReturnValue();
      cachedManagedAppConfigurationInfo = v8->_cachedManagedAppConfigurationInfo;
      v8->_cachedManagedAppConfigurationInfo = (NSString *)v23;

    }
  }

  return v8;
}

+ (id)_allApplications
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  DMCApplicationProxy *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = -[DMCApplicationProxy initWithLSApplicationRecord:dataSource:]([DMCApplicationProxy alloc], "initWithLSApplicationRecord:dataSource:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), 0);
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

+ (id)_bundlePathsForApplications:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "bundlePath", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)blockedApplications
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_allApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(a1, "_bundlePathsForApplications:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v6 = objc_msgSend(v4, "getAreBundlesBlocked:bundlePaths:outError:", &v26, v5, &v25);
  v7 = v26;
  v8 = v25;

  if ((v6 & 1) != 0)
  {
    v20 = v8;
    v9 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "bundlePath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBlockedInfo:", v17);

          if (objc_msgSend(v15, "isBlocked"))
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v12);
    }

    v8 = v20;
  }
  else
  {
    v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_216358000, v18, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to check profiled if bundle paths are blocked by MIS with error: %{public}@", buf, 0xCu);
    }
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

+ (id)userApplications
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_allApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __39__DMCApplicationProxy_userApplications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isUserApp");
}

- (id)iconForVariant:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  CGImage *v12;

  if (-[DMCApplicationProxy dataSource](self, "dataSource") != 1)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

    if (v8 < 1.0)
    {
LABEL_7:
      v10 = 0;
    }
    else
    {
      while (1)
      {
        -[DMCApplicationProxy _lsIconDataForVariant:scale:](self, "_lsIconDataForVariant:scale:", a3, v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9 || v8 <= 1.0)
          break;
        v8 = v8 + -1.0;
        if (v8 < 1.0)
          goto LABEL_7;
      }
      if (v9)
      {
        v12 = (CGImage *)LICreateIconFromCachedBitmap();
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v12, 0, v8);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = 0;
        }
        CGImageRelease(v12);
        goto LABEL_9;
      }
    }
    v5 = 0;
LABEL_9:

    return v5;
  }
  -[DMCApplicationProxy _bridgeIconForVariant:](self, "_bridgeIconForVariant:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)_lsIconDataForVariant:(unint64_t)a3 scale:(double)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (a4 == 3.0)
  {
    v9 = a3 == 0;
    v10 = 32;
    v11 = 34;
  }
  else if (a4 == 2.0)
  {
    if (v8 == 1)
      v10 = 24;
    else
      v10 = 15;
    v9 = a3 == 0;
    v11 = 17;
  }
  else
  {
    if (a4 != 1.0)
    {
      v14 = 0;
      return v14;
    }
    v10 = v8 == 1;
    v9 = a3 == 0;
    v11 = 4;
  }
  if (v9)
    v12 = v11;
  else
    v12 = v10;
  -[DMCApplicationProxy lsApp](self, "lsApp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconDataForVariant:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)bookIconForVariant:(unint64_t)a3
{
  DMCApplicationProxy *v4;
  void *v5;

  v4 = -[DMCApplicationProxy initWithBundleID:dataSource:]([DMCApplicationProxy alloc], "initWithBundleID:dataSource:", CFSTR("com.apple.iBooks"), 0);
  -[DMCApplicationProxy iconForVariant:](v4, "iconForVariant:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_bridgeIconForVariant:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  if (a3)
    v9 = 42;
  else
    v9 = 48;
  if (a3)
    v10 = 42;
  else
    v10 = 47;
  if (v8 <= 2.0)
    v11 = v10;
  else
    v11 = v9;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BE6B520], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCApplicationProxy bundleID](self, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getCachedIconForBundleID:iconVariant:outIconImage:updateBlock:", v13, v11, &v19, 0);

  if (v19)
  {
    -[DMCApplicationProxy _circularImageFromImage:variant:](self, "_circularImageFromImage:variant:", v19, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DMCApplicationProxy bundleID](self, "bundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getIconForBundleID:iconVariant:queue:block:timeout:", v15, v11, v16, &__block_literal_global_16, 10.0);

    PSBlankIconImage();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCApplicationProxy _circularImageFromImage:variant:](self, "_circularImageFromImage:variant:", v17, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

void __45__DMCApplicationProxy__bridgeIconForVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("kMCUIBridgeIconLoadedNotification"), 0, 0);

  }
}

- (id)_circularImageFromImage:(id)a3 variant:(int)a4
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;

  v5 = a3;
  if (a4 == 42)
    v6 = 57.0;
  else
    v6 = 29.0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", v6, v6);
  v8 = (void *)MEMORY[0x24BDF6AC8];
  v9 = objc_retainAutorelease(v5);
  v10 = objc_msgSend(v9, "CGImage");
  objc_msgSend(v9, "scale");
  objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __55__DMCApplicationProxy__circularImageFromImage_variant___block_invoke;
  v20[3] = &unk_24D52E378;
  v22 = v6;
  v23 = v6;
  v12 = v11;
  v21 = v12;
  objc_msgSend(v7, "imageWithActions:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v15 = *(NSObject **)DMCLogObjects();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    v13 = v9;
    if (v16)
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_216358000, v15, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to create circular Bridge app icon", v19, 2u);
      v13 = v9;
    }
  }
  v17 = v13;

  return v17;
}

void __55__DMCApplicationProxy__circularImageFromImage_variant___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", *MEMORY[0x24BDBEFB0], v5, v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(v3, (CGPathRef)objc_msgSend(v8, "CGPath"));
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v4, v5, v6, v7);

}

- (void)setBlockedInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSData *misCDHash;
  NSNumber *misHashType;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE63E38]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_isBlocked = objc_msgSend(v6, "BOOLValue");
      }
      else
      {
        v9 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v14 = 138543362;
          v15 = v6;
          _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to parse blocked app isBlockedInfo as NSNumber: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE63E28]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&self->_misCDHash, v10);
      }
      else
      {
        v11 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v14 = 138543362;
          v15 = v10;
          _os_log_impl(&dword_216358000, v11, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to parse blocked app hash info as NSData: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE63E30]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&self->_misHashType, v12);
      }
      else
      {
        v13 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = 138543362;
          v15 = v12;
          _os_log_impl(&dword_216358000, v13, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to parse blocked app hash type as NSNumber: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
    }

  }
  else
  {
    self->_isBlocked = 0;
    misCDHash = self->_misCDHash;
    self->_misCDHash = 0;

    misHashType = self->_misHashType;
    self->_misHashType = 0;

  }
}

- (BOOL)checkIsBlocked
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[DMCApplicationProxy bundlePath](self, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCApplicationProxy bundlePath](self, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = 0;
  v17 = 0;
  v6 = objc_msgSend(v4, "getIsBundleBlocked:bundlePath:outHash:outHashType:outError:", &v20, v5, &v19, &v18, &v17);
  v7 = v19;
  v8 = v19;
  v9 = v18;
  v10 = v18;
  v11 = v17;

  if (v6)
  {
    self->_isBlocked = v20;
    objc_storeStrong((id *)&self->_misCDHash, v7);
    objc_storeStrong((id *)&self->_misHashType, v9);
  }
  else
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      -[DMCApplicationProxy bundlePath](self, "bundlePath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_216358000, v14, OS_LOG_TYPE_ERROR, "DMCApplicationProxy failed to check profiled if bundle path '%{public}@' is blocked by MIS with error: %{public}@", buf, 0x16u);

    }
  }
  v12 = v20;

  return v12;
}

- (unint64_t)misStateIncludingPending:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[DMCApplicationProxy bundlePath](self, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DMCApplicationProxy bundlePath](self, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3, *MEMORY[0x24BEDC870]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v8 = MISAppApprovalState();

    if (v8 > 5)
      return 4;
    else
      return qword_21639B630[v8];
  }
  else
  {
    v10 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      -[DMCApplicationProxy bundleID](self, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_216358000, v11, OS_LOG_TYPE_ERROR, "DMCApplicationProxy MIS validator failed to find bundle for app: %{public}@", buf, 0xCu);

    }
    return 0;
  }
}

- (id)misStateString
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[DMCApplicationProxy misStateIncludingPending:](self, "misStateIncludingPending:", 0) - 2;
  if (v2 > 3)
    v3 = CFSTR("DMC_MIS_NOT_VERIFIED_APP");
  else
    v3 = off_24D52E398[v2];
  DMCEnrollmentLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)managedAppConfigurationInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  -[DMCApplicationProxy cachedManagedAppConfigurationInfo](self, "cachedManagedAppConfigurationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DMCApplicationProxy cachedManagedAppConfigurationInfo](self, "cachedManagedAppConfigurationInfo");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_40:
    v23 = (void *)v4;
    return v23;
  }
  if (!-[DMCApplicationProxy _hasManagedRestrictions](self, "_hasManagedRestrictions"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_HAS_NO_RESTRICTIONS"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  v5 = (void *)objc_opt_new();
  if (-[DMCApplicationProxy _isUninstalledOnMDMRemoval](self, "_isUninstalledOnMDMRemoval"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_WILL_BE_REMOVED"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if (-[DMCApplicationProxy _isExcludedFromBackup](self, "_isExcludedFromBackup"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_BACKUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if (-[DMCApplicationProxy _isUnableToExportToUnmanaged](self, "_isUnableToExportToUnmanaged"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_EXPORT_DATA_TO_UNMANAGED"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  if (-[DMCApplicationProxy _isUnableToImportFromUnmanaged](self, "_isUnableToImportFromUnmanaged"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_IMPORT_UNMANAGED_DATA"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  if (-[DMCApplicationProxy _isExcludedFromCloudSync](self, "_isExcludedFromCloudSync"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_CLOUD_SYNC"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  if (-[DMCApplicationProxy _isUnableToUseCellData](self, "_isUnableToUseCellData"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_USE_CELL_DATA"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  if (-[DMCApplicationProxy _isUnableToUseRoamingCellData](self, "_isUnableToUseRoamingCellData"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_USE_ROAMING_CELL_DATA"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  if (-[DMCApplicationProxy _hasAppVPN](self, "_hasAppVPN"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_USES_VPN"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  if (-[DMCApplicationProxy _hasAppCellularSlice](self, "_hasAppCellularSlice"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_USES_CELLULAR_SLICE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  if (-[DMCApplicationProxy _hasAppContentFilter](self, "_hasAppContentFilter"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_USES_CONTENT_FILTER"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  if (-[DMCApplicationProxy _hasAppDNSProxy](self, "_hasAppDNSProxy"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_USES_DNS_PROXY"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

  }
  if (-[DMCApplicationProxy _hasAppRelay](self, "_hasAppRelay"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_USES_RELAY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

  }
  if (-[DMCApplicationProxy _hasAssociatedDomains](self, "_hasAssociatedDomains"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_ADDS_ASSOCIATED_DOMAINS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  if (-[DMCApplicationProxy _isNotRemovable](self, "_isNotRemovable"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_BE_REMOVED"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  if (-[DMCApplicationProxy _canNotBeHidden](self, "_canNotBeHidden"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_BE_HIDDEN"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

  }
  if (-[DMCApplicationProxy _canNotBeLocked](self, "_canNotBeLocked"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_CANNOT_BE_LOCKED"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

  }
  if (-[DMCApplicationProxy _isTapToPayScreenLock](self, "_isTapToPayScreenLock"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_TAP_TO_SCREEN_LOCK_ENABLED"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)_hasManagedRestrictions
{
  return -[DMCApplicationProxy _isUninstalledOnMDMRemoval](self, "_isUninstalledOnMDMRemoval")
      || -[DMCApplicationProxy _isExcludedFromBackup](self, "_isExcludedFromBackup")
      || -[DMCApplicationProxy _isExcludedFromCloudSync](self, "_isExcludedFromCloudSync")
      || -[DMCApplicationProxy _isUnableToImportFromUnmanaged](self, "_isUnableToImportFromUnmanaged")
      || -[DMCApplicationProxy _isUnableToExportToUnmanaged](self, "_isUnableToExportToUnmanaged")
      || -[DMCApplicationProxy _isUnableToUseCellData](self, "_isUnableToUseCellData")
      || -[DMCApplicationProxy _isUnableToUseRoamingCellData](self, "_isUnableToUseRoamingCellData")
      || -[DMCApplicationProxy _hasAppVPN](self, "_hasAppVPN")
      || -[DMCApplicationProxy _hasAppCellularSlice](self, "_hasAppCellularSlice")
      || -[DMCApplicationProxy _hasAppContentFilter](self, "_hasAppContentFilter")
      || -[DMCApplicationProxy _hasAppDNSProxy](self, "_hasAppDNSProxy")
      || -[DMCApplicationProxy _hasAppRelay](self, "_hasAppRelay")
      || -[DMCApplicationProxy _hasAssociatedDomains](self, "_hasAssociatedDomains")
      || -[DMCApplicationProxy _isNotRemovable](self, "_isNotRemovable")
      || -[DMCApplicationProxy _isTapToPayScreenLock](self, "_isTapToPayScreenLock")
      || -[DMCApplicationProxy _canNotBeHidden](self, "_canNotBeHidden")
      || -[DMCApplicationProxy _canNotBeLocked](self, "_canNotBeLocked");
}

- (BOOL)_isUninstalledOnMDMRemoval
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BE60DA0], "managedAppIDsWithFlags:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCApplicationProxy bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (BOOL)_isExcludedFromBackup
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doNotBackupAppIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCApplicationProxy bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);

  return (char)v3;
}

- (BOOL)_isExcludedFromCloudSync
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE639C8]) == 2;

  return v3;
}

- (BOOL)_isUnableToImportFromUnmanaged
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63A30]) == 2;

  return v3;
}

- (BOOL)_isUnableToExportToUnmanaged
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63A28]) == 2;

  return v3;
}

- (BOOL)_isUnableToUseCellData
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (id)objc_msgSend(MEMORY[0x24BDE2700], "copyAggregatePathRules");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "matchSigningIdentifier", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCApplicationProxy bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v12 = objc_msgSend(v8, "supportsCellularBehavior:", 0) ^ 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  LOBYTE(v12) = 0;
LABEL_11:

  return v12;
}

- (BOOL)_isUnableToUseRoamingCellData
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (id)objc_msgSend(MEMORY[0x24BDE2700], "copyAggregatePathRules");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
      objc_msgSend(v8, "matchSigningIdentifier", (_QWORD)v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCApplicationProxy bundleID](self, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (v11)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    if (objc_msgSend(v8, "supportsCellularBehavior:", 0)
      && !objc_msgSend(v8, "supportsCellularBehavior:", 2))
    {
      v12 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)_managedAppAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE60DA0], "attributesByAppID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCApplicationProxy bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_hasAppVPN
{
  void *v2;
  char isKindOfClass;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60FD0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppCellularSlice
{
  void *v2;
  char isKindOfClass;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60FA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppContentFilter
{
  void *v2;
  char isKindOfClass;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60FA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppDNSProxy
{
  void *v2;
  char isKindOfClass;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60FB0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAppRelay
{
  void *v2;
  char isKindOfClass;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60FB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasAssociatedDomains
{
  void *v2;
  BOOL v3;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60F90]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_isNotRemovable
{
  void *v2;
  int v3;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60FC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (BOOL)_isTapToPayScreenLock
{
  void *v2;
  char v3;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60FC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_canNotBeHidden
{
  void *v2;
  int v3;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60F80]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (BOOL)_canNotBeLocked
{
  void *v2;
  int v3;

  -[DMCApplicationProxy _managedAppAttribute:](self, "_managedAppAttribute:", *MEMORY[0x24BE60F88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[DMCApplicationProxy name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v4, CFSTR("name"));

  -[DMCApplicationProxy bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  -[DMCApplicationProxy bundlePath](self, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("bundlePath"));

  -[DMCApplicationProxy signerID](self, "signerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("signerID"));

  -[DMCApplicationProxy appIDEntitlement](self, "appIDEntitlement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("appIDEntitlement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCApplicationProxy isInstalled](self, "isInstalled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("isInstalled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCApplicationProxy isBetaApp](self, "isBetaApp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("isBetaApp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCApplicationProxy isUserApp](self, "isUserApp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("isUserApp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCApplicationProxy isBlocked](self, "isBlocked"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("isBlocked"));

  -[DMCApplicationProxy misCDHash](self, "misCDHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("misCDHash"));

  -[DMCApplicationProxy misHashType](self, "misHashType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("misHashType"));

  -[DMCApplicationProxy cachedManagedAppConfigurationInfo](self, "cachedManagedAppConfigurationInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("cachedManagedAppConfigurationInfo"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DMCApplicationProxy dataSource](self, "dataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("dataSource"));

  if (self->_dataSource != 1)
  {
    -[DMCApplicationProxy lsApp](self, "lsApp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("lsApp"));

  }
}

- (DMCApplicationProxy)initWithCoder:(id)a3
{
  id v4;
  DMCApplicationProxy *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSString *bundleID;
  void *v12;
  uint64_t v13;
  NSString *bundlePath;
  void *v15;
  uint64_t v16;
  NSString *signerID;
  void *v18;
  uint64_t v19;
  NSString *appIDEntitlement;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSData *misCDHash;
  void *v28;
  uint64_t v29;
  NSNumber *misHashType;
  void *v31;
  uint64_t v32;
  NSString *cachedManagedAppConfigurationInfo;
  void *v34;
  void *v35;
  uint64_t v36;
  LSApplicationProxy *lsApp;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)DMCApplicationProxy;
  v5 = -[DMCApplicationProxy init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("bundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("bundlePath"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("signerID"));
    v16 = objc_claimAutoreleasedReturnValue();
    signerID = v5->_signerID;
    v5->_signerID = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("appIDEntitlement"));
    v19 = objc_claimAutoreleasedReturnValue();
    appIDEntitlement = v5->_appIDEntitlement;
    v5->_appIDEntitlement = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInstalled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInstalled = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBetaApp"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isBetaApp = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isUserApp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isUserApp = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBlocked"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isBlocked = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("misCDHash"));
    v26 = objc_claimAutoreleasedReturnValue();
    misCDHash = v5->_misCDHash;
    v5->_misCDHash = (NSData *)v26;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("misHashType"));
    v29 = objc_claimAutoreleasedReturnValue();
    misHashType = v5->_misHashType;
    v5->_misHashType = (NSNumber *)v29;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("cachedManagedAppConfigurationInfo"));
    v32 = objc_claimAutoreleasedReturnValue();
    cachedManagedAppConfigurationInfo = v5->_cachedManagedAppConfigurationInfo;
    v5->_cachedManagedAppConfigurationInfo = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataSource"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataSource = objc_msgSend(v34, "unsignedIntegerValue");

    if (v5->_dataSource != 1)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("lsApp"));
      v36 = objc_claimAutoreleasedReturnValue();
      lsApp = v5->_lsApp;
      v5->_lsApp = (LSApplicationProxy *)v36;

    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)signerID
{
  return self->_signerID;
}

- (NSString)appIDEntitlement
{
  return self->_appIDEntitlement;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (BOOL)isUserApp
{
  return self->_isUserApp;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (NSData)misCDHash
{
  return self->_misCDHash;
}

- (NSNumber)misHashType
{
  return self->_misHashType;
}

- (LSApplicationProxy)lsApp
{
  return self->_lsApp;
}

- (void)setLsApp:(id)a3
{
  objc_storeStrong((id *)&self->_lsApp, a3);
}

- (NSString)cachedManagedAppConfigurationInfo
{
  return self->_cachedManagedAppConfigurationInfo;
}

- (void)setCachedManagedAppConfigurationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedManagedAppConfigurationInfo, a3);
}

- (unint64_t)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(unint64_t)a3
{
  self->_dataSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedManagedAppConfigurationInfo, 0);
  objc_storeStrong((id *)&self->_lsApp, 0);
  objc_storeStrong((id *)&self->_misHashType, 0);
  objc_storeStrong((id *)&self->_misCDHash, 0);
  objc_storeStrong((id *)&self->_appIDEntitlement, 0);
  objc_storeStrong((id *)&self->_signerID, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
