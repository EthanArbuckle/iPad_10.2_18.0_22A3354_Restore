@implementation SFWebExtensionsController(SafariServicesExtras)

- (uint64_t)webProcessIDForDialogController:()SafariServicesExtras
{
  return 1;
}

- (void)cancelPresentedDialogIfNecessaryAndUnqueuePendingWebExtensionDialogs
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_dialogController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPresentedDialogIfNeeded");

  objc_msgSend(a1, "_dialogController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentNextDialogIfNeeded");

}

- (id)_dialogController
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (int)*MEMORY[0x1E0D4EFA8];
  v3 = *(void **)(a1 + v2);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D4EC68]);
    v5 = *(void **)(a1 + v2);
    *(_QWORD *)(a1 + v2) = v4;

    objc_msgSend(*(id *)(a1 + v2), "setViewControllerPresenter:", a1);
    objc_msgSend(*(id *)(a1 + v2), "setDialogPresenter:", a1);
    objc_msgSend(*(id *)(a1 + v2), "setDelegate:", a1);
    v3 = *(void **)(a1 + v2);
  }
  return v3;
}

- (BOOL)_createTabWithURL:()SafariServicesExtras inWindow:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "navigationIntentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v9, "setPreferredTabOrder:", 1);
    objc_msgSend(v9, "setPrefersRelationToSourceTab:", 0);
    objc_msgSend(v9, "navigationIntentWithURL:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&a1[*MEMORY[0x1E0D8ADE8]]);
      objc_msgSend(WeakRetained, "sfWebExtensionsController:navigationIntentUUIDForWindow:", a1, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSourceWindowUUID:", v12);

    }
    objc_msgSend(v8, "dispatchNavigationIntent:", v10);

  }
  return v8 != 0;
}

- (void)showAccessRequestDialogForExtension:()SafariServicesExtras URLs:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:
{
  id v14;
  id v15;
  id v16;
  id v17;

  v14 = a8;
  v15 = a5;
  v16 = a3;
  objc_msgSend(a4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_60);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "showAccessRequestDialogForExtension:domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:", v16, v17, v15, a6, a7, v14);

}

- (void)showAccessRequestDialogForExtension:()SafariServicesExtras domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v13 = a3;
  v14 = a4;
  v15 = a8;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "safari_sortedArrayUsingFinderLikeSorting");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dialogController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EC60], "webExtensionPermissionDialogWithExtension:domains:showMoreOptionsForAlwaysAllow:includeDenyButton:completionHandler:", v13, v16, a6, a7, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentDialog:", v18);

  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SFWebExtensionsController(SafariServicesExtras) showAccessRequestDialogForExtension:domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:].cold.1(v19);
  }

}

- (void)showAlwaysAllowConfirmationDialogForExtension:()SafariServicesExtras domains:includeDenyButton:responseBlock:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a1, "_dialogController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D4EC60];
  objc_msgSend(v11, "safari_sortedArrayUsingFinderLikeSorting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "webExtensionAlwaysAllowDialogWithExtension:domains:includeDenyButton:completionHandler:", v12, v14, a5, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "presentDialog:", v15);
}

- (void)showPromptForExtensionDisabledBecauseItDoesNotSupportThisVersionOfSafariWithMessage:()SafariServicesExtras extensionIdentifier:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_dialogController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D4EC60];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "genericErrorDialogWithTitle:message:applicationModal:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "presentDialog:", v7);
}

- (void)showPromptForBlocklistedExtension:()SafariServicesExtras extensionName:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  objc_msgSend(a1, "_dialogController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D4EC60];
  v7 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "genericErrorDialogWithTitle:message:applicationModal:", v9, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentDialog:", v13);

}

- (void)showPromptForExpiredExtension:()SafariServicesExtras extensionName:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  objc_msgSend(a1, "_dialogController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D4EC60];
  v7 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "genericErrorDialogWithTitle:message:applicationModal:", v9, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentDialog:", v10);

}

- (void)_showPromptForExtensionDisabledBecauseItHasRequestedAdditionalPermissions:()SafariServicesExtras extensionIdentifier:
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "_dialogController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EC60], "webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension:completionHandler:", v4, &__block_literal_global_11_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentDialog:", v5);
}

- (void)createNewTabFromBackgroundPageWithURL:()SafariServicesExtras
{
  id *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v4 = (id *)&a1[*MEMORY[0x1E0D8ADE8]];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "sfWebExtensionsControllerLastFocusedWindow:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createTabWithURL:inWindow:", v5, v6);

}

- (void)dialogController:()SafariServicesExtras presentViewController:withAdditionalAnimations:
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a1, "viewControllerToPresentDialogsFrom");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);
  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v7);

}

- (void)dialogController:()SafariServicesExtras dismissViewController:withAdditionalAnimations:
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  v8 = a4;
  objc_msgSend(v8, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v6);
}

- (uint64_t)dialogController:()SafariServicesExtras presentationPolicyForDialog:
{
  void *v1;
  _BOOL4 v2;

  objc_msgSend(a1, "viewControllerToPresentDialogsFrom");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 == 0;

  return 2 * v2;
}

- (void)presentDialogView:()SafariServicesExtras withAdditionalAnimations:forDialogController:
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __break(0xC471u);
}

- (void)dismissDialogView:()SafariServicesExtras withAdditionalAnimations:forDialogController:
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __break(0xC471u);
}

- (void)showAccessRequestDialogForExtension:()SafariServicesExtras domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "showAccessRequestDialogForExtension called with empty array of domains.", v1, 2u);
}

@end
