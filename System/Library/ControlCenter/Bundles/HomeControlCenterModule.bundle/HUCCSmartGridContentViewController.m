@implementation HUCCSmartGridContentViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v7;
    v31 = 2080;
    v32 = "-[HUCCSmartGridContentViewController viewWillAppear:]";
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);

  }
  objc_msgSend_delegate(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_smartGridContentViewController_viewWillAppear_(v10, v11, (uint64_t)self, v3);

  v28.receiver = self;
  v28.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController viewWillAppear:](&v28, sel_viewWillAppear_, v3);
  objc_msgSend_view(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_frame(v14, v15, v16);
  v21 = HUCCSizeSubclassForModuleViewWidth(v17, v18, v19, v20);

  objc_msgSend_smartGridViewController(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSizeSubclass_(v24, v25, v21);

  objc_msgSend__setUpSmartGridContent(self, v26, v27);
}

- (HUCCSmartGridContentViewControllerDelegate)delegate
{
  return (HUCCSmartGridContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_tearDownSmartGridContent
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint8_t v64[16];

  objc_msgSend_activeAssertion(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_setIsExpanded_(self, v5, 0);
    objc_msgSend_dashboardContainerViewController(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopRemoteViewController(v8, v9, v10);

    objc_msgSend_view(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resetToInitialState(v13, v14, v15);

    objc_msgSend_dashboardContainerViewController(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromParentViewController(v18, v19, v20);

    objc_msgSend_setDashboardContainerViewController_(self, v21, 0);
    objc_msgSend_setIsTransitioningToHomeControlService_(self, v22, 0);
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_230FDD000, v23, OS_LOG_TYPE_DEFAULT, "Terminating HomeControlService", v64, 2u);
    }

    objc_msgSend_sharedInstance(MEMORY[0x24BE4F478], v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dismissService(v26, v27, v28);

    objc_msgSend_policyWithDecision_(MEMORY[0x24BE4D170], v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_smartGridViewController(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemManager(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReadPolicy_(v36, v37, (uint64_t)v30);

    objc_msgSend_smartGridViewController(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)objc_msgSend_dismissQuickControlAnimated_wasDismissed_(v40, v41, 0, 0);

    objc_msgSend_sharedDispatcher(MEMORY[0x24BE4D0B0], v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeManager(v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homes(v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_na_each_(v51, v52, (uint64_t)&unk_24FFD85E8);

    objc_msgSend_sharedDispatcher(MEMORY[0x24BE4D0B0], v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeManager(v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activeAssertion(self, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__endActiveAssertion_(v58, v62, (uint64_t)v61);

    objc_msgSend_setActiveAssertion_(self, v63, 0);
  }
}

- (void)setURLHandler:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  objc_storeStrong((id *)&self->_URLHandler, a3);
  v5 = a3;
  objc_msgSend_smartGridViewController(self, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setURLHandler_(v9, v8, (uint64_t)v5);

}

- (HUCCSmartGridContentViewController)initWithDelegate:(id)a3
{
  id v4;
  HUCCSmartGridContentViewController *v5;
  HUCCSmartGridContentViewController *v6;
  HUCCSmartGridViewController *v7;
  const char *v8;
  uint64_t v9;
  HUCCSmartGridViewController *smartGridViewController;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUCCSmartGridContentViewController;
  v5 = -[HUCCSmartGridContentViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_expandedContentMode = 0;
    v7 = [HUCCSmartGridViewController alloc];
    v9 = objc_msgSend_initWithItemType_delegate_(v7, v8, 0, v6);
    smartGridViewController = v6->_smartGridViewController;
    v6->_smartGridViewController = (HUCCSmartGridViewController *)v9;

  }
  return v6;
}

- (void)loadView
{
  HUCCSmartContainerView *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(HUCCSmartContainerView);
  objc_msgSend_setView_(self, v4, (uint64_t)v3);

  objc_msgSend_systemWhiteColor(MEMORY[0x24BDF6950], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(v10, v11, (uint64_t)v7);

  objc_msgSend_smartGridViewController(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beginAppearanceTransition_animated_(v14, v15, 1, 0);

  objc_msgSend_smartGridViewController(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addChildViewController_(self, v19, (uint64_t)v18);

  objc_msgSend_smartGridViewController(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCompressedView_(v28, v29, (uint64_t)v25);

  objc_msgSend_smartGridViewController(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didMoveToParentViewController_(v32, v33, (uint64_t)self);

  objc_msgSend_smartGridViewController(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beginAppearanceTransition_animated_(v36, v37, 0, 0);

  objc_msgSend_smartGridViewController(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endAppearanceTransition(v40, v41, v42);

  HFLogForCategory();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138412546;
    v47 = v45;
    v48 = 2080;
    v49 = "-[HUCCSmartGridContentViewController loadView]";
    _os_log_impl(&dword_230FDD000, v43, OS_LOG_TYPE_DEFAULT, "%@:%s", (uint8_t *)&v46, 0x16u);

  }
}

- (void)viewDidLoad
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  float v11;
  const char *v12;
  uint64_t v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2080;
    v18 = "-[HUCCSmartGridContentViewController viewDidLoad]";
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);

  }
  v14.receiver = self;
  v14.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController viewDidLoad](&v14, sel_viewDidLoad);
  v6 = objc_alloc_init(MEMORY[0x24BDF6BE8]);
  objc_msgSend_largeTitleTextAttributes(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionLargeTitleTextAttributes_(self, v10, (uint64_t)v9);

  MGGetFloat32Answer();
  objc_msgSend_setTransitionDeviceCornerRadius_(self, v12, v13, v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_window(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("yes");
    if (!v12)
      v13 = CFSTR("no");
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    v17 = 2080;
    v18 = "-[HUCCSmartGridContentViewController viewDidAppear:]";
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_230FDD000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v7;
    v25 = 2080;
    v26 = "-[HUCCSmartGridContentViewController viewWillDisappear:]";
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);

  }
  objc_msgSend_accessoryControlsViewController(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accessoryControlsViewController(self, v14, v15);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v13;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_230FDD000, v11, OS_LOG_TYPE_DEFAULT, "%@ was asked to dismiss while accessory controls were still presented: %@", buf, 0x16u);

    }
    objc_msgSend_accessoryControlsViewController(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dismissAccessoryControlsAnimated_completion_(v19, v20, v3, 0);

    objc_msgSend_setAccessoryControlsViewController_(self, v21, 0);
  }
  v22.receiver = self;
  v22.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController viewWillDisappear:](&v22, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v7;
    v32 = 2080;
    v33 = "-[HUCCSmartGridContentViewController viewDidDisappear:]";
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);

  }
  objc_msgSend__tearDownSmartGridContent(self, v8, v9);
  objc_msgSend_accessoryControlsViewController(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accessoryControlsViewController(self, v17, v18);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v16;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_230FDD000, v14, OS_LOG_TYPE_DEFAULT, "%@ disappeared while accessory controls were still presented: %@", buf, 0x16u);

    }
    objc_msgSend_accessoryControlsViewController(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dismissAccessoryControlsAnimated_completion_(v22, v23, 0, 0);

    objc_msgSend_setAccessoryControlsViewController_(self, v24, 0);
  }
  objc_msgSend_setExpandedContentMode_(self, v13, 0);
  v29.receiver = self;
  v29.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController viewDidDisappear:](&v29, sel_viewDidDisappear_, v3);
  objc_msgSend_delegate(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_smartGridContentViewController_viewDidDisappear_(v27, v28, (uint64_t)self, v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (objc_msgSend_expandedContentMode(self, v8, v9) == 1)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_230FEA0D4;
    v11[3] = &unk_24FFD8558;
    v11[4] = self;
    objc_msgSend_animateAlongsideTransition_completion_(v7, v10, (uint64_t)v11, 0);
  }

}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend__tearDownSmartGridContent(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)HUCCSmartGridContentViewController;
  -[HUCCSmartGridContentViewController dealloc](&v4, sel_dealloc);
}

- (CCUIModuleLayoutSize)moduleLayoutSizeForOrientation:(int64_t)a3
{
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;
  CCUIModuleLayoutSize result;

  v25 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HUCCStringForOrientation(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_230FDD000, v6, OS_LOG_TYPE_DEFAULT, "Computing module layout size for orientiation: %@", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend_smartGridViewController(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_occupiedGridSizeForOrientation_(v10, v11, a3);
  v14 = v13;

  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v16;
    v21 = 2048;
    v22 = v12;
    v23 = 2048;
    v24 = v14;
    _os_log_impl(&dword_230FDD000, v15, OS_LOG_TYPE_DEFAULT, "%@ - height: %ld, width: %ld", (uint8_t *)&v19, 0x20u);

  }
  v17 = v14;
  v18 = v12;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldUseCompactContentFrameForExpandedContent
{
  uint64_t v2;

  return objc_msgSend_expandedContentMode(self, a2, v2) != 2;
}

- (BOOL)shouldPerformClickInteraction
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isShowingLockSecurity;

  objc_msgSend_view(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(v3, v4, v5);

  return isShowingLockSecurity;
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (UIViewPropertyAnimator)customAnimator
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  HUCCSmartGridPropertyAnimator *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  id v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  HUCCSmartGridPropertyAnimator *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];

  if (objc_msgSend_expandedContentMode(self, a2, v2) == 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend__prepareTransitionSubviews(self, v4, v5);
    if (objc_msgSend_isExpanded(self, v7, v8))
    {
      v15 = objc_alloc(MEMORY[0x24BDF6DC8]);
      v18 = (void *)objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(v15, v16, v17, 1.0, 205.7182, 22.85739, 0.0, 0.0);
      v19 = [HUCCSmartGridPropertyAnimator alloc];
      v6 = (void *)objc_msgSend_initWithDuration_timingParameters_(v19, v20, (uint64_t)v18, 0.0);
      objc_msgSend_setDelegate_(v6, v21, (uint64_t)self);
      v22 = MEMORY[0x24BDAC760];
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = sub_230FEA59C;
      v43[3] = &unk_24FFD8580;
      v43[4] = self;
      objc_msgSend_addAnimations_(v6, v23, (uint64_t)v43);
      v42[0] = v22;
      v42[1] = 3221225472;
      v42[2] = sub_230FEAA24;
      v42[3] = &unk_24FFD8580;
      v42[4] = self;
      objc_msgSend_addAnimations_(v6, v24, (uint64_t)v42);
    }
    else
    {
      LODWORD(v11) = 1048168144;
      LODWORD(v12) = 1053104274;
      LODWORD(v13) = 1057634019;
      LODWORD(v14) = 1064730781;
      objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v9, v10, v11, v12, v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x24BDF69A0]);
      v27 = (void *)objc_msgSend_initWithCustomCurve_(v25, v26, (uint64_t)v18);
      v28 = objc_alloc(MEMORY[0x24BDF6DC8]);
      v31 = (void *)objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(v28, v29, v30, 3.0, 500.0, 1000.0, 0.0, 0.0);
      objc_msgSend_setSpringTimingParameters_(v27, v32, (uint64_t)v31);

      v33 = [HUCCSmartGridPropertyAnimator alloc];
      v6 = (void *)objc_msgSend_initWithDuration_timingParameters_(v33, v34, (uint64_t)v27, 0.45);
      objc_msgSend_setDelegate_(v6, v35, (uint64_t)self);
      v36 = MEMORY[0x24BDAC760];
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = sub_230FEB1C8;
      v41[3] = &unk_24FFD8580;
      v41[4] = self;
      objc_msgSend_addAnimations_(v6, v37, (uint64_t)v41);
      v40[0] = v36;
      v40[1] = 3221225472;
      v40[2] = sub_230FEB628;
      v40[3] = &unk_24FFD8580;
      v40[4] = self;
      objc_msgSend_addAnimations_(v6, v38, (uint64_t)v40);

    }
  }
  return (UIViewPropertyAnimator *)v6;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int isShowingLockSecurity;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  int isAnIPad;
  const char *v31;
  uint64_t v32;
  double v33;
  _QWORD v35[4];
  id v36;
  id location;

  v4 = objc_msgSend_expandedContentMode(self, a2, v2);
  if (v4 != 1)
  {
    if ((objc_msgSend_isTransitioningToHomeControlService(self, v5, v6) & 1) != 0)
    {
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    objc_msgSend_view(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(v9, v10, v11);

    if (isShowingLockSecurity)
    {
      objc_initWeak(&location, self);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = sub_230FEBE20;
      v35[3] = &unk_24FFD81D8;
      objc_copyWeak(&v36, &location);
      dispatch_async(MEMORY[0x24BDAC9B8], v35);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    if (!objc_msgSend__shouldDisplayHomeControlService(self, v13, v14))
    {
      objc_msgSend__openHomeApp(self, v15, v16);
      goto LABEL_10;
    }
    objc_msgSend_view(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hu_frameInGlobalCoordinateSpace(v17, v18, v19);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    isAnIPad = objc_msgSend_isAnIPad(MEMORY[0x24BE4D198], v28, v29);
    v33 = 0.0;
    if (!isAnIPad)
      v33 = v21;
    objc_msgSend_setTransitionCompressedViewFrame_(self, v31, v32, v33, v23, v25, v27);
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t isExpanded;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  double v84;
  double v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  double v124;
  double v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  double v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  double v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  double v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  id v180;

  v3 = a3;
  objc_msgSend_setIsExpanded_(self, a2, a3);
  if (v3 && objc_msgSend_expandedContentMode(self, v5, v6) != 1)
  {
    objc_msgSend_delegate(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentModuleContext(v7, v12, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHomeGestureDismissalAllowed_(v10, v14, 1);
  }
  else
  {
    objc_msgSend_delegate(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentModuleContext(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHomeGestureDismissalAllowed_(v10, v11, 0);
  }

  if (objc_msgSend_expandedContentMode(self, v15, v16) != 1 && UIAccessibilityIsReduceMotionEnabled())
  {
    isExpanded = objc_msgSend_isExpanded(self, v17, v18);
    objc_msgSend_view(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_compressedView(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v25, v26, isExpanded);

    v29 = objc_msgSend_isExpanded(self, v27, v28);
    objc_msgSend_smartGridViewController(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v35, v36, v29);

    v39 = objc_msgSend_isExpanded(self, v37, v38) ^ 1;
    objc_msgSend_view(self, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v45, v46, v39);

    v49 = objc_msgSend_isExpanded(self, v47, v48) ^ 1;
    objc_msgSend_view(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v55, v56, v49);

    objc_msgSend_dashboardContainerViewController(self, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedContentFrame(v59, v60, v61);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    objc_msgSend_view(self, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFrame_(v75, v76, v77, v63, v65, v67, v69);

    if (objc_msgSend_isAnIPad(MEMORY[0x24BE4D198], v78, v79))
      CCUIExpandedModuleContinuousCornerRadius();
    else
      objc_msgSend_transitionDeviceCornerRadius(self, v80, v81);
    v85 = v84;
    objc_msgSend_view(self, v82, v83);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v89, v90, v91, v85);

    objc_msgSend_view(self, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v94, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_frame(v97, v98, v99);
    v101 = v100;
    v103 = v102;
    v105 = v104;
    v107 = v106;
    objc_msgSend_view(self, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFrame_(v113, v114, v115, v101, v103, v105, v107);

    objc_msgSend_view(self, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__continuousCornerRadius(v121, v122, v123);
    v125 = v124;
    objc_msgSend_view(self, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v131, v132, v133, v125);

    if (objc_msgSend_isExpanded(self, v134, v135))
      v138 = 0.0;
    else
      v138 = 1.0;
    objc_msgSend_view(self, v136, v137);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_compressedView(v139, v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v142, v143, v144, v138);

    if (objc_msgSend_isExpanded(self, v145, v146))
      v149 = 1.0;
    else
      v149 = 0.0;
    objc_msgSend_view(self, v147, v148);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v150, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v153, v154, v155, v149);

    if (objc_msgSend_isExpanded(self, v156, v157))
      v160 = 1.0;
    else
      v160 = 0.0;
    objc_msgSend_view(self, v158, v159);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v161, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v164, v165, v166, v160);

    objc_msgSend_dashboardContainerViewController(self, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend_isExpanded(self, v170, v171);
    objc_msgSend_willBeginTransition_forCompactModule_(v169, v173, v172, 0);

    objc_msgSend_dashboardContainerViewController(self, v174, v175);
    v180 = (id)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend_isExpanded(self, v176, v177);
    objc_msgSend_willFinishTransition_forCompactModule_(v180, v179, v178, 0);

  }
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  if (!a3)
    objc_msgSend_setExpandedContentMode_(self, a2, 0);
}

- (void)displayWillTurnOff
{
  uint64_t v2;
  double v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;

  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend_view(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedView(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrameOrigin_(v9, v10, v11, v4, v5);

  objc_msgSend_view(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedView(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v17, v18, v19, 1.0);

  objc_msgSend_view(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animationView(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v25, v26, 1);

  objc_msgSend_smartGridViewController(self, v27, v28);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v33, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v31, v32, 0);

}

- (void)propertyAnimatorDidStartAnimating:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t isExpanded;
  const char *v7;
  id v8;

  objc_msgSend_dashboardContainerViewController(self, a2, (uint64_t)a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  isExpanded = objc_msgSend_isExpanded(self, v4, v5);
  objc_msgSend_willBeginTransition_forCompactModule_(v8, v7, isExpanded, 0);

}

- (void)_prepareTransitionSubviews
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  double v88;
  double v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  double v120;
  double v121;
  const char *v122;
  uint64_t v123;
  double v124;
  double v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  id v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  void *v148;
  const char *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  const char *v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  const char *v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  double v230;
  double v231;
  const char *v232;
  uint64_t v233;
  double v234;
  double v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  const char *v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  double v266;
  double v267;
  const char *v268;
  uint64_t v269;
  double v270;
  double v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  id v289;
  const char *v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  void *v294;
  const char *v295;
  const char *v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  void *v306;
  const char *v307;
  const char *v308;
  uint64_t v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  const char *v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  const char *v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  void *v339;
  const char *v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  const char *v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  const char *v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  double v361;
  double v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  const char *v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  const char *v374;
  uint64_t v375;
  double v376;
  double v377;
  const char *v378;
  uint64_t v379;
  double v380;
  double v381;
  const char *v382;
  uint64_t v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  void *v389;
  const char *v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  double v397;
  double v398;
  double v399;
  double v400;
  double v401;
  double v402;
  double v403;
  double v404;
  const char *v405;
  uint64_t v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  double v412;
  double v413;
  const char *v414;
  uint64_t v415;
  double v416;
  double v417;
  const char *v418;
  uint64_t v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  const char *v428;
  uint64_t v429;
  const char *v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  void *v438;
  const char *v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  void *v443;
  const char *v444;
  const char *v445;
  uint64_t v446;
  void *v447;
  const char *v448;
  uint64_t v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  const char *v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  const char *v459;
  uint64_t v460;
  double v461;
  double v462;
  double v463;
  double v464;
  double v465;
  double v466;
  double v467;
  double v468;
  void *v469;
  const char *v470;
  uint64_t v471;
  const char *v472;
  uint64_t v473;
  void *v474;
  const char *v475;
  uint64_t v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  double v480;
  double v481;
  double v482;
  double v483;
  const char *v484;
  uint64_t v485;
  double v486;
  double v487;
  double v488;
  double v489;
  const char *v490;
  uint64_t v491;
  const char *v492;
  uint64_t v493;
  void *v494;
  const char *v495;
  uint64_t v496;
  id v497;

  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v7 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x24BDF6F88], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend_initWithEffect_(v7, v11, (uint64_t)v10);
    objc_msgSend_setTransitionNavigationHeaderHomeNameLabelEffectView_(self, v13, (uint64_t)v12);

    objc_msgSend_view(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v19, v23, (uint64_t)v22);

    v24 = (void *)objc_opt_new();
    objc_msgSend_setTransitionNavigationHeaderHomeNameLabel_(self, v25, (uint64_t)v24);

    objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentView(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v31, v35, (uint64_t)v34);

    objc_msgSend_preferredFontForTextStyle_(MEMORY[0x24BDF6A70], v36, *MEMORY[0x24BDF77E8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFont_(v40, v41, (uint64_t)v37);

    objc_msgSend_smartGridViewController(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_primaryLabel(v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setText_(v56, v57, (uint64_t)v53);

    objc_msgSend_systemWhiteColor(MEMORY[0x24BDF6950], v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(v63, v64, (uint64_t)v60);

    if (objc_msgSend_isExpanded(self, v65, v66))
    {
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v67, v68);
      v70 = v69;
      v72 = v71;
      v74 = v73;
      v76 = v75;
      objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v79, v80, v81, v70, v72, v74, v76);

      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v82, v83);
      v85 = v84;
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v86, v87);
      v89 = v88;
      objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v92, v93, v94, 0.0, 0.0, v85, v89);

      objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v97, v98, v99, 0.0);

      objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v102, v103, v104, 0.0);
    }
    else
    {
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v67, v68);
      v106 = v105;
      v108 = v107;
      v110 = v109;
      v112 = v111;
      objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v115, v116, v117, v106, v108, v110, v112);

      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v118, v119);
      v121 = v120;
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v122, v123);
      v125 = v124;
      objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v128, v129, v130, 0.0, 0.0, v121, v125);

      objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v133, v134, v135, 1.0);

      objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v136, v137);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v102, v138, v139, 1.0);
    }

  }
  objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v5, v6);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v140)
  {
    v143 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend_controlCenterPrimaryVibrancyEffect(MEMORY[0x24BDF6F88], v144, v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = (void *)objc_msgSend_initWithEffect_(v143, v147, (uint64_t)v146);
    objc_msgSend_setTransitionGridCellHomeNameLabelEffectView_(self, v149, (uint64_t)v148);

    objc_msgSend_view(self, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v152, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v155, v159, (uint64_t)v158);

    v160 = (void *)objc_opt_new();
    objc_msgSend_setTransitionGridCellHomeNameLabel_(self, v161, (uint64_t)v160);

    objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentView(v164, v165, v166);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellHomeNameLabel(self, v168, v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v167, v171, (uint64_t)v170);

    objc_msgSend_smartGridViewController(self, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v174, v175, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_primaryLabel(v177, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_font(v180, v181, v182);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellHomeNameLabel(self, v184, v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFont_(v186, v187, (uint64_t)v183);

    objc_msgSend_smartGridViewController(self, v188, v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v190, v191, v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_primaryLabel(v193, v194, v195);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v196, v197, v198);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellHomeNameLabel(self, v200, v201);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setText_(v202, v203, (uint64_t)v199);

    objc_msgSend_systemWhiteColor(MEMORY[0x24BDF6950], v204, v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellHomeNameLabel(self, v207, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(v209, v210, (uint64_t)v206);

    if (objc_msgSend_isExpanded(self, v211, v212))
    {
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v213, v214);
      v216 = v215;
      v218 = v217;
      v220 = v219;
      v222 = v221;
      objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v223, v224);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v225, v226, v227, v216, v218, v220, v222);

      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v228, v229);
      v231 = v230;
      objc_msgSend__homeNameLabelInHomeGridCellFrame(self, v232, v233);
      v235 = v234;
      objc_msgSend_transitionGridCellHomeNameLabel(self, v236, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v238, v239, v240, 0.0, 0.0, v231, v235);

      objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v241, v242);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v243, v244, v245, 1.0);

      objc_msgSend_transitionGridCellHomeNameLabel(self, v246, v247);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v248, v249, v250, 1.0);
    }
    else
    {
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v213, v214);
      v252 = v251;
      v254 = v253;
      v256 = v255;
      v258 = v257;
      objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v259, v260);
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v261, v262, v263, v252, v254, v256, v258);

      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v264, v265);
      v267 = v266;
      objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(self, v268, v269);
      v271 = v270;
      objc_msgSend_transitionGridCellHomeNameLabel(self, v272, v273);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v274, v275, v276, 0.0, 0.0, v267, v271);

      objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v277, v278);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v279, v280, v281, 0.0);

      objc_msgSend_transitionGridCellHomeNameLabel(self, v282, v283);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v248, v284, v285, 0.0);
    }

  }
  objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v141, v142);
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v286)
  {
    v289 = objc_alloc(MEMORY[0x24BDF6FC8]);
    objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x24BDF6F88], v290, v291);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    v294 = (void *)objc_msgSend_initWithEffect_(v289, v293, (uint64_t)v292);
    objc_msgSend_setTransitionGridCellRoomNameLabelEffectView_(self, v295, (uint64_t)v294);

    objc_msgSend_view(self, v296, v297);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v298, v299, v300);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v302, v303);
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v301, v305, (uint64_t)v304);

    v306 = (void *)objc_opt_new();
    objc_msgSend_setTransitionGridCellRoomNameLabel_(self, v307, (uint64_t)v306);

    objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v308, v309);
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentView(v310, v311, v312);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellRoomNameLabel(self, v314, v315);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v313, v317, (uint64_t)v316);

    objc_msgSend_smartGridViewController(self, v318, v319);
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v320, v321, v322);
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_secondaryLabel(v323, v324, v325);
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_font(v326, v327, v328);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellRoomNameLabel(self, v330, v331);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFont_(v332, v333, (uint64_t)v329);

    objc_msgSend_smartGridViewController(self, v334, v335);
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v336, v337, v338);
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_secondaryLabel(v339, v340, v341);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v342, v343, v344);
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellRoomNameLabel(self, v346, v347);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setText_(v348, v349, (uint64_t)v345);

    objc_msgSend_systemWhiteColor(MEMORY[0x24BDF6950], v350, v351);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionGridCellRoomNameLabel(self, v353, v354);
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(v355, v356, (uint64_t)v352);

    if (objc_msgSend_isExpanded(self, v357, v358))
    {
      objc_msgSend__roomNameLabelInHomeGridCellFrame(self, v359, v360);
      v362 = v361;
      v364 = v363;
      v366 = v365;
      v368 = v367;
      objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v369, v370);
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v371, v372, v373, v362, v364, v366, v368);

      objc_msgSend__roomNameLabelInHomeGridCellFrame(self, v374, v375);
      v377 = v376;
      objc_msgSend__roomNameLabelInHomeGridCellFrame(self, v378, v379);
      v381 = v380;
      objc_msgSend_transitionGridCellRoomNameLabel(self, v382, v383);
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v384, v385, v386, 0.0, 0.0, v377, v381);

      objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v387, v388);
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v389, v390, v391, 1.0);

      objc_msgSend_transitionGridCellRoomNameLabel(self, v392, v393);
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v394, v395, v396, 1.0);
    }
    else
    {
      objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(self, v359, v360);
      v398 = v397;
      v400 = v399;
      v402 = v401;
      v404 = v403;
      objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v405, v406);
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v407, v408, v409, v398, v400, v402, v404);

      objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(self, v410, v411);
      v413 = v412;
      objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(self, v414, v415);
      v417 = v416;
      objc_msgSend_transitionGridCellRoomNameLabel(self, v418, v419);
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFrame_(v420, v421, v422, 0.0, 0.0, v413, v417);

      objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v423, v424);
      v425 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v425, v426, v427, 0.0);

      objc_msgSend_transitionGridCellRoomNameLabel(self, v428, v429);
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAlpha_(v394, v430, v431, 0.0);
    }

  }
  objc_msgSend_transitionIconView(self, v287, v288);
  v432 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v432)
  {
    objc_msgSend_smartGridViewController(self, v433, v434);
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v435, v436, v437);
    v438 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_iconView(v438, v439, v440);
    v441 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_snapshotViewAfterScreenUpdates_(v441, v442, 0);
    v443 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTransitionIconView_(self, v444, (uint64_t)v443);

    objc_msgSend_view(self, v445, v446);
    v447 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v447, v448, v449);
    v450 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionIconView(self, v451, v452);
    v453 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v450, v454, (uint64_t)v453);

    if (objc_msgSend_isExpanded(self, v455, v456))
      objc_msgSend__iconViewInHomeGridCellFrame(self, v457, v458);
    else
      objc_msgSend__iconViewInNavigationHeaderViewFrame(self, v457, v458);
    v465 = v461;
    v466 = v462;
    v467 = v463;
    v468 = v464;
    objc_msgSend_transitionIconView(self, v459, v460);
    v469 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFrame_(v469, v470, v471, v465, v466, v467, v468);

  }
  if ((objc_msgSend_isExpanded(self, v433, v434) & 1) == 0)
  {
    objc_msgSend_view(self, v472, v473);
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_compressedView(v474, v475, v476);
    v477 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_frame(v477, v478, v479);
    v481 = v480;
    v483 = v482;

    objc_msgSend_transitionCompressedViewFrame(self, v484, v485);
    v487 = v486;
    v489 = v488;
    objc_msgSend_view(self, v490, v491);
    v497 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_compressedView(v497, v492, v493);
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFrame_(v494, v495, v496, v487, v489, v481, v483);

  }
}

