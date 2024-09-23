@implementation AUDeveloperSettingsLearnMoreController

- (AUDeveloperSettingsLearnMoreController)init
{
  AUDeveloperSettingsLearnMoreController *v2;
  void *v3;
  objc_class *v4;
  id v5;
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
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)AUDeveloperSettingsLearnMoreController;
  v2 = -[AUDeveloperSettingsLearnMoreController init](&v18, sel_init);
  if (v2)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v3 = (void *)getOBTextWelcomeControllerClass_softClass;
    v23 = getOBTextWelcomeControllerClass_softClass;
    if (!getOBTextWelcomeControllerClass_softClass)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __getOBTextWelcomeControllerClass_block_invoke;
      v19[3] = &unk_24DFEF5D8;
      v19[4] = &v20;
      __getOBTextWelcomeControllerClass_block_invoke((uint64_t)v19);
      v3 = (void *)v21[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v20, 8);
    v5 = [v4 alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LEGAL_CONSENT_TITLE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTitle:detailText:symbolName:", v7, 0, 0);
    -[AUDeveloperSettingsLearnMoreController setController:](v2, "setController:", v8);

    -[AUDeveloperSettingsLearnMoreController controller](v2, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LEGAL_CONSENT_TEXT"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSectionWithHeader:content:", 0, v11);

    -[AUDeveloperSettingsLearnMoreController controller](v2, "controller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUDeveloperSettingsLearnMoreController setViewControllers:](v2, "setViewControllers:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v2, sel_donePressed);
    -[AUDeveloperSettingsLearnMoreController controller](v2, "controller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", v14);

  }
  return v2;
}

- (void)donePressed
{
  void *v2;
  id v3;

  -[AUDeveloperSettingsLearnMoreController controller](self, "controller");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (OBTextWelcomeController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
