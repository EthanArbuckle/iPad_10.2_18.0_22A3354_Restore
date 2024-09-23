@implementation ICHandwritingDebugPresenter

- (ICHandwritingDebugPresenter)initWithPresentingViewController:(id)a3 presentationStyle:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  ICHandwritingDebugPresenter *v11;
  ICHandwritingDebugPresenter *v12;
  uint64_t v13;
  NSUserDefaults *userDefaults;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICHandwritingDebugPresenter;
  v11 = -[ICHandwritingDebugPresenter init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_presentingViewController, a3);
    v12->_presentationStyle = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = objc_claimAutoreleasedReturnValue();
    userDefaults = v12->_userDefaults;
    v12->_userDefaults = (NSUserDefaults *)v13;

  }
  return v12;
}

- (void)show
{
  unint64_t v3;
  ICHandwritingDebugWindow *v4;
  void *v5;
  ICHandwritingDebugWindow *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ICHandwritingDebugPillOrnamentViewController *v17;
  void *v18;
  void *v19;
  ICHandwritingDebugPillOrnamentViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  self->_isShowing = 1;
  v3 = -[ICHandwritingDebugPresenter presentationStyle](self, "presentationStyle");
  if (v3 == 1)
  {
    v17 = [ICHandwritingDebugPillOrnamentViewController alloc];
    -[ICHandwritingDebugPresenter presentingViewController](self, "presentingViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugPresenter delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICHandwritingDebugPillOrnamentViewController initWithRootViewController:delegate:](v17, "initWithRootViewController:delegate:", v18, v19);
    -[ICHandwritingDebugPresenter setHandwritingDebugPillOrnamentViewController:](self, "setHandwritingDebugPillOrnamentViewController:", v20);

    -[ICHandwritingDebugPresenter presentingViewController](self, "presentingViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugPresenter handwritingDebugPillOrnamentViewController](self, "handwritingDebugPillOrnamentViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTintColor:", v23);

    -[ICHandwritingDebugPresenter handwritingDebugPillOrnamentViewController](self, "handwritingDebugPillOrnamentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "show");
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = [ICHandwritingDebugWindow alloc];
    -[ICHandwritingDebugPresenter delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICHandwritingDebugWindow initWithDelegate:](v4, "initWithDelegate:", v5);
    -[ICHandwritingDebugPresenter setHandwritingDebugWindow:](self, "setHandwritingDebugWindow:", v6);

    -[ICHandwritingDebugPresenter presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugPresenter handwritingDebugWindow](self, "handwritingDebugWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v9);

    -[ICHandwritingDebugPresenter handwritingDebugWindow](self, "handwritingDebugWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHandwritingDebugPresenter presentingViewController](self, "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWindowScene:", v15);

    -[ICHandwritingDebugPresenter handwritingDebugWindow](self, "handwritingDebugWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "makeKeyAndVisible");
LABEL_5:

  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_refresh, 0, 1, 1.0);
  -[ICHandwritingDebugPresenter setHandwritingDebugSelectorDelayer:](self, "setHandwritingDebugSelectorDelayer:", v26);

  -[ICHandwritingDebugPresenter userDefaults](self, "userDefaults");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBool:forKey:", 1, CFSTR("ShowHandwritingWindow"));

}

- (void)hide
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  self->_isShowing = 0;
  v3 = -[ICHandwritingDebugPresenter presentationStyle](self, "presentationStyle");
  if (v3 == 1)
  {
    -[ICHandwritingDebugPresenter handwritingDebugPillOrnamentViewController](self, "handwritingDebugPillOrnamentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hide");

    -[ICHandwritingDebugPresenter setHandwritingDebugPillOrnamentViewController:](self, "setHandwritingDebugPillOrnamentViewController:", 0);
  }
  else if (!v3)
  {
    -[ICHandwritingDebugPresenter handwritingDebugWindow](self, "handwritingDebugWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[ICHandwritingDebugPresenter setHandwritingDebugWindow:](self, "setHandwritingDebugWindow:", 0);
  }
  -[ICHandwritingDebugPresenter setHandwritingDebugSelectorDelayer:](self, "setHandwritingDebugSelectorDelayer:", 0);
  -[ICHandwritingDebugPresenter userDefaults](self, "userDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", 0, CFSTR("ShowHandwritingWindow"));

}

- (void)refresh
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = -[ICHandwritingDebugPresenter presentationStyle](self, "presentationStyle");
  if (v3 == 1)
  {
    -[ICHandwritingDebugPresenter handwritingDebugPillOrnamentViewController](self, "handwritingDebugPillOrnamentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
      return;
    -[ICHandwritingDebugPresenter handwritingDebugWindow](self, "handwritingDebugWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "refresh");

}

- (BOOL)usesPillOrnament
{
  return objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (ICHandwritingDebugDelegate)delegate
{
  return (ICHandwritingDebugDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isShowing
{
  return self->_isShowing;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (ICHandwritingDebugPillOrnamentViewController)handwritingDebugPillOrnamentViewController
{
  return self->_handwritingDebugPillOrnamentViewController;
}

- (void)setHandwritingDebugPillOrnamentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingDebugPillOrnamentViewController, a3);
}

- (ICHandwritingDebugWindow)handwritingDebugWindow
{
  return self->_handwritingDebugWindow;
}

- (void)setHandwritingDebugWindow:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingDebugWindow, a3);
}

- (ICSelectorDelayer)handwritingDebugSelectorDelayer
{
  return self->_handwritingDebugSelectorDelayer;
}

- (void)setHandwritingDebugSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingDebugSelectorDelayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingDebugSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_handwritingDebugWindow, 0);
  objc_storeStrong((id *)&self->_handwritingDebugPillOrnamentViewController, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
