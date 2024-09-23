@implementation FeatureManager

+ (id)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1)
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_74);
  return (id)sharedFeatureManagerObject;
}

- (BOOL)areSharedTabGroupsEnabled
{
  _BOOL4 v3;

  v3 = -[WBUFeatureManager isCloudAccountHSA2](self, "isCloudAccountHSA2");
  if (v3)
    LOBYTE(v3) = -[WBUFeatureManager isSafariSyncEnabled](self, "isSafariSyncEnabled");
  return v3;
}

void __38__FeatureManager_sharedFeatureManager__block_invoke()
{
  FeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(FeatureManager);
  v1 = (void *)sharedFeatureManagerObject;
  sharedFeatureManagerObject = (uint64_t)v0;

}

- (FeatureManager)init
{
  FeatureManager *v2;
  FeatureManager *v3;
  FeatureManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FeatureManager;
  v2 = -[WBUFeatureManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FeatureManager _updateAccessLevel](v2, "_updateAccessLevel");
    v4 = v3;
  }

  return v3;
}

- (void)_updateAccessLevel
{
  self->_customTabGroupsEnabled = 1;
  self->_addToHomeScreenAvailable = 1;
  if ((unint64_t)(+[WBUFeatureManager accessLevel](FeatureManager, "accessLevel") - 1) <= 1)
  {
    self->_addToHomeScreenAvailable = 0;
    self->_customTabGroupsEnabled = 0;
  }
}

- (BOOL)areTabGroupSuggestionsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D4F130]);

  return v3;
}

- (BOOL)isAddToHomeScreenAvailable
{
  return self->_addToHomeScreenAvailable;
}

- (BOOL)isCustomTabGroupsEnabled
{
  return self->_customTabGroupsEnabled;
}

@end
