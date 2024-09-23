@implementation HUCameraActivityZoneEditorViewController

- (HUCameraActivityZoneEditorViewController)initWithCameraProfile:(id)a3
{
  id v5;
  HUCameraActivityZoneEditorViewController *v6;
  HUCameraLiveStreamViewController *v7;
  HUCameraLiveStreamViewController *liveStreamViewController;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *initialActivityZones;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUCameraActivityZoneEditorViewController;
  v6 = -[HUCameraActivityZoneEditorViewController init](&v16, sel_init);
  if (v6)
  {
    v7 = -[HUCameraLiveStreamViewController initWithCameraProfile:]([HUCameraLiveStreamViewController alloc], "initWithCameraProfile:", v5);
    liveStreamViewController = v6->_liveStreamViewController;
    v6->_liveStreamViewController = v7;

    -[HUCameraLiveStreamViewController setLiveStreamControllerDelegate:](v6->_liveStreamViewController, "setLiveStreamControllerDelegate:", v6);
    -[HUCameraLiveStreamViewController setShouldRespectAspectRatio:](v6->_liveStreamViewController, "setShouldRespectAspectRatio:", 1);
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
    objc_msgSend(v5, "userSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityZones");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = objc_claimAutoreleasedReturnValue();
    initialActivityZones = v6->_initialActivityZones;
    v6->_initialActivityZones = (NSArray *)v11;

    if (-[NSArray count](v6->_initialActivityZones, "count"))
    {
      -[HUCameraActivityZoneEditorViewController cameraProfile](v6, "cameraProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_initialSettingDetectsInclusionZones = objc_msgSend(v14, "areActivityZonesIncludedForSignificantEventDetection");

    }
    else
    {
      v6->_initialSettingDetectsInclusionZones = 1;
    }
  }

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUCameraActivityZoneEditorViewController;
  -[HUCameraActivityZoneEditorViewController viewDidAppear:](&v22, sel_viewDidAppear_, a3);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    -[HUCameraActivityZoneEditorViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    -[HUCameraActivityZoneEditorViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeRestrictions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMinimumSize:", v6, v8);

    -[HUCameraActivityZoneEditorViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    -[HUCameraActivityZoneEditorViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeRestrictions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMaximumSize:", v15, v17);

  }
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
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t v33[16];
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)HUCameraActivityZoneEditorViewController;
  -[HUCameraActivityZoneEditorViewController viewDidLoad](&v34, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController liveStreamViewController](self, "liveStreamViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v7);

  -[HUCameraActivityZoneEditorViewController liveStreamViewController](self, "liveStreamViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController addChildViewController:](self, "addChildViewController:", v8);

  -[HUCameraActivityZoneEditorViewController liveStreamViewController](self, "liveStreamViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didMoveToParentViewController:", self);

  v10 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  v11 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorTitle"), CFSTR("HUCameraActivityZoneEditorTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v12);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v13);

  -[HUCameraActivityZoneEditorViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleView:", v10);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "center");
  v19 = v18;
  v21 = v20;
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v19, v21);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController tutorialLabel](self, "tutorialLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

  -[HUCameraActivityZoneEditorViewController cameraProfile](self, "cameraProfile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accessory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "home");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hf_currentUserIsAdministrator");

  if ((v28 & 1) == 0)
  {
    HFLogForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_INFO, "Bypassing admin controls for shared users", v33, 2u);
    }

    -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setUserInteractionEnabled:", 0);

    -[HUCameraActivityZoneEditorViewController displayActivityZoneState](self, "displayActivityZoneState");
    v11 = 0;
  }
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", v11, self, sel_cancelEditing);
  -[HUCameraActivityZoneEditorViewController navigationItem](self, "navigationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLeftBarButtonItem:", v31);

  -[HUCameraActivityZoneEditorViewController _refreshUI](self, "_refreshUI");
}

- (void)didUpdateActivityZone:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Did receive update for activity zone:%@", (uint8_t *)&v6, 0xCu);
  }

  -[HUCameraActivityZoneEditorViewController _refreshUI](self, "_refreshUI");
}

