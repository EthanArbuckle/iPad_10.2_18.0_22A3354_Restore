@implementation SFWebExtensionsController

- (BOOL)extensionsEnabled
{
  return 1;
}

- (id)_developerIdentifierForExtension:(id)a3 untrustedCodeSigningDictionary:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_getAssociatedObject(v4, &developerIdentifierRepresentedObjectKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = objc_alloc(MEMORY[0x1E0CA5848]);
    objc_msgSend(v4, "_plugIn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v12 = (void *)objc_msgSend(v9, "initWithUUID:error:", v11, &v23);
    v13 = v23;

    if (!v12)
    {
      v16 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "safari_privacyPreservingDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFWebExtensionsController _developerIdentifierForExtension:untrustedCodeSigningDictionary:].cold.1(v17, v18, (uint64_t)buf, v16);
      }

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v4, &developerIdentifierRepresentedObjectKey, v14, (void *)1);
      v8 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v12, "containingBundleRecord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFWebExtensionsController _developerIdentifierForExtension:untrustedCodeSigningDictionary:].cold.2(v20, buf, v19);
      }

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v4, &developerIdentifierRepresentedObjectKey, v21, (void *)1);
      v8 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v14, "teamIdentifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("0000000000")))
    {

      v15 = 0;
      v8 = CFSTR("UNSIGNED");
    }
    else
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 1;
LABEL_19:
        objc_setAssociatedObject(v4, &developerIdentifierRepresentedObjectKey, v21, (void *)1);
        if ((v15 & 1) == 0)
        {
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:

        goto LABEL_21;
      }
      v15 = 0;
    }
    v21 = v8;
    goto LABEL_19;
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

LABEL_22:
  return v8;
}

+ (id)_skipLoadingEnabledExtensionsAtLaunchPreferenceKey
{
  return CFSTR("SkipLoadingEnabledExtensionsAtLaunch");
}

void __44__SFWebExtensionsController_setProcessPool___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 37);
    v7 = *MEMORY[0x1E0D8A2C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E0D8A2C0]));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setObject:forBundleParameter:", v8, v7);

  }
}

- (NSMutableDictionary)tabIDToTabPositionForTabsInTransit
{
  return self->_tabIDToTabPositionForTabsInTransit;
}

- (void)setProfileDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_profileDelegate, a3);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (void)setApplicationNameForUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_applicationNameForUserAgent, a3);
}

+ (void)_didDiscoverExtensions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D8A3D8]);

}

- (id)_findWindowWithID:(double)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
  objc_msgSend(WeakRetained, "sfWebExtensionsController:windowWithID:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allProfileExtensionsControllers
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sfWebExtensionsControllerAllProfileExtensionsControllers:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (void)setViewControllerToPresentDialogsFrom:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerToPresentDialogsFrom, a3);
  -[SFWebExtensionsController cancelPresentedDialogIfNecessaryAndUnqueuePendingWebExtensionDialogs](self, "cancelPresentedDialogIfNecessaryAndUnqueuePendingWebExtensionDialogs");
}

- (void)setProcessPool:(id)a3
{
  WKProcessPool *v5;
  WKProcessPool **p_processPool;
  WKProcessPool *processPool;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  WBSUserDefaultObservation *v12;
  WBSUserDefaultObservation *stubUnsupportedAPIsUserDefaultObserver;
  WBSUserDefaultObservation *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v5 = (WKProcessPool *)a3;
  p_processPool = &self->_processPool;
  processPool = self->_processPool;
  if (v5)
  {
    if (processPool != v5)
    {
      objc_storeStrong((id *)p_processPool, a3);
      objc_initWeak(&location, self);
      objc_msgSend((id)objc_opt_class(), "_extensionDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0D8A2C0];
      v10 = MEMORY[0x1E0C80D38];
      v11 = MEMORY[0x1E0C80D38];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__SFWebExtensionsController_setProcessPool___block_invoke;
      v15[3] = &unk_1E21E40F0;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v8, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v9, v10, 1, v15);
      v12 = (WBSUserDefaultObservation *)objc_claimAutoreleasedReturnValue();
      stubUnsupportedAPIsUserDefaultObserver = self->_stubUnsupportedAPIsUserDefaultObserver;
      self->_stubUnsupportedAPIsUserDefaultObserver = v12;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    *p_processPool = 0;

    v14 = self->_stubUnsupportedAPIsUserDefaultObserver;
    self->_stubUnsupportedAPIsUserDefaultObserver = 0;

  }
}

+ (id)_extensionDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
}

- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *blocklistQueue;
  NSObject *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *v13;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sf_bundleIdentifierForContainingApp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);
  if (v9)
  {
    blocklistQueue = self->_blocklistQueue;
    if (!blocklistQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (OS_dispatch_queue *)dispatch_queue_create("Web Extension Blocklist Queue", v11);
      v13 = self->_blocklistQueue;
      self->_blocklistQueue = v12;

      blocklistQueue = self->_blocklistQueue;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke;
    block[3] = &unk_1E21E3F10;
    v16 = v9;
    v17 = v8;
    v18 = v7;
    dispatch_async(blocklistQueue, block);

  }
  return 0;
}

void __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DE7300];
  v14[0] = *MEMORY[0x1E0DE72E8];
  v14[1] = v2;
  v15[0] = MEMORY[0x1E0C9AAB0];
  v15[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0DE72C8];
  v14[2] = *MEMORY[0x1E0DE72D8];
  v14[3] = v3;
  v15[2] = MEMORY[0x1E0C9AAB0];
  v15[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MISValidateSignature();

  if (v7)
  {
    v8 = (void *)MISCopyErrorStringForErrorCode();
    v9 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke_cold_1(a1, (uint64_t)v8, v9);

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138477827;
      v13 = v11;
      _os_log_impl(&dword_18B7B2000, v10, OS_LOG_TYPE_INFO, "Parent app for web extension with identifier %{private}@ is a trusted app", (uint8_t *)&v12, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 developerIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke;
  v8[3] = &unk_1E21E3F60;
  v8[4] = self;
  v6 = v5;
  v9 = v6;
  objc_copyWeak(&v10, &location);
  LOBYTE(self) = -[SFWebExtensionsController _isExtensionBlockedByBlocklist:completionHandler:](self, "_isExtensionBlockedByBlocklist:completionHandler:", v6, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return (char)self;
}

void __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  int v9;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke_2;
    block[3] = &unk_1E21E3F38;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    v7 = *(id *)(a1 + 40);
    v9 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v8);
  }
  else
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeExtensionBundleIDFromArrayOfBlocklistedExtensions:");

  }
}

void __80__SFWebExtensionsController__isExtensionBlockedByBlocklist_developerIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "_disableAndBlockExtension:", *(_QWORD *)(a1 + 32));
    v3 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend((id)v3, "hasBlockedPromptAppearedForExtensionWithIdentifier:", v4);

    WeakRetained = v8;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v8, "_displayNameForExtension:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(a1 + 48) == -402620387)
      {
        objc_msgSend(v8, "showPromptForBlocklistedExtension:extensionName:", v6, v5);
      }
      else
      {
        objc_msgSend(v8, "webExtensionForExtension:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "showPromptForExpiredExtension:extensionName:", v7, v5);

      }
      WeakRetained = v8;
    }
  }

}

- (void)extensionSettingsWereUpdatedExternallyFromSettingsApp:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (-[SFWebExtensionsController extensionsEnabled](self, "extensionsEnabled"))
  {
    v5 = (int)*MEMORY[0x1E0D8ADF8];
    v9 = *(id *)((char *)&self->super.super.super.isa + v5);
    -[WBSExtensionsController readExtensionsStateFromStorage](self, "readExtensionsStateFromStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_msgSend(v6, "mutableCopy");
    v8 = *(Class *)((char *)&self->super.super.super.isa + v5);
    *(Class *)((char *)&self->super.super.super.isa + v5) = v7;

    if (*(Class *)((char *)&self->super.super.super.isa + v5))
      -[SFWebExtensionsController _updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally:shouldUpdateExtensionPermissionsAndEnabledState:](self, "_updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally:shouldUpdateExtensionPermissionsAndEnabledState:", v9, v3);

  }
}

