@implementation HUAccessorySettingsProfileModuleController

- (HUAccessorySettingsProfileModuleController)initWithModule:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsProfileModuleController;
  return -[HUItemModuleController initWithModule:](&v4, sel_initWithModule_, a3);
}

- (Class)cellClassForItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getMCProfileSummaryCellClass_softClass;
  v12 = getMCProfileSummaryCellClass_softClass;
  if (!getMCProfileSummaryCellClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getMCProfileSummaryCellClass_block_invoke;
    v8[3] = &unk_1E6F4C868;
    v8[4] = &v9;
    __getMCProfileSummaryCellClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProfile:", v5);

  objc_msgSend(v6, "setAccessoryType:", 1);
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v6 = (void *)getMCProfileViewControllerClass_softClass;
    v15 = getMCProfileViewControllerClass_softClass;
    if (!getMCProfileViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getMCProfileViewControllerClass_block_invoke;
      v11[3] = &unk_1E6F4C868;
      v11[4] = &v12;
      __getMCProfileViewControllerClass_block_invoke((uint64_t)v11);
      v6 = (void *)v13[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v12, 8);
    v8 = (void *)objc_msgSend([v7 alloc], "initWithStyle:profile:profileViewMode:", 1, v5, 2);
    objc_msgSend(v8, "setProfileViewControllerDelegate:", self);
    -[HUAccessorySettingsProfileModuleController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessorySettingsProfileModuleController:needsNavigationToController:", self, v8);

  }
  return 1;
}

- (BOOL)profileViewControllerIsProfileInstalled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HUItemModuleController module](self, "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "na_any:", &__block_literal_global_150);

  return (char)v3;
}

BOOL __85__HUAccessorySettingsProfileModuleController_profileViewControllerIsProfileInstalled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5 != 0;
}

- (void)profileViewControllerDidSelectRemoveProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke;
  v18[3] = &unk_1E6F4DAD8;
  v10 = v4;
  v19 = v10;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "promptForRemoveProfileItem:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke_2;
  v16[3] = &unk_1E6F4CDD0;
  v17 = v10;
  v14 = v10;
  v15 = (id)objc_msgSend(v13, "addCompletionBlock:", v16);

}

BOOL __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UIProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 == v9;

  return v10;
}

void __90__HUAccessorySettingsProfileModuleController_profileViewControllerDidSelectRemoveProfile___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  if ((objc_msgSend(a3, "na_isCancelledError") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

- (HUAccessorySettingsProfileModuleControllerDelegate)delegate
{
  return (HUAccessorySettingsProfileModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
