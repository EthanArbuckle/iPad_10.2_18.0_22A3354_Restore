@implementation PDFPasswordViewController

- (PDFPasswordViewController)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  PDFPasswordViewController *v6;
  objc_super v8;

  v4 = a3;
  PDFKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PDFPasswordViewController;
  v6 = -[PDFPasswordViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, CFSTR("NewPasswordView"), v5);

  if (v6)
    objc_storeWeak((id *)&v6->_delegate, v4);

  return v6;
}

- (void)clearPasswordField
{
  id v2;

  -[UIDocumentPasswordView passwordField](self->_uiDocPasswordView, "passwordField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", &stru_24C25F170);

}

- (void)focusOnPasswordField
{
  id v2;

  -[UIDocumentPasswordView passwordField](self->_uiDocPasswordView, "passwordField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)presentInvalidPasswordAlertWithParentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDF67F0];
  PDFKitLocalizedString(CFSTR("Invalid Password"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(CFSTR("Please enter the password again."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x24BDF67E8];
  PDFKitLocalizedString(CFSTR("OK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __81__PDFPasswordViewController_presentInvalidPasswordAlertWithParentViewController___block_invoke;
  v15 = &unk_24C25DEA0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v11, v12, v13, v14, v15);
  objc_msgSend(v4, "presentViewController:animated:completion:", v8, 1, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __81__PDFPasswordViewController_presentInvalidPasswordAlertWithParentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "focusOnPasswordField");

}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 && objc_msgSend(v9, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(WeakRetained, "userDidEnterPassword:forPasswordViewController:", v9, self);

    if (v8)
      objc_msgSend(v6, "resignFirstResponder");
    -[PDFPasswordViewController clearPasswordField](self, "clearPasswordField");
  }

}

- (void)viewDidLoad
{
  UIDocumentPasswordView *v3;
  UIDocumentPasswordView *uiDocPasswordView;
  UIDocumentPasswordView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PDFPasswordViewController;
  -[PDFPasswordViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = (UIDocumentPasswordView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69E0]), "initWithDocumentName:", 0);
  uiDocPasswordView = self->_uiDocPasswordView;
  self->_uiDocPasswordView = v3;

  -[UIDocumentPasswordView setPasswordDelegate:](self->_uiDocPasswordView, "setPasswordDelegate:", self);
  v5 = self->_uiDocPasswordView;
  -[PDFPasswordViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIDocumentPasswordView setFrame:](v5, "setFrame:");

  -[UIDocumentPasswordView setAutoresizingMask:](self->_uiDocPasswordView, "setAutoresizingMask:", 18);
  -[PDFPasswordViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_uiDocPasswordView);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPasswordViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiDocPasswordView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