- (void)_refreshUI
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[HUCameraActivityZoneEditorViewController cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");

  if (v6)
  {
    -[HUCameraActivityZoneEditorViewController _updateToolbar](self, "_updateToolbar");
    -[HUCameraActivityZoneEditorViewController _updateNavigationBar](self, "_updateNavigationBar");
    -[HUCameraActivityZoneEditorViewController _updateTutorialText](self, "_updateTutorialText");
  }
}

- (void)_updateToolbar
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityZones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    if (v5 == 1)
      v7 = CFSTR("HUCameraActivityZoneInvertZoneText");
    else
      v7 = CFSTR("HUCameraActivityZoneInvertZonesText");
    _HULocalizedStringWithDefaultValue(v7, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 2, self, sel_invertZones);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v9, v18, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isCreatingActivityZone");

    if (v12)
    {
      -[HUCameraActivityZoneEditorViewController _addZoneButton](self, "_addZoneButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertObject:atIndex:", v13, 0);

    }
    -[HUCameraActivityZoneEditorViewController setToolbarItems:](self, "setToolbarItems:", v10);

  }
  else
  {
    -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isCreatingActivityZone");

    if (v15)
    {
      -[HUCameraActivityZoneEditorViewController _addZoneButton](self, "_addZoneButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraActivityZoneEditorViewController setToolbarItems:](self, "setToolbarItems:", v17);

    }
    else
    {
      -[HUCameraActivityZoneEditorViewController setToolbarItems:](self, "setToolbarItems:", 0);
    }
  }
}

- (void)_updateNavigationBar
{
  void *v3;
  id v4;

  if (-[HUCameraActivityZoneEditorViewController hasActivityZoneChanges](self, "hasActivityZoneChanges"))
  {
    -[HUCameraActivityZoneEditorViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_commitChangesAndDismissEditor);
    -[HUCameraActivityZoneEditorViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", v4);

  }
  else
  {
    -[HUCameraActivityZoneEditorViewController setModalInPresentation:](self, "setModalInPresentation:", 0);
    -[HUCameraActivityZoneEditorViewController navigationItem](self, "navigationItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", 0);
  }

}

- (void)_updateTutorialText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityZones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[HUCameraActivityZoneEditorViewController displayActivityZoneState](self, "displayActivityZoneState");
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneTutorialLabelText"), CFSTR("HUCameraActivityZoneTutorialLabelText"), 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneEditorViewController tutorialLabel](self, "tutorialLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

  }
}

- (void)displayActivityZoneState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;

  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityZones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "displaysInclusionZones");

  if ((_DWORD)v4)
  {
    if (v5 == 1)
      v7 = CFSTR("HUCameraActivityZoneInclusionZoneText");
    else
      v7 = CFSTR("HUCameraActivityZoneInclusionZonesText");
  }
  else if (v5 == 1)
  {
    v7 = CFSTR("HUCameraActivityZoneExclusionZoneText");
  }
  else
  {
    v7 = CFSTR("HUCameraActivityZoneExclusionZonesText");
  }
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController tutorialLabel](self, "tutorialLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

}

- (id)_addZoneButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneAddZoneText"), CFSTR("HUCameraActivityZoneAddZoneText"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, v5, sel_createActivityZone);

  return v6;
}

- (void)displayUnCommittedChangesAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZonesCancelWithoutSavingAlertTitle"), CFSTR("HUCameraActivityZonesCancelWithoutSavingAlertTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZonesCancelWithoutSavingAlertMessage"), CFSTR("HUCameraActivityZonesCancelWithoutSavingAlertMessage"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceView:", v7);

  -[HUCameraActivityZoneEditorViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toolbar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v6, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

  v20 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZonesProceedWithoutSavingText"), CFSTR("HUCameraActivityZonesProceedWithoutSavingText"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke;
  v28[3] = &unk_1E6F4C6E0;
  v28[4] = self;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 2, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v23);
  v24 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZonesSaveBeforeProceedingText"), CFSTR("HUCameraActivityZonesSaveBeforeProceedingText"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v27[1] = 3221225472;
  v27[2] = __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke_2;
  v27[3] = &unk_1E6F4C6E0;
  v27[4] = self;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v26);
  -[HUCameraActivityZoneEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitChangesAndDismissEditor");
}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  -[HUCameraActivityZoneEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)displayErrorAlert
{
  void *v3;
  id v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorErrorTitle"), CFSTR("HUCameraActivityZoneEditorErrorTitle"), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorErrorMessage"), CFSTR("HUCameraActivityZoneEditorErrorMessage"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController displayAlertWithTitle:message:](self, "displayAlertWithTitle:message:", v4, v3);

}

