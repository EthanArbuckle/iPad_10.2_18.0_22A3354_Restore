@implementation SFExtensionWrapper

+ (id)extensionWrapperForWebExtensionWithComposedIdentifier:(id)a3 webExtensionsController:(id)a4
{
  void *v4;
  SFWebExtensionExtensionWrapper *v5;

  objc_msgSend(a4, "webExtensionForComposedIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[SFWebExtensionExtensionWrapper initWithWebExtensionData:]([SFWebExtensionExtensionWrapper alloc], "initWithWebExtensionData:", v4);
  else
    v5 = 0;

  return v5;
}

+ (id)extensionWrapperForContentBlockerWithComposedIdentifier:(id)a3 contentBlockerManager:(id)a4
{
  id v5;
  void *v6;
  SFContentBlockerExtensionWrapper *v7;

  v5 = a4;
  objc_msgSend(v5, "_contentBlockerWithComposedIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[SFContentBlockerExtensionWrapper initWithExtension:contentBlockerManager:]([SFContentBlockerExtensionWrapper alloc], "initWithExtension:contentBlockerManager:", v6, v5);
  else
    v7 = 0;

  return v7;
}

- (int64_t)localizedCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SFExtensionWrapper containingAppDisplayName](self, "containingAppDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingAppDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "localizedCompare:", v6);

  if (!v7)
  {
    -[SFExtensionWrapper displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "localizedCompare:", v9);

  }
  return v7;
}

- (BOOL)contentBlockerHasSameNameAsWebExtensionFromSameApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SFExtensionWrapper *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFExtensionWrapper isContentBlocker](self, "isContentBlocker"))
  {
    -[SFExtensionWrapper extension](self, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_plugIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containingUrl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v22 = v4;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(SFExtensionWrapper **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (v12 != self)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "extension");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_plugIn");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "containingUrl");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v23, "isEqual:", v15);

            if (v16)
            {
              -[SFExtensionWrapper displayName](self, "displayName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFExtensionWrapper displayName](v12, "displayName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "isEqualToString:", v18);

              if ((v19 & 1) != 0)
              {
                v20 = 1;
                goto LABEL_15;
              }
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
          continue;
        break;
      }
      v20 = 0;
LABEL_15:
      v4 = v22;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)containingAppDisplayName
{
  return 0;
}

- (NSString)displayName
{
  return 0;
}

- (NSString)shortName
{
  return 0;
}

- (NSString)composedIdentifier
{
  return 0;
}

- (NSExtension)extension
{
  return 0;
}

- (BOOL)isContentBlocker
{
  return 0;
}

- (BOOL)isEnabled
{
  return 0;
}

- (BOOL)canEnable
{
  return -[SFExtensionWrapper canLoadWithErrorString:](self, "canLoadWithErrorString:", 0);
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  return 0;
}

- (BOOL)allowedInPrivateBrowsing
{
  return 0;
}

- (NSArray)enabledProfiles
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)enabledNamedProfiles
{
  return 0;
}

- (BOOL)isEnabledInProfile:(id)a3
{
  return 0;
}

- (BOOL)isEnabledInAnyProfile
{
  void *v2;
  BOOL v3;

  -[SFExtensionWrapper enabledProfiles](self, "enabledProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isEnabledInAnyNamedProfile
{
  void *v2;
  BOOL v3;

  -[SFExtensionWrapper enabledNamedProfiles](self, "enabledNamedProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isEnabledInAllNamedProfiles
{
  return 0;
}

- (Class)settingsPermissionClass
{
  return 0;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFExtensionWrapper extension](self, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; extension = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_postNotificationsToUpdateExtensionState
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0D8B8D8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D8B710], self);

}

@end
