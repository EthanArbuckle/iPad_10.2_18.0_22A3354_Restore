@implementation IFBundle

+ (id)frameworkBundle
{
  if (frameworkBundle_onceToken != -1)
    dispatch_once(&frameworkBundle_onceToken, &__block_literal_global_3);
  return (id)frameworkBundle_frameworkBundle;
}

void __27__IFBundle_frameworkBundle__block_invoke()
{
  IFBundle *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/IconServices.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[IFBundle initWithURL:]([IFBundle alloc], "initWithURL:", v2);
  v1 = (void *)frameworkBundle_frameworkBundle;
  frameworkBundle_frameworkBundle = (uint64_t)v0;

}

+ (id)iconFoundationFrameworkBundle
{
  if (iconFoundationFrameworkBundle_onceToken != -1)
    dispatch_once(&iconFoundationFrameworkBundle_onceToken, &__block_literal_global_5);
  return (id)iconFoundationFrameworkBundle_bundle;
}

void __41__IFBundle_iconFoundationFrameworkBundle__block_invoke()
{
  void *v0;
  IFBundle *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = -[IFBundle initWithURL:]([IFBundle alloc], "initWithURL:", v3);
  v2 = (void *)iconFoundationFrameworkBundle_bundle;
  iconFoundationFrameworkBundle_bundle = (uint64_t)v1;

}

+ (id)mobileIconsFrameworkBundle
{
  if (mobileIconsFrameworkBundle_onceToken != -1)
    dispatch_once(&mobileIconsFrameworkBundle_onceToken, &__block_literal_global_7);
  return (id)mobileIconsFrameworkBundle_frameworkBundle;
}

void __38__IFBundle_mobileIconsFrameworkBundle__block_invoke()
{
  IFBundle *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileIcons.framework"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[IFBundle initWithURL:]([IFBundle alloc], "initWithURL:", v2);
  v1 = (void *)mobileIconsFrameworkBundle_frameworkBundle;
  mobileIconsFrameworkBundle_frameworkBundle = (uint64_t)v0;

}

+ (id)iconsetResourceBundle
{
  if (iconsetResourceBundle_onceToken != -1)
    dispatch_once(&iconsetResourceBundle_onceToken, &__block_literal_global_10);
  return (id)iconsetResourceBundle_resourceBundle;
}

void __33__IFBundle_iconsetResourceBundle__block_invoke()
{
  IFBundle *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/IconsetResources.bundle"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[IFBundle initWithURL:]([IFBundle alloc], "initWithURL:", v2);
  v1 = (void *)iconsetResourceBundle_resourceBundle;
  iconsetResourceBundle_resourceBundle = (uint64_t)v0;

}

+ (id)mainBundle
{
  if (mainBundle_onceToken != -1)
    dispatch_once(&mainBundle_onceToken, &__block_literal_global_13);
  return (id)mainBundle_mainBundle;
}

void __22__IFBundle_mainBundle__block_invoke()
{
  IFBundle *v0;
  void *v1;

  v0 = -[IFBundle initWithCFBundle:]([IFBundle alloc], "initWithCFBundle:", CFBundleGetMainBundle());
  v1 = (void *)mainBundle_mainBundle;
  mainBundle_mainBundle = (uint64_t)v0;

}

+ (id)coreTypesBundle
{
  if (coreTypesBundle_onceToken != -1)
    dispatch_once(&coreTypesBundle_onceToken, &__block_literal_global_14);
  return (id)coreTypesBundle_coreTypesBundle;
}

void __27__IFBundle_coreTypesBundle__block_invoke()
{
  IFBundle *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[IFBundle initWithURL:]([IFBundle alloc], "initWithURL:", v2);
  v1 = (void *)coreTypesBundle_coreTypesBundle;
  coreTypesBundle_coreTypesBundle = (uint64_t)v0;

}

+ (id)coreGlyphsBundle
{
  if (coreGlyphsBundle_onceToken != -1)
    dispatch_once(&coreGlyphsBundle_onceToken, &__block_literal_global_15);
  return (id)coreGlyphsBundle_coreGlyphsBundle;
}

