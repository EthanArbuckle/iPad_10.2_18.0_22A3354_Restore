@implementation _EXRunningExtensionInfo

+ (_EXRunningExtensionInfo)extensionInfoForCurrentProcess
{
  id v2;

  if (s_extensionMainCalled == 1)
  {
    if (extensionInfoForCurrentProcess_onceToken != -1)
      dispatch_once(&extensionInfoForCurrentProcess_onceToken, &__block_literal_global_1);
    v2 = (id)extensionInfoForCurrentProcess_extensionForCurrentProcess;
  }
  else
  {
    v2 = 0;
  }
  return (_EXRunningExtensionInfo *)v2;
}

+ (void)notifyExtensionMainCalled
{
  if (notifyExtensionMainCalled_onceToken != -1)
    dispatch_once(&notifyExtensionMainCalled_onceToken, &__block_literal_global_3);
}

- (id)initForCurrentProcess
{
  _EXRunningExtensionInfo *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSString *bundleIdentifier;
  void *v7;
  uint64_t v8;
  NSString *containerBundleIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *containingViewControllerClassName;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *runLoopType;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_EXRunningExtensionInfo;
  v2 = -[_EXRunningExtensionInfo init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "bundleIdentifier");
      v5 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = v2->_bundleIdentifier;
      v2->_bundleIdentifier = (NSString *)v5;

      objc_msgSend(v4, "containingBundleRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      containerBundleIdentifier = v2->_containerBundleIdentifier;
      v2->_containerBundleIdentifier = (NSString *)v8;

      objc_msgSend(v4, "extensionPointRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "SDKDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "_EX_stringForKey:", CFSTR("NSExtensionContainingViewControllerClass"));
      v13 = objc_claimAutoreleasedReturnValue();
      containingViewControllerClassName = v2->_containingViewControllerClassName;
      v2->_containingViewControllerClassName = (NSString *)v13;

      objc_msgSend(v10, "SDKDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("XPCService"), objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "_EX_stringForKey:", CFSTR("RunLoopType"));
      v17 = objc_claimAutoreleasedReturnValue();
      runLoopType = v2->_runLoopType;
      v2->_runLoopType = (NSString *)v17;

    }
    else
    {
      v10 = v2;
      v2 = 0;
    }

  }
  return v2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)containingViewControllerClassName
{
  return self->_containingViewControllerClassName;
}

- (NSString)runLoopType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoopType, 0);
  objc_storeStrong((id *)&self->_containingViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
