@implementation HUDoorbellChimeDevicesViewController

- (HUDoorbellChimeDevicesViewController)init
{
  HUDoorbellChimeDevicesItemManager *v3;
  HUDoorbellChimeDevicesViewController *v4;
  void *v5;
  objc_super v7;

  v3 = -[HFItemManager initWithDelegate:]([HUDoorbellChimeDevicesItemManager alloc], "initWithDelegate:", self);
  v7.receiver = self;
  v7.super_class = (Class)HUDoorbellChimeDevicesViewController;
  v4 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v7, sel_initWithItemManager_tableViewStyle_, v3, 1);
  if (v4)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoorbellChimeDevices_Title"), CFSTR("HUDoorbellChimeDevices_Title"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDoorbellChimeDevicesViewController setTitle:](v4, "setTitle:", v5);

    objc_storeStrong((id *)&v4->_doorbellChimeDevicesItemManager, v3);
  }

  return v4;
}

- (HUDoorbellChimeDevicesViewController)initWithAccessorySettingItem:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessorySettingItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDoorbellChimeDevicesViewController.m"), 46, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDoorbellChimeDevicesViewController initWithAccessorySettingItem:]",
    v6);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a3;
  objc_opt_class();
  v9 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "setDelegate:", self);
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  BOOL v19;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_7:
    -[HUDoorbellChimeDevicesViewController doorbellChimeDevicesItemManager](self, "doorbellChimeDevicesItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enableDoorbellChime:forItem:", v4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__HUDoorbellChimeDevicesViewController_switchCell_didTurnOn___block_invoke;
    v17[3] = &unk_1E6F52A58;
    v18 = v6;
    v19 = v4;
    v16 = (id)objc_msgSend(v15, "addFailureBlock:", v17);

    goto LABEL_8;
  }
  objc_msgSend(v9, "sourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_7;
LABEL_8:

}

uint64_t __61__HUDoorbellChimeDevicesViewController_switchCell_didTurnOn___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setOn:animated:", *(_BYTE *)(result + 40) == 0, 1);
  return result;
}

- (HUDoorbellChimeDevicesItemManager)doorbellChimeDevicesItemManager
{
  return self->_doorbellChimeDevicesItemManager;
}

- (void)setDoorbellChimeDevicesItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_doorbellChimeDevicesItemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doorbellChimeDevicesItemManager, 0);
}

@end