- (void)_updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally:(id)a3 shouldUpdateExtensionPermissionsAndEnabledState:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SFWebExtensionsController *v11;
  BOOL v12;

  v6 = a3;
  v7 = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADF8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __143__SFWebExtensionsController__updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally_shouldUpdateExtensionPermissionsAndEnabledState___block_invoke;
  v9[3] = &unk_1E21E3F88;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __143__SFWebExtensionsController__updateExtensionsStateAfterExtensionSettingsWereUpdatedExternally_shouldUpdateExtensionPermissionsAndEnabledState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "webExtensionForComposedIdentifier:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setHasLoadedPermissionsFromStorage:", 0);
    if (*(_BYTE *)(a1 + 48))
    {
      v9 = *MEMORY[0x1E0D8A5C0];
      v10 = objc_msgSend(v5, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5C0]);
      v11 = objc_msgSend(v6, "safari_BOOLForKey:", v9);
      if ((_DWORD)v10 == v11)
      {
        if (v11)
          objc_msgSend(*(id *)(a1 + 40), "_permissionsMayHaveBeenChangedExternallyForExtension:previousExtensionState:", v8, v6);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "_extensionWithComposedIdentifier:wasEnabledOrDisabledByExtensionSettings:", v12, v10);
      }
    }
  }

}

- (void)_extensionWithComposedIdentifier:(id)a3 wasEnabledOrDisabledByExtensionSettings:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WBSExtensionsController extensionWithComposedIdentifier:](self, "extensionWithComposedIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADF0]), "containsObject:", v7) == v4)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFWebExtensionsController _extensionWithComposedIdentifier:wasEnabledOrDisabledByExtensionSettings:].cold.1(v13, v4, (uint8_t *)&v14, v12);
      }

    }
    else
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "identifier");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        v11 = CFSTR("disabled");
        if (v4)
          v11 = CFSTR("enabled");
        v14 = 138478083;
        v15 = v9;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_18B7B2000, v8, OS_LOG_TYPE_INFO, "Extension with identifier %{private}@ was %{public}@ by Settings", (uint8_t *)&v14, 0x16u);

      }
      -[WBSExtensionsController setExtension:isEnabled:skipSavingToStorage:](self, "setExtension:isEnabled:skipSavingToStorage:", v7, v4, 1);
    }
  }

}

- (void)showPermissionBannerForExtension:(id)a3
{
  id v4;
  NSMutableOrderedSet *queueOfExtensionsToShowInPermissionBanner;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id WeakRetained;
  id v9;

  v4 = a3;
  queueOfExtensionsToShowInPermissionBanner = self->_queueOfExtensionsToShowInPermissionBanner;
  v9 = v4;
  if (!queueOfExtensionsToShowInPermissionBanner)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_queueOfExtensionsToShowInPermissionBanner;
    self->_queueOfExtensionsToShowInPermissionBanner = v6;

    queueOfExtensionsToShowInPermissionBanner = self->_queueOfExtensionsToShowInPermissionBanner;
    v4 = v9;
  }
  if ((-[NSMutableOrderedSet containsObject:](queueOfExtensionsToShowInPermissionBanner, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->_queueOfExtensionsToShowInPermissionBanner, "addObject:", v9);
    if (-[NSMutableOrderedSet count](self->_queueOfExtensionsToShowInPermissionBanner, "count") == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
      objc_msgSend(WeakRetained, "sfWebExtensionsControllerDidChangeExtensionForPermissionBanner:", self);

    }
  }

}

- (void)hidePermissionBannerForExtension:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_queueOfExtensionsToShowInPermissionBanner, "containsObject:") & 1) != 0)
  {
    -[SFWebExtensionsController currentExtensionForPermissionBanner](self, "currentExtensionForPermissionBanner");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableOrderedSet removeObject:](self->_queueOfExtensionsToShowInPermissionBanner, "removeObject:", v6);
    if (v4 == v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
      objc_msgSend(WeakRetained, "sfWebExtensionsControllerDidChangeExtensionForPermissionBanner:", self);

    }
  }

}

