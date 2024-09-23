@implementation GKBaseComposeController

- (GKBaseComposeController)init
{
  GKBaseComposeController *v2;
  GKBaseComposeController *v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIView *contentView;
  GKTextView *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  GKContiguousContainerView *headerFieldContainer;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)GKBaseComposeController;
  v2 = -[GKLoadableContentViewController init](&v27, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GKBaseComposeController setShowHeaderFieldContainer:](v2, "setShowHeaderFieldContainer:", 1);
    v4 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBounces:", 1);
    objc_msgSend(v4, "setAlwaysBounceVertical:", 1);
    objc_msgSend(v4, "setContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v11;

    -[UIView setBackgroundColor:](v3->_contentView, "setBackgroundColor:", 0);
    -[UIView setOpaque:](v3->_contentView, "setOpaque:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", v3->_contentView);
    objc_storeStrong((id *)&v3->_backgroundView, v4);
    v13 = -[GKTextView initWithFrame:]([GKTextView alloc], "initWithFrame:", v7, v8, v9, v10);
    -[GKTextView setDelegate:](v13, "setDelegate:", v3);
    -[GKTextView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKTextView setBackgroundColor:](v13, "setBackgroundColor:", 0);
    -[GKTextView setOpaque:](v13, "setOpaque:", 0);
    -[GKTextView setScrollEnabled:](v13, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "composeMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "emphasized");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTextView applyTextStyle:](v13, "applyTextStyle:", v16);

    -[UIView addSubview:](v3->_contentView, "addSubview:", v13);
    objc_storeStrong((id *)&v3->_messageField, v13);
    LODWORD(v17) = 1148846080;
    -[GKTextView setContentCompressionResistancePriority:forAxis:](v3->_messageField, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    +[GKContiguousContainerView containerViewForViews:overlap:vertical:](GKContiguousContainerView, "containerViewForViews:overlap:vertical:", 0, 1, 0.0);
    v18 = objc_claimAutoreleasedReturnValue();
    headerFieldContainer = v3->_headerFieldContainer;
    v3->_headerFieldContainer = (GKContiguousContainerView *)v18;

    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_headerFieldContainer);
    -[GKBaseComposeController setIntendedFirstResponder:](v3, "setIntendedFirstResponder:", v13);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceIdiom");

    if (v21 == 1 && (!*MEMORY[0x1E0D253F8] || *MEMORY[0x1E0D25B68]))
    {
      objc_msgSend(v4, "setOpaque:", 0);
      objc_msgSend(v4, "setBackgroundColor:", 0);
    }
    else
    {
      objc_msgSend(v4, "setOpaque:", 1);
      objc_msgSend(v5, "viewBackgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackgroundColor:", v22);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel_keyboardWillHideShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v3, sel_keyboardWillHideShow_, *MEMORY[0x1E0DC4FE0], 0);

    v28[0] = v3->_backgroundView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLoadableContentViewController setViewsToHideWhileLoading:](v3, "setViewsToHideWhileLoading:", v25);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKBaseComposeController;
  -[GKBaseComposeController dealloc](&v4, sel_dealloc);
}

- (void)setComposeHeaderFields:(id)a3
{
  NSArray **p_composeHeaderFields;
  void *v6;
  NSArray *v7;

  p_composeHeaderFields = &self->_composeHeaderFields;
  v7 = (NSArray *)a3;
  if (*p_composeHeaderFields != v7)
  {
    -[GKBaseComposeController headerFieldContainer](self, "headerFieldContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceSubviews:", v7);
    objc_storeStrong((id *)p_composeHeaderFields, a3);

  }
}

- (BOOL)_gkWantsCustomRightBarButtonItemInViewService
{
  return 1;
}

