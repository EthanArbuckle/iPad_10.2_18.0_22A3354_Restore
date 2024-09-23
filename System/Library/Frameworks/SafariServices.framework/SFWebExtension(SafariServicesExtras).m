@implementation SFWebExtension(SafariServicesExtras)

- (void)_loadToolbarItem
{
  SFWebExtensionPageMenuController *v2;

  v2 = -[SFWebExtensionPageMenuController initWithExtension:]([SFWebExtensionPageMenuController alloc], "initWithExtension:", a1);
  objc_msgSend(a1, "setToolbarItem:", v2);

}

- (void)_unloadToolbarItem
{
  id v1;

  objc_msgSend(a1, "toolbarItem");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissPopupImmediatelyIfNecessary");

}

- (void)_validateToolbarItemInAllWindows
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "showOrHidePermissionRequestBannerIfNeeded");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "extensionsController", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_allWindowsForWebExtension:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "validateToolbarItemForExtension:", a1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