- (SFWebExtension)currentExtensionForPermissionBanner
{
  return (SFWebExtension *)-[NSMutableOrderedSet firstObject](self->_queueOfExtensionsToShowInPermissionBanner, "firstObject");
}

- (void)didViewToolbarItemBadgesInTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WBSExtensionsController enabledExtensions](self, "enabledExtensions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v6;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "toolbarItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "didViewBadgeInTab:", v4);

        ++v9;
        v10 = v6;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v6, "_validateToolbarItemInAllWindows");
}

- (BOOL)hasUpdatedToolbarItemBadgeTextInTab:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WBSExtensionsController enabledExtensions](self, "enabledExtensions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        -[WBSWebExtensionsController webExtensionForExtension:](self, "webExtensionForExtension:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "toolbarItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasUpdatedBadgeTextInTab:", v4);

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)reportCommandShortcutConflictsIfNecessaryForExtension:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  -[WBSWebExtensionsController commandShortcutConflictsForExtension:](self, "commandShortcutConflictsForExtension:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    -[SFWebExtensionsController _reportCommandShortcutConflictsForExtension:conflicts:presentingViewController:completionHandler:](self, "_reportCommandShortcutConflictsForExtension:conflicts:presentingViewController:completionHandler:", v13, v12, v8, v9);

  }
  else
  {
    v9[2](v9);
  }

}

- (void)_reportCommandShortcutConflictsForExtension:(id)a3 conflicts:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  objc_msgSend(v11, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "removeObjectAtIndex:", 0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __126__SFWebExtensionsController__reportCommandShortcutConflictsForExtension_conflicts_presentingViewController_completionHandler___block_invoke;
    v17[3] = &unk_1E21E3FB0;
    v17[4] = self;
    v18 = v10;
    v19 = v11;
    v15 = v12;
    v20 = v15;
    v21 = v13;
    -[SFWebExtensionsController _commandShortcutConflictAlertForExtension:conflict:okAction:](self, "_commandShortcutConflictAlertForExtension:conflict:okAction:", v18, v14, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v16, 1, 0);

  }
  else
  {
    v13[2](v13);
  }

}

uint64_t __126__SFWebExtensionsController__reportCommandShortcutConflictsForExtension_conflicts_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportCommandShortcutConflictsForExtension:conflicts:presentingViewController:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (id)_commandShortcutConflictAlertForExtension:(id)a3 conflict:(id)a4 okAction:(id)a5
{
  id v7;
  id v8;
  id v9;
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
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayShortName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionDisplayShortName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "compare:", v12) == 1)
    objc_msgSend(v8, "extensionDisplayName");
  else
    objc_msgSend(v7, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionDisplayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shortcut");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v16, v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__SFWebExtensionsController__commandShortcutConflictAlertForExtension_conflict_okAction___block_invoke;
  v25[3] = &unk_1E21E3FD8;
  v22 = v9;
  v26 = v22;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v23);

  return v19;
}

uint64_t __89__SFWebExtensionsController__commandShortcutConflictAlertForExtension_conflict_okAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)recentlyInstalledExtensionCount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t, void *);
  void *v13;
  SFWebExtensionsController *v14;
  id v15;

  -[WBSExtensionsController extensions](self, "extensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dateForKey:", *MEMORY[0x1E0D8A440]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__SFWebExtensionsController_recentlyInstalledExtensionCount__block_invoke;
  v13 = &unk_1E21E4000;
  v14 = self;
  v6 = v5;
  v15 = v6;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count", v10, v11, v12, v13, v14);

  return v8;
}

BOOL __60__SFWebExtensionsController_recentlyInstalledExtensionCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "extensionIsEnabled:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "installationDateForExtension:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 40), "compare:", v5) == -1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (NSURL)extensionOverriddenStartPageURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController tabOverridePreferencesManager](self, "tabOverridePreferencesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:", v3) & 1) != 0)
  {
    objc_msgSend(v4, "extensionComposedIdentifierForNewTabPreferenceInDefaults:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionsController webExtensionForComposedIdentifier:](self, "webExtensionForComposedIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newTabOverridePageURL");

  }
  else
  {
    v7 = 0;
  }

  return (NSURL *)v7;
}

