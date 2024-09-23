@implementation UIViewController(GKChallengeAdditions)

- (void)_gkPresentChallengeVC:()GKChallengeAdditions
{
  id v4;
  _BYTE *v5;
  GKNavigationController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v4 = a3;
  v5 = (_BYTE *)MEMORY[0x1E0D253F8];
  v33 = v4;
  if (!*MEMORY[0x1E0D253F8])
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    v4 = v33;
    if (v17 != 1 || (*v5 ? (v18 = *MEMORY[0x1E0D25B68] == 0) : (v18 = 0), v18))
    {
      v6 = -[GKNavigationController initWithRootViewController:]([GKNavigationController alloc], "initWithRootViewController:", v33);
      -[GKNavigationController navigationBar](v6, "navigationBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_gkApplyTheme:navbarStyle:", v20, 1);

      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "userInterfaceIdiom");

      if (v22 == 1)
      {
        -[GKNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 16);
        objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "formSheetSize");
        -[GKNavigationController setFormSheetSize:](v6, "setFormSheetSize:");

      }
      objc_msgSend(a1, "setWantsFullScreenLayout:", 1);
      objc_msgSend(a1, "_popoverController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "delegate");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        objc_msgSend(a1, "_popoverController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(a1, "_popoverController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "delegate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_24;
        }
      }
      else
      {

      }
      objc_msgSend(a1, "navigationController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      objc_msgSend(v31, "presentViewController:animated:completion:", v6, 1, &__block_literal_global_99);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v31, "dismissPopoverAnimated:", 0);
      }
      else
      {
        objc_msgSend(a1, "_popoverController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "dismissPopoverAnimated:", 0);

      }
      goto LABEL_21;
    }
  }
  objc_msgSend(v4, "view");
  v6 = (GKNavigationController *)objc_claimAutoreleasedReturnValue();
  -[GKNavigationController setBackgroundColor:](v6, "setBackgroundColor:", 0);
  -[GKNavigationController setOpaque:](v6, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    v14 = v11 > 1024.0;
    if (v13 > 1024.0)
      v14 = 1;
    v15 = 320.0;
    if (v14)
      v15 = 375.0;
  }
  else
  {
    v15 = 320.0;
  }
  objc_msgSend(v33, "setPreferredContentSize:", v15, 440.0);
  objc_msgSend(a1, "navigationController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "pushViewController:animated:", v33, 1);
LABEL_21:

}

- (uint64_t)_gkPresentSendDialogForChallenge:()GKChallengeAdditions selectPlayers:defaultMessage:
{
  return objc_msgSend(a1, "_gkPresentSendDialogForChallenge:selectPlayers:defaultMessage:complete:", a3, a4, a5, 0);
}

- (void)_gkPresentSendDialogForChallenge:()GKChallengeAdditions selectPlayers:defaultMessage:complete:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__3;
  v19[4] = __Block_byref_object_dispose__3;
  v20 = 0;
  v17 = v19;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke;
  v18[3] = &unk_1E59C6398;
  v18[4] = a1;
  v18[5] = v19;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke_2;
  v15[3] = &unk_1E59C63E0;
  v14 = v13;
  v15[4] = a1;
  v16 = v14;
  +[GKChallengeComposeController composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:](GKChallengeComposeController, "composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:", v10, v11, v12, 0, v18, v15);

  _Block_object_dispose(v19, 8);
}

@end
