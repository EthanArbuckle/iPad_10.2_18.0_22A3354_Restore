@implementation ISDefaults

- (NSURL)cacheURL
{
  NSURL *cacheURL;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSURL *v9;
  NSURL *v10;
  uint64_t v12;

  cacheURL = self->__cacheURL;
  if (!cacheURL)
  {
    v12 = 1;
    v4 = container_system_group_path_for_identifier();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      free(v5);
    }
    else
    {
      _ISDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ISDefaults cacheURL].cold.1(&v12, v8);

      v7 = 0;
    }
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.IconsCache"), 1);
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v10 = self->__cacheURL;
    self->__cacheURL = v9;

    cacheURL = self->__cacheURL;
  }
  return cacheURL;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_17);
  return (id)sharedInstance_sharedInstance_2;
}

void __28__ISDefaults_sharedInstance__block_invoke()
{
  ISDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(ISDefaults);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (ISDefaults)init
{
  ISDefaults *v2;
  uint64_t v3;
  NSString *serviceName;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *cacheSaltString;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ISDefaults;
  v2 = -[ISDefaults init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "com.apple.iconservices", 4);
    v3 = objc_claimAutoreleasedReturnValue();
    serviceName = v2->_serviceName;
    v2->_serviceName = (NSString *)v3;

    v5 = (__CFString *)MGCopyAnswer();
    v6 = (__CFString *)MGCopyAnswer();
    v7 = &stru_1E5801B98;
    if (v5)
      v8 = v5;
    else
      v8 = &stru_1E5801B98;
    if (v6)
      v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%@%@"), "18:31:16", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();

    cacheSaltString = v2->_cacheSaltString;
    v2->_cacheSaltString = (NSString *)v11;

  }
  return v2;
}

- (BOOL)usePerstentCache
{
  os_unfair_lock_s *p_lock;
  char *v4;
  NSNumber *v5;
  NSNumber *usePerstentCache;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->__usePerstentCache)
  {
    v4 = getenv("IS_USE_PERSISTENT_CACHE");
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", atoi(v4) > 0);
      v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (NSNumber *)MEMORY[0x1E0C9AAB0];
    }
    usePerstentCache = self->__usePerstentCache;
    self->__usePerstentCache = v5;

  }
  os_unfair_lock_unlock(p_lock);
  return -[NSNumber BOOLValue](self->__usePerstentCache, "BOOLValue");
}

- (BOOL)defaultToTemplatizedAppIcons
{
  return 1;
}

- (BOOL)allowDocumentClaimIcons
{
  return 0;
}

- (BOOL)preferSymbolAsTemplateVariant
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableAppIconOverides
{
  return (_os_feature_enabled_impl() & 1) != 0 || self->__enableAppIconOverrides;
}

- (double)prepareImageDelay
{
  int v2;
  double result;

  v2 = pthread_main_np();
  result = 0.0;
  if (v2 == 1)
  {
    if (prepareImageDelay_onceToken != -1)
      dispatch_once(&prepareImageDelay_onceToken, &__block_literal_global_23);
    return *(double *)&prepareImageDelay_delay;
  }
  return result;
}

void __31__ISDefaults_prepareImageDelay__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleForKey:", CFSTR("IconServicesMainThreadPrepareDelay"));
  prepareImageDelay_delay = v0;

}

- (BOOL)logMissingURLCacheProperties
{
  return 0;
}

- (BOOL)isDebugGraphicIconColourEnabled
{
  if (isDebugGraphicIconColourEnabled_once != -1)
    dispatch_once(&isDebugGraphicIconColourEnabled_once, &__block_literal_global_27);
  return isDebugGraphicIconColourEnabled_result;
}

void __45__ISDefaults_isDebugGraphicIconColourEnabled__block_invoke()
{
  void *v0;
  int v1;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ISDebugGraphicIcons"));

    if (v1)
      isDebugGraphicIconColourEnabled_result = 1;
  }
}

- (id)debugGraphicIconColor
{
  if (debugGraphicIconColor_once != -1)
    dispatch_once(&debugGraphicIconColor_once, &__block_literal_global_30_0);
  return (id)debugGraphicIconColor_color;
}

