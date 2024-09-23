@implementation HUAudioAnalysisSettingsViewController

- (HUAudioAnalysisSettingsViewController)initWithAccessoryGroupItem:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAudioAnalysisSettingsViewController.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAudioAnalysisSettingsViewController initWithAccessoryGroupItem:]",
    v6);

  return 0;
}

- (HUAudioAnalysisSettingsViewController)initWithAccessorySettingItem:(id)a3
{
  void *v4;
  void *v5;
  HUAudioAnalysisSettingsViewController *v6;

  objc_msgSend(a3, "homeKitSettingsVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUAudioAnalysisSettingsViewController initWithHome:](self, "initWithHome:", v5);

  return v6;
}

- (HUAudioAnalysisSettingsViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  id v7;
  HUAudioAnalysisSettingsViewController *v8;
  void *v9;
  void *v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAudioAnalysisSettingsViewController.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__HUAudioAnalysisSettingsViewController_initWithHome___block_invoke;
  v13[3] = &unk_1E6F4C518;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "setHomeCreator:", v13);
  objc_msgSend(v6, "setItemModuleCreator:", &__block_literal_global_184);
  v12.receiver = self;
  v12.super_class = (Class)HUAudioAnalysisSettingsViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v12, sel_initWithItemManager_tableViewStyle_, v6, 1);
  if (v8)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUListenSettings_Title"), CFSTR("HUListenSettings_Title"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAudioAnalysisSettingsViewController setTitle:](v8, "setTitle:", v9);

  }
  return v8;
}

uint64_t __54__HUAudioAnalysisSettingsViewController_initWithHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __54__HUAudioAnalysisSettingsViewController_initWithHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  HUAudioAnalysisSettingsItemModule *v8;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "arrayWithCapacity:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUAudioAnalysisSettingsItemModule initWithItemUpdater:home:]([HUAudioAnalysisSettingsItemModule alloc], "initWithItemUpdater:home:", v5, v6);

  objc_msgSend(v7, "addObject:", v8);
  return v7;
}

- (HUAudioAnalysisSettingsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  void *v5;
  HUAudioAnalysisSettingsViewController *v6;

  objc_msgSend(a4, "home", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUAudioAnalysisSettingsViewController initWithHome:](self, "initWithHome:", v5);

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUAudioAnalysisSettingsItemModuleController *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v4);
  v5 = -[HUItemModuleController initWithModule:]([HUAudioAnalysisSettingsItemModuleController alloc], "initWithModule:", v4);
  -[HUAudioAnalysisSettingsViewController setModuleController:](self, "setModuleController:", v5);

  -[HUAudioAnalysisSettingsViewController moduleController](self, "moduleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)serviceItem
{
  return self->_serviceItem;
}

- (void)setServiceItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItem, a3);
}

- (HUAudioAnalysisSettingsItemModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_moduleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleController, 0);
  objc_storeStrong((id *)&self->_serviceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
