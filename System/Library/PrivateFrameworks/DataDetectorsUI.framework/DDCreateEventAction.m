@implementation DDCreateEventAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Create Event"));
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  objc_msgSend(a3, "setEditViewDelegate:", 0, a4);
  -[DDAddEventAction viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAction:", 0);

  -[DDAddEventAction setViewController:](self, "setViewController:", 0);
  -[DDAction delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[DDAction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[DDAction delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actionDidFinish:", self);

    }
  }
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3;

  v3 = +[DDRemoteActionViewController prepareViewController:forAction:actionController:](DDRemoteActionViewController, "prepareViewController:forAction:actionController:", CFSTR("DDEventEditViewController"), self, a3);
}

@end
