@implementation CKSettingsGenericAboutViewController

- (CKSettingsGenericAboutViewController)initWithTitle:(id)a3 bodyText:(id)a4
{
  id v6;
  id v7;
  CKSettingsGenericAboutViewController *v8;
  CKSettingsGenericAboutViewController *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  UITextView *aboutView;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKSettingsGenericAboutViewController;
  v8 = -[CKSettingsGenericAboutViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[CKSettingsGenericAboutViewController navigationItem](v8, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v6);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v9, sel_done_);
    objc_msgSend(v10, "setRightBarButtonItem:", v11);
    v12 = objc_alloc(MEMORY[0x24BEBDA88]);
    v13 = objc_msgSend(v12, "initWithFrame:textContainer:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    aboutView = v9->_aboutView;
    v9->_aboutView = (UITextView *)v13;

    -[UITextView setTextContainerInset:](v9->_aboutView, "setTextContainerInset:", 25.0, 20.0, 25.0, 20.0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v9->_aboutView, "setFont:", v15);

    -[UITextView setTextAlignment:](v9->_aboutView, "setTextAlignment:", 4);
    -[UITextView setDataDetectorTypes:](v9->_aboutView, "setDataDetectorTypes:", 2);
    -[UITextView setText:](v9->_aboutView, "setText:", v7);
    -[UITextView setEditable:](v9->_aboutView, "setEditable:", 0);
    -[UITextView setScrollEnabled:](v9->_aboutView, "setScrollEnabled:", 1);

  }
  return v9;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSettingsGenericAboutViewController;
  -[CKSettingsGenericAboutViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[CKSettingsGenericAboutViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UITextView setFrame:](self->_aboutView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSettingsGenericAboutViewController;
  -[CKSettingsGenericAboutViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[UITextView setContentOffset:](self->_aboutView, "setContentOffset:", 0.0, -25.0);
  -[CKSettingsGenericAboutViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_aboutView);

}

- (void)done:(id)a3
{
  id v3;

  -[CKSettingsGenericAboutViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UITextView)aboutView
{
  return self->_aboutView;
}

- (void)setAboutView:(id)a3
{
  objc_storeStrong((id *)&self->_aboutView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aboutView, 0);
}

@end
