@implementation DKPromptCloudUploadViewController

- (DKPromptCloudUploadViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DKPromptCloudUploadViewController *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CLOUD_UPLOAD_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CLOUD_UPLOAD_DETAIL"), &stru_24F20EA28, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)DKPromptCloudUploadViewController;
  v7 = -[DKPromptCloudUploadViewController initWithTitle:detailText:symbolName:contentLayout:](&v9, sel_initWithTitle_detailText_symbolName_contentLayout_, v4, v6, CFSTR("icloud.and.arrow.up"), 2);

  return v7;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DKPromptCloudUploadViewController;
  -[OBBaseWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FINISH_UPLOAD_THEN_ERASE"), &stru_24F20EA28, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__uploadTapped_, 64);
  -[DKPromptCloudUploadViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton:", v3);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ERASE_NOW"), &stru_24F20EA28, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__eraseTapped_, 64);
  -[DKPromptCloudUploadViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", v7);

}

- (void)_uploadTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t (**v6)(void);
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t (**v10)(void);
  int v11;
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
  _QWORD *v25;
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
  id v36;
  void (**v37)(id, _QWORD);
  _QWORD v38[5];
  _QWORD v39[5];

  -[DKPromptCloudUploadViewController hasInternetConnectivity](self, "hasInternetConnectivity", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[DKPromptCloudUploadViewController hasInternetConnectivity](self, "hasInternetConnectivity"),
        v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        v7 = v6[2](),
        v6,
        v5,
        !v7))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", v27, &stru_24F20EA28, CFSTR("Localizable"));
    v36 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", v29, &stru_24F20EA28, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v36, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 1, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v33);

    v22 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_24F20EA28, CFSTR("Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke_2;
    v38[3] = &unk_24F20DE68;
    v38[4] = self;
    v25 = v38;
    goto LABEL_7;
  }
  -[DKPromptCloudUploadViewController shouldWarnForDataUsage](self, "shouldWarnForDataUsage");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DKPromptCloudUploadViewController shouldWarnForDataUsage](self, "shouldWarnForDataUsage");
    v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v11 = v10[2]();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24F20EA28, CFSTR("Localizable"));
      v36 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24F20EA28, CFSTR("Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v36, v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v21);

      v22 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24F20EA28, CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke;
      v39[3] = &unk_24F20DE68;
      v39[4] = self;
      v25 = v39;
LABEL_7:
      objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v25);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v34);

      -[DKPromptCloudUploadViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
      return;
    }
  }
  -[DKPromptCloudUploadViewController uploadThenEraseBlock](self, "uploadThenEraseBlock");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[DKPromptCloudUploadViewController uploadThenEraseBlock](self, "uploadThenEraseBlock");
    v37 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v37[2](v37, 0);

  }
}

void __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "uploadThenEraseBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "uploadThenEraseBlock");
    v3 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 1);

  }
}

void __51__DKPromptCloudUploadViewController__uploadTapped___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "presentNetworkSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentNetworkSettings");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)_eraseTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[DKPromptCloudUploadViewController eraseNowBlock](self, "eraseNowBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DKPromptCloudUploadViewController eraseNowBlock](self, "eraseNowBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)uploadThenEraseBlock
{
  return self->_uploadThenEraseBlock;
}

- (void)setUploadThenEraseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (id)eraseNowBlock
{
  return self->_eraseNowBlock;
}

- (void)setEraseNowBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (id)hasInternetConnectivity
{
  return self->_hasInternetConnectivity;
}

- (void)setHasInternetConnectivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (id)shouldWarnForDataUsage
{
  return self->_shouldWarnForDataUsage;
}

- (void)setShouldWarnForDataUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (id)presentNetworkSettings
{
  return self->_presentNetworkSettings;
}

- (void)setPresentNetworkSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentNetworkSettings, 0);
  objc_storeStrong(&self->_shouldWarnForDataUsage, 0);
  objc_storeStrong(&self->_hasInternetConnectivity, 0);
  objc_storeStrong(&self->_eraseNowBlock, 0);
  objc_storeStrong(&self->_uploadThenEraseBlock, 0);
}

@end
