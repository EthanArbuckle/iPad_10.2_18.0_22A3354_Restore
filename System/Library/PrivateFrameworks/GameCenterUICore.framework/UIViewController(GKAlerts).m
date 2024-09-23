@implementation UIViewController(GKAlerts)

+ (id)_gkKeyWindowRootViewController
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:
{
  return objc_msgSend(a1, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", a3, a4, a5, 0);
}

- (uint64_t)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:dismissHandler:
{
  return objc_msgSend(a1, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:presentationCompletionHandler:", a3, a4, a5, a6, 0);
}

- (id)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:dismissHandler:presentationCompletionHandler:
{
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v12 = a6;
  v13 = (void *)MEMORY[0x24BDF67F0];
  v14 = a7;
  v15 = a5;
  objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDF67E8];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __120__UIViewController_GKAlerts___gkPresentAlertWithTitle_message_buttonTitle_dismissHandler_presentationCompletionHandler___block_invoke;
  v21[3] = &unk_24DC27F70;
  v22 = v12;
  v18 = v12;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v15, 0, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v19);
  objc_msgSend(a1, "presentViewController:animated:completion:", v16, 1, v14);

  return v16;
}

- (id)_gkPresentConfirmationAlertWithTitle:()GKAlerts message:buttonTitle:block:cancelAction:
{
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v12 = a6;
  v13 = (void *)MEMORY[0x24BDF67F0];
  v14 = a7;
  v15 = a5;
  objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDF67E8];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __106__UIViewController_GKAlerts___gkPresentConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke;
  v21[3] = &unk_24DC27F70;
  v22 = v12;
  v18 = v12;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v15, 0, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v19);
  objc_msgSend(v16, "_gkAddCancelButtonWithAction:", v14);

  objc_msgSend(v16, "setPreferredAction:", v19);
  objc_msgSend(a1, "presentViewController:animated:completion:", v16, 1, 0);

  return v16;
}

- (id)_gkPresentAlertForError:()GKAlerts title:defaultMessage:
{
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+GKAlerts.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+GKAlerts.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title != nil"));

LABEL_3:
  objc_msgSend(v9, "localizedDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!(v11 | v12))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+GKAlerts.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedDescription != nil || defaultMessage != nil"));

    goto LABEL_5;
  }
  v14 = (id)v12;
  if (!v13)
LABEL_5:
    v14 = (id)v11;
  v15 = v14;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v10, v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDF67E8];
  GKGameCenterUIFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, &__block_literal_global_12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v20);
  objc_msgSend(a1, "presentViewController:animated:completion:", v16, 1, 0);

  return v16;
}

- (id)_gkAlertControllerForBarButtonItem:()GKAlerts
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    if (*MEMORY[0x24BE3A2C0])
      v7 = _GKIsRemoteUIUsingPadIdiom == 0;
    else
      v7 = 0;
    if (!v7)
    {
      objc_msgSend(v4, "setModalPresentationStyle:", 7);
      objc_msgSend(v4, "popoverPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPermittedArrowDirections:", 15);
      objc_msgSend(v8, "setBarButtonItem:", v3);

    }
  }

  return v4;
}

@end