- (void)displayZoneOverlapAlert
{
  void *v3;
  id v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorZoneOverlapErrorTitle"), CFSTR("HUCameraActivityZoneEditorZoneOverlapErrorTitle"), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorZoneOverlapErrorMessage"), CFSTR("HUCameraActivityZoneEditorZoneOverlapErrorMessage"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController displayAlertWithTitle:message:](self, "displayAlertWithTitle:message:", v4, v3);

}

- (void)displayLineOverlapAlert
{
  void *v3;
  id v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorLineOverlapErrorTitle"), CFSTR("HUCameraActivityZoneEditorLineOverlapErrorTitle"), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorLineOverlapErrorMessage"), CFSTR("HUCameraActivityZoneEditorLineOverlapErrorMessage"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController displayAlertWithTitle:message:](self, "displayAlertWithTitle:message:", v4, v3);

}

- (void)displayMoveOverlapAlert
{
  void *v3;
  id v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorMoveOverlapErrorTitle"), CFSTR("HUCameraActivityZoneEditorMoveOverlapErrorTitle"), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneEditorMoveOverlapErrorMessage"), CFSTR("HUCameraActivityZoneEditorMoveOverlapErrorMessage"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneEditorViewController displayAlertWithTitle:message:](self, "displayAlertWithTitle:message:", v4, v3);

}

- (void)_updateViewsForTraitCollection
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  NSObject *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint8_t v60[16];
  CGRect v61;

  -[HUCameraActivityZoneEditorViewController tutorialLabel](self, "tutorialLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[HUCameraActivityZoneEditorViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hu_hasExtendedWidth"))
    v11 = 40.0;
  else
    v11 = 60.0;

  -[HUCameraActivityZoneEditorViewController tutorialLabel](self, "tutorialLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v11, v7, v9);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v61.origin.x = v5;
  v61.origin.y = v11;
  v61.size.width = v7;
  v61.size.height = v9;
  v16 = v15 - CGRectGetMaxY(v61);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  if (v23 >= v25)
    v26 = v25;
  else
    v26 = v23;
  if (v26 >= v16)
    v27 = v16;
  else
    v27 = v26;
  -[HUCameraActivityZoneEditorViewController cameraProfile](self, "cameraProfile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "snapshotControl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mostRecentSnapshot");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "aspectRatio");
  if (v31 == 0.0)
    v32 = 1.0;
  else
    v32 = v31;

  if (v32 == 1.0)
  {
    HFLogForCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v60 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_ERROR, "Invalid aspect ratio. Using 1:1.", v60, 2u);
    }

  }
  if (v32 >= 1.0)
    v34 = v27 / v32;
  else
    v34 = v27 * v32;
  -[HUCameraActivityZoneEditorViewController liveStreamViewController](self, "liveStreamViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v19, v21, v27, v34);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "center");
  v39 = v38;
  v41 = v40;
  -[HUCameraActivityZoneEditorViewController liveStreamViewController](self, "liveStreamViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setCenter:", v39, v41);

  -[HUCameraActivityZoneEditorViewController liveStreamViewController](self, "liveStreamViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setShouldRespectAspectRatio:", 1);

  if (v32 < 1.0)
    v27 = v32 * v34;
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v19, v21, v27, v34);

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "center");
  v48 = v47;
  v50 = v49;
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setCenter:", v48, v50);

  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "updateAfterVideoBoundsChange");

  -[HUCameraActivityZoneEditorViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "center");
  v55 = v54;
  v57 = v56;
  -[HUCameraActivityZoneEditorViewController liveStreamViewController](self, "liveStreamViewController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setCenter:", v55, v57);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCameraActivityZoneEditorViewController;
  -[HUCameraActivityZoneEditorViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HUCameraActivityZoneEditorViewController _updateViewsForTraitCollection](self, "_updateViewsForTraitCollection");
}