- (void)webExtensionController:(id)a3 presentPopupForAction:(id)a4 forExtensionContext:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  _QWORD v17[4];
  id v18;

  v9 = a4;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0D8ADA0], "webExtensionForWebKitExtensionContext:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "toolbarItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "popupWebViewInspectionNameForAction:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInspectionName:", v13);

    }
    objc_msgSend(v9, "associatedTab");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "webExtensionWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __112__SFWebExtensionsController_webExtensionController_presentPopupForAction_forExtensionContext_completionHandler___block_invoke;
    v17[3] = &unk_1E21E4028;
    v18 = v10;
    objc_msgSend(WeakRetained, "sfWebExtensionsController:showPopupForExtension:inWindow:completionHandler:", self, v11, v15, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __112__SFWebExtensionsController_webExtensionController_presentPopupForAction_forExtensionContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (Class)_extensionDataClass
{
  return (Class)objc_opt_class();
}

- (id)_webViewConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  -[SFWebExtensionsController applicationNameForUserAgent](self, "applicationNameForUserAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationNameForUserAgent:", v4);

  -[SFWebExtensionsController processPool](self, "processPool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProcessPool:", v5);

  objc_msgSend(MEMORY[0x1E0CEF608], "safari_webExtensionUserContentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserContentController:", v6);

  objc_msgSend(v3, "_setCrossOriginAccessControlCheckEnabled:", 0);
  objc_msgSend(v3, "_setGroupIdentifier:", *MEMORY[0x1E0D8B738]);
  objc_msgSend(v3, "_setShouldRelaxThirdPartyCookieBlocking:", 1);
  objc_msgSend(v3, "defaultWebpagePreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setAutoplayPolicy:", 1);

  -[WBSExtensionsController websiteDataStore](self, "websiteDataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWebsiteDataStore:", v8);

  v9 = _SFDeviceSupportsDesktopSitesByDefault();
  objc_msgSend(v3, "defaultWebpagePreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v9)
    v12 = 2;
  else
    v12 = 0;
  objc_msgSend(v10, "setPreferredContentMode:", v12);

  _SFApplicationNameForDesktopUserAgent();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultWebpagePreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setApplicationNameForUserAgentWithModernCompatibility:", v13);

  objc_msgSend(v3, "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setShouldIgnoreMetaViewport:", v9);

  return v3;
}

- (unint64_t)toolbarItemIdealPointSize
{
  return 24;
}

- (void)_createNewTabInWindow:(id)a3 tabIndex:(id)a4 url:(id)a5 makeActive:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id WeakRetained;

  v7 = a6;
  v12 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]);
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WeakRetained = objc_loadWeakRetained(v12);
  objc_msgSend(WeakRetained, "sfWebExtensionsController:createNewTabInWindow:tabIndex:url:makeActive:completionHandler:", self, v16, v15, v14, v7, v13);

}

- (void)_relateParentTab:(id)a3 toTab:(id)a4
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]);
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "sfWebExtensionsController:relateParentTab:toTab:", self, v8, v7);

}

- (id)_findTabInAnyWindowWithID:(double)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
  objc_msgSend(WeakRetained, "sfWebExtensionsController:tabWithID:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fireAppropriateTabMovementEventForTabState:(id)a3
{
  NSMutableDictionary *tabIDToTabPositionForTabsInTransit;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__SFWebExtensionsController_fireAppropriateTabMovementEventForTabState___block_invoke;
  v5[3] = &unk_1E21E4050;
  v5[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
  tabIDToTabPositionForTabsInTransit = self->_tabIDToTabPositionForTabsInTransit;
  self->_tabIDToTabPositionForTabsInTransit = 0;

}

void __72__SFWebExtensionsController_fireAppropriateTabMovementEventForTabState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "objectForKeyedSubscript:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v7, "_findTabInAnyWindowWithID:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "windowID");
      v10 = v9;
      objc_msgSend(v6, "windowID");
      v12 = v11;
      v13 = objc_msgSend(v5, "index");
      v14 = objc_msgSend(v6, "index");
      v15 = *(void **)(a1 + 32);
      if (v10 == v12)
        objc_msgSend(v15, "didMoveTab:fromIndex:toIndex:", v8, v14, v13);
      else
        objc_msgSend(v15, "didMoveTab:fromWindowWithID:indexInOldWindow:", v8, v14, v12);
    }

  }
}

