@implementation ASCDefaults

+ (ASCDefaults)daemonDefaults
{
  if (daemonDefaults_onceToken != -1)
    dispatch_once(&daemonDefaults_onceToken, &__block_literal_global_6);
  return (ASCDefaults *)(id)daemonDefaults_daemonDefaults;
}

void __29__ASCDefaults_daemonDefaults__block_invoke()
{
  ASCDefaults *v0;
  void *v1;

  v0 = -[ASCDefaults initWithBundleID:]([ASCDefaults alloc], "initWithBundleID:", CFSTR("com.apple.AppStoreComponents"));
  v1 = (void *)daemonDefaults_daemonDefaults;
  daemonDefaults_daemonDefaults = (uint64_t)v0;

}

- (ASCDefaults)initWithBundleID:(id)a3
{
  id v4;
  ASCDefaults *v5;
  uint64_t v6;
  NSString *bundleID;
  NSCache *v8;
  NSCache *cachedValues;
  uint64_t v10;
  NSUserDefaults *userDefaults;
  uint64_t i;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASCDefaults;
  v5 = -[ASCDefaults init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v5->_bundleID);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v10;

    for (i = 0; i != 11; ++i)
      -[NSUserDefaults addObserver:forKeyPath:options:context:](v5->_userDefaults, "addObserver:forKeyPath:options:context:", v5, ASCDefaultsKeys[i], 1, ASCDefaultsKVOContext);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 0; i != 11; ++i)
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_userDefaults, "removeObserver:forKeyPath:context:", self, ASCDefaultsKeys[i], ASCDefaultsKVOContext);
  v4.receiver = self;
  v4.super_class = (Class)ASCDefaults;
  -[ASCDefaults dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  ASCCacheValue *v13;
  void *v14;
  id v15;
  objc_super v16;

  if ((void *)ASCDefaultsKVOContext == a6)
  {
    v11 = *MEMORY[0x1E0CB2CB8];
    v12 = a3;
    objc_msgSend(a5, "objectForKeyedSubscript:", v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v13 = -[ASCCacheValue initWithValue:]([ASCCacheValue alloc], "initWithValue:", v15);
    -[ASCDefaults cachedValues](self, "cachedValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, v12);

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)ASCDefaults;
    v10 = a3;
    -[ASCDefaults observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);

  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;

  v6 = (__CFString *)a4;
  v7 = a3;
  -[ASCDefaults bundleID](self, "bundleID");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v6, v7, v8);

}

- (id)objectForKey:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  ASCCacheValue *v9;
  void *v10;

  v4 = (__CFString *)a3;
  -[ASCDefaults cachedValues](self, "cachedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ASCDefaults bundleID](self, "bundleID");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)CFPreferencesCopyAppValue(v4, v8);

    v9 = -[ASCCacheValue initWithValue:]([ASCCacheValue alloc], "initWithValue:", v7);
    -[ASCDefaults cachedValues](self, "cachedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v4);

  }
  return v7;
}

- (NSString)storefrontLocaleID
{
  void *v3;
  void *v4;
  NSString *v5;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCLocaleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (void)setStorefrontLocaleID:(id)a3
{
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ASCLocaleID"));
}

- (BOOL)forceRightToLeftLayout
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCForceRightToLeftLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setForceRightToLeftLayout:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("ASCForceRightToLeftLayout"));

}

- (BOOL)disableShutdownTimer
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCDisableShutdownTimer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setDisableShutdownTimer:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("ASCDisableShutdownTimer"));

}

- (NSNumber)overlaysRateLimitRequestsPerSecond
{
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCPreferenceKeyOverlaysRateLimitRequestsPerSecond"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (void)setOverlaysRateLimitRequestsPerSecond:(id)a3
{
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ASCPreferenceKeyOverlaysRateLimitRequestsPerSecond"));
}

- (NSNumber)overlaysRateLimitTimeWindow
{
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCPreferenceKeyOverlaysRateLimitTimeWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (void)setOverlaysRateLimitTimeWindow:(id)a3
{
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ASCPreferenceKeyOverlaysRateLimitTimeWindow"));
}

- (NSNumber)overlaysLoadTimeout
{
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCPreferenceKeyOverlaysLoadTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (void)setOverlaysLoadTimeout:(id)a3
{
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ASCPreferenceKeyOverlaysLoadTimeout"));
}

- (BOOL)enableWebInspector
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCEnableWebInspector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setEnableWebInspector:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("ASCEnableWebInspector"));

}

- (BOOL)forceStandaloneWatch
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCForceStandaloneWatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setForceStandaloneWatch:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("ASCForceStandaloneWatch"));

}

- (NSString)debugPackageURL
{
  void *v3;
  void *v4;
  NSString *v5;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCDebugJavaScriptPackageURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (void)setDebugPackageURL:(id)a3
{
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ASCDebugJavaScriptPackageURL"));
}

- (BOOL)preferInternalJS
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCPreferInternalJS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setPreferInternalJS:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("ASCPreferInternalJS"));

}

- (NSString)jsVersion
{
  void *v3;
  void *v4;
  NSString *v5;

  objc_opt_class();
  -[ASCDefaults objectForKey:](self, "objectForKey:", CFSTR("ASCJavaScriptVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (void)setJsVersion:(id)a3
{
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("ASCJavaScriptVersion"));
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCDefaults bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCDefaults bundleID](self, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqual:", v9);
    else
      v11 = v8 == (void *)v9;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCDefaults bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("bundleID"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSCache)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
