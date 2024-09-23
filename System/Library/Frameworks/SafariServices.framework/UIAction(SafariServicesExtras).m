@implementation UIAction(SafariServicesExtras)

+ (id)safari_actionWithTarget:()SafariServicesExtras selector:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10[2];
  BOOL v11;
  id location;

  v5 = a3;
  objc_initWeak(&location, v5);
  v6 = (void *)MEMORY[0x1E0DC3428];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__UIAction_SafariServicesExtras__safari_actionWithTarget_selector___block_invoke;
  v9[3] = &unk_1E4AC3218;
  objc_copyWeak(v10, &location);
  v11 = v5 == 0;
  v10[1] = a4;
  objc_msgSend(v6, "actionWithHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v7;
}

+ (id)_sf_openInNewTabActionWithHandler:()SafariServicesExtras
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__UIAction_SafariServicesExtras___sf_openInNewTabActionWithHandler___block_invoke;
  v8[3] = &unk_1E4AC16D0;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A8598C40](v8);
  objc_msgSend(MEMORY[0x1E0DC3428], "_sf_openInNewTabActionWithTabOrder:handler:identifierSuffix:", 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)_sf_openInNewTabActionsWithHandler:()SafariServicesExtras
{
  return objc_msgSend(a1, "_sf_openInNewTabActionsWithHandler:identifierSuffix:", a3, 0);
}

+ (id)_sf_openInNewTabActionsWithHandler:()SafariServicesExtras identifierSuffix:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_sf_openInNewTabActionWithTabOrder:handler:identifierSuffix:", 1, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(a1, "_sf_openInNewTabActionWithTabOrder:handler:identifierSuffix:", 2, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_sf_openInNewTabActionWithTabOrder:()SafariServicesExtras handler:identifierSuffix:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(MEMORY[0x1E0D4EF68], "effectiveTabOrderWithPreferredTabOrder:", a3);
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.square.on.square"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3428];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __94__UIAction_SafariServicesExtras___sf_openInNewTabActionWithTabOrder_handler_identifierSuffix___block_invoke;
  v22 = &unk_1E4AC3240;
  v13 = v7;
  v23 = v13;
  v24 = a3;
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v10, v11, 0, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8)
  {
    v16 = CFSTR("Foreground");
    if (v9 == 2)
      v16 = CFSTR("Background");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OpenInNewTab%@%@"), v16, v8, v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityIdentifier:", v17);

  }
  else
  {
    objc_msgSend(v14, "setAccessibilityIdentifier:", 0);
  }

  return v15;
}

+ (id)_sf_debugKillWebProcessActionForWebView:()SafariServicesExtras
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __74__UIAction_SafariServicesExtras___sf_debugKillWebProcessActionForWebView___block_invoke;
  v15 = &unk_1E4ABFA58;
  v16 = v3;
  v6 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", CFSTR("Kill Web Process"), v5, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributes:", 2);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_msgSend(v6, "_webProcessIdentifier");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("PID %d"), v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v10);

  return v7;
}

@end
