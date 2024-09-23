@implementation HUCameraRecordingOptionsTableViewController

- (HUCameraRecordingOptionsTableViewController)initWithServiceLikeItem:(id)a3
{
  id v4;
  HUCameraRecordingOptionsItemManager *v5;
  void *v6;
  HUCameraRecordingOptionsItemManager *v7;
  HUCameraRecordingOptionsTableViewController *v8;
  HUCameraRecordingOptionsTableViewController *v9;
  objc_super v11;

  v4 = a3;
  v5 = [HUCameraRecordingOptionsItemManager alloc];
  v6 = (void *)objc_msgSend(v4, "copy");

  v7 = -[HFItemManager initWithDelegate:sourceItem:](v5, "initWithDelegate:sourceItem:", self, v6);
  -[HUCameraRecordingOptionsItemManager setDisplayStyle:](v7, "setDisplayStyle:", 3);
  v11.receiver = self;
  v11.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v11, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_detailsItemManager, v7);
    v9->_displayStyle = 3;
  }

  return v9;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HUCameraSettingsModuleController *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)objc_opt_new();
  v14.receiver = self;
  v14.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  -[HUItemTableViewController itemModuleControllers](&v14, sel_itemModuleControllers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[HUCameraRecordingOptionsTableViewController detailsItemManager](self, "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraRecordingItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUCameraRecordingOptionsTableViewController cameraSettingsModuleController](self, "cameraSettingsModuleController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = -[HUCameraSettingsModuleController initWithModule:]([HUCameraSettingsModuleController alloc], "initWithModule:", v6);
      -[HUCameraRecordingOptionsTableViewController setCameraSettingsModuleController:](self, "setCameraSettingsModuleController:", v8);

      v9 = -[HUCameraRecordingOptionsTableViewController displayStyle](self, "displayStyle") == 2;
      -[HUCameraRecordingOptionsTableViewController cameraSettingsModuleController](self, "cameraSettingsModuleController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUseProxSetupPresentationStyle:", v9);

      -[HUCameraRecordingOptionsTableViewController cameraSettingsModuleController](self, "cameraSettingsModuleController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHost:", self);

    }
  }
  -[HUCameraRecordingOptionsTableViewController cameraSettingsModuleController](self, "cameraSettingsModuleController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v12);

  return v3;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  id WeakRetained;

  if (self->_displayStyle != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_detailsItemManager);
    objc_msgSend(WeakRetained, "setDisplayStyle:", a3);

    self->_displayStyle = a3;
  }
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  -[HUItemTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRecordingOptionsDisplayTitle"), CFSTR("HUServiceDetailsRecordingOptionsDisplayTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[HUCameraRecordingOptionsTableViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleView:", v3);

  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AccessoryDetails.RecordingOptionDisplayTitle"));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  v7 = a4;
  -[HUItemTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__HUCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6F4CB78;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

void __98__HUCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cameraSettingsModuleController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewSizeDidChanged");

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  HUCameraRecordingOptionsTableViewController *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = self;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "hf_cameraRecordingURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D651A8]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraAndRecordingLearnMoreTitle"), CFSTR("HUCameraAndRecordingLearnMoreTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraAndRecordingLearnMoreBody"), CFSTR("HUCameraAndRecordingLearnMoreBody"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTitle:detailText:symbolName:contentLayout:", v12, v13, 0, 2);

    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v16, 0);

    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_dismissTextViewController, 64);
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("AccessoryDetails.DoneButton"));
    objc_msgSend(v14, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addButton:", v15);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __98__HUCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v21[3] = &unk_1E6F4C638;
    v21[4] = self;
    v22 = v14;
    v18 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v15, "openURL:", v7);
  }

  return v10 ^ 1;
}

void __98__HUCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)dismissTextViewController
{
  id v2;

  -[HUCameraRecordingOptionsTableViewController navigationController](self, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (HUCameraRecordingOptionsItemManager)detailsItemManager
{
  return (HUCameraRecordingOptionsItemManager *)objc_loadWeakRetained((id *)&self->_detailsItemManager);
}

- (void)setDetailsItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_detailsItemManager, a3);
}

- (HUCameraSettingsModuleController)cameraSettingsModuleController
{
  return self->_cameraSettingsModuleController;
}

- (void)setCameraSettingsModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraSettingsModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraSettingsModuleController, 0);
  objc_destroyWeak((id *)&self->_detailsItemManager);
}

@end
