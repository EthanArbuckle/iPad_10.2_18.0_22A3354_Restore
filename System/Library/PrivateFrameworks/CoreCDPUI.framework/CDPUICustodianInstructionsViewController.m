@implementation CDPUICustodianInstructionsViewController

- (CDPUICustodianInstructionsViewController)initWithViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CDPUICustodianInstructionsViewController *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CDPUICustodianInstructionsViewController;
  v8 = -[CDPUICustodianInstructionsViewController initWithTitle:detailText:symbolName:](&v10, sel_initWithTitle_detailText_symbolName_, v6, v7, 0);

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CDPUICustodianInstructionsViewController;
  -[OBBaseWelcomeController viewDidLoad](&v17, sel_viewDidLoad);
  -[CDPUICustodianInstructionsViewModel instructionHeader](self->_viewModel, "instructionHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v3);

  -[CDPUICustodianInstructionsViewModel instructions](self->_viewModel, "instructions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v4);

  -[CDPUICustodianInstructionsViewModel footerText](self->_viewModel, "footerText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v5);

  -[CDPUICustodianInstructionsViewModel continueOption](self->_viewModel, "continueOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__handleContinueAction_, 64);
    -[CDPUICustodianInstructionsViewModel continueOption](self->_viewModel, "continueOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v9, 0);

    -[CDPUICustodianInstructionsViewController buttonTray](self, "buttonTray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addButton:", v7);

  }
  -[CDPUICustodianInstructionsViewModel escapeOffer](self->_viewModel, "escapeOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUICustodianInstructionsViewModel escapeOffer](self->_viewModel, "escapeOffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:forControlEvents:", v13, sel_handleEscapeAction_, 64);

    -[CDPUICustodianInstructionsViewModel escapeOffer](self->_viewModel, "escapeOffer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "escapeOfferName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v15, 0);

    -[CDPUICustodianInstructionsViewController buttonTray](self, "buttonTray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addButton:", v12);

  }
}

- (void)_handleContinueAction:(id)a3
{
  void *v4;
  void (**v5)(void);
  id v6;

  -[CDPUICustodianInstructionsViewModel continueOption](self->_viewModel, "continueOption", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CDPUICustodianInstructionsViewModel continueOption](self->_viewModel, "continueOption");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "escapeAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