- (void)invertZones
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displaysInclusionZones") ^ 1;
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplaysInclusionZones:", v4);

  -[HUCameraActivityZoneEditorViewController _updateTutorialText](self, "_updateTutorialText");
  -[HUCameraActivityZoneEditorViewController _updateNavigationBar](self, "_updateNavigationBar");
}

- (void)cancelEditing
{
  if (-[HUCameraActivityZoneEditorViewController hasActivityZoneChanges](self, "hasActivityZoneChanges"))
    -[HUCameraActivityZoneEditorViewController displayUnCommittedChangesAlert](self, "displayUnCommittedChangesAlert");
  else
    -[HUCameraActivityZoneEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)hasActivityZoneChanges
{
  int v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  NSObject *v22;
  _BYTE *v23;
  _BYTE buf[24];
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[HUCameraActivityZoneEditorViewController initialSettingDetectsInclusionZones](self, "initialSettingDetectsInclusionZones");
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displaysInclusionZones");

  if (v3 != v5)
    return 1;
  -[HUCameraActivityZoneEditorViewController initialActivityZones](self, "initialActivityZones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityZones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v8 == v11)
  {
    -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activityZones");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v25 = 0;
    -[HUCameraActivityZoneEditorViewController initialActivityZones](self, "initialActivityZones");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke;
    v21[3] = &unk_1E6F4EB50;
    v15 = v13;
    v22 = v15;
    v23 = buf;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

    v6 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraActivityZoneEditorViewController initialActivityZones](self, "initialActivityZones");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activityZones");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v19, "count");
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Activity zones have changed. Total count changed from:%lu to:%lu", buf, 0x16u);

    }
    v6 = 1;
  }

  return v6;
}

void __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "points");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(v8, "count");

  if (v10 == v11)
  {
    objc_msgSend(v7, "points");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke_67;
    v17[3] = &unk_1E6F4EB28;
    v13 = v8;
    v14 = *(_QWORD *)(a1 + 40);
    v18 = v13;
    v19 = v14;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

  }
  else
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "points");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v21 = objc_msgSend(v16, "count");
      v22 = 2048;
      v23 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Activity zones have changed. Number of points changed from:%lu to:%lu", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke_67(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "point");
  v10 = v9;
  objc_msgSend(v7, "point");
  if (vabdd_f64(v10, v11) > 0.001)
  {
    objc_msgSend(v8, "point");
    v13 = v12;
    objc_msgSend(v7, "point");
    if (vabdd_f64(v13, v14) > 0.001)
    {
      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412802;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Activity zone has changed. Points differ:%@ vs %@ at index:%lu.", (uint8_t *)&v16, 0x20u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (void)commitChangesAndDismissEditor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  HUCameraActivityZoneEditorViewController *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[HUCameraActivityZoneEditorViewController hasActivityZoneChanges](self, "hasActivityZoneChanges"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityZones");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke;
    v19[3] = &unk_1E6F4EB78;
    v7 = v3;
    v20 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    -[HUCameraActivityZoneEditorViewController _displayProgressIndicatorWhileLoading](self, "_displayProgressIndicatorWhileLoading");
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "displaysInclusionZones");
      *(_DWORD *)buf = 138412802;
      v22 = self;
      v23 = 1024;
      v24 = v10;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@ Editor: Submitting zoneType inclusion:%{BOOL}d zones:%@", buf, 0x1Cu);

    }
    objc_initWeak((id *)buf, self);
    -[HUCameraActivityZoneEditorViewController cameraProfile](self, "cameraProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneEditorViewController activityZoneCanvas](self, "activityZoneCanvas");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "displaysInclusionZones");
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke_73;
    v16[3] = &unk_1E6F4EBA0;
    objc_copyWeak(&v18, (id *)buf);
    v15 = v7;
    v17 = v15;
    objc_msgSend(v12, "updateActivityZones:areActivityZonesIncludedForSignificantEventDetection:completionHandler:", v15, v14, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[HUCameraActivityZoneEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

void __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Editor: Appending first point to the end of the array of points:%@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(v3, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA3A8]), "initWithPoints:", v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

  }
}

