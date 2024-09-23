@implementation HKTitledBuddyViewController

- (HKTitledBuddyViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKTitledBuddyViewController;
  return -[HKTitledBuddyViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *loadingIndicator;
  void *v7;
  void *v8;
  UIStackView *v9;
  UIStackView *containerStackView;
  UIStackView *v11;
  void *v12;
  void *v13;
  UIScrollView *v14;
  UIScrollView *scrollView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIStackView *v20;
  UIStackView *bodyStackView;
  void *v22;
  uint64_t v23;
  void *v24;
  UIVisualEffectView *v25;
  UIVisualEffectView *anchoredButtonContainerView;
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
  id v41;
  id v42;
  id v43;
  objc_super v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)HKTitledBuddyViewController;
  -[HKTitledBuddyViewController viewDidLoad](&v44, sel_viewDidLoad);
  -[HKTitledBuddyViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_loadingIndicator, "setHidesWhenStopped:", 1);
  -[HKTitledBuddyViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_loadingIndicator);
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

  v9 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  containerStackView = self->_containerStackView;
  self->_containerStackView = v9;

  v11 = self->_containerStackView;
  -[HKTitledBuddyViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[UIStackView setFrame:](v11, "setFrame:");

  -[UIStackView setAutoresizingMask:](self->_containerStackView, "setAutoresizingMask:", 18);
  -[UIStackView setAxis:](self->_containerStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_bodyStackView, "setAlignment:", 3);
  -[HKTitledBuddyViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_containerStackView);

  v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v14;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_containerStackView, "addArrangedSubview:", self->_scrollView);
  -[HKTitledBuddyViewController _createHeaderView](self, "_createHeaderView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  -[HKTitledBuddyViewController subsequentViews](self, "subsequentViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  v20 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v18);
  bodyStackView = self->_bodyStackView;
  self->_bodyStackView = v20;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_bodyStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_bodyStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_bodyStackView, "setAlignment:", 3);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_bodyStackView);
  -[HKTitledBuddyViewController bottomAnchoredButtons](self, "bottomAnchoredButtons");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v24);
    anchoredButtonContainerView = self->_anchoredButtonContainerView;
    self->_anchoredButtonContainerView = v25;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_anchoredButtonContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKTitledBuddyViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", self->_anchoredButtonContainerView);

    -[HKTitledBuddyViewController _createAnchoredButtons](self, "_createAnchoredButtons");
    -[UIVisualEffectView bottomAnchor](self->_anchoredButtonContainerView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UIVisualEffectView leadingAnchor](self->_anchoredButtonContainerView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UIVisualEffectView trailingAnchor](self->_anchoredButtonContainerView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

  }
  _NSDictionaryOfVariableBindings(CFSTR("_scrollView, _bodyStackView"), self->_scrollView, self->_bodyStackView, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)-[UIScrollView hk_addConstraintsWithFormat:options:views:](self->_scrollView, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|[_bodyStackView]|"), 0, v40);
  v42 = (id)-[UIScrollView hk_addConstraintsWithFormat:options:views:](self->_scrollView, "hk_addConstraintsWithFormat:options:views:", CFSTR("V:|[_bodyStackView]|"), 0, v40);
  v43 = (id)-[UIScrollView hk_addEqualsConstraintWithItem:attribute:relatedTo:constant:](self->_scrollView, "hk_addEqualsConstraintWithItem:attribute:relatedTo:constant:", self->_bodyStackView, 9, self->_scrollView, 0.0);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  UIScrollView *scrollView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double Height;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)HKTitledBuddyViewController;
  -[HKTitledBuddyViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v4 = v3;
  -[UIStackView bounds](self->_bodyStackView, "bounds");
  if (v4 < CGRectGetHeight(v16))
  {
    scrollView = self->_scrollView;
    -[UIStackView bounds](self->_bodyStackView, "bounds");
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v6, v7);
  }
  if (self->_anchoredButtonContainerView)
  {
    -[UIScrollView contentInset](self->_scrollView, "contentInset");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIVisualEffectView frame](self->_anchoredButtonContainerView, "frame");
    Height = CGRectGetHeight(v17);
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v9, v11, Height, v13);
    -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v9, v11, Height, v13);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKTitledBuddyViewController;
  -[HKTitledBuddyViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  if (-[HKTitledBuddyViewController shouldCustomizeNavigationBar](self, "shouldCustomizeNavigationBar"))
  {
    -[HKTitledBuddyViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHidesShadow:", 1);

    -[HKTitledBuddyViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBarTintColor:", v8);

    -[HKTitledBuddyViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNavigationBarHidden:", -[HKTitledBuddyViewController shouldHideNavigationBar](self, "shouldHideNavigationBar"));

  }
}

- (BOOL)shouldCustomizeNavigationBar
{
  return 1;
}

- (id)titleImage
{
  return 0;
}

- (id)titleString
{
  return &stru_1E9C4C428;
}

- (id)bodyString
{
  return &stru_1E9C4C428;
}

- (int64_t)bodyTextAlignment
{
  return 1;
}

- (id)linkButtonTitle
{
  return 0;
}

- (id)subsequentViews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)bottomAnchoredButtons
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldHideNavigationBar
{
  return 0;
}

- (void)reloadViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[UIStackView arrangedSubviews](self->_bodyStackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[UIStackView removeArrangedSubview:](self->_bodyStackView, "removeArrangedSubview:", v8);
        objc_msgSend(v8, "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v5);
  }

  -[HKTitledBuddyViewController _createHeaderView](self, "_createHeaderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[HKTitledBuddyViewController subsequentViews](self, "subsequentViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[UIStackView addArrangedSubview:](self->_bodyStackView, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (id)_createHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  HKTitledLogoBuddyHeaderView *v8;
  void *v9;
  HKTitledLogoBuddyHeaderView *v10;
  HKTitledLogoBuddyHeaderView *header;
  void *v12;
  void *v13;
  void *v14;
  HKTitledLogoBuddyHeaderView *v15;
  void *v16;
  HKTitledLogoBuddyHeaderView *v17;
  void *v18;
  HKTitledLogoBuddyHeaderView *v19;
  CGRect v21;
  CGRect v22;

  -[HKTitledBuddyViewController titleImage](self, "titleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyViewController shouldHideNavigationBar](self, "shouldHideNavigationBar");
  -[HKTitledBuddyViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  CGRectGetHeight(v21);
  -[HKTitledBuddyViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v7 = v6;

  v8 = [HKTitledLogoBuddyHeaderView alloc];
  -[HKTitledBuddyViewController linkButtonTitle](self, "linkButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKTitledLogoBuddyHeaderView initWithTopInset:linkButtonTitle:](v8, "initWithTopInset:linkButtonTitle:", v9, v7);
  header = self->_header;
  self->_header = v10;

  -[HKTitledBuddyHeaderView setDelegate:](self->_header, "setDelegate:", self);
  -[HKTitledLogoBuddyHeaderView widthAnchor](self->_header, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  objc_msgSend(v12, "constraintEqualToConstant:", CGRectGetWidth(v22));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v15 = self->_header;
  -[HKTitledBuddyViewController titleString](self, "titleString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView setTitleText:](v15, "setTitleText:", v16);

  v17 = self->_header;
  -[HKTitledBuddyViewController bodyString](self, "bodyString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView setBodyText:alignment:](v17, "setBodyText:alignment:", v18, -[HKTitledBuddyViewController bodyTextAlignment](self, "bodyTextAlignment"));

  -[HKTitledLogoBuddyHeaderView setLogoImage:](self->_header, "setLogoImage:", v3);
  v19 = self->_header;

  return v19;
}

- (id)headerView
{
  return self->_header;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)_createAnchoredButtons
{
  void *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSArray *buttonStackConstraints;
  NSArray *v43;
  NSArray *buttons;
  NSArray *v45;
  id v46;
  _QWORD v47[5];
  NSArray *v48;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyViewController bottomAnchoredButtons](self, "bottomAnchoredButtons");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __53__HKTitledBuddyViewController__createAnchoredButtons__block_invoke;
  v47[3] = &unk_1E9C44B80;
  v47[4] = self;
  v4 = v3;
  v48 = v4;
  objc_msgSend(v46, "enumerateObjectsUsingBlock:", v47);
  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](v4, "count"))
  {
    v6 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](self->_anchoredButtonContainerView, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v7);

      objc_msgSend(v7, "centerXAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView centerXAnchor](self->_anchoredButtonContainerView, "centerXAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActive:", 1);

      v12 = HKHealthUIBuddyDirectionalEdgeInsets();
      v14 = v13;
      v16 = v15;
      objc_msgSend(v7, "leadingAnchor", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActive:", 1);

      objc_msgSend(v7, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setActive:", 1);

      if (v6)
        break;
      objc_msgSend(v7, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView topAnchor](self->_anchoredButtonContainerView, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 32.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setActive:", 1);

      if (-[NSArray count](v4, "count") == 1)
      {
        objc_msgSend(v7, "bottomAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView bottomAnchor](self->_anchoredButtonContainerView, "bottomAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintEqualToAnchor:constant:", v36, -44.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setActive:", 1);
        goto LABEL_13;
      }
LABEL_15:

      if (++v6 >= -[NSArray count](v4, "count"))
        goto LABEL_16;
    }
    objc_msgSend(v7, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_bodyLeading");
    v28 = v27;

    -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v6 - 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](v4, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 42.0;
    if (v28 >= 42.0)
      v31 = v28;
    v32 = -v31;
    if (v29 == v30)
      objc_msgSend(v29, "bottomAnchor");
    else
      objc_msgSend(v29, "lastBaselineAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstBaselineAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setActive:", 1);
    -[NSArray addObject:](v5, "addObject:", v36);
    if (v6 == -[NSArray count](v4, "count") - 1)
    {
      objc_msgSend(v7, "lastBaselineAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView bottomAnchor](self->_anchoredButtonContainerView, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:constant:", v40, -44.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setActive:", 1);

LABEL_13:
    }

    goto LABEL_15;
  }
LABEL_16:
  buttonStackConstraints = self->_buttonStackConstraints;
  self->_buttonStackConstraints = v5;
  v43 = v5;

  buttons = self->_buttons;
  self->_buttons = v4;
  v45 = v4;

}

void __53__HKTitledBuddyViewController__createAnchoredButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0DC3518];
  v6 = a2;
  HKHealthKeyColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  if (a3)
    objc_msgSend(v5, "hk_buttonTintedWithColor:title:target:action:", v7, v6, v8, sel__anchoredButtonTapped_);
  else
    objc_msgSend(v5, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v7, v6, v8, sel__anchoredButtonTapped_);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTag:", a3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

- (void)_anchoredButtonTapped:(id)a3
{
  -[HKTitledBuddyViewController buttonAtIndexTapped:](self, "buttonAtIndexTapped:", objc_msgSend(a3, "tag"));
}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_buttonStackConstraints;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        -[NSArray firstObject](self->_buttons, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "titleLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "font");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_bodyLeading");
        v12 = v11;

        v13 = 42.0;
        if (v12 >= 42.0)
          v13 = v12;
        objc_msgSend(v7, "setConstant:", -v13);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD block[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKTitledBuddyViewController;
  -[HKTitledBuddyViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKTitledBuddyViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__HKTitledBuddyViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __56__HKTitledBuddyViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentSizeCategory");
}

+ (id)embedView:(id)a3 inContainerViewWithMinimumEdgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  _QWORD v21[5];

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v21[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", v8);
  _NSDictionaryOfVariableBindings(CFSTR("view"), v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("topInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", top);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v20[1] = CFSTR("leftInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", left);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  v20[2] = CFSTR("bottomInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", bottom);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  v20[3] = CFSTR("rightInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", right);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (id)objc_msgSend(v9, "hk_addConstraintsWithFormat:options:metrics:views:", CFSTR("V:|-(>=topInset)-[view]-(>=bottomInset)-|"), 0, v15, v10);
  v17 = (id)objc_msgSend(v9, "hk_addConstraintsWithFormat:options:metrics:views:", CFSTR("H:|-(>=leftInset)-[view]-(>=rightInset)-|"), 0, v15, v10);
  v18 = (id)objc_msgSend(v9, "hk_addEqualsConstraintWithItem:attribute:relatedTo:constant:", v8, 9, v9, 0.0);

  return v9;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_buttonStackConstraints, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_anchoredButtonContainerView, 0);
  objc_storeStrong((id *)&self->_bodyStackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
