@implementation DSEmergencyResetWelcomeController

- (DSEmergencyResetWelcomeController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DSEmergencyResetWelcomeController *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("SAFETY_RESET"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("SAFETY_RESET_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("person.2.gobackward"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)DSEmergencyResetWelcomeController;
  v9 = -[DSEmergencyResetWelcomeController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v6, v7, v8);

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  int v6;
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
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)DSEmergencyResetWelcomeController;
  -[DSOBWelcomeController viewDidLoad](&v24, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("START_EMERGENCY_RESET"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetWelcomeController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, v4, sel_pushNextPane);

  v6 = objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow");
  DSUILocStringForKey(CFSTR("EMERGENCY_RESET_1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("EMERGENCY_RESET_1_DETAIL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("1.circle.fill"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetWelcomeController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v7, v8, v9);

  if (v6)
  {
    DSUILocStringForKey(CFSTR("EMERGENCY_RESET_3"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("EMERGENCY_RESET_3_DETAIL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("2.circle.fill"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v10, v11, v12);

    DSUIDTOLocStringForKey(CFSTR("EMERGENCY_RESET_BULLET_DEVICES"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DSUIDTOLocStringForKey(CFSTR("EMERGENCY_RESET_BULLET_DEVICES_DETAIL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("3.circle.fill"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v13, v14, v15);

    DSUIDTOLocStringForKey(CFSTR("EMERGENCY_RESET_BULLET_ACCOUNT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DSUIDTOLocStringForKey(CFSTR("EMERGENCY_RESET_BULLET_ACCOUNT_DETAIL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BEBD640];
    v19 = CFSTR("4.circle.fill");
  }
  else
  {
    DSUILocStringForKey(CFSTR("EMERGENCY_RESET_2"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("EMERGENCY_RESET_2_DETAIL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("2.circle.fill"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v20, v21, v22);

    DSUILocStringForKey(CFSTR("EMERGENCY_RESET_3"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("EMERGENCY_RESET_3_DETAIL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BEBD640];
    v19 = CFSTR("3.circle.fill");
  }
  objc_msgSend(v18, "systemImageNamed:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetWelcomeController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v16, v17, v23);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DSEmergencyResetWelcomeController;
  -[DSEmergencyResetWelcomeController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  if (objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
  {
    objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __59__DSEmergencyResetWelcomeController_viewWillLayoutSubviews__block_invoke;
    v4[3] = &unk_24EFF3440;
    v4[4] = self;
    objc_msgSend(v3, "stateWithCompletion:", v4);

  }
}

void __59__DSEmergencyResetWelcomeController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];

  v6 = a2;
  v5 = a3;
  if (v6 && (!objc_msgSend(v6, "rawValue") || objc_msgSend(v6, "rawValue") == 1))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__DSEmergencyResetWelcomeController_viewWillLayoutSubviews__block_invoke_2;
    block[3] = &unk_24EFF33A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __59__DSEmergencyResetWelcomeController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentDTOCell");
}

- (void)_presentDTOCell
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
  void *v17;
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
  id v30;

  -[DSEmergencyResetWelcomeController cell](self, "cell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[DSPlatterTableView cellWithPresentingViewController:](DSPlatterTableView, "cellWithPresentingViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController setCell:](self, "setCell:", v4);

    -[DSEmergencyResetWelcomeController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_cell);

  }
  -[DSEmergencyResetWelcomeController cell](self, "cell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DSEmergencyResetWelcomeController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController cell](self, "cell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[DSEmergencyResetWelcomeController cell](self, "cell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController headerView](self, "headerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 16.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[DSEmergencyResetWelcomeController cell](self, "cell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController headerView](self, "headerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[DSEmergencyResetWelcomeController cell](self, "cell");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController headerView](self, "headerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[DSEmergencyResetWelcomeController cell](self, "cell");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetWelcomeController cell](self, "cell");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preferredHeight");
    objc_msgSend(v27, "constraintEqualToConstant:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

  }
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSPlatterTableView)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
