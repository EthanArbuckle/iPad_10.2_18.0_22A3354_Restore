@implementation HUAboutResidentDeviceViewController

- (HUAboutResidentDeviceViewController)init
{
  return -[HUAboutResidentDeviceViewController initWithStyle:](self, "initWithStyle:", 0);
}

- (HUAboutResidentDeviceViewController)initWithStyle:(unint64_t)a3
{
  HUAboutResidentDeviceViewController *v4;
  HUAboutResidentDeviceViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUAboutResidentDeviceViewController;
  v4 = -[HUAboutResidentDeviceViewController init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = -[HUAboutResidentDeviceViewController style](v4, "style");
    if (v6 == 1)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUUsersHomeHubTitle"), CFSTR("HUUsersHomeHubTitle"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAboutResidentDeviceViewController setTitle:](v5, "setTitle:", v8);

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v5, sel__done_);
      -[HUAboutResidentDeviceViewController navigationItem](v5, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRightBarButtonItem:", v9);

      -[HUAboutResidentDeviceViewController navigationItem](v5, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rightBarButtonItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEnabled:", 1);

      goto LABEL_6;
    }
    if (!v6)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUTabAutomationTitle"), CFSTR("HUTabAutomationTitle"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAboutResidentDeviceViewController setTitle:](v5, "setTitle:", v7);
LABEL_6:

    }
  }
  return v5;
}

