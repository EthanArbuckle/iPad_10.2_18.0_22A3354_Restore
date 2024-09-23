@implementation HUMediaServiceSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUMediaServiceSettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v19, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v9, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitleText:", v14);

  objc_msgSend(v12, "setAccessoryType:", 1);
  -[HUItemModuleController module](self, "module");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "defaultAccountsItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v9)
  {
    objc_msgSend(v12, "setHideIcon:", 1);
    objc_msgSend(v9, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValueText:", v18);

  }
  else
  {
    objc_msgSend(v12, "setHideIcon:", 0);
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAccountsItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    -[HUMediaServiceSettingsItemModuleController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[HUMediaServiceSettingsItemModuleController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didSelectDefaultAccounts:", self);
LABEL_7:

      goto LABEL_8;
    }
  }
  else
  {

  }
  -[HUMediaServiceSettingsItemModuleController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HUMediaServiceSettingsItemModuleController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaServiceSettingsItemModuleController:didSelectMediaService:", self, v4);
    goto LABEL_7;
  }
LABEL_8:

  return 0;
}

- (HUMediaServiceSettingsItemModuleControllerDelegate)delegate
{
  return (HUMediaServiceSettingsItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
