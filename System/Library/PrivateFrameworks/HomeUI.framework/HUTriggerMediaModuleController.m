@implementation HUTriggerMediaModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRowItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return (Class)v7;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaRowItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    v10 = v11;
    objc_msgSend(v10, "setAccessoryType:", 1);
    objc_msgSend(v10, "setHideIcon:", 1);

  }
}

- (unint64_t)didSelectItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HUMediaSelectionViewController *v8;
  void *v9;

  -[HUItemModuleController module](self, "module", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerActionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anonymousActionSetBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HUMediaSelectionViewController initWithActionSetBuilder:]([HUMediaSelectionViewController alloc], "initWithActionSetBuilder:", v7);
  -[HUMediaSelectionViewController setDelegate:](v8, "setDelegate:", self);
  -[HUTriggerMediaModuleController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaModuleController:pushViewController:", self, v8);

  return 0;
}

- (id)mediaSelectionViewController:(id)a3 messageForMediaPickerUnavailableReason:(int64_t)a4
{
  return +[HUMediaAccountUtilities reasonForMediaPickerNotAvailable:](HUMediaAccountUtilities, "reasonForMediaPickerNotAvailable:", a4);
}

- (id)mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:(id)a3
{
  return CFSTR("HUTriggerMediaActionPlayUnavailableMessage");
}

- (HUTriggerMediaModuleControllerDelegate)delegate
{
  return (HUTriggerMediaModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