- (void)_done:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HUAboutResidentDeviceViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HUAboutResidentDeviceViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aboutResidentDeviceViewControllerDidFinish:", self);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double Height;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)HUAboutResidentDeviceViewController;
  -[HUAboutResidentDeviceViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if ((-[HUAboutResidentDeviceViewController edgesForExtendedLayout](self, "edgesForExtendedLayout") & 4) != 0)
  {
    -[HUAboutResidentDeviceViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    Height = CGRectGetHeight(v18);
    -[HUAboutResidentDeviceViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeAreaLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutFrame");
    v9 = Height - CGRectGetMaxY(v19) + 10.0;

  }
  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentInset:", v5, v7, v9, v11);

}

- (void)viewDidLoad
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUAboutResidentDeviceViewController;
  -[HUAboutResidentDeviceViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[HUAboutResidentDeviceViewController _createSubviews](self, "_createSubviews");
  v3 = -[HUAboutResidentDeviceViewController style](self, "style");
  if (v3 <= 2)
    -[HUAboutResidentDeviceViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", qword_1B9442BF0[v3]);
  -[HUAboutResidentDeviceViewController _setNavigationBarVisibility](self, "_setNavigationBarVisibility");
  -[HUAboutResidentDeviceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[HUAboutResidentDeviceViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController statusBarBackgroundView](self, "statusBarBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  if (!-[HUAboutResidentDeviceViewController style](self, "style"))
  {
    -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

  }
  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController homePodImageView](self, "homePodImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  if (-[HUAboutResidentDeviceViewController _shouldShowNavigationBar](self, "_shouldShowNavigationBar"))
  {
    -[HUAboutResidentDeviceViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNavigationBarHidden:animated:", 1, 0);

  }
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
  v9.super_class = (Class)HUAboutResidentDeviceViewController;
  v7 = a4;
  -[HUAboutResidentDeviceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__HUAboutResidentDeviceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6F4CB78;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __90__HUAboutResidentDeviceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateViews");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAboutResidentDeviceViewController;
  -[HUAboutResidentDeviceViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUAboutResidentDeviceViewController _setNavigationBarVisibility](self, "_setNavigationBarVisibility");
  -[HUAboutResidentDeviceViewController updateViews](self, "updateViews");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAboutResidentDeviceViewController;
  -[HUAboutResidentDeviceViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[HUAboutResidentDeviceViewController updateViews](self, "updateViews");
}

- (BOOL)_shouldShowNavigationBar
{
  void *v3;
  BOOL v4;

  if (!objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    return 0;
  -[HUAboutResidentDeviceViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)_backgroundColor
{
  void *v2;

  v2 = -[HUAboutResidentDeviceViewController style](self, "style");
  if (v2 == (void *)2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == (void *)1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_createSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[HUAboutResidentDeviceViewController setStatusBarBackgroundView:](self, "setStatusBarBackgroundView:", v8);

  -[HUAboutResidentDeviceViewController statusBarBackgroundView](self, "statusBarBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUAboutResidentDeviceViewController _backgroundColor](self, "_backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController statusBarBackgroundView](self, "statusBarBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA970]), "initWithFrame:", v4, v5, v6, v7);
  -[HUAboutResidentDeviceViewController setScrollView:](self, "setScrollView:", v12);

  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUAboutResidentDeviceViewController _backgroundColor](self, "_backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  if (-[HUAboutResidentDeviceViewController style](self, "style"))
  {
    v16 = *MEMORY[0x1E0CEB538];
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUAboutResidentDeviceViewController setTitleLabel:](self, "setTitleLabel:", v17);

    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextAlignment:", 4);

    _HULocalizedStringWithDefaultValue(CFSTR("HUResidentDeviceTriggerInfoTitle"), CFSTR("HUResidentDeviceTriggerInfoTitle"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfLines:", 1);

    -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "headlineCellOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "font");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v25);

    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAdjustsFontSizeToFitWidth:", 1);

    v28 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUAboutResidentDeviceViewController setSubtitleLabel:](self, "setSubtitleLabel:", v28);

    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextAlignment:", 4);

    _HULocalizedStringWithDefaultValue(CFSTR("HUResidentDeviceTriggerInfoSubtitleText"), CFSTR("HUResidentDeviceTriggerInfoSubtitleText"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setText:", v31);

    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNumberOfLines:", 0);

    v16 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0CEB538], *MEMORY[0x1E0CEB5F8]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_scaledValueForValue:", 18.0);
    objc_msgSend(v34, "fontWithSize:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFont:", v35);

    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAdjustsFontForContentSizeCategory:", 1);

  }
  v38 = objc_alloc(MEMORY[0x1E0CEA658]);
  HUImageNamed(CFSTR("appleTV"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v38, "initWithImage:", v39);
  -[HUAboutResidentDeviceViewController setAtvImageView:](self, "setAtvImageView:", v40);

  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v42 = objc_alloc(MEMORY[0x1E0CEA658]);
  HUImageNamed(CFSTR("homePod"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v42, "initWithImage:", v43);
  -[HUAboutResidentDeviceViewController setHomePodImageView:](self, "setHomePodImageView:", v44);

  -[HUAboutResidentDeviceViewController homePodImageView](self, "homePodImageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v46 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUAboutResidentDeviceViewController setHomeHubTextLabel:](self, "setHomeHubTextLabel:", v46);

  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setTextAlignment:", 4);

  _HULocalizedStringWithDefaultValue(CFSTR("HUResidentDeviceInfoHomeHubText"), CFSTR("HUResidentDeviceInfoHomeHubText"), 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setText:", v49);

  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", v16, *MEMORY[0x1E0CEB5F0]);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "_scaledValueForValue:", 18.0);
  objc_msgSend(v55, "fontWithSize:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFont:", v52);

  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setAdjustsFontForContentSizeCategory:", 1);

}

- (id)_defaultLayoutOptionsForViewSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "viewSizeSubclass") >= 4)
  {
    -[HUAboutResidentDeviceViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readableContentGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutFrame");
    objc_msgSend(v4, "setSectionLeadingMargin:");

    objc_msgSend(v4, "sectionLeadingMargin");
    objc_msgSend(v4, "setSectionTrailingMargin:");
  }
  return v4;
}

- (void)updateViews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  -[HUAboutResidentDeviceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[HUAboutResidentDeviceViewController _defaultLayoutOptionsForViewSize:](self, "_defaultLayoutOptionsForViewSize:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController setLayoutOptions:](self, "setLayoutOptions:", v6);

  -[HUAboutResidentDeviceViewController updateViewsAndConstraints](self, "updateViewsAndConstraints");
  -[HUAboutResidentDeviceViewController _setNavigationBarVisibility](self, "_setNavigationBarVisibility");
  -[HUAboutResidentDeviceViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)updateViewsAndConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  char v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  unint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  _QWORD v154[2];
  _QWORD v155[3];

  v155[2] = *MEMORY[0x1E0C80C00];
  -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headlineCellOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v11 = HUViewSizeSubclassForViewSize(v9, v10);

  -[HUAboutResidentDeviceViewController statusBarBackgroundView](self, "statusBarBackgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v16);

  -[HUAboutResidentDeviceViewController statusBarBackgroundView](self, "statusBarBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v21);

  -[HUAboutResidentDeviceViewController statusBarBackgroundView](self, "statusBarBackgroundView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v26);

  -[HUAboutResidentDeviceViewController statusBarBackgroundView](self, "statusBarBackgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "safeAreaLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v32);

  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v37);

  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v42);

  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v47);

  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v52);

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "sectionLeadingMargin");
    v55 = v54;
    -[HUAboutResidentDeviceViewController view](self, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v55 != 0.0)
    {
      objc_msgSend(v56, "layoutMarginsGuide");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v61 = v58;
      objc_msgSend(v58, "leadingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
LABEL_6:
    objc_msgSend(v56, "readableContentGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sectionLeadingMargin");
  v60 = v59;
  -[HUAboutResidentDeviceViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v60 == 0.0)
    goto LABEL_6;
  objc_msgSend(v56, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  if (!-[HUAboutResidentDeviceViewController style](self, "style"))
  {
    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "sectionLeadingMargin");
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v62);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v66);

    -[HUAboutResidentDeviceViewController view](self, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "sectionTrailingMargin");
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v72);

    if (-[HUAboutResidentDeviceViewController useNavigationBarForAutomationTabStyle](self, "useNavigationBarForAutomationTabStyle")|| objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "topAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAboutResidentDeviceViewController view](self, "view");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "readableContentGuide");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "topAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v78);

    }
    else
    {
      v154[0] = &unk_1E7041620;
      v154[1] = &unk_1E7041638;
      v155[0] = &unk_1E7043608;
      v155[1] = &unk_1E7043618;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 2);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = HUConstantFloatForViewSizeSubclass(v11, v79);

      v81 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
      -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82;
      if ((v81 & 1) != 0)
      {
        objc_msgSend(v82, "largeTitleCellTopMargin");
        v85 = v84;
      }
      else
      {
        objc_msgSend(v82, "headlineCellOptions");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "headlineBaselineOffset");
        v85 = v87;

      }
      -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "firstBaselineAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "topAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:constant:", v76, v80 + v85);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v77);
    }

    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "sectionLeadingMargin");
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v62);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v91);

    -[HUAboutResidentDeviceViewController view](self, "view");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "sectionTrailingMargin");
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v97);

    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "topAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController titleLabel](self, "titleLabel");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "lastBaselineAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "sectionTopMargin");
    objc_msgSend(v99, "constraintEqualToAnchor:constant:", v101);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v103);

  }
  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "sectionLeadingMargin");
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v62);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v107);

  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "widthAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "heightAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v112);

  v113 = -[HUAboutResidentDeviceViewController style](self, "style");
  if (v113 - 1 >= 2)
  {
    if (v113)
      goto LABEL_23;
    -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "topAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController subtitleLabel](self, "subtitleLabel");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "lastBaselineAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "subtitleBaselineToATVImageConstant");
  }
  else
  {
    -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "topAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "topAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "scrollViewTopToATVImageConstant");
  }
  objc_msgSend(v115, "constraintEqualToAnchor:constant:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v118);

LABEL_23:
  -[HUAboutResidentDeviceViewController homePodImageView](self, "homePodImageView");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "leadingAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "trailingAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:constant:", v122, 28.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v123);

  -[HUAboutResidentDeviceViewController homePodImageView](self, "homePodImageView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "topAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v128);

  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "leadingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "sectionLeadingMargin");
  objc_msgSend(v130, "constraintEqualToAnchor:constant:", v62);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v132);

  -[HUAboutResidentDeviceViewController view](self, "view");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "trailingAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "trailingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController layoutOptions](self, "layoutOptions");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "sectionTrailingMargin");
  objc_msgSend(v134, "constraintEqualToAnchor:constant:", v136);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v138);

  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "firstBaselineAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController atvImageView](self, "atvImageView");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "bottomAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "atvImageToTextBaselineConstantForViewSizeSubclass:", v11);
  objc_msgSend(v140, "constraintEqualToAnchor:constant:", v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v143);

  -[HUAboutResidentDeviceViewController homeHubTextLabel](self, "homeHubTextLabel");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "bottomAnchor");
  v145 = objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceViewController scrollView](self, "scrollView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "bottomAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v145, "constraintEqualToAnchor:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v148);

  -[HUAboutResidentDeviceViewController constraints](self, "constraints");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v145) = objc_msgSend(v7, "isEqualToArray:", v149);

  if ((v145 & 1) == 0)
  {
    v150 = (void *)MEMORY[0x1E0CB3718];
    -[HUAboutResidentDeviceViewController constraints](self, "constraints");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "deactivateConstraints:", v151);

    -[HUAboutResidentDeviceViewController setConstraints:](self, "setConstraints:", v7);
    v152 = (void *)MEMORY[0x1E0CB3718];
    -[HUAboutResidentDeviceViewController constraints](self, "constraints");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "activateConstraints:", v153);

  }
}

