@implementation SiriModalTextViewController

- (SiriModalTextViewController)initWithTitleText:(id)a3 andBodyText:(id)a4
{
  id v6;
  id v7;
  SiriModalTextViewController *v8;
  SiriModalTextViewController *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SiriModalTextViewController;
  v8 = -[SiriModalTextViewController init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SiriModalTextViewController setTitle:](v8, "setTitle:", v6);
    v10 = objc_alloc(MEMORY[0x24BEBDA88]);
    v11 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v11, "setText:", v7);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(v11, "setEditable:", 0);
    objc_msgSend(v11, "setTextContainerInset:", 8.0, 10.0, 8.0, 10.0);
    objc_msgSend(v11, "setContentOffset:", 0.0, -8.0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v9, sel_donePressed);
    -[SiriModalTextViewController navigationItem](v9, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", v13);

    -[SiriModalTextViewController setView:](v9, "setView:", v11);
  }

  return v9;
}

- (void)presentFromParentViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", self);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)donePressed
{
  id v2;

  -[SiriModalTextViewController parentViewController](self, "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
