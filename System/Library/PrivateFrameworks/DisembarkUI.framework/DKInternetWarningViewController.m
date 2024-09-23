@implementation DKInternetWarningViewController

- (DKInternetWarningViewController)init
{
  void *v3;
  void *v4;
  DKInternetWarningViewController *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("INTERNET_WARNING_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)DKInternetWarningViewController;
  v5 = -[DKInternetWarningViewController initWithTitle:detailText:symbolName:contentLayout:](&v7, sel_initWithTitle_detailText_symbolName_contentLayout_, v4, 0, 0, 2);

  return v5;
}

- (void)viewDidLoad
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[6];

  v53[4] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)DKInternetWarningViewController;
  -[OBBaseWelcomeController viewDidLoad](&v52, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setAxis:", 1);
  objc_msgSend(v8, "setSpacing:", 10.0);
  -[DKInternetWarningViewController notableUserData](self, "notableUserData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInternetWarningViewController _createNotableUserDataCardForFindMy:](self, "_createNotableUserDataCardForFindMy:", objc_msgSend(v9, "findMyEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v10);

  objc_msgSend(v8, "arrangedSubviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCustomSpacing:afterView:", v51, 20.0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("INTERNET_WARNING_DETAIL"), &stru_24F20EA28, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v14);

  objc_msgSend(v12, "setTextAlignment:", 1);
  v15 = (void *)MEMORY[0x24BDF6A70];
  v16 = (void *)MEMORY[0x24BDF6A78];
  v17 = *MEMORY[0x24BDF77B0];
  -[DKInternetWarningViewController traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fontWithDescriptor:size:", v19, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v12;
  objc_msgSend(v12, "setFont:", v20);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v21);

  objc_msgSend(v12, "setNumberOfLines:", 0);
  objc_msgSend(v8, "addArrangedSubview:", v12);
  -[DKInternetWarningViewController contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v8);

  -[DKInternetWarningViewController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKInternetWarningViewController contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v45;
  -[DKInternetWarningViewController contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v41;
  -[DKInternetWarningViewController contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v8;
  objc_msgSend(v8, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v26;
  -[DKInternetWarningViewController contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addConstraints:", v31);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("INTERNET_WARNING_REQUIRE_INTERNET_BUTTON"), &stru_24F20EA28, CFSTR("Localizable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitle:forState:", v34, 0);

  objc_msgSend(v32, "addTarget:action:forControlEvents:", self, sel__requireInternetTapped_, 64);
  -[DKInternetWarningViewController buttonTray](self, "buttonTray");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addButton:", v32);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("INTERNET_WARNING_CONTINUE_WITHOUT_INTERNET_BUTTON"), &stru_24F20EA28, CFSTR("Localizable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTitle:forState:", v38, 0);

  objc_msgSend(v36, "addTarget:action:forControlEvents:", self, sel__continueWithoutInternetTapped_, 64);
  -[DKInternetWarningViewController buttonTray](self, "buttonTray");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addButton:", v36);

}

- (void)showBusy
{
  id v2;

  -[DKInternetWarningViewController buttonTray](self, "buttonTray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsBusy");

}

- (void)showAvailable
{
  id v2;

  -[DKInternetWarningViewController buttonTray](self, "buttonTray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsAvailable");

}

- (id)_createNotableUserDataCardForFindMy:(BOOL)a3
{
  DKNotableUserDataCardView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DKNotableUserDataCardView *v9;
  DKNotableUserDataCardCell *v10;
  void *v11;
  void *v12;
  DKNotableUserDataCardCell *v13;

  if (a3)
  {
    v3 = [DKNotableUserDataCardView alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FIND_MY"), &stru_24F20EA28, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_LOCK"), &stru_24F20EA28, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("findmy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DKNotableUserDataCardView initWithTitle:subtitle:icon:](v3, "initWithTitle:subtitle:icon:", v5, v7, v8);

    v10 = [DKNotableUserDataCardCell alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FIND_MY_DESCRIPTION"), &stru_24F20EA28, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[DKNotableUserDataCardCell initWithTitle:subtitle:accessoryView:](v10, "initWithTitle:subtitle:accessoryView:", 0, v12, 0);

    -[DKNotableUserDataCardView addCardCell:](v9, "addCardCell:", v13);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_requireInternetTapped:(id)a3
{
  void (**v3)(void);

  -[DKInternetWarningViewController requireInternetBlock](self, "requireInternetBlock", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)_continueWithoutInternetTapped:(id)a3
{
  void *v4;
  _BOOL8 v5;
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
  void *v17;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  v6 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INTERNET_WARNING_CONFIRMATION_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INTERNET_WARNING_CONFIRMATION_CONTINUE_WITHOUT_INTERNET_BUTTON"), &stru_24F20EA28, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__DKInternetWarningViewController__continueWithoutInternetTapped___block_invoke;
  v18[3] = &unk_24F20DE68;
  v18[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v17);

  -[DKInternetWarningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

void __66__DKInternetWarningViewController__continueWithoutInternetTapped___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "continueWithoutInternetBlock");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (id)requireInternetBlock
{
  return self->_requireInternetBlock;
}

- (void)setRequireInternetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (id)continueWithoutInternetBlock
{
  return self->_continueWithoutInternetBlock;
}

- (void)setContinueWithoutInternetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (DKNotableUserData)notableUserData
{
  return self->_notableUserData;
}

- (void)setNotableUserData:(id)a3
{
  objc_storeStrong((id *)&self->_notableUserData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notableUserData, 0);
  objc_storeStrong(&self->_continueWithoutInternetBlock, 0);
  objc_storeStrong(&self->_requireInternetBlock, 0);
}

@end