- (void)_setNavigationBarVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (!-[HUAboutResidentDeviceViewController _shouldShowNavigationBar](self, "_shouldShowNavigationBar")
    && !-[HUAboutResidentDeviceViewController style](self, "style"))
  {
    if (-[HUAboutResidentDeviceViewController useNavigationBarForAutomationTabStyle](self, "useNavigationBarForAutomationTabStyle"))
    {
      -[HUAboutResidentDeviceViewController setTitle:](self, "setTitle:", 0);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAboutResidentDeviceViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v3);

      -[HUAboutResidentDeviceViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = 0;
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUTabAutomationTitle"), CFSTR("HUTabAutomationTitle"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAboutResidentDeviceViewController setTitle:](self, "setTitle:", v8);

      -[HUAboutResidentDeviceViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = 1;
    }
    objc_msgSend(v6, "setNavigationBarHidden:animated:", v7, 0);

  }
}

- (BOOL)useNavigationBarForAutomationTabStyle
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[HUAboutResidentDeviceViewController _shouldShowNavigationBar](self, "_shouldShowNavigationBar")
    || (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[HUAboutResidentDeviceViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "splitViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HUAboutResidentDeviceViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "splitViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "isCollapsed") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

+ (double)subtitleBaselineToATVImageConstant
{
  return 36.0;
}

+ (double)scrollViewTopToATVImageConstant
{
  return 36.0;
}

+ (double)atvImageToTextBaselineConstantForViewSizeSubclass:(int64_t)a3
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 32770;
  v4 = (_QWORD *)MEMORY[0x1E0CEB540];
  if (a3)
    v4 = (_QWORD *)MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v4, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 40.0);
  v8 = v7;

  return v8;
}

- (HUAboutResidentDeviceViewControllerDelegate)delegate
{
  return (HUAboutResidentDeviceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIView)statusBarBackgroundView
{
  return self->_statusBarBackgroundView;
}

- (void)setStatusBarBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarBackgroundView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIImageView)atvImageView
{
  return self->_atvImageView;
}

- (void)setAtvImageView:(id)a3
{
  objc_storeStrong((id *)&self->_atvImageView, a3);
}

- (UIImageView)homePodImageView
{
  return self->_homePodImageView;
}

- (void)setHomePodImageView:(id)a3
{
  objc_storeStrong((id *)&self->_homePodImageView, a3);
}

- (UILabel)homeHubTextLabel
{
  return self->_homeHubTextLabel;
}

- (void)setHomeHubTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_homeHubTextLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeHubTextLabel, 0);
  objc_storeStrong((id *)&self->_homePodImageView, 0);
  objc_storeStrong((id *)&self->_atvImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