- (void)fireOnMovedEventForTabsWithPreviousTabPositions:(id)a3 currentTabsPositions:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SFWebExtensionsController *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__SFWebExtensionsController_fireOnMovedEventForTabsWithPreviousTabPositions_currentTabsPositions___block_invoke;
  v8[3] = &unk_1E21E4078;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __98__SFWebExtensionsController_fireOnMovedEventForTabsWithPreviousTabPositions_currentTabsPositions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v7, "_findTabInAnyWindowWithID:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "didMoveTab:fromIndex:toIndex:", v8, objc_msgSend(v6, "index"), objc_msgSend(v5, "index"));

}

- (void)fireAttachmentEventsForTabsWithPreviousTabPositions:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__SFWebExtensionsController_fireAttachmentEventsForTabsWithPreviousTabPositions___block_invoke;
  v3[3] = &unk_1E21E4050;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __81__SFWebExtensionsController_fireAttachmentEventsForTabsWithPreviousTabPositions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v6, "_findTabInAnyWindowWithID:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "windowID");
  objc_msgSend(v8, "didMoveTab:fromWindowWithID:indexInOldWindow:", v7, objc_msgSend(v5, "index"), v9);

}

- (id)_allWindowsForWebExtension:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
  objc_msgSend(WeakRetained, "sfWebExtensionsControllerAllWindows:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SFWebExtensionsController__allWindowsForWebExtension___block_invoke;
  v10[3] = &unk_1E21E40A0;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__SFWebExtensionsController__allWindowsForWebExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "isPrivate")
    && (objc_msgSend(*(id *)(a1 + 32), "allowedInPrivateBrowsing") & 1) == 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "extensionsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

  }
  return v7;
}

- (id)lastFocusedWindow
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
  objc_msgSend(WeakRetained, "sfWebExtensionsControllerLastFocusedWindow:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didDeactivateWindow
{
  -[WBSWebExtensionsController didActivateWindow:](self, "didActivateWindow:", 0);
}

- (void)_clearNewTabPreferenceIfNecessaryForRemovedExtensionWithComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_extensionDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionsController tabOverridePreferencesManager](self, "tabOverridePreferencesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionComposedIdentifierForNewTabPreferenceInDefaults:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v9);

  if (v7)
  {
    -[WBSWebExtensionsController tabOverridePreferencesManager](self, "tabOverridePreferencesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearNewTabBehaviorInDefaults:fromUserGesture:", v4, 0);

  }
}

- (void)_showAccessRequestAlertForExtension:(id)a3 domains:(id)a4 callingAPIName:(id)a5 responseBlock:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__SFWebExtensionsController__showAccessRequestAlertForExtension_domains_callingAPIName_responseBlock___block_invoke;
  v12[3] = &unk_1E21E40C8;
  v13 = v10;
  v11 = v10;
  -[SFWebExtensionsController showAccessRequestDialogForExtension:domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:](self, "showAccessRequestDialogForExtension:domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:", a3, a4, a5, 0, 1, v12);

}

uint64_t __102__SFWebExtensionsController__showAccessRequestAlertForExtension_domains_callingAPIName_responseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_safariShortVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_shortVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIViewController)viewControllerToPresentDialogsFrom
{
  void *v3;
  void *v4;
  void *WeakRetained;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  {
    while (1)
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        break;
      objc_msgSend(WeakRetained, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isBeingDismissed");

      if ((v8 & 1) != 0)
        break;
      objc_msgSend(WeakRetained, "presentedViewController");
      v9 = objc_claimAutoreleasedReturnValue();

      WeakRetained = (void *)v9;
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToPresentDialogsFrom);
  }
  return (UIViewController *)WeakRetained;
}

- (BOOL)parentalControlsAreEnabledForExtensions
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isWebFilterEnabled") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "usesAllowedSitesOnly");

  return v3;
}