void __35__ISDefaults_debugGraphicIconColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 84.0, 92.0, 0.0, 255.0);
  v1 = (void *)debugGraphicIconColor_color;
  debugGraphicIconColor_color = v0;

}

- (id)debugPreDefinedGraphicIconColor
{
  if (debugPreDefinedGraphicIconColor_once != -1)
    dispatch_once(&debugPreDefinedGraphicIconColor_once, &__block_literal_global_32);
  return (id)debugPreDefinedGraphicIconColor_color;
}

void __45__ISDefaults_debugPreDefinedGraphicIconColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 84.0, 0.0, 42.0, 255.0);
  v1 = (void *)debugPreDefinedGraphicIconColor_color;
  debugPreDefinedGraphicIconColor_color = v0;

}

- (id)debugISIconGraphicIconColor
{
  if (debugISIconGraphicIconColor_once != -1)
    dispatch_once(&debugISIconGraphicIconColor_once, &__block_literal_global_33);
  return (id)debugISIconGraphicIconColor_color;
}

void __41__ISDefaults_debugISIconGraphicIconColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.33, 1.0, 16.0, 1.0);
  v1 = (void *)debugISIconGraphicIconColor_color;
  debugISIconGraphicIconColor_color = v0;

}

- (BOOL)enableInstanceIDBasedTwoAppModel
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableBadgeOverhang
{
  return _os_feature_enabled_impl();
}

- (BOOL)simulateTintableAppearance
{
  return _os_feature_enabled_impl();
}

- (id)tintColor
{
  if (tintColor_once != -1)
    dispatch_once(&tintColor_once, &__block_literal_global_38);
  return (id)tintColor_ifcolor;
}

void __23__ISDefaults_tintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "stringForKey:", CFSTR("ISTintColor"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {
      _ISColorForString(v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&tintColor_ifcolor, v2);
      }
      else if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v3 = (int)objc_msgSend(v2, "intValue");
        v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", v3);
        v5 = (void *)tintColor_ifcolor;
        tintColor_ifcolor = v4;

      }
      else
      {
        _ISDefaultLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          __23__ISDefaults_tintColor__block_invoke_cold_1((uint64_t)v2, v6);

      }
    }

  }
}

- (int64_t)forceApperance
{
  if (forceApperance_once != -1)
    dispatch_once(&forceApperance_once, &__block_literal_global_41);
  return forceApperance_appearance;
}

void __28__ISDefaults_forceApperance__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "stringForKey:", CFSTR("ISForceApperance"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

    v1 = v3;
    if (v3)
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("dark")))
        v2 = 2 * (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("tintable")) == 0);
      else
        v2 = 1;
      forceApperance_appearance = v2;
      v1 = v3;
    }

  }
}

- (BOOL)disableLegacyIconSegmentation
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconSegmentationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconColorEnhancementEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconDimmingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconDimmingForDedicatedAssetsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isFlagDimmedDedicatedAssetsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isUnsupportedDecorationDisabled
{
  if (isUnsupportedDecorationDisabled_once != -1)
    dispatch_once(&isUnsupportedDecorationDisabled_once, &__block_literal_global_54);
  return isUnsupportedDecorationDisabled_result;
}

void __45__ISDefaults_isUnsupportedDecorationDisabled__block_invoke()
{
  void *v0;
  int v1;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ISDisableUnsupportedDecoration"));

    if (v1)
      isUnsupportedDecorationDisabled_result = 1;
  }
}

- (NSString)cacheSaltString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)_usePerstentCache
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_usePerstentCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)_enableAppIconOverrides
{
  return self->__enableAppIconOverrides;
}

- (BOOL)_enable1016Icons
{
  return self->__enable1016Icons;
}

- (BOOL)_ignoreDocumentClaimIcons
{
  return self->__ignoreDocumentClaimIcons;
}

- (NSURL)_cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_cacheURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cacheURL, 0);
  objc_storeStrong((id *)&self->__usePerstentCache, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_cacheSaltString, 0);
}

- (void)cacheURL
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_fault_impl(&dword_1AA928000, a2, OS_LOG_TYPE_FAULT, "Failed to get cache path with error: %llu.", (uint8_t *)&v3, 0xCu);
}

void __23__ISDefaults_tintColor__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "Unexpected color %@", (uint8_t *)&v2, 0xCu);
}

@end
