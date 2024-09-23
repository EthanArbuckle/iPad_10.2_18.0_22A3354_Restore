@implementation AAUIInheritanceShareAccessKeyOptionsViewController

- (AAUIInheritanceShareAccessKeyOptionsViewController)initWithBeneficiaryName:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  AAUIOBInheritanceShareAccessKeyOptionsViewModel *v8;
  AAUIOBInheritanceShareAccessKeyOptionsViewModel *viewModel;
  NSArray *v10;
  NSArray *options;
  AAUIOBInheritanceShareAccessKeyOptionsViewModel *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = -[AAUIOBInheritanceShareAccessKeyOptionsViewModel initWithBeneficiaryName:handle:]([AAUIOBInheritanceShareAccessKeyOptionsViewModel alloc], "initWithBeneficiaryName:handle:", v7, v6);

  viewModel = self->_viewModel;
  self->_viewModel = v8;

  -[AAOBInheritanceShareAccessKeyOptionsModel defaultSharingOptions](self->_viewModel, "defaultSharingOptions");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  self->_options = v10;

  v12 = self->_viewModel;
  v14.receiver = self;
  v14.super_class = (Class)AAUIInheritanceShareAccessKeyOptionsViewController;
  return -[AAUIOBTableWelcomeController initWithViewModel:](&v14, sel_initWithViewModel_, v12);
}

- (void)viewDidLoad
{
  AAUIOBInheritanceShareAccessKeyOptionsViewModel *viewModel;
  _QWORD v4[5];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIInheritanceShareAccessKeyOptionsViewController;
  -[AAUIOBTableWelcomeController viewDidLoad](&v7, sel_viewDidLoad);
  -[AAUIInheritanceShareAccessKeyOptionsViewController _setupTableView](self, "_setupTableView");
  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1EA2DCF38;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  -[AAOBInheritanceShareAccessKeyOptionsModel availableSharingOptionsWithCompletion:](viewModel, "availableSharingOptionsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1272);
  *(_QWORD *)(v4 + 1272) = v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v7);
}

void __65__AAUIInheritanceShareAccessKeyOptionsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)_setupTableView
{
  void *v3;
  id v4;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_options, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("InheritanceShareOptionCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("InheritanceShareOptionCell"));
  -[NSArray objectAtIndex:](self->_options, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "intValue");

  -[AAUIInheritanceShareAccessKeyOptionsViewController _configurationForShareType:](self, "_configurationForShareType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentConfiguration:", v10);
  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:");
  -[AAUIInheritanceShareAccessKeyOptionsViewController flowDelegate](self, "flowDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AAUIInheritanceShareAccessKeyOptionsViewController flowDelegate](self, "flowDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->_options, "objectAtIndex:", objc_msgSend(v10, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inheritanceDidSelectSharingOption:", objc_msgSend(v9, "integerValue"));

  }
}

- (id)_configurationForShareType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1420]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[AAOBInheritanceShareAccessKeyOptionsModel titleForShareAccessKeyType:](self->_viewModel, "titleForShareAccessKeyType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC1138];
  v9 = v26;
  v27[0] = v6;
  v23 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v10);

  objc_msgSend(v5, "setAttributedText:", v11);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[AAOBInheritanceShareAccessKeyOptionsModel detailTextForShareAccessKeyType:](self->_viewModel, "detailTextForShareAccessKeyType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v25[0] = v15;
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v16);

  objc_msgSend(v5, "setSecondaryAttributedText:", v17);
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("printer.fill.and.paper.fill"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v20);
    v18 = v23;
    goto LABEL_5;
  }
  v18 = v23;
  if (!a3)
  {
    v19 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageNamed:inBundle:", CFSTR("beneficiary_message"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v21);

LABEL_5:
  }

  return v5;
}

- (AAUIInheritanceSetupFlowDelegate)flowDelegate
{
  return (AAUIInheritanceSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
