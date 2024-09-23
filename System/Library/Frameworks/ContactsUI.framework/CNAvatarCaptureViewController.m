@implementation CNAvatarCaptureViewController

- (CNAvatarCaptureViewController)initWithAvatarRecord:(id)a3
{
  id v5;
  CNAvatarCaptureViewController *v6;
  CNAvatarCaptureViewController *v7;
  CNAvatarCaptureViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAvatarCaptureViewController;
  v6 = -[CNAvatarCaptureViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    v8 = v7;
  }

  return v7;
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
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNAvatarCaptureViewController;
  -[CNAvatarCaptureViewController viewDidLoad](&v11, sel_viewDidLoad);
  +[CNUIColorRepository photoPickerCaptureBackgroundColor](CNUIColorRepository, "photoPickerCaptureBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  +[CNUIColorRepository photoPickerCaptureBackgroundColor](CNUIColorRepository, "photoPickerCaptureBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[CNAvatarCaptureViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setBackgroundHidden:", 1);

  -[CNAvatarCaptureViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isTranslucent");

  if ((v10 & 1) == 0)
    -[CNAvatarCaptureViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[CNAvatarCaptureViewController loadAvatarView](self, "loadAvatarView");
  -[CNAvatarCaptureViewController addPromptLabel](self, "addPromptLabel");
  -[CNAvatarCaptureViewController setupFooterView](self, "setupFooterView");
  -[CNAvatarCaptureViewController layoutFooterView](self, "layoutFooterView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCaptureViewController;
  -[CNAvatarCaptureViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableFaceTracking");

  if ((v5 & 1) == 0)
  {
    -[CNAvatarCaptureViewController avtView](self, "avtView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnableFaceTracking:", 1);

  }
  -[CNAvatarCaptureViewController updateAvtViewAspectRatioConstraint](self, "updateAvtViewAspectRatioConstraint");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCaptureViewController;
  -[CNAvatarCaptureViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateInterfaceOrientation");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCaptureViewController;
  -[CNAvatarCaptureViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnableFaceTracking:", 0);

}

- (void)loadAvatarView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_class *v10;
  void *v11;
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
  id v27;
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
  uint64_t v39;
  uint64_t v40;
  Class (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  -[CNAvatarCaptureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[CNAvatarCaptureViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v9 = (void *)getAVTViewClass_softClass;
  v47 = getAVTViewClass_softClass;
  if (!getAVTViewClass_softClass)
  {
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __getAVTViewClass_block_invoke;
    v42 = &unk_1E204EBC0;
    v43 = &v44;
    __getAVTViewClass_block_invoke((uint64_t)&v39);
    v9 = (void *)v45[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v44, 8);
  v11 = (void *)objc_msgSend([v10 alloc], "initWithFrame:", 0.0, 0.0, v5, v8);
  -[CNAvatarCaptureViewController setAvtView:](self, "setAvtView:", v11);

  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNAvatarCaptureViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[CNAvatarCaptureViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_avtView);

  -[CNAvatarCaptureViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leftAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leftAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v34;
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v19;
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addConstraints:", v25);

  -[CNAvatarCaptureViewController updateAvtViewAspectRatioConstraint](self, "updateAvtViewAspectRatioConstraint");
  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v26 = (void *)getAVTAvatarRecordRenderingClass_softClass;
  v47 = getAVTAvatarRecordRenderingClass_softClass;
  if (!getAVTAvatarRecordRenderingClass_softClass)
  {
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __getAVTAvatarRecordRenderingClass_block_invoke;
    v42 = &unk_1E204EBC0;
    v43 = &v44;
    __getAVTAvatarRecordRenderingClass_block_invoke((uint64_t)&v39);
    v26 = (void *)v45[3];
  }
  v27 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v44, 8);
  -[CNAvatarCaptureViewController avatarRecord](self, "avatarRecord");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "avatarForRecord:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAvatar:", v29);

}

- (void)addPromptLabel
{
  id v3;
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
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  CGRect v25;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNAvatarCaptureViewController setPromptLabel:](self, "setPromptLabel:", v4);

  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 1);

  +[CNUIColorRepository photoPickerCapturePromptLabelTextColor](CNUIColorRepository, "photoPickerCapturePromptLabelTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontWithDescriptor:size:", v9, 18.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AVATAR_POSE_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeToFit");

  -[CNAvatarCaptureViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v17 = CGRectGetWidth(v25) + -40.0;
  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;
  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", 20.0, 64.0, v17, v20);

  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAutoresizingMask:", 34);

  -[CNAvatarCaptureViewController view](self, "view");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v23);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CNAvatarCaptureViewController;
  -[CNAvatarCaptureViewController viewDidLayoutSubviews](&v23, sel_viewDidLayoutSubviews);
  -[CNAvatarCaptureViewController cancelButton](self, "cancelButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[CNAvatarCaptureViewController cancelButton](self, "cancelButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController cancelButton](self, "cancelButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "textRectForBounds:limitedToNumberOfLines:", 1);
  v12 = v11;

  v13 = 13.0;
  if (-[CNAvatarCaptureViewController shouldUseLandscapeLayout](self, "shouldUseLandscapeLayout"))
  {
    -[CNAvatarCaptureViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeAreaInsets");
    v13 = v15 + 13.0;

  }
  -[CNAvatarCaptureViewController captureFooter](self, "captureFooter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17 - v12;
  -[CNAvatarCaptureViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaInsets");
  v21 = v18 - v20 + -32.0;

  -[CNAvatarCaptureViewController cancelButton](self, "cancelButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v13, v21, v5, v7);

}

- (void)updateAvtViewAspectRatioConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[CNAvatarCaptureViewController avtViewHeightConstraint](self, "avtViewHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAvatarCaptureViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCaptureViewController avtViewHeightConstraint](self, "avtViewHeightConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConstraint:", v5);

  }
  -[CNAvatarCaptureViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  -[CNAvatarCaptureViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v8 / v10;

  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController avtView](self, "avtView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:multiplier:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController setAvtViewHeightConstraint:](self, "setAvtViewHeightConstraint:", v16);

  -[CNAvatarCaptureViewController view](self, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCaptureViewController avtViewHeightConstraint](self, "avtViewHeightConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addConstraint:", v17);

}

- (BOOL)shouldUseLandscapeLayout
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1
      && (unint64_t)(-[CNAvatarCaptureViewController interfaceOrientation](self, "interfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)layoutFooterView
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  CGAffineTransform *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  __int128 v35;
  void *v36;
  CGFloat v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  _OWORD v55[3];
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGRect v60;

  if (-[CNAvatarCaptureViewController shouldUseLandscapeLayout](self, "shouldUseLandscapeLayout"))
  {
    v3 = -[CNAvatarCaptureViewController interfaceOrientation](self, "interfaceOrientation");
    -[CNAvatarCaptureViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    if (v3 == 4)
    {
      v7 = v6;
      -[CNAvatarCaptureViewController captureFooter](self, "captureFooter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFrame:", 0.0, 0.0, 190.0, v7);

      -[CNAvatarCaptureViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;
      -[CNAvatarCaptureViewController captureButtonView](self, "captureButtonView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFrame:", 0.0, 0.0, 190.0, v11);

      -[CNAvatarCaptureViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14 + -190.0;
      -[CNAvatarCaptureViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v18 = v17 * 0.5;
      -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCenter:", v15, v18);

      CGAffineTransformMakeRotation(&v59, 1.57079633);
      -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v58 = v59;
      v22 = &v58;
    }
    else
    {
      v42 = v5 + -190.0;
      -[CNAvatarCaptureViewController view](self, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bounds");
      v45 = v44;
      -[CNAvatarCaptureViewController captureFooter](self, "captureFooter");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFrame:", v42, 0.0, 190.0, v45);

      -[CNAvatarCaptureViewController view](self, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bounds");
      v49 = v48;
      -[CNAvatarCaptureViewController captureButtonView](self, "captureButtonView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFrame:", 0.0, 0.0, 190.0, v49);

      -[CNAvatarCaptureViewController view](self, "view");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "bounds");
      v53 = v52 * 0.5;
      -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setCenter:", 190.0, v53);

      CGAffineTransformMakeRotation(&v57, -1.57079633);
      -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v56 = v57;
      v22 = &v56;
    }
    objc_msgSend(v20, "setTransform:", v22);
  }
  else
  {
    -[CNAvatarCaptureViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24 + -190.0;
    -[CNAvatarCaptureViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v28 = v27;
    -[CNAvatarCaptureViewController captureFooter](self, "captureFooter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", 0.0, v25, v28, 190.0);

    -[CNAvatarCaptureViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;
    -[CNAvatarCaptureViewController captureButtonView](self, "captureButtonView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", 0.0, 0.0, v32, 190.0);

    -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v55[0] = *MEMORY[0x1E0C9BAA8];
    v55[1] = v35;
    v55[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v34, "setTransform:", v55);

    -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sizeToFit");

    -[CNAvatarCaptureViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v37 = CGRectGetWidth(v60) + -40.0;
    -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v40 = v39;
    -[CNAvatarCaptureViewController promptLabel](self, "promptLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", 20.0, 64.0, v37, v40);

  }
}

- (void)setupFooterView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *captureFooter;
  CNCaptureButtonView *v10;
  CNCaptureButtonView *captureButtonView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  UIButton *cancelButton;
  UIButton *v18;
  void *v19;
  void *v20;
  UIButton *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  captureFooter = self->_captureFooter;
  self->_captureFooter = v8;

  v10 = -[CNCaptureButtonView initWithFrame:]([CNCaptureButtonView alloc], "initWithFrame:", v4, v5, v6, v7);
  captureButtonView = self->_captureButtonView;
  self->_captureButtonView = v10;

  +[CNUIColorRepository photoPickerCropOverlayColor](CNUIColorRepository, "photoPickerCropOverlayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_captureFooter, "setBackgroundColor:", v12);

  -[UIView setAutoresizingMask:](self->_captureFooter, "setAutoresizingMask:", 10);
  -[CNAvatarCaptureViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_captureFooter);

  -[CNCaptureButtonView setAutoresizingMask:](self->_captureButtonView, "setAutoresizingMask:", 10);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCaptureButtonView setBackgroundColor:](self->_captureButtonView, "setBackgroundColor:", v14);

  -[CNCaptureButtonView button](self->_captureButtonView, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTarget:action:forEvents:", self, sel_didTapCaptureButton_, 64);

  -[UIView addSubview:](self->_captureFooter, "addSubview:", self->_captureButtonView);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v16;

  v18 = self->_cancelButton;
  CNContactsUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v18, "setTitle:forState:", v20, 0);

  v21 = self->_cancelButton;
  +[CNUIColorRepository photoPickerCaptureCancelButtonTextColor](CNUIColorRepository, "photoPickerCaptureCancelButtonTextColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v21, "setTitleColor:forState:", v22, 0);

  v23 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fontWithDescriptor:size:", v24, 18.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_cancelButton, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFont:", v25);

  -[UIButton sizeToFit](self->_cancelButton, "sizeToFit");
  -[UIButton addTarget:action:forEvents:](self->_cancelButton, "addTarget:action:forEvents:", self, sel_didTapCancelButton_, 64);
  -[UIView addSubview:](self->_captureFooter, "addSubview:", self->_cancelButton);
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
  v9.super_class = (Class)CNAvatarCaptureViewController;
  v7 = a4;
  -[CNAvatarCaptureViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E204B480;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)dismissCaptureController
{
  id v2;

  -[CNAvatarCaptureViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)didTapCaptureButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  -[CNAvatarCaptureViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNAvatarCaptureViewController avtView](self, "avtView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCaptureViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "snapshotWithSize:", v7, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[CNAvatarCaptureViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avatarCaptureController:didCaptureImage:", self, v10);

  }
}

- (CNAvatarCaptureViewControllerDelegate)delegate
{
  return (CNAvatarCaptureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
  objc_storeStrong((id *)&self->_avtView, a3);
}

- (NSLayoutConstraint)avtViewHeightConstraint
{
  return self->_avtViewHeightConstraint;
}

- (void)setAvtViewHeightConstraint:(id)a3
{
  self->_avtViewHeightConstraint = (NSLayoutConstraint *)a3;
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_promptLabel, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (CNCaptureButtonView)captureButtonView
{
  return self->_captureButtonView;
}

- (void)setCaptureButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_captureButtonView, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIView)captureFooter
{
  return self->_captureFooter;
}

- (void)setCaptureFooter:(id)a3
{
  objc_storeStrong((id *)&self->_captureFooter, a3);
}

- (UIImage)capturedImage
{
  return self->_capturedImage;
}

- (void)setCapturedImage:(id)a3
{
  objc_storeStrong((id *)&self->_capturedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capturedImage, 0);
  objc_storeStrong((id *)&self->_captureFooter, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_captureButtonView, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v2[3] = &unk_1E204F648;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

uint64_t __84__CNAvatarCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateAvtViewAspectRatioConstraint");
  objc_msgSend(*(id *)(a1 + 32), "avtView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateInterfaceOrientation");

  return objc_msgSend(*(id *)(a1 + 32), "layoutFooterView");
}

@end