void __28__IFBundle_coreGlyphsBundle__block_invoke()
{
  IFBundle *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [IFBundle alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "coreGlyphsBundleURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[IFBundle initWithURL:](v0, "initWithURL:", v3);
  v2 = (void *)coreGlyphsBundle_coreGlyphsBundle;
  coreGlyphsBundle_coreGlyphsBundle = v1;

}

+ (id)coreGlyphsPrivateBundle
{
  if (coreGlyphsPrivateBundle_onceToken != -1)
    dispatch_once(&coreGlyphsPrivateBundle_onceToken, &__block_literal_global_16);
  return (id)coreGlyphsPrivateBundle_coreGlyphsBundle;
}

void __35__IFBundle_coreGlyphsPrivateBundle__block_invoke()
{
  IFBundle *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [IFBundle alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "coreGlyphsPrivateBundleURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[IFBundle initWithURL:](v0, "initWithURL:", v3);
  v2 = (void *)coreGlyphsPrivateBundle_coreGlyphsBundle;
  coreGlyphsPrivateBundle_coreGlyphsBundle = v1;

}

+ (id)appIconOverrideBundle
{
  if (appIconOverrideBundle_onceToken != -1)
    dispatch_once(&appIconOverrideBundle_onceToken, &__block_literal_global_17);
  return (id)appIconOverrideBundle_bundle;
}

void __33__IFBundle_appIconOverrideBundle__block_invoke()
{
  IFBundle *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/AppleInternal/Library/Bundles/AppIconOverrides.bundle"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[IFBundle initWithURL:]([IFBundle alloc], "initWithURL:", v2);
  v1 = (void *)appIconOverrideBundle_bundle;
  appIconOverrideBundle_bundle = (uint64_t)v0;

}

+ (id)iconsetResourceAssetsCatalogURL
{
  void *v2;
  void *v3;

  +[IFBundle iconsetResourceBundle](IFBundle, "iconsetResourceBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("Assets"), CFSTR("car"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)frameworkLocalizedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IFBundle frameworkBundle](IFBundle, "frameworkBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E97698A0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bundleWithURL:(id)a3
{
  uint64_t Unique;
  const void *v4;
  IFBundle *v5;

  Unique = _CFBundleCreateUnique();
  if (Unique)
  {
    v4 = (const void *)Unique;
    v5 = -[IFBundle initWithCFBundle:]([IFBundle alloc], "initWithCFBundle:", Unique);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (IFBundle)initWithURL:(id)a3
{
  id v4;
  IFBundle *v5;
  IFBundle *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFBundle;
  v5 = -[IFBundle init](&v10, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v5->_bundle = (__CFBundle *)_CFBundleCreateUnique();
    objc_msgSend(v4, "absoluteURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_coreTypes = objc_msgSend(v8, "isEqual:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"));

  }
  return v6;
}

- (IFBundle)initWithCFBundle:(__CFBundle *)a3
{
  IFBundle *v4;
  IFBundle *v5;
  CFURLRef v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IFBundle;
  v4 = -[IFBundle init](&v10, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_bundle = a3;
    v6 = CFBundleCopyBundleURL(a3);
    -[__CFURL absoluteURL](v6, "absoluteURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_coreTypes = objc_msgSend(v8, "isEqual:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"));

  }
  return v5;
}

- (void)dealloc
{
  __CFBundle *bundle;
  objc_super v4;

  bundle = self->_bundle;
  if (bundle)
    CFRelease(bundle);
  v4.receiver = self;
  v4.super_class = (Class)IFBundle;
  -[IFBundle dealloc](&v4, sel_dealloc);
}

- (NSURL)assetCatalogURL
{
  return (NSURL *)-[IFBundle URLForResource:withExtension:](self, "URLForResource:withExtension:", CFSTR("Assets"), CFSTR("car"));
}

- (id)URLForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IFBundle URLForResource:withExtension:subdirectory:](self, "URLForResource:withExtension:subdirectory:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4
{
  return -[IFBundle URLForResource:withExtension:subdirectory:](self, "URLForResource:withExtension:subdirectory:", a3, a4, 0);
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5
{
  __CFBundle *bundle;

  bundle = self->_bundle;
  if (bundle)
    bundle = CFBundleCopyResourceURL(bundle, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5);
  return bundle;
}

- (id)URLsForResources:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[IFBundle URLForResource:](self, "URLForResource:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4
{
  __CFBundle *bundle;

  bundle = self->_bundle;
  if (bundle)
    bundle = CFBundleCopyResourceURLsOfType(bundle, (CFStringRef)a3, (CFStringRef)a4);
  return bundle;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  __CFBundle *bundle;

  bundle = self->_bundle;
  if (bundle)
    bundle = (__CFBundle *)CFBundleCopyLocalizedString(bundle, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5);
  return bundle;
}

- (NSURL)bundleURL
{
  __CFBundle *bundle;
  CFURLRef v3;
  void *v4;

  bundle = self->_bundle;
  if (bundle)
    v3 = CFBundleCopyBundleURL(bundle);
  else
    v3 = 0;
  v4 = (void *)-[__CFURL copy](v3, "copy");

  return (NSURL *)v4;
}

- (NSString)bundleID
{
  __CFBundle *bundle;
  void *v3;
  void *v4;

  bundle = self->_bundle;
  if (bundle)
  {
    CFBundleGetIdentifier(bundle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSDictionary)infoDictionary
{
  __CFBundle *bundle;
  void *v3;

  bundle = self->_bundle;
  if (bundle)
  {
    CFBundleGetInfoDictionary(bundle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v3;
}

- (IFPlistParser)plistParser
{
  IFPlistParser *plistParser;
  IFPlistParser *v4;
  void *v5;
  IFPlistParser *v6;
  IFPlistParser *v7;

  plistParser = self->_plistParser;
  if (!plistParser)
  {
    if (self->_bundle)
    {
      v4 = [IFPlistParser alloc];
      -[IFBundle infoDictionary](self, "infoDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[IFPlistParser initWithInfoDictionary:](v4, "initWithInfoDictionary:", v5);
      v7 = self->_plistParser;
      self->_plistParser = v6;

      plistParser = self->_plistParser;
    }
    else
    {
      plistParser = 0;
    }
  }
  return plistParser;
}

- (NSDictionary)iconDictionary
{
  void *v2;
  void *v3;

  -[IFBundle plistParser](self, "plistParser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)platform
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v10;

  if (!-[IFBundle bundle](self, "bundle"))
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[IFBundle bundleURL](self, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:allowPlaceholder:error:", v4, 1, 0);

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CA5848]);
    -[IFBundle bundleURL](self, "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithURL:error:", v7, 0);

  }
  if (objc_msgSend(v5, "platform") == 1)
  {
    v8 = 1;
  }
  else if (objc_msgSend(v5, "platform") == 2 || objc_msgSend(v5, "platform") == 7)
  {
    v8 = 4;
  }
  else if (objc_msgSend(v5, "platform") == 6)
  {
    v8 = 2;
  }
  else if (objc_msgSend(v5, "platform") == 4 || objc_msgSend(v5, "platform") == 9)
  {
    v8 = 8;
  }
  else if (objc_msgSend(v5, "platform") == 11 || objc_msgSend(v5, "platform") == 12)
  {
    v8 = 16;
  }
  else if (objc_msgSend(v5, "platform") == 3 || objc_msgSend(v5, "platform") == 8)
  {
    v8 = 32;
  }
  else if (objc_msgSend(v5, "platform"))
  {
    v8 = 0;
  }
  else
  {
    -[IFBundle plistParser](self, "plistParser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "supportedPlatform");

  }
  return v8;
}

- (BOOL)isCoreTypes
{
  return self->_coreTypes;
}

- (__CFBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(__CFBundle *)a3
{
  self->_bundle = a3;
}

- (void)setPlistParser:(id)a3
{
  objc_storeStrong((id *)&self->_plistParser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistParser, 0);
}

@end