void __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = (uint64_t)v3;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Failure to update activity zones with error:%@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(WeakRetained, "_updateNavigationBar");
    objc_msgSend(WeakRetained, "displayErrorAlert");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Saved activity zones %lu without error.", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_displayProgressIndicatorWhileLoading
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
  -[HUCameraActivityZoneEditorViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(v5, "startAnimating");
}

- (HUCameraActivityZoneCanvasView)activityZoneCanvas
{
  HUCameraActivityZoneCanvasView *activityZoneCanvas;
  HUCameraActivityZoneCanvasView *v4;
  void *v5;
  HUCameraActivityZoneCanvasView *v6;
  void *v7;
  HUCameraActivityZoneCanvasView *v8;

  activityZoneCanvas = self->_activityZoneCanvas;
  if (!activityZoneCanvas)
  {
    v4 = [HUCameraActivityZoneCanvasView alloc];
    -[HUCameraActivityZoneEditorViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[HUCameraActivityZoneCanvasView initWithFrame:](v4, "initWithFrame:");

    -[HUCameraActivityZoneCanvasView setDelegate:](v6, "setDelegate:", self);
    -[HUCameraActivityZoneCanvasView setDisplaysInclusionZones:](v6, "setDisplaysInclusionZones:", -[HUCameraActivityZoneEditorViewController initialSettingDetectsInclusionZones](self, "initialSettingDetectsInclusionZones"));
    -[HUCameraActivityZoneEditorViewController initialActivityZones](self, "initialActivityZones");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneCanvasView loadActivityZones:](v6, "loadActivityZones:", v7);

    v8 = self->_activityZoneCanvas;
    self->_activityZoneCanvas = v6;

    activityZoneCanvas = self->_activityZoneCanvas;
  }
  return activityZoneCanvas;
}

- (UILabel)tutorialLabel
{
  UILabel *tutorialLabel;
  void *v4;
  double v5;
  double v6;
  UILabel *v7;
  void *v8;
  void *v9;
  UILabel *v10;

  tutorialLabel = self->_tutorialLabel;
  if (!tutorialLabel)
  {
    -[HUCameraActivityZoneEditorViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5 + -20.0;

    v7 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 10.0, 60.0, v6, 50.0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraActivityZoneTutorialLabelText"), CFSTR("HUCameraActivityZoneTutorialLabelText"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v8);

    -[UILabel setTextAlignment:](v7, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v9);

    -[UILabel setAdjustsFontSizeToFitWidth:](v7, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAutoresizingMask:](v7, "setAutoresizingMask:", 2);
    v10 = self->_tutorialLabel;
    self->_tutorialLabel = v7;

    tutorialLabel = self->_tutorialLabel;
  }
  return tutorialLabel;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  HUCameraActivityZoneEditorViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Editing complete. Dealloc.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)HUCameraActivityZoneEditorViewController;
  -[HUCameraActivityZoneEditorViewController dealloc](&v4, sel_dealloc);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (void)setActivityZoneCanvas:(id)a3
{
  objc_storeStrong((id *)&self->_activityZoneCanvas, a3);
}

- (void)setTutorialLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tutorialLabel, a3);
}

- (HUCameraLiveStreamViewController)liveStreamViewController
{
  return self->_liveStreamViewController;
}

- (void)setLiveStreamViewController:(id)a3
{
  objc_storeStrong((id *)&self->_liveStreamViewController, a3);
}

- (NSArray)initialActivityZones
{
  return self->_initialActivityZones;
}

- (void)setInitialActivityZones:(id)a3
{
  objc_storeStrong((id *)&self->_initialActivityZones, a3);
}

- (BOOL)initialSettingDetectsInclusionZones
{
  return self->_initialSettingDetectsInclusionZones;
}

- (void)setInitialSettingDetectsInclusionZones:(BOOL)a3
{
  self->_initialSettingDetectsInclusionZones = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialActivityZones, 0);
  objc_storeStrong((id *)&self->_liveStreamViewController, 0);
  objc_storeStrong((id *)&self->_tutorialLabel, 0);
  objc_storeStrong((id *)&self->_activityZoneCanvas, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end
