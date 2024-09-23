@implementation SFWebExtensionExtensionWrapper

- (SFWebExtensionExtensionWrapper)initWithWebExtensionData:(id)a3
{
  id v5;
  SFWebExtensionExtensionWrapper *v6;
  SFWebExtensionExtensionWrapper *v7;
  SFWebExtensionExtensionWrapper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFWebExtensionExtensionWrapper;
  v6 = -[SFWebExtensionExtensionWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webExtension, a3);
    v8 = v7;
  }

  return v7;
}

- (id)containingAppDisplayName
{
  void *v2;
  void *v3;

  -[WBSWebExtensionData extension](self->_webExtension, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_localizedContainingAppDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayName
{
  return -[WBSWebExtensionData displayName](self->_webExtension, "displayName");
}

- (id)shortName
{
  return -[WBSWebExtensionData displayShortName](self->_webExtension, "displayShortName");
}

- (id)composedIdentifier
{
  return -[WBSWebExtensionData composedIdentifier](self->_webExtension, "composedIdentifier");
}

- (id)extension
{
  return -[WBSWebExtensionData extension](self->_webExtension, "extension");
}

- (BOOL)isContentBlocker
{
  return 0;
}

- (BOOL)isEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[WBSWebExtensionData extensionsController](self->_webExtension, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData extension](self->_webExtension, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "extensionIsEnabled:", v4);

  return v5;
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  return -[WBSWebExtensionData canLoadWithErrorString:](self->_webExtension, "canLoadWithErrorString:", a3);
}

- (void)enableWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WBSWebExtensionData *webExtension;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[WBSWebExtensionData extensionsController](self->_webExtension, "extensionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  webExtension = self->_webExtension;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__SFWebExtensionExtensionWrapper_enableWithPresentingViewController_completionHandler___block_invoke;
  v13[3] = &unk_1E21E22D0;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "reportCommandShortcutConflictsIfNecessaryForExtension:presentingViewController:completionHandler:", webExtension, v12, v13);

}

uint64_t __87__SFWebExtensionExtensionWrapper_enableWithPresentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newTabOverridePageURL");

  if (v2)
    return objc_msgSend(*(id *)(a1 + 32), "_enableNewTabOverrideExtensionWithPresentingViewController:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtension:isEnabled:", v5, 1);

  objc_msgSend(*(id *)(a1 + 32), "_postNotificationsToUpdateExtensionState");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_enableNewTabOverrideExtensionWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  WBSWebExtensionData *webExtension;
  void *v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  SFWebExtensionExtensionWrapper *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  SFWebExtensionExtensionWrapper *v38;
  id v39;

  v30 = a4;
  webExtension = self->_webExtension;
  v31 = a3;
  -[WBSWebExtensionData extensionsController](webExtension, "extensionsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "kind");
  v10 = (void *)MEMORY[0x1E0DC3450];
  v11 = (void *)MEMORY[0x1E0CB3940];
  v29 = v8;
  if (v9)
  {
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData displayName](self->_webExtension, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData displayName](self->_webExtension, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v18 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke;
  v36[3] = &unk_1E21E62C0;
  v21 = v7;
  v37 = v21;
  v38 = self;
  v22 = v30;
  v39 = v22;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v36);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v23);

  v24 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  v32[1] = 3221225472;
  v32[2] = __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke_2;
  v32[3] = &unk_1E21E62C0;
  v33 = v21;
  v34 = self;
  v35 = v22;
  v26 = v22;
  v27 = v21;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v28);
  objc_msgSend(v17, "setPreferredAction:", v28);
  objc_msgSend(v31, "presentViewController:animated:completion:", v17, 1, 0);

}

void __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tabOverridePreferencesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionComposedIdentifierForNewTabPreferenceInDefaults:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "composedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "tabOverridePreferencesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearNewTabBehaviorInDefaults:", v9);

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExtension:isEnabled:", v8, 1);

  objc_msgSend(*(id *)(a1 + 40), "_postNotificationsToUpdateExtensionState");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "tabOverridePreferencesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "composedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNewTabBehaviorWithExtensionComposedIdentifier:inDefaults:", v3, v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtension:isEnabled:", v6, 1);

  objc_msgSend(*(id *)(a1 + 40), "_postNotificationsToUpdateExtensionState");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)disable
{
  void *v3;
  void *v4;

  -[WBSWebExtensionData extensionsController](self->_webExtension, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData extension](self->_webExtension, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExtension:isEnabled:", v4, 0);

  -[SFExtensionWrapper _postNotificationsToUpdateExtensionState](self, "_postNotificationsToUpdateExtensionState");
}

- (BOOL)allowedInPrivateBrowsing
{
  return -[WBSWebExtensionData allowedInPrivateBrowsing](self->_webExtension, "allowedInPrivateBrowsing");
}

- (void)setAllowedInPrivateBrowsing:(BOOL)a3
{
  -[WBSWebExtensionData setAllowedInPrivateBrowsing:](self->_webExtension, "setAllowedInPrivateBrowsing:", a3);
  -[SFExtensionWrapper _postNotificationsToUpdateExtensionState](self, "_postNotificationsToUpdateExtensionState");
}

- (id)enabledProfiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[WBSWebExtensionData extensionsController](self->_webExtension, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabGroupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SFWebExtensionExtensionWrapper_enabledProfiles__block_invoke;
  v8[3] = &unk_1E21E6258;
  v8[4] = self;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __49__SFWebExtensionExtensionWrapper_enabledProfiles__block_invoke(uint64_t a1, void *a2)
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

  -[WBSWebExtensionData extensionsController](self->_webExtension, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabGroupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namedProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[SFWebExtensionExtensionWrapper enabledProfiles](self, "enabledProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_135);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __54__SFWebExtensionExtensionWrapper_enabledNamedProfiles__block_invoke(uint64_t a1, void *a2)
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
  WBSWebExtensionData *webExtension;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  webExtension = self->_webExtension;
  v5 = a3;
  -[WBSWebExtensionData extensionsController](webExtension, "extensionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierForExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "webExtensionsControllerForProfileServerID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSWebExtensionData extension](self->_webExtension, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "extensionIsEnabled:", v9);

  return (char)v7;
}

- (BOOL)isEnabledInAllNamedProfiles
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[WBSWebExtensionData extensionsController](self->_webExtension, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWebExtensionExtensionWrapper enabledNamedProfiles](self, "enabledNamedProfiles");
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
  return NSClassFromString(CFSTR("SafariWebExtensionsPermissionsSettingsController"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webExtension, 0);
}

@end
