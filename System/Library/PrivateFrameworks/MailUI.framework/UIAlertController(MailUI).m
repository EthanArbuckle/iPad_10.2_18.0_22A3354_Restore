@implementation UIAlertController(MailUI)

+ (id)mf_actionSheetWithTitle:()MailUI cancellationHandler:
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0DC3450];
  v6 = a4;
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", a3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  objc_msgSend(v7, "mf_addCancelActionWithHandler:", v6);

  return v7;
}

- (void)mf_addCancelActionWithHandler:()MailUI
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC3448];
  v5 = a3;
  _EFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 1, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addAction:", v7);
}

- (void)mf_presentFromViewController:()MailUI withSource:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "popoverPresentationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mui_setAsSourceForPopoverPresentationController:", v8);

  objc_msgSend(v7, "presentViewController:animated:completion:", a1, 1, 0);
}

- (void)mf_presentConfirmationSheetFromViewController:()MailUI withSource:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "popoverPresentationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "mui_setAsSourceWithExtendedRectForPopoverPresentationController:", v8);
  else
    objc_msgSend(v6, "mui_setAsSourceForPopoverPresentationController:", v8);

  objc_msgSend(v7, "presentViewController:animated:completion:", a1, 1, 0);
}

@end
