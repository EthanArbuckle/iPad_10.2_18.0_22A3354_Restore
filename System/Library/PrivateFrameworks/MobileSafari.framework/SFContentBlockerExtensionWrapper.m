@implementation SFContentBlockerExtensionWrapper

- (SFContentBlockerExtensionWrapper)initWithExtension:(id)a3 contentBlockerManager:(id)a4
{
  id v7;
  id v8;
  SFContentBlockerExtensionWrapper *v9;
  SFContentBlockerExtensionWrapper *v10;
  SFContentBlockerExtensionWrapper *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFContentBlockerExtensionWrapper;
  v9 = -[SFContentBlockerExtensionWrapper init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeStrong((id *)&v10->_contentBlockerManager, a4);
    v11 = v10;
  }

  return v10;
}

- (id)containingAppDisplayName
{
  return (id)-[NSExtension safari_localizedContainingAppDisplayName](self->_extension, "safari_localizedContainingAppDisplayName");
}

- (id)displayName
{
  return (id)-[SFContentBlockerManager displayNameForExtension:](self->_contentBlockerManager, "displayNameForExtension:", self->_extension);
}

- (id)shortName
{
  return 0;
}

- (id)composedIdentifier
{
  void *v3;
  void *v4;

  -[SFContentBlockerManager webExtensionsController](self->_contentBlockerManager, "webExtensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composedIdentifierForExtensionStateForExtension:", self->_extension);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)extension
{
  return self->_extension;
}

- (BOOL)isContentBlocker
{
  return 1;
}

- (BOOL)isEnabled
{
  return -[SFContentBlockerManager extensionIsEnabled:](self->_contentBlockerManager, "extensionIsEnabled:", self->_extension);
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  return 1;
}

- (void)enableWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  SFContentBlockerManager *contentBlockerManager;
  NSExtension *extension;
  void (**v7)(void);

  contentBlockerManager = self->_contentBlockerManager;
  extension = self->_extension;
  v7 = (void (**)(void))a4;
  -[SFContentBlockerManager setExtension:isEnabled:byUserGesture:](contentBlockerManager, "setExtension:isEnabled:byUserGesture:", extension, 1, 1);
  -[SFExtensionWrapper _postNotificationsToUpdateExtensionState](self, "_postNotificationsToUpdateExtensionState");
  v7[2]();

}

- (void)disable
{
  -[SFContentBlockerManager setExtension:isEnabled:byUserGesture:](self->_contentBlockerManager, "setExtension:isEnabled:byUserGesture:", self->_extension, 0, 1);
  -[SFExtensionWrapper _postNotificationsToUpdateExtensionState](self, "_postNotificationsToUpdateExtensionState");
}

- (BOOL)allowedInPrivateBrowsing
{
  return -[SFContentBlockerManager isContentBlockerAllowedInPrivateBrowsing:](self->_contentBlockerManager, "isContentBlockerAllowedInPrivateBrowsing:", self->_extension);
}

- (void)setAllowedInPrivateBrowsing:(BOOL)a3
{
  -[SFContentBlockerManager setExtension:isEnabledInPrivateBrowsing:updateUserContentController:](self->_contentBlockerManager, "setExtension:isEnabledInPrivateBrowsing:updateUserContentController:", self->_extension, a3, 1);
  -[SFExtensionWrapper _postNotificationsToUpdateExtensionState](self, "_postNotificationsToUpdateExtensionState");
}

- (id)enabledProfiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[SFContentBlockerManager webExtensionsController](self->_contentBlockerManager, "webExtensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabGroupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SFContentBlockerExtensionWrapper_enabledProfiles__block_invoke;
  v8[3] = &unk_1E21E6258;
  v8[4] = self;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__SFContentBlockerExtensionWrapper_enabledProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEnabledInProfile:", v3))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)enabledNamedProfiles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[SFContentBlockerManager webExtensionsController](self->_contentBlockerManager, "webExtensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabGroupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namedProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[SFContentBlockerExtensionWrapper enabledProfiles](self, "enabledProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __56__SFContentBlockerExtensionWrapper_enabledNamedProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "kind"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isEnabledInProfile:(id)a3
{
  SFContentBlockerExtensionWrapper *v3;
  SFContentBlockerManager *contentBlockerManager;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = self;
  contentBlockerManager = self->_contentBlockerManager;
  v5 = a3;
  -[SFContentBlockerManager webExtensionsController](contentBlockerManager, "webExtensionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierForExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentBlockerManagerForProfileServerID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v8, "extensionIsEnabled:", v3->_extension);
  return (char)v3;
}

- (BOOL)isEnabledInAllNamedProfiles
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[SFContentBlockerManager webExtensionsController](self->_contentBlockerManager, "webExtensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContentBlockerExtensionWrapper enabledNamedProfiles](self, "enabledNamedProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v3, "tabGroupManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "namedProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v5 == objc_msgSend(v7, "count");

  return v5;
}

- (Class)settingsPermissionClass
{
  return NSClassFromString(CFSTR("SafariContentBlockerPermissionsSettingsController"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
