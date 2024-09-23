@implementation CSResetRestoreViewController

- (CSResetRestoreViewController)initWithStatusProvider:(id)a3
{
  id v5;
  CSResetRestoreViewController *v6;
  CSResetRestoreViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSResetRestoreViewController;
  v6 = -[CSResetRestoreViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_statusProvider, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CSModalViewControllerBase view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSResetRestoreViewController _currentTextForResetOrRestoreState](self, "_currentTextForResetOrRestoreState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  v5.receiver = self;
  v5.super_class = (Class)CSResetRestoreViewController;
  -[CSModalViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);

}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CSResetRestoreViewController;
  v4 = a3;
  -[CSModalViewControllerBase aggregateAppearance:](&v16, sel_aggregateAppearance_, v4);
  +[CSComponent homeAffordance](CSComponent, "homeAffordance", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 80);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hidden:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v9);

  +[CSComponent proudLock](CSComponent, "proudLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "priority:", 80);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hidden:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v12);

  +[CSComponent whitePoint](CSComponent, "whitePoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "priority:", 80);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hidden:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v15);

}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSResetRestoreViewController;
  v3 = a3;
  -[CSModalViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "addRestrictedCapabilities:", 1048632, v4.receiver, v4.super_class);

}

- (int64_t)presentationPriority
{
  return 590;
}

- (id)_currentTextForResetOrRestoreState
{
  void *v3;
  int v4;
  CSResetRestoreStatusProviding *statusProvider;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CSResetRestoreStatusProviding isRestoring](self->_statusProvider, "isRestoring");
  statusProvider = self->_statusProvider;
  if (v4)
  {
    switch(-[CSResetRestoreStatusProviding restoreState](statusProvider, "restoreState"))
    {
      case 1:
        goto LABEL_8;
      case 2:
        v6 = CFSTR("RESTORE_COMPLETE");
        goto LABEL_13;
      case 3:
        v6 = CFSTR("RESTORE_CANCELING");
        goto LABEL_13;
      case 4:
        v6 = CFSTR("RESTORE_FAILED");
        goto LABEL_13;
      default:
        goto LABEL_9;
    }
  }
  if (!-[CSResetRestoreStatusProviding isResetting](statusProvider, "isResetting"))
  {
LABEL_8:
    v6 = CFSTR("RESTORE_IN_PROGRESS");
LABEL_13:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v6, &stru_1E8E30B28, CFSTR("CoverSheet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v7 = -[CSResetRestoreStatusProviding resetState](self->_statusProvider, "resetState");
  if (v7 == 2)
  {
    v6 = CFSTR("RESET_COMPLETE");
    goto LABEL_13;
  }
  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("RESET_IN_PROGRESS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", v8, &stru_1E8E30B28, CFSTR("CoverSheet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

@end