- (void)_cleanupTransitionSubviews
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;

  objc_msgSend_transitionIconView(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v4, v5, v6);

  objc_msgSend_setTransitionIconView_(self, v7, 0);
  objc_msgSend_transitionGridCellRoomNameLabel(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v10, v11, v12);

  objc_msgSend_setTransitionGridCellRoomNameLabel_(self, v13, 0);
  objc_msgSend_transitionGridCellRoomNameLabelEffectView(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v16, v17, v18);

  objc_msgSend_setTransitionGridCellRoomNameLabelEffectView_(self, v19, 0);
  objc_msgSend_transitionGridCellHomeNameLabel(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v22, v23, v24);

  objc_msgSend_setTransitionGridCellHomeNameLabel_(self, v25, 0);
  objc_msgSend_transitionGridCellHomeNameLabelEffectView(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v28, v29, v30);

  objc_msgSend_setTransitionGridCellHomeNameLabelEffectView_(self, v31, 0);
  objc_msgSend_transitionNavigationHeaderRoomNameLabel(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v34, v35, v36);

  objc_msgSend_setTransitionNavigationHeaderRoomNameLabel_(self, v37, 0);
  objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v40, v41, v42);

  objc_msgSend_setTransitionNavigationHeaderRoomNameLabelEffectView_(self, v43, 0);
  objc_msgSend_transitionNavigationHeaderHomeNameLabel(self, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v46, v47, v48);

  objc_msgSend_setTransitionNavigationHeaderHomeNameLabel_(self, v49, 0);
  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(self, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFromSuperview(v52, v53, v54);

  objc_msgSend_setTransitionNavigationHeaderHomeNameLabelEffectView_(self, v55, 0);
}

