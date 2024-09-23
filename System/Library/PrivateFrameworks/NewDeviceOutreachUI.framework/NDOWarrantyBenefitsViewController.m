@implementation NDOWarrantyBenefitsViewController

- (NDOWarrantyBenefitsViewController)initWithWarranty:(id)a3
{
  id v4;
  void *v5;
  NDOWarrantyBenefitsViewController *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "localizedBenefitsCardTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)NDOWarrantyBenefitsViewController;
  v6 = -[OBTextWelcomeController initWithTitle:](&v8, sel_initWithTitle_, v5);

  if (v6)
    objc_storeWeak((id *)&v6->_warranty, v4);

  return v6;
}

- (void)loadView
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
  _QWORD v15[5];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NDOWarrantyBenefitsViewController;
  -[OBTextWelcomeController loadView](&v16, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_donePressed_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[NDOWarrantyBenefitsViewController warranty](self, "warranty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedBenefitsCardSubTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NDOWarrantyBenefitsViewController warranty](self, "warranty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedBenefitsCardSubTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v8);

  }
  -[NDOWarrantyBenefitsViewController warranty](self, "warranty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "benefitDetailsArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __45__NDOWarrantyBenefitsViewController_loadView__block_invoke;
  v15[3] = &unk_24F335190;
  v15[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  -[NDOWarrantyBenefitsViewController warranty](self, "warranty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedBenefitsCardFooter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NDOWarrantyBenefitsViewController warranty](self, "warranty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedBenefitsCardFooter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v14);

  }
}

void __45__NDOWarrantyBenefitsViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedBenefitLabel"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedBenefitValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addSectionWithHeader:content:", v5, v4);
}

- (void)donePressed:(id)a3
{
  id v3;

  -[NDOWarrantyBenefitsViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (NDOWarranty)warranty
{
  return (NDOWarranty *)objc_loadWeakRetained((id *)&self->_warranty);
}

- (void)setWarranty:(id)a3
{
  objc_storeWeak((id *)&self->_warranty, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_warranty);
}

@end
