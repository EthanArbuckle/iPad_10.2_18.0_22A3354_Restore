@implementation CDPRemoteUILocalSecretEntryViewController

- (CDPRemoteUILocalSecretEntryViewController)init
{
  CDPRemoteUILocalSecretEntryViewController *v2;
  CDPRemoteUILocalSecretEntryViewController *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  v2 = -[CDPPassphraseEntryViewController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DevicePINController setPinDelegate:](v2, "setPinDelegate:", v2);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C857A78, 0, 0, 0, 0, 13, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditPaneClass:", objc_opt_class());
    objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE75E10]);
    -[DevicePINController setSpecifier:](v3, "setSpecifier:", v4);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
    {
      -[DevicePINController setNumericPIN:](v3, "setNumericPIN:", 0);
      -[CDPRemoteUILocalSecretEntryViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 2);
    }

  }
  return v3;
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
  NSString *v10;
  NSString *titleText;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  -[PSDetailController viewDidLoad](&v12, sel_viewDidLoad);
  -[CDPRemoteUILocalSecretEntryViewController extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("forceInlineMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_finished = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleText = self->_titleText;
  self->_titleText = v10;

}

- (id)title
{
  return 0;
}

- (id)pinInstructionsPrompt
{
  uint64_t *p_titleText;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_titleText = (uint64_t *)&self->_titleText;
  if (self->_titleText)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CDPRemoteUILocalSecretEntryViewController pinInstructionsPrompt].cold.1((uint64_t)self, p_titleText, v4);

    v5 = (id)*p_titleText;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("LOCAL_SECRET_ENTRY_REASON"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSecretType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDeviceClass:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  CDPRemoteUILocalSecretEntryViewController *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  -[DevicePINController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[CDPRemoteUILocalSecretEntryViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (CDPRemoteUILocalSecretEntryViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[CDPRemoteUILocalSecretEntryViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setBackgroundOpacity:", 0.0);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  -[DevicePINController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (!*(&self->_finished + 1))
  {
    *(&self->_finished + 1) = 1;
    -[CDPRemoteUILocalSecretEntryViewController extensionContext](self, "extensionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequestWithError:", v5);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDPRemoteUILocalSecretEntryViewController;
  -[DevicePINController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (!self->_finished)
  {
    if (-[NSString length](self->_titleText, "length"))
    {
      objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopAnimatingForIdentifier:", CFSTR("localSecretValidator"));

    }
  }
}

- (void)_startAnimating
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteUILocalSecretEntryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v4, CFSTR("localSecretValidator"), 1);

  v5 = (int)*MEMORY[0x24BE75690];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5), "resignFirstResponder");
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5), "setUserInteractionEnabled:", 0);
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  *(&self->_finished + 1) = 1;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlockScreenTypeWithOutSimplePasscodeType:", &v12);

  if (v12 == -1)
    v6 = 3;
  else
    v6 = 2;
  if (self->_finished)
    goto LABEL_8;
  if (-[NSString length](self->_titleText, "length"))
    -[CDPRemoteUILocalSecretEntryViewController _startAnimating](self, "_startAnimating");
  if (self->_finished)
LABEL_8:
    -[CDPRemoteUILocalSecretEntryViewController _startAnimating](self, "_startAnimating");
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v14[0] = CFSTR("localSecret");
    v14[1] = CFSTR("secretType");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInfo:", v9);

    -[CDPRemoteUILocalSecretEntryViewController extensionContext](self, "extensionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completeRequestReturningItems:completionHandler:", v11, &__block_literal_global_4);

  }
  else
  {
    -[CDPRemoteUILocalSecretEntryViewController extensionContext](self, "extensionContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelRequestWithError:", v10);
  }

}

- (void)didCancelEnteringPIN
{
  void *v2;
  id v3;

  *(&self->_finished + 1) = 1;
  -[CDPRemoteUILocalSecretEntryViewController extensionContext](self, "extensionContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequestWithError:", v2);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
}

- (void)pinInstructionsPrompt
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a2;
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_20DC8F000, a3, OS_LOG_TYPE_DEBUG, "\"%@: title: %@\", (uint8_t *)&v8, 0x16u);

}

@end