- (id)_deviceUUIDString
{
  void *v2;
  void *v3;

  +[SFDeviceUtilities deviceUUID](SFDeviceUtilities, "deviceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tabGroupManager
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sfWebExtensionsControllerTabGroupManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)profile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[WBSExtensionsController profileServerID](self, "profileServerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWebExtensionsController tabGroupManager](self, "tabGroupManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__SFWebExtensionsController_profile__block_invoke;
  v9[3] = &unk_1E21E4118;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "safari_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __36__SFWebExtensionsController_profile__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifierForExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)hasNamedProfiles
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SFWebExtensionsController tabGroupManager](self, "tabGroupManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "namedProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)webExtensionsControllerForProfileServerID:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sfWebExtensionsController:forProfileServerID:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)contentBlockerManagerForProfileServerID:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sfWebExtensionsControllerContentBlockerManager:forProfileServerID:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)allWebExtensionControllers
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  objc_msgSend(WeakRetained, "sfWebExtensionsControllersForAllProfiles:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)allContentBlockerManagers
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profileDelegate);
  objc_msgSend(WeakRetained, "sfWebExtensionsControllersContentBlockerManagersForAllProfiles:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)_domainForDefaultSearchProvider
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8ADE8]));
  objc_msgSend(WeakRetained, "sfWebExtensionsControllerDomainForDefaultSearchProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WKProcessPool)processPool
{
  return self->_processPool;
}

- (NSString)applicationNameForUserAgent
{
  return self->_applicationNameForUserAgent;
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (void)setTabIDToTabPositionForTabsInTransit:(id)a3
{
  objc_storeStrong((id *)&self->_tabIDToTabPositionForTabsInTransit, a3);
}

- (WKContentRuleListStore)contentBlockerStore
{
  return self->_contentBlockerStore;
}

- (SFWebExtensionControllerProfileDelegate)profileDelegate
{
  return (SFWebExtensionControllerProfileDelegate *)objc_loadWeakRetained((id *)&self->_profileDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profileDelegate);
  objc_storeStrong((id *)&self->_tabIDToTabPositionForTabsInTransit, 0);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_storeStrong((id *)&self->_applicationNameForUserAgent, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_contentBlockerStore, 0);
  objc_destroyWeak((id *)&self->_viewControllerToPresentDialogsFrom);
  objc_storeStrong((id *)&self->_blocklistQueue, 0);
  objc_storeStrong((id *)&self->_stubUnsupportedAPIsUserDefaultObserver, 0);
  objc_storeStrong((id *)&self->_queueOfExtensionsToShowInPermissionBanner, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
}

void __78__SFWebExtensionsController__isExtensionBlockedByBlocklist_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138478083;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_1_1(&dword_18B7B2000, a3, (uint64_t)a3, "Parent app for web extension with identifier %{private}@ is not a trusted app. %@", (uint8_t *)&v4);
}

- (void)_extensionWithComposedIdentifier:(uint8_t *)buf wasEnabledOrDisabledByExtensionSettings:(os_log_t)log .cold.1(void *a1, char a2, uint8_t *buf, os_log_t log)
{
  const __CFString *v5;

  v5 = CFSTR("disabled");
  if ((a2 & 1) != 0)
    v5 = CFSTR("enabled");
  *(_DWORD *)buf = 138478083;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_18B7B2000, log, OS_LOG_TYPE_DEBUG, "Extension with identifier %{private}@ was %{public}@ by Settings, but is already in that state", buf, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

- (void)_developerIdentifierForExtension:(uint64_t)a3 untrustedCodeSigningDictionary:(NSObject *)a4 .cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138478083;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_1(&dword_18B7B2000, a4, a3, "Developer identifier for extension with identifier %{private}@ couldn't be determined because LSApplicationExtensionRecord couldn't be allocated: error %{public}@", (uint8_t *)a3);

  OUTLINED_FUNCTION_0_2();
}

- (void)_developerIdentifierForExtension:(os_log_t)log untrustedCodeSigningDictionary:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Developer identifier for extension with identifier %{private}@ couldn't be determined because extension isn't in an app bundle", buf, 0xCu);

  OUTLINED_FUNCTION_0_2();
}

@end
