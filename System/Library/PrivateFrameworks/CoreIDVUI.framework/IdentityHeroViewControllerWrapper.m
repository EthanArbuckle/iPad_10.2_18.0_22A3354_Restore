@implementation IdentityHeroViewControllerWrapper

- (IdentityHeroViewControllerWrapper)initWithImageData:(id)a3 title:(id)a4 subtitle:(id)a5 primaryButtonTitle:(id)a6 secondaryButtonTitle:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IdentityHeroViewControllerWrapper *v17;
  IdentityHeroViewControllerWrapper *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IdentityHeroViewControllerWrapper;
  v17 = -[IdentityHeroViewControllerWrapper init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_imageData, a3);
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v18->_subTitle, a5);
    objc_storeStrong((id *)&v18->_primaryButtonTitle, a6);
    objc_storeStrong((id *)&v18->_secondaryButtonTitle, a7);
  }

  return v18;
}

- (id)identityHeroViewController:(id)a3 secondaryButtonClicked:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v8 = (void *)getPKIdentityHeroViewControllerClass_softClass;
  v29 = getPKIdentityHeroViewControllerClass_softClass;
  if (!getPKIdentityHeroViewControllerClass_softClass)
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __getPKIdentityHeroViewControllerClass_block_invoke;
    v24 = &unk_24D116DC0;
    v25 = &v26;
    __getPKIdentityHeroViewControllerClass_block_invoke((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v26, 8);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v10 = (void *)getPKIdentityHeroViewConfigurationClass_softClass;
  v29 = getPKIdentityHeroViewConfigurationClass_softClass;
  if (!getPKIdentityHeroViewConfigurationClass_softClass)
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __getPKIdentityHeroViewConfigurationClass_block_invoke;
    v24 = &unk_24D116DC0;
    v25 = &v26;
    __getPKIdentityHeroViewConfigurationClass_block_invoke((uint64_t)&v21);
    v10 = (void *)v27[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v26, 8);
  if (v9 && v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6ECA0]), "initWithIdentifier:imageData:credentialType:", CFSTR("AppleIdentityHeroViewImage"), self->_imageData, 129);
    v13 = (void *)objc_msgSend([v11 alloc], "initWithImage:title:subtitle:primaryButtonTitle:secondaryButtonTitle:", v12, self->_title, self->_subTitle, self->_primaryButtonTitle, self->_secondaryButtonTitle);
    v14 = (void *)objc_msgSend([v9 alloc], "initWithConfiguration:", v13);
    v15 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke;
    v19[3] = &unk_24D116D98;
    v20 = v6;
    objc_msgSend(v14, "setPrimaryButtonClickedBlock:", v19);
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke_2;
    v17[3] = &unk_24D116D98;
    v18 = v7;
    objc_msgSend(v14, "setSecondaryButtonClickedBlock:", v17);

  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB08]), "initWithNibName:bundle:", 0, 0);
  }

  return v14;
}

uint64_t __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__IdentityHeroViewControllerWrapper_identityHeroViewController_secondaryButtonClicked___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
