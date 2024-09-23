@implementation GKDetailViewController

- (void)reportProblemAboutPlayer:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "alertUserInStoreDemoModeEnabled");

  if ((v6 & 1) == 0)
  {
    -[GKDetailViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke;
    v9[3] = &unk_1E59C5108;
    v9[4] = self;
    v8 = +[GKReportProblemRemoteUIController controllerForProblemPlayer:completionHandler:](GKReportProblemRemoteUIController, "controllerForProblemPlayer:completionHandler:", v4, v9);
  }

}

void __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  GKRemoteUINavigationController *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  GKRemoteUINavigationController *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  void *v28;
  uint64_t v29;
  GKRemoteUINavigationController *v30;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    GKGameCenterUIFrameworkBundle();
    v9 = (GKRemoteUINavigationController *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v8, "_gkPresentAlertForError:title:defaultMessage:", v6, v10, v12);

  }
  else
  {
    v14 = -[GKRemoteUINavigationController initWithRemoteUIController:]([GKRemoteUINavigationController alloc], "initWithRemoteUIController:", v5);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 == 1)
    {
      if (*MEMORY[0x1E0D253F8])
        v17 = *MEMORY[0x1E0D25B68] == 0;
      else
        v17 = 0;
      if (!v17)
      {
        -[GKRemoteUINavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 2);
        -[GKRemoteUINavigationController view](v14, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setMasksToBounds:", 1);

        objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "formSheetCornerRadius");
        v22 = v21;
        -[GKRemoteUINavigationController view](v14, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCornerRadius:", v22);

      }
    }
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke_2;
    v28 = &unk_1E59C50E0;
    v29 = *(_QWORD *)(a1 + 32);
    v30 = v14;
    v9 = v14;
    objc_msgSend(v5, "setCompletionHandler:", &v25);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0, v25, v26, v27, v28, v29);

  }
}

uint64_t __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v4, "_gkPresentAlertWithTitle:message:buttonTitle:", v6, v8, v10);

  }
  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GKDetailViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDetailViewController;
  -[GKDashboardCollectionViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDetailViewController;
  -[GKDetailViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)shareAchievement:(id)a3 sendingView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldAllowSharing");

  if (v9)
  {
    v18[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[GKDetailViewController _gkPresentActivityViewControllerForActivityItems:fromView:withCompletionHandler:](self, "_gkPresentActivityViewControllerForActivityItems:fromView:withCompletionHandler:", v10, v7, 0);
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[GKDetailViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v12, v14, v16, 0);

  }
}

- (void)shareScore:(id)a3 fromLeaderboard:(id)a4 sendingView:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldAllowSharing");

  if (v10)
  {
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)-[GKDetailViewController _gkPresentActivityViewControllerForActivityItems:fromView:withCompletionHandler:](self, "_gkPresentActivityViewControllerForActivityItems:fromView:withCompletionHandler:", v11, v8, 0);
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)-[GKDetailViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v13, v15, v17, 0);

  }
}

@end
