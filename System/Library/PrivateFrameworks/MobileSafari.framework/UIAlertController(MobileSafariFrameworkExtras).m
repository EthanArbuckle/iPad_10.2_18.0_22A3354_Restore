@implementation UIAlertController(MobileSafariFrameworkExtras)

+ (id)safari_closeAllTabsConfirmationWithCloseAllLabel:()MobileSafariFrameworkExtras closeHandler:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DC3450];
  v7 = a3;
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("ConfirmCloseAllTabsAlert"));

  v11 = (void *)MEMORY[0x1E0DC3448];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__UIAlertController_MobileSafariFrameworkExtras__safari_closeAllTabsConfirmationWithCloseAllLabel_closeHandler___block_invoke;
  v20[3] = &unk_1E21E5B10;
  v21 = v5;
  v12 = v5;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v7, 2, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v13);
  objc_msgSend(v9, "actions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("CloseAllTabsButton"));

  v16 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v18);

  return v9;
}

@end