- (void)_adjustContentInsetForShowingKeyboard:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  double scrollContentInsetAdjustY;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 1)
  {
    scrollContentInsetAdjustY = self->_scrollContentInsetAdjustY;
    if (v3)
    {
      if (scrollContentInsetAdjustY > 0.0)
        -[GKBaseComposeController _adjustContentInsetForShowingKeyboard:](self, "_adjustContentInsetForShowingKeyboard:", 0);
      -[UIScrollView contentInset](self->_backgroundView, "contentInset");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      height = self->_lastKnownKeyboardFrame.size.height;
      self->_scrollContentInsetAdjustY = height;
      v16 = v15 + height;
      -[UIScrollView setContentInset:](self->_backgroundView, "setContentInset:", v9);
      -[UIScrollView setScrollIndicatorInsets:](self->_backgroundView, "setScrollIndicatorInsets:", v9, v11, v16, v13);
      scrollContentInsetAdjustY = self->_scrollContentInsetAdjustY;
    }
    else if (scrollContentInsetAdjustY > 0.0)
    {
      -[UIScrollView contentInset](self->_backgroundView, "contentInset");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23 - self->_scrollContentInsetAdjustY;
      -[UIScrollView setContentInset:](self->_backgroundView, "setContentInset:", v17);
      -[UIScrollView setScrollIndicatorInsets:](self->_backgroundView, "setScrollIndicatorInsets:", v18, v20, v24, v22);
      self->_scrollContentInsetAdjustY = 0.0;
      scrollContentInsetAdjustY = 0.0;
    }
    -[NSLayoutConstraint setConstant:](self->_contentHeightConstraint, "setConstant:", -scrollContentInsetAdjustY);
  }
}

- (void)keyboardWillHideShow:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0DC4FE8]);

  if ((_DWORD)v5)
  {
    -[GKBaseComposeController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGRectValue");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v7, "convertRect:fromWindow:", 0, v11, v13, v15, v17);
    objc_msgSend(v6, "convertRect:fromView:", 0);
    -[GKBaseComposeController setLastKnownKeyboardFrame:](self, "setLastKnownKeyboardFrame:");

  }
  -[GKBaseComposeController _adjustContentInsetForShowingKeyboard:](self, "_adjustContentInsetForShowingKeyboard:", v5);

}

