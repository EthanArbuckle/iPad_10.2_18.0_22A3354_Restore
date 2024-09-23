@implementation HUMultiCameraRecordingOptionsTableViewController

- (HUMultiCameraRecordingOptionsTableViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  HUMultiCameraRecordingOptionsItemManager *v7;
  HUMultiCameraRecordingOptionsTableViewController *v8;
  HUMultiCameraRecordingOptionsTableViewController *v9;
  objc_super v11;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31418]), "initWithHome:", v5);
  v7 = -[HFItemManager initWithDelegate:sourceItem:]([HUMultiCameraRecordingOptionsItemManager alloc], "initWithDelegate:sourceItem:", self, v6);
  v11.receiver = self;
  v11.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v11, sel_initWithItemManager_tableViewStyle_, v7, 2);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    objc_storeStrong((id *)&v9->_recordingOptionsItemManager, v7);
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
  void *v8;
  void *v9;
  _QWORD v11[5];
  objc_super v12;

  v3 = (void *)objc_opt_new();
  v12.receiver = self;
  v12.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  -[HUCameraRecordingOptionsTableViewController itemModuleControllers](&v12, sel_itemModuleControllers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[HUMultiCameraRecordingOptionsTableViewController cameraSettingsModuleControllers](self, "cameraSettingsModuleControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMultiCameraRecordingOptionsTableViewController setCameraSettingsModuleControllers:](self, "setCameraSettingsModuleControllers:", v6);

    -[HUMultiCameraRecordingOptionsTableViewController recordingOptionsItemManager](self, "recordingOptionsItemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraRecordingItemModules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__HUMultiCameraRecordingOptionsTableViewController_itemModuleControllers__block_invoke;
    v11[3] = &unk_1E6F5B2F8;
    v11[4] = self;
    objc_msgSend(v8, "na_each:", v11);

  }
  -[HUMultiCameraRecordingOptionsTableViewController cameraSettingsModuleControllers](self, "cameraSettingsModuleControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  return v3;
}

void __73__HUMultiCameraRecordingOptionsTableViewController_itemModuleControllers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  HUCameraSettingsModuleController *v5;

  v3 = a2;
  v5 = -[HUCameraSettingsModuleController initWithModule:]([HUCameraSettingsModuleController alloc], "initWithModule:", v3);

  -[HUCameraSettingsModuleController setUseProxSetupPresentationStyle:](v5, "setUseProxSetupPresentationStyle:", 1);
  -[HUCameraSettingsModuleController setHost:](v5, "setHost:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "cameraSettingsModuleControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  -[HUCameraRecordingOptionsTableViewController viewDidLoad](&v2, sel_viewDidLoad);
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
  v9.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  v7 = a4;
  -[HUCameraRecordingOptionsTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __103__HUMultiCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6F4CB78;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

void __103__HUMultiCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cameraSettingsModuleControllers");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_each:", &__block_literal_global_209);

}

uint64_t __103__HUMultiCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "viewSizeDidChanged");
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
  HUMultiCameraRecordingOptionsTableViewController *v24;
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
    objc_msgSend(v14, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addButton:", v15);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __103__HUMultiCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
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

void __103__HUMultiCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)dismissTextViewController
{
  id v2;

  -[HUMultiCameraRecordingOptionsTableViewController navigationController](self, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (HUMultiCameraRecordingOptionsItemManager)recordingOptionsItemManager
{
  return self->_recordingOptionsItemManager;
}

- (void)setRecordingOptionsItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_recordingOptionsItemManager, a3);
}

- (NSMutableArray)cameraSettingsModuleControllers
{
  return self->_cameraSettingsModuleControllers;
}

- (void)setCameraSettingsModuleControllers:(id)a3
{
  objc_storeStrong((id *)&self->_cameraSettingsModuleControllers, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_cameraSettingsModuleControllers, 0);
  objc_storeStrong((id *)&self->_recordingOptionsItemManager, 0);
}

@end