- (CGRect)_iconViewInHomeGridCellFrame
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  objc_msgSend_smartGridViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_iconView(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_homeNameLabelInHomeGridCellFrame
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  CGRect result;

  objc_msgSend_smartGridViewController(self, a2, v2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v57, v4, v5);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_verticalStackView(v56, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v8, v9, v10);
  v12 = v11;
  objc_msgSend_smartGridViewController(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_verticalStackView(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v21, v22, v23);
  v25 = v24;
  objc_msgSend_smartGridViewController(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryLabel(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v34, v35, v36);
  v38 = v37;
  objc_msgSend_smartGridViewController(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryLabel(v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v47, v48, v49);
  v51 = v50;

  v52 = v12;
  v53 = v25;
  v54 = v38;
  v55 = v51;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)_roomNameLabelInHomeGridCellFrame
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGRect result;

  objc_msgSend_smartGridViewController(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_verticalStackView(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v10, v11, v12);
  v14 = v13;
  objc_msgSend_smartGridViewController(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_verticalStackView(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_spacing(v23, v24, v25);
  v27 = v14 + v26;
  objc_msgSend_smartGridViewController(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryLabel(v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v36, v37, v38);
  v40 = v27 + v39;

  objc_msgSend_smartGridViewController(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_verticalStackView(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v49, v50, v51);
  v53 = v52;
  objc_msgSend_smartGridViewController(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secondaryLabel(v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v62, v63, v64);
  v66 = v65;
  objc_msgSend_smartGridViewController(self, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secondaryLabel(v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v75, v76, v77);
  v79 = v78;

  v80 = v53;
  v81 = v40;
  v82 = v66;
  v83 = v79;
  result.size.height = v83;
  result.size.width = v82;
  result.origin.y = v81;
  result.origin.x = v80;
  return result;
}

- (CGRect)_iconViewInNavigationHeaderViewFrame
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  objc_msgSend_dashboardContainerViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transitionSubviewFrames(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x24BE4F3C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v8, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_roomNameLabelInNavigationHeaderViewFrame
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  objc_msgSend_dashboardContainerViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transitionSubviewFrames(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x24BE4F3D8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v8, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_homeNameLabelInNavigationHeaderViewFrame
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  objc_msgSend_dashboardContainerViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transitionSubviewFrames(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x24BE4F3D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v8, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)isDeviceUnlockedForGridViewController:(id)a3
{
  HUCCSmartGridContentViewController *v3;
  void *v4;
  const char *v5;

  v3 = self;
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend_isDeviceUnlockedForSmartGridContentViewController_(v4, v5, (uint64_t)v3);

  return (char)v3;
}

- (id)prepareForActionRequiringDeviceUnlockForGridViewController:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v15[4];
  id v16;

  v4 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_230FED878;
    v15[3] = &unk_24FFD8530;
    v16 = v4;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v10, v11, (uint64_t)v15);

  }
  else
  {
    NAEmptyResult();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithResult_(v4, v13, (uint64_t)v12);

  }
  return v4;
}

- (BOOL)_shouldDisplayHomeControlService
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;

  objc_msgSend_smartGridViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemManager(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allDisplayedItems(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)objc_msgSend_count(v9, v10, v11) > 1;

  return v12;
}

- (void)displayHome:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  int shouldDisplayHomeControlService;
  NSObject *v8;
  _BOOL4 v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  objc_class *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  int v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  shouldDisplayHomeControlService = objc_msgSend__shouldDisplayHomeControlService(self, v5, v6);
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (shouldDisplayHomeControlService)
  {
    if (v9)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412802;
      v39 = v11;
      v40 = 2080;
      v41 = "-[HUCCSmartGridContentViewController displayHome:]";
      v42 = 2112;
      v43 = v4;
      _os_log_impl(&dword_230FDD000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s displaying Home Control Service for %@", (uint8_t *)&v38, 0x20u);

    }
    objc_msgSend_setExpandedContentMode_(self, v12, 2);
    objc_msgSend_view(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_smartGridViewController(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeCell(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_frame(v21, v22, v23);
    objc_msgSend_willMoveToExpandedStateWithAnimationStartFrame_(v15, v24, v25);

    objc_msgSend_delegate(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentModuleContext(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestExpandModule(v31, v32, v33);

  }
  else
  {
    if (v9)
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412802;
      v39 = v35;
      v40 = 2080;
      v41 = "-[HUCCSmartGridContentViewController displayHome:]";
      v42 = 2112;
      v43 = v4;
      _os_log_impl(&dword_230FDD000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s Opening Home app for %@", (uint8_t *)&v38, 0x20u);

    }
    objc_msgSend__openHomeApp(self, v36, v37);
  }

}

- (void)gridSizeMayHaveChanged
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint8_t v12[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "Requesting layout size update", v12, 2u);
  }

  objc_msgSend_delegate(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestLayoutSizeUpdate(v9, v10, v11);

}

- (void)willPresentAccessoryControlsViewController:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "Accessory controls will present: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_setExpandedContentMode_(self, v6, 1);
  objc_msgSend_setAccessoryControlsViewController_(self, v7, (uint64_t)v4);
  objc_msgSend_delegate(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestExpandModule(v13, v14, v15);

}

- (void)willDismissAccessoryControlsViewController:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "Accessory controls will dismiss: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend_setAccessoryControlsViewController_(self, v6, 0);
  objc_msgSend_delegate(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dismissModule(v12, v13, v14);

}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;

  objc_msgSend_delegate(self, a2, (uint64_t)a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(v8, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHomeGestureDismissalAllowed_(v6, v7, 1);

}

- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int isDeviceUnlockedForSmartGridContentViewController;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  _QWORD v17[4];
  void (**v18)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isDeviceUnlockedForSmartGridContentViewController = objc_msgSend_isDeviceUnlockedForSmartGridContentViewController_(v7, v8, (uint64_t)self);

  if (isDeviceUnlockedForSmartGridContentViewController)
  {
    v4[2](v4, 1);
  }
  else
  {
    objc_msgSend_delegate(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentModuleContext(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = sub_230FEDEE4;
      v17[3] = &unk_24FFD8200;
      v18 = v4;
      objc_msgSend_requestAuthenticationWithCompletionHandler_(v15, v16, (uint64_t)v17);

    }
    else
    {
      v4[2](v4, 0);
    }

  }
}

- (void)requestDismissal
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_delegate(self, a2, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(v8, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dismissModule(v5, v6, v7);

}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  _BOOL4 v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;

  v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(v8, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHomeGestureDismissalAllowed_(v6, v7, !v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setAccessAllowedForCurrentLockState:(BOOL)a3
{
  self->_accessAllowedForCurrentLockState = a3;
  objc_msgSend__showLockSecurityView_(self, a2, !a3);
}

- (void)_setUpSmartGridContent
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  HUCCDashboardContainerViewController *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;

  objc_msgSend_activeAssertion(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend_sharedDispatcher(MEMORY[0x24BE4D0B0], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_homeManager(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__beginActiveAssertionWithReason_(v10, v11, (uint64_t)CFSTR("HUCCSmartGridModuleVisible"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActiveAssertion_(self, v13, (uint64_t)v12);

    objc_msgSend_activeAssertion(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE4F478], v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_launchServiceSuspendedWithUserInfo_(v19, v20, MEMORY[0x24BDBD1B8]);

      objc_msgSend_policyWithDecision_(MEMORY[0x24BE4D170], v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_smartGridViewController(self, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_itemManager(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReadPolicy_(v28, v29, (uint64_t)v22);

      v30 = [HUCCDashboardContainerViewController alloc];
      v32 = (void *)objc_msgSend_initWithDelegate_(v30, v31, (uint64_t)self);
      objc_msgSend_setDashboardContainerViewController_(self, v33, (uint64_t)v32);

      objc_msgSend_dashboardContainerViewController(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_view(v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_view(self, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExpandedView_(v42, v43, (uint64_t)v39);

      objc_msgSend_dashboardContainerViewController(self, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addChildViewController_(self, v47, (uint64_t)v46);

      objc_msgSend_dashboardContainerViewController(self, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_didMoveToParentViewController_(v50, v51, (uint64_t)self);

      objc_msgSend_smartGridViewController(self, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_homeCell(v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHidden_(v57, v58, 0);

      objc_msgSend_setIsTransitioningToHomeControlService_(self, v59, 0);
    }
  }
}

- (double)preferredExpandedContentHeight
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_dashboardContainerViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredExpandedSize(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)preferredExpandedContentWidth
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_dashboardContainerViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredExpandedSize(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void)_openHomeApp
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_230FEE2C0;
  v2[3] = &unk_24FFD81D8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_showLockSecurityView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  int isShowingLockSecurity;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  id v20;

  v3 = a3;
  objc_msgSend_view(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(v5, v6, v7);

  if (v3)
  {
    if ((isShowingLockSecurity & 1) != 0)
      return;
    objc_msgSend_view(self, v9, v10);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_smartGridViewController(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mosaicLayout(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_showLockSecurityWithFrameDelegate_(v20, v17, (uint64_t)v16);

  }
  else
  {
    if (!isShowingLockSecurity)
      return;
    objc_msgSend_view(self, v9, v10);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hideLockSecurity(v20, v18, v19);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)accessAllowedForCurrentLockState
{
  return self->_accessAllowedForCurrentLockState;
}

- (HUOpenURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (HUCCSmartGridViewController)smartGridViewController
{
  return self->_smartGridViewController;
}

- (void)setSmartGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_smartGridViewController, a3);
}

- (HUCCDashboardContainerViewController)dashboardContainerViewController
{
  return self->_dashboardContainerViewController;
}

- (void)setDashboardContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardContainerViewController, a3);
}

- (HUCCAccessoryControlsHosting)accessoryControlsViewController
{
  return (HUCCAccessoryControlsHosting *)objc_loadWeakRetained((id *)&self->_accessoryControlsViewController);
}

- (void)setAccessoryControlsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryControlsViewController, a3);
}

- (unint64_t)expandedContentMode
{
  return self->_expandedContentMode;
}

- (void)setExpandedContentMode:(unint64_t)a3
{
  self->_expandedContentMode = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (BOOL)isTransitioningToHomeControlService
{
  return self->_isTransitioningToHomeControlService;
}

- (void)setIsTransitioningToHomeControlService:(BOOL)a3
{
  self->_isTransitioningToHomeControlService = a3;
}

- (NSObject)activeAssertion
{
  return self->_activeAssertion;
}

- (void)setActiveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_activeAssertion, a3);
}

- (HUCCSmartGridPropertyAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (void)setTransitionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAnimator, a3);
}

- (UIView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionIconView, a3);
}

- (UIVisualEffectView)transitionGridCellHomeNameLabelEffectView
{
  return self->_transitionGridCellHomeNameLabelEffectView;
}

- (void)setTransitionGridCellHomeNameLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionGridCellHomeNameLabelEffectView, a3);
}

- (UILabel)transitionGridCellHomeNameLabel
{
  return self->_transitionGridCellHomeNameLabel;
}

- (void)setTransitionGridCellHomeNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionGridCellHomeNameLabel, a3);
}

- (UIVisualEffectView)transitionGridCellRoomNameLabelEffectView
{
  return self->_transitionGridCellRoomNameLabelEffectView;
}

- (void)setTransitionGridCellRoomNameLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionGridCellRoomNameLabelEffectView, a3);
}

- (UILabel)transitionGridCellRoomNameLabel
{
  return self->_transitionGridCellRoomNameLabel;
}

- (void)setTransitionGridCellRoomNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionGridCellRoomNameLabel, a3);
}

- (UIVisualEffectView)transitionNavigationHeaderHomeNameLabelEffectView
{
  return self->_transitionNavigationHeaderHomeNameLabelEffectView;
}

- (void)setTransitionNavigationHeaderHomeNameLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionNavigationHeaderHomeNameLabelEffectView, a3);
}

- (UILabel)transitionNavigationHeaderHomeNameLabel
{
  return self->_transitionNavigationHeaderHomeNameLabel;
}

- (void)setTransitionNavigationHeaderHomeNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionNavigationHeaderHomeNameLabel, a3);
}

- (UIVisualEffectView)transitionNavigationHeaderRoomNameLabelEffectView
{
  return self->_transitionNavigationHeaderRoomNameLabelEffectView;
}

- (void)setTransitionNavigationHeaderRoomNameLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionNavigationHeaderRoomNameLabelEffectView, a3);
}

- (UILabel)transitionNavigationHeaderRoomNameLabel
{
  return self->_transitionNavigationHeaderRoomNameLabel;
}

- (void)setTransitionNavigationHeaderRoomNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionNavigationHeaderRoomNameLabel, a3);
}

- (NSDictionary)transitionLargeTitleTextAttributes
{
  return self->_transitionLargeTitleTextAttributes;
}

- (void)setTransitionLargeTitleTextAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_transitionLargeTitleTextAttributes, a3);
}

- (NSDictionary)transitionSubviewFrames
{
  return self->_transitionSubviewFrames;
}

- (void)setTransitionSubviewFrames:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSubviewFrames, a3);
}

- (CGRect)transitionCompressedViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_transitionCompressedViewFrame.origin.x;
  y = self->_transitionCompressedViewFrame.origin.y;
  width = self->_transitionCompressedViewFrame.size.width;
  height = self->_transitionCompressedViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTransitionCompressedViewFrame:(CGRect)a3
{
  self->_transitionCompressedViewFrame = a3;
}

- (double)transitionDeviceCornerRadius
{
  return self->_transitionDeviceCornerRadius;
}

- (void)setTransitionDeviceCornerRadius:(double)a3
{
  self->_transitionDeviceCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionSubviewFrames, 0);
  objc_storeStrong((id *)&self->_transitionLargeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderRoomNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderRoomNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderHomeNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionNavigationHeaderHomeNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionGridCellRoomNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionGridCellRoomNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionGridCellHomeNameLabel, 0);
  objc_storeStrong((id *)&self->_transitionGridCellHomeNameLabelEffectView, 0);
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_activeAssertion, 0);
  objc_destroyWeak((id *)&self->_accessoryControlsViewController);
  objc_storeStrong((id *)&self->_dashboardContainerViewController, 0);
  objc_storeStrong((id *)&self->_smartGridViewController, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
