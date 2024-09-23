@implementation UIAlertController(MCUI)

- (void)MCUIAddActionWithTitle:()MCUI style:completion:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__UIAlertController_MCUI__MCUIAddActionWithTitle_style_completion___block_invoke;
    v13[3] = &unk_1EA2B5EB8;
    v14 = v9;
    v11 = (void *)MEMORY[0x1DF0AD9A4](v13);

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v8, a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addAction:", v12);

}

- (void)MCUIAddCancelActionWithTitle:()MCUI
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addAction:", v4);

}

- (void)MCUIShowFromController:()MCUI
{
  id v4;
  id v5;
  id v6;
  int v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v6 = objc_initWeak(&location, v4);
  v7 = objc_msgSend(v4, "_isTransitioning");

  if (!v7)
  {
    objc_destroyWeak(&location);
LABEL_5:
    objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__UIAlertController_MCUI__MCUIShowFromController___block_invoke;
  v9[3] = &unk_1EA2B6758;
  objc_copyWeak(&v11, &location);
  v10 = v5;
  v8 = objc_loadWeakRetained(&location);
  objc_msgSend(v8, "setShowViewControllerCompletionBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
LABEL_6:

}

+ (uint64_t)MCUIShowWatchUnavailableAlertWithCompletion:()MCUI
{
  return BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
}

+ (void)MCUIShowRebootAlertFromViewController:()MCUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  if (MCUIForPairedDevice())
  {
    NSLog(CFSTR("Showing Reboot Message for Watch"));
    MCUILocalizedString(CFSTR("REBOOT_SUGGESTED_TITLE_WATCH"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MCUILocalizedString(CFSTR("REBOOT_SUGGESTED_TEXT_WATCH"));
  }
  else
  {
    NSLog(CFSTR("Showing Reboot Message for phone/ipad/ipod"));
    MCUILocalizedString(CFSTR("REBOOT_SUGGESTED_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MCUILocalizedStringByDevice(CFSTR("REBOOT_SUGGESTED_TEXT"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA2E0];
  MCUILocalizedString(CFSTR("REBOOT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, &__block_literal_global_8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  MCUILocalizedString(CFSTR("NOTNOW"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__UIAlertController_MCUI__MCUIShowRebootAlertFromViewController___block_invoke_2;
  v15[3] = &unk_1EA2B5E68;
  v16 = v3;
  v17 = v6;
  v13 = v6;
  v14 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

+ (void)MCUIShowAlertForError:()MCUI fromViewController:suggestedTitle:suggestedMessage:completion:
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!MCUIForPairedDevice())
  {
    v21 = v25;
LABEL_7:
    NSLog(CFSTR("MCUI presenting alert '%@' - '%@' for error: %@"), v12, v13, v21);
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MCUILocalizedString(CFSTR("OK"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "MCUIAddCancelActionWithTitle:", v23);

    objc_msgSend(v11, "MCUITopViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "presentViewController:animated:completion:", v22, 1, v14);

    goto LABEL_8;
  }
  objc_msgSend(v25, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("NSSErrorDomain"));

  if (v16)
  {
    objc_msgSend(v25, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "localizedDescription");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "localizedRecoverySuggestion");
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = v20;
    v12 = v19;
  }
  v21 = v25;
  if (v12 | v13)
    goto LABEL_7;
  NSLog(CFSTR("MCUI presenting Watch unreachable alert for unknown error: %@"), v25);
  objc_msgSend(MEMORY[0x1E0CEA2E8], "MCUIShowWatchUnavailableAlertWithCompletion:", v14);
LABEL_8:

}

@end
