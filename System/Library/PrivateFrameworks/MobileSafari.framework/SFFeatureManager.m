@implementation SFFeatureManager

- (BOOL)showRectangularTabsInSeparateBar
{
  if (showRectangularTabsInSeparateBar_onceToken != -1)
    dispatch_once(&showRectangularTabsInSeparateBar_onceToken, &__block_literal_global_4_1);
  return showRectangularTabsInSeparateBar_showRectangularTabsInSeparateBar;
}

void __52__SFFeatureManager_showRectangularTabsInSeparateBar__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  showRectangularTabsInSeparateBar_showRectangularTabsInSeparateBar = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", CFSTR("DebugUnifiedBarShowRectangularTabsInSeparateBar"), 0);

}

+ (SFFeatureManager)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1)
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_10);
  return (SFFeatureManager *)(id)sharedFeatureManager_sharedFeatureManagerObject;
}

- (int64_t)preferredCapsuleLayoutStyle
{
  void *v3;
  uint64_t v4;
  id v5;
  int64_t v6;
  _QWORD block[4];
  id v8;

  if ((_SFDeviceIsPad() & 1) != 0)
    return 2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SFFeatureManager_preferredCapsuleLayoutStyle__block_invoke;
  block[3] = &unk_1E21E2050;
  v8 = v3;
  v4 = preferredCapsuleLayoutStyle_onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&preferredCapsuleLayoutStyle_onceToken, block);
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("PreferredCapsuleLayoutStyle"));

  return v6;
}

void __47__SFFeatureManager_preferredCapsuleLayoutStyle__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "safari_numberForKey:", CFSTR("PreferredCapsuleLayoutStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = objc_msgSend(v2, "integerValue") - 1;
    v2 = v4;
    if (v3 >= 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", CFSTR("PreferredCapsuleLayoutStyle"));
      v2 = v4;
    }
  }

}

void __40__SFFeatureManager_sharedFeatureManager__block_invoke()
{
  SFFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFFeatureManager);
  v1 = (void *)sharedFeatureManager_sharedFeatureManagerObject;
  sharedFeatureManager_sharedFeatureManagerObject = (uint64_t)v0;

}

- (SFFeatureManager)init
{
  SFFeatureManager *v2;
  SFFeatureManager *v3;
  SFFeatureManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFFeatureManager;
  v2 = -[WBUFeatureManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tabDocumentCanHideToolbar = 1;
    -[SFFeatureManager _updateAccessLevel](v2, "_updateAccessLevel");
    v4 = v3;
  }

  return v3;
}

- (void)_updateAccessLevel
{
  unint64_t v3;

  v3 = +[WBUFeatureManager accessLevel](SFFeatureManager, "accessLevel");
  if (v3 <= 2)
    self->_addToHomeScreenAvailable = 1u >> (8 * v3);
}

- (BOOL)usesFormatMenuInUnifiedTabBar
{
  if (usesFormatMenuInUnifiedTabBar_onceToken != -1)
    dispatch_once(&usesFormatMenuInUnifiedTabBar_onceToken, &__block_literal_global_5_0);
  return usesFormatMenuInUnifiedTabBar_usesFormatMenuInUnifiedTabBar;
}

void __49__SFFeatureManager_usesFormatMenuInUnifiedTabBar__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  usesFormatMenuInUnifiedTabBar_usesFormatMenuInUnifiedTabBar = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugUsePageFormatMenuInUnifiedTabBar"));

}

- (BOOL)allowsUnlimitedTabs
{
  if (allowsUnlimitedTabs_onceToken != -1)
    dispatch_once(&allowsUnlimitedTabs_onceToken, &__block_literal_global_6_0);
  return allowsUnlimitedTabs_allowsUnlimitedTabs;
}

void __39__SFFeatureManager_allowsUnlimitedTabs__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  allowsUnlimitedTabs_allowsUnlimitedTabs = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugUnlimitedTabsEnabled"));

}

- (BOOL)tabDocumentCanHideToolbar
{
  return self->_tabDocumentCanHideToolbar;
}

- (void)setTabDocumentCanHideToolbar:(BOOL)a3
{
  self->_tabDocumentCanHideToolbar = a3;
}

- (BOOL)isAddToHomeScreenAvailable
{
  return self->_addToHomeScreenAvailable;
}

@end