- (id)viewMetricsForContainerView:(id)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "frame");
  v4 = v3;
  v10[0] = &unk_1E5A5E2C8;
  v9[0] = CFSTR("headerLeftMargin");
  v9[1] = CFSTR("headerWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 + -15.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v10[2] = &unk_1E5A5E2E0;
  v9[2] = CFSTR("bodyLeftMargin");
  v9[3] = CFSTR("bodyRightMargin");
  v10[3] = &unk_1E5A5E2E0;
  v9[4] = CFSTR("bodyWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 + -20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIScrollView *backgroundView;
  UIView *contentView;
  GKContiguousContainerView *headerFieldContainer;
  GKTextView *messageField;
  void *v11;
  UIView *v12;
  void *v13;
  UIView *v14;
  void *v15;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  UIScrollView *v20;
  void *v21;
  UIScrollView *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)GKBaseComposeController;
  -[GKViewController loadView](&v30, sel_loadView);
  -[GKBaseComposeController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*MEMORY[0x1E0D253F8])
    objc_msgSend(v4, "viewBackgroundColor");
  else
    objc_msgSend(v4, "windowBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  objc_msgSend(v3, "addSubview:", self->_backgroundView);
  backgroundView = self->_backgroundView;
  v31[0] = CFSTR("scroll");
  v31[1] = CFSTR("content");
  contentView = self->_contentView;
  v32[0] = backgroundView;
  v32[1] = contentView;
  headerFieldContainer = self->_headerFieldContainer;
  v31[2] = CFSTR("header");
  v31[3] = CFSTR("message");
  messageField = self->_messageField;
  v32[2] = headerFieldContainer;
  v32[3] = messageField;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[message]"), 0, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v12, "addConstraints:", v13);

  if (-[GKBaseComposeController showHeaderFieldContainer](self, "showHeaderFieldContainer"))
  {
    v14 = self->_contentView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[header]|"), 0, 0, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v14, "addConstraints:", v15);

    v16 = self->_contentView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[header]-16-[message]|"), 0, 0, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v16, "addConstraints:", v17);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[scroll]|"), 0, 0, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v18);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[scroll]|"), 0, 0, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v19);

  v20 = self->_backgroundView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[content]|"), 0, 0, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView addConstraints:](v20, "addConstraints:", v21);

  v22 = self->_backgroundView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 6, 0, v22, 6, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView addConstraint:](v22, "addConstraint:", v23);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 6, 0, v3, 6, 1.0, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v24);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 8, 1, v3, 8, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseComposeController setContentHeightConstraint:](self, "setContentHeightConstraint:", v25);

  objc_msgSend(v3, "addConstraint:", self->_contentHeightConstraint);
  if (*MEMORY[0x1E0D253F8])
    v26 = 5;
  else
    v26 = 17;
  if (*MEMORY[0x1E0D253F8])
    v27 = 6;
  else
    v27 = 18;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 5, 0, v3, v26, 1.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseComposeController setContentLeadingConstraint:](self, "setContentLeadingConstraint:", v28);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_messageField, 6, 0, v3, v27, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseComposeController setMessageFieldTrailingConstraint:](self, "setMessageFieldTrailingConstraint:", v29);

  objc_msgSend(v3, "addConstraint:", self->_contentLeadingConstraint);
  objc_msgSend(v3, "addConstraint:", self->_messageFieldTrailingConstraint);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKBaseComposeController;
  -[GKBaseComposeController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  -[UIView bounds](self->_contentView, "bounds");
  -[UIScrollView setContentSize:](self->_backgroundView, "setContentSize:", v3, v4);
  if (*MEMORY[0x1E0D253F8])
  {
    -[NSLayoutConstraint constant](self->_contentLeadingConstraint, "constant");
    if (v5 == 0.0)
    {
      -[GKBaseComposeController margins](self, "margins");
      v7 = v6;
      -[NSLayoutConstraint setConstant:](self->_contentLeadingConstraint, "setConstant:", v8);
      -[NSLayoutConstraint setConstant:](self->_messageFieldTrailingConstraint, "setConstant:", -v7);
    }
  }
}

