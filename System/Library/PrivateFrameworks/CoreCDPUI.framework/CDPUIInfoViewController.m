@implementation CDPUIInfoViewController

- (CDPUIInfoViewController)initWithViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CDPUIInfoViewController *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CDPUIInfoViewController;
  v8 = -[CDPUIInfoViewController initWithTitle:detailText:icon:contentLayout:](&v10, sel_initWithTitle_detailText_icon_contentLayout_, v6, v7, 0, 3);

  if (v8)
    objc_storeStrong((id *)&v8->_viewModel, a3);

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDPUIInfoViewController;
  -[OBBaseWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__handleButton1Action_, 64);
  -[CDPUIInfoViewModel option1](self->_viewModel, "option1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  -[CDPUIInfoViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton:", v3);

  -[CDPUIInfoViewModel option2](self->_viewModel, "option2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleButton2Action_, 64);
    -[CDPUIInfoViewModel option2](self->_viewModel, "option2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:forState:", v10, 0);

    -[CDPUIInfoViewController buttonTray](self, "buttonTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", v8);

  }
}

- (void)_handleButton1Action:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  -[CDPUIInfoViewModel option1](self->_viewModel, "option1", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "escapeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDPUIInfoViewModel option1](self->_viewModel, "option1");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "escapeAction");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (void)_handleButton2Action:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  -[CDPUIInfoViewModel option2](self->_viewModel, "option2", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "escapeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDPUIInfoViewModel option2](self->_viewModel, "option2");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "escapeAction");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
