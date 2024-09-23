@implementation EKUIApplicationExtensionOverrides

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_10);
  return (id)shared_shared;
}

- (id)viewHierarchyOrOverride
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D0CD78], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentProcessAnApplicationExtension");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "performSelector:", sel_sharedApplication);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectedScenes");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            objc_msgSend(v11, "windows", (_QWORD)v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v12, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              return v15;
            }

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  return (id)_overrideViewHierarchy;
}

- (id)preferredContentSizeCategoryOrOverride
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D0CD78], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategoryOrOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)layoutDirectionOrOverride
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0D0CD78], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirectionOrOverride");

  return v3;
}

void __43__EKUIApplicationExtensionOverrides_shared__block_invoke()
{
  EKUIApplicationExtensionOverrides *v0;
  void *v1;

  v0 = objc_alloc_init(EKUIApplicationExtensionOverrides);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

- (EKUIApplicationExtensionOverrides)init
{
  EKUIApplicationExtensionOverrides *v2;
  EKUIViewHierarchyFromComponents *v3;
  void *v4;
  double v5;
  double v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  _OWORD v11[3];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EKUIApplicationExtensionOverrides;
  v2 = -[EKUIApplicationExtensionOverrides init](&v12, sel_init);
  if (v2)
  {
    v3 = [EKUIViewHierarchyFromComponents alloc];
    CalendarAppTintColor();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v11[0] = *MEMORY[0x1E0C9BAA8];
    v11[1] = v7;
    v11[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v8 = -[EKUIViewHierarchyFromComponents initWithSize:verticalSizeClass:horizontalSizeClass:interfaceOrientation:tintColor:affineTranform:](v3, "initWithSize:verticalSizeClass:horizontalSizeClass:interfaceOrientation:tintColor:affineTranform:", 0, 0, 0, v4, v11, v5, v6);
    v9 = (void *)_overrideViewHierarchy;
    _overrideViewHierarchy = v8;

  }
  return v2;
}

- (void)setLayoutDirectionOverride:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D0CD78], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutDirectionOverride:", a3);

  CalUpdateUserInterfaceDirection();
}

- (void)setPreferredContentSizeCategoryOverride:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D0CD78];
  v4 = a3;
  objc_msgSend(v3, "shared");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredContentSizeCategoryOverride:", v4);

}

- (void)setViewHierarchyOverride:(id)a3
{
  objc_storeStrong((id *)&_overrideViewHierarchy, a3);
}

@end