- (UIEdgeInsets)margins
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
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIEdgeInsets result;

  -[GKBaseComposeController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (v7 == 0.0)
  {
    -[GKBaseComposeController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_contentMargin");
    v7 = v13;

    if (v7 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceIdiom");

      if (v15 != 1 || (v7 = 20.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "userInterfaceIdiom");

        v7 = 15.0;
        if (!v17)
        {
          if ((objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v18, "bounds"),
                v20 = v19,
                v22 = v21,
                v18,
                v20 >= 414.0)
            && v22 >= 736.0
            || (v22 >= 414.0 ? (v23 = v20 < 736.0) : (v23 = 1), !v23))
          {
            v7 = 20.0;
          }
        }
      }
    }
  }
  if (v11 == 0.0)
    v24 = v7;
  else
    v24 = v11;
  v25 = v5;
  v26 = v7;
  v27 = v9;
  result.right = v24;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  __CFString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKBaseComposeController;
  -[GKViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[GKLoadableContentViewController loadingState](self, "loadingState");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 == CFSTR("Initial"))
  {
    -[GKLoadableContentViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadingState"));
    -[GKLoadableContentViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadedState"));
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKBaseComposeController;
  -[GKViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  if (v3)
  {
    -[GKBaseComposeController backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flashScrollIndicators");

  }
  -[GKBaseComposeController intendedFirstResponder](self, "intendedFirstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

}

- (unint64_t)supportedInterfaceOrientations
{
  _BYTE *v2;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;

  v2 = (_BYTE *)MEMORY[0x1E0D253F8];
  if (*MEMORY[0x1E0D253F8])
    return 30;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1 && (!*v2 || *MEMORY[0x1E0D25B68] != 0))
    return 30;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8)
    return 2;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  v14 = v11 < 414.0 || v13 < 736.0;
  if (v14 && (v13 >= 414.0 ? (v15 = v11 < 736.0) : (v15 = 1), v15))
    return 2;
  else
    return 30;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKBaseComposeController;
  -[GKBaseComposeController didRotateFromInterfaceOrientation:](&v5, sel_didRotateFromInterfaceOrientation_, a3);
  -[GKBaseComposeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (void)setMessageFieldText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GKBaseComposeController messageField](self, "messageField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[GKBaseComposeController messageFieldTextDidChange](self, "messageFieldTextDidChange");
}

- (void)_scrollSelectedTextToVisible
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;

  -[GKBaseComposeController messageField](self, "messageField");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "caretRectForPosition:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  if (!CGRectIsEmpty(v14))
  {
    -[UIScrollView convertRect:fromView:](self->_backgroundView, "convertRect:fromView:", v13, v6, v8, v10, v12);
    -[UIScrollView scrollRectToVisible:animated:](self->_backgroundView, "scrollRectToVisible:animated:", 1);
  }

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[GKBaseComposeController messageField](self, "messageField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v9)
  {
    objc_msgSend(v9, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6 >= 141)
    {
      objc_msgSend(v9, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringToIndex:", 140);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

    }
    -[GKBaseComposeController _scrollSelectedTextToVisible](self, "_scrollSelectedTextToVisible");
    -[GKBaseComposeController messageFieldTextDidChange](self, "messageFieldTextDidChange");
  }

}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GKBaseComposeController messageField](self, "messageField");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    -[GKBaseComposeController _scrollSelectedTextToVisible](self, "_scrollSelectedTextToVisible");
    v5 = v6;
  }

}

- (BOOL)showHeaderFieldContainer
{
  return self->_showHeaderFieldContainer;
}

- (void)setShowHeaderFieldContainer:(BOOL)a3
{
  self->_showHeaderFieldContainer = a3;
}

- (UIScrollView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSArray)composeHeaderFields
{
  return self->_composeHeaderFields;
}

- (GKTextView)messageField
{
  return self->_messageField;
}

- (void)setMessageField:(id)a3
{
  objc_storeStrong((id *)&self->_messageField, a3);
}

- (UIView)intendedFirstResponder
{
  return self->_intendedFirstResponder;
}

- (void)setIntendedFirstResponder:(id)a3
{
  self->_intendedFirstResponder = (UIView *)a3;
}

- (CGRect)lastKnownKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastKnownKeyboardFrame.origin.x;
  y = self->_lastKnownKeyboardFrame.origin.y;
  width = self->_lastKnownKeyboardFrame.size.width;
  height = self->_lastKnownKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastKnownKeyboardFrame:(CGRect)a3
{
  self->_lastKnownKeyboardFrame = a3;
}

- (GKContiguousContainerView)headerFieldContainer
{
  return self->_headerFieldContainer;
}

- (void)setHeaderFieldContainer:(id)a3
{
  objc_storeStrong((id *)&self->_headerFieldContainer, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (double)scrollContentInsetAdjustY
{
  return self->_scrollContentInsetAdjustY;
}

- (void)setScrollContentInsetAdjustY:(double)a3
{
  self->_scrollContentInsetAdjustY = a3;
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (void)setContentHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentHeightConstraint, a3);
}

- (NSLayoutConstraint)contentLeadingConstraint
{
  return self->_contentLeadingConstraint;
}

- (void)setContentLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentLeadingConstraint, a3);
}

- (NSLayoutConstraint)messageFieldTrailingConstraint
{
  return self->_messageFieldTrailingConstraint;
}

- (void)setMessageFieldTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_messageFieldTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFieldTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerFieldContainer, 0);
  objc_storeStrong((id *)&self->_messageField, 0);
  objc_storeStrong((id *)&self->_composeHeaderFields, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
