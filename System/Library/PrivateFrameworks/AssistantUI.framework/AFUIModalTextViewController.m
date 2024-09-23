@implementation AFUIModalTextViewController

- (AFUIModalTextViewController)initWithTitleText:(id)a3 andBodyText:(id)a4
{
  id v6;
  id v7;
  AFUIModalTextViewController *v8;
  AFUIModalTextViewController *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AFUIModalTextViewController;
  v8 = -[AFUIModalTextViewController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AFUIModalTextViewController setTitle:](v8, "setTitle:", v6);
    objc_storeStrong((id *)&v9->_bodyText, a4);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v9, sel_donePressed);
    -[AFUIModalTextViewController navigationItem](v9, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

  }
  return v9;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x24BEBDA88]);
  v5 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setText:", self->_bodyText);
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v5, "setEditable:", 0);
  objc_msgSend(v5, "setTextContainerInset:", 8.0, 10.0, 8.0, 10.0);
  objc_msgSend(v5, "setContentOffset:", 0.0, -8.0);
  -[AFUIModalTextViewController setView:](self, "setView:", v5);

}

- (void)presentFromParentViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", self);
  objc_msgSend(v6, "setModalPresentationStyle:", 6);
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)donePressed
{
  id v2;

  -[AFUIModalTextViewController parentViewController](self, "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
}

@end
