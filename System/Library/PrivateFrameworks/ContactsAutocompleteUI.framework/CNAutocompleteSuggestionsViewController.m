@implementation CNAutocompleteSuggestionsViewController

+ (id)os_log
{
  if (os_log_cn_once_token_2 != -1)
    dispatch_once(&os_log_cn_once_token_2, &__block_literal_global_1);
  return (id)os_log_cn_once_object_2;
}

void __49__CNAutocompleteSuggestionsViewController_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "suggestions");
  v1 = (void *)os_log_cn_once_object_2;
  os_log_cn_once_object_2 = (uint64_t)v0;

}

- (CNAutocompleteSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNAutocompleteSuggestionsViewController initWithSearchType:](self, "initWithSearchType:", 1, a4);
}

- (CNAutocompleteSuggestionsViewController)initWithSearchType:(unint64_t)a3
{
  CNAutocompleteSuggestionsViewControllerOptions *v5;
  CNAutocompleteSuggestionsViewController *v6;

  v5 = objc_alloc_init(CNAutocompleteSuggestionsViewControllerOptions);
  -[CNAutocompleteSuggestionsViewControllerOptions setSearchType:](v5, "setSearchType:", a3);
  -[CNAutocompleteSuggestionsViewControllerOptions setMaxNumberOfSuggestions:](v5, "setMaxNumberOfSuggestions:", 8);
  v6 = -[CNAutocompleteSuggestionsViewController initWithOptions:](self, "initWithOptions:", v5);

  return v6;
}

- (CNAutocompleteSuggestionsViewController)initWithOptions:(id)a3
{
  id v4;
  CNAutocompleteSuggestionsViewController *v5;
  uint64_t v6;
  CNAutocompleteSuggestionsViewControllerOptions *options;
  CNAutocompleteSuggestionsViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteSuggestionsViewController;
  v5 = -[CNAutocompleteSuggestionsViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (CNAutocompleteSuggestionsViewControllerOptions *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewController keyboardWillShowNotificationObserver](self, "keyboardWillShowNotificationObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  -[CNAutocompleteSuggestionsViewController keyboardWillHideNotificationObserver](self, "keyboardWillHideNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v5);

  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteSuggestionsViewController;
  -[CNAutocompleteSuggestionsViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CNAutocompleteSuggestionsViewController;
  -[CNAutocompleteSuggestionsViewController viewDidLoad](&v18, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInsetsLayoutMarginsFromSafeArea:", 0);

  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

  -[CNAutocompleteSuggestionsViewController buildCollectionView](self, "buildCollectionView");
  -[CNAutocompleteSuggestionsViewController setSuggestionPreWarmCompletionBlock:](self, "setSuggestionPreWarmCompletionBlock:", 0);
  -[CNAutocompleteSuggestionsViewController fetchRecipients](self, "fetchRecipients");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = *MEMORY[0x1E0CEB978];
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke;
  v15[3] = &unk_1E62BF170;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewController setKeyboardWillShowNotificationObserver:](self, "setKeyboardWillShowNotificationObserver:", v10);

  v11 = *MEMORY[0x1E0CEB970];
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke_2;
  v13[3] = &unk_1E62BF170;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewController setKeyboardWillHideNotificationObserver:](self, "setKeyboardWillHideNotificationObserver:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");

  objc_msgSend(WeakRetained, "latestKeyboardFrame");
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");

}

void __54__CNAutocompleteSuggestionsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");

  objc_msgSend(WeakRetained, "latestKeyboardFrame");
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAutocompleteSuggestionsViewController;
  -[CNAutocompleteSuggestionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNAutocompleteSuggestionsViewController fetchRecipientsIfNeeded](self, "fetchRecipientsIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNAutocompleteSuggestionsViewController;
  v4 = a3;
  -[CNAutocompleteSuggestionsViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[CNAutocompleteSuggestionsViewController traitCollection](self, "traitCollection", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[CNAutocompleteSuggestionsViewController compositionalLayout](self, "compositionalLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController setLayout:](self, "setLayout:", v8);

    -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController layout](self, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCollectionViewLayout:animated:", v10, 1);

    -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

  }
}

- (BOOL)useAccessibleLayout
{
  void *v2;
  char v3;

  -[CNAutocompleteSuggestionsViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = isTraitCollectionAccessible(v2);

  return v3;
}

- (void)adjustInsetsForKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  id v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromWindow:", 0, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v48, "convertRect:fromView:", 0, v10, v12, v14, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v48, "frame");
  v51.origin.x = v18;
  v51.origin.y = v20;
  v51.size.width = v22;
  v51.size.height = v24;
  v50 = CGRectIntersection(v49, v51);
  v25 = CGRectGetHeight(v50);
  -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentInset");
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[CNAutocompleteSuggestionsViewController additionalContentInsets](self, "additionalContentInsets");
  v34 = v28 + v33;
  -[CNAutocompleteSuggestionsViewController additionalContentInsets](self, "additionalContentInsets");
  v36 = v25 + v35;
  -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setContentInset:", v34, v30, v36, v32);

  -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "contentInset");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setVerticalScrollIndicatorInsets:", v40, v42, v44, v46);

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
  v9.super_class = (Class)CNAutocompleteSuggestionsViewController;
  v7 = a4;
  -[CNAutocompleteSuggestionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CNAutocompleteSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E62BF198;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __94__CNAutocompleteSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)setAdditionalContentInset:(NSDirectionalEdgeInsets)a3
{
  if (self->_additionalContentInsets.leading != a3.leading
    || self->_additionalContentInsets.top != a3.top
    || self->_additionalContentInsets.trailing != a3.trailing
    || self->_additionalContentInsets.bottom != a3.bottom)
  {
    self->_additionalContentInsets = a3;
    -[CNAutocompleteSuggestionsViewController latestKeyboardFrame](self, "latestKeyboardFrame");
    -[CNAutocompleteSuggestionsViewController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
  }
}

- (void)titleLabelTapped:(id)a3
{
  id v4;

  -[CNAutocompleteSuggestionsViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionsControllerTitleLabelWasTapped:", self);

}

- (void)prepareForReuse
{
  -[CNAutocompleteSuggestionsViewController setAdditionalContentInsets:](self, "setAdditionalContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));
  -[CNAutocompleteSuggestionsViewController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNAutocompleteSuggestionsViewController latestKeyboardFrame](self, "latestKeyboardFrame");
  -[CNAutocompleteSuggestionsViewController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
  -[CNAutocompleteSuggestionsViewController setRecipients:](self, "setRecipients:", 0);
  -[CNAutocompleteSuggestionsViewController setTaskID:](self, "setTaskID:", 0);
}

- (id)compositionalLayout
{
  double v3;
  double v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (-[CNAutocompleteSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v3 = 1.0;
  else
    v3 = 0.25;
  if (-[CNAutocompleteSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v4 = 96.0;
  else
    v4 = 140.0;
  v5 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithWidthDimension:heightDimension:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithWidthDimension:heightDimension:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
  v14 = (void *)MEMORY[0x1E0CEA1D0];
  v27[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "horizontalGroupWithLayoutSize:subitems:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInsets:", 10.0, 10.0, 10.0, 10.0);
  objc_msgSend(v17, "setInterGroupSpacing:", 0.0);
  v18 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 44.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeWithWidthDimension:heightDimension:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1B0], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v21, *MEMORY[0x1E0CEB3B8], 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentInsets:", 0.0, 3.0, 0.0, 3.0);
  v26 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBoundarySupplementaryItems:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA428]), "initWithSection:", v17);
  return v24;
}

- (void)buildCollectionView
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;

  -[CNAutocompleteSuggestionsViewController compositionalLayout](self, "compositionalLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewController setLayout:](self, "setLayout:", v3);

  v4 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6 + 0.0;
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  -[CNAutocompleteSuggestionsViewController layout](self, "layout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v17, v7, v10, v13, v16);

  objc_msgSend(v18, "setDelegate:", self);
  objc_initWeak(&location, self);
  v19 = objc_alloc(MEMORY[0x1E0CEA440]);
  v20 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke;
  v30[3] = &unk_1E62BF1E8;
  objc_copyWeak(&v31, &location);
  v21 = (void *)objc_msgSend(v19, "initWithCollectionView:cellProvider:", v18, v30);
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_3;
  v28[3] = &unk_1E62BF210;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v21, "setSupplementaryViewProvider:", v28);
  -[CNAutocompleteSuggestionsViewController setDiffableDataSource:](self, "setDiffableDataSource:", v21);
  objc_msgSend(v18, "setDataSource:", v21);
  objc_msgSend(v18, "setClipsToBounds:", 0);
  v22 = objc_opt_class();
  +[CNAutocompleteSuggestionsCell cellIdentifier](CNAutocompleteSuggestionsCell, "cellIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellWithReuseIdentifier:", v22, v23);

  v24 = objc_opt_class();
  +[CNAutocompleteSuggestionsViewSectionHeader reuseIdentifier](CNAutocompleteSuggestionsViewSectionHeader, "reuseIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v24, *MEMORY[0x1E0CEB3B8], v25);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v26);

  objc_msgSend(v18, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v18, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v18, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v18, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v18, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v18);

  objc_msgSend(v18, "setAutoresizingMask:", 18);
  -[CNAutocompleteSuggestionsViewController setCollectionView:](self, "setCollectionView:", v18);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

id __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  +[CNAutocompleteSuggestionsCell cellIdentifier](CNAutocompleteSuggestionsCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "item");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisplayString:", v13);

  objc_msgSend(v12, "recipient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_2;
  v17[3] = &unk_1E62BF1C0;
  v15 = v9;
  v18 = v15;
  objc_msgSend(WeakRetained, "imageForRecipient:imageUpdateBlock:", v14, v17);

  return v15;
}

uint64_t __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", a2);
}

id __62__CNAutocompleteSuggestionsViewController_buildCollectionView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if ((id)*MEMORY[0x1E0CEB3B8] == v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    +[CNAutocompleteSuggestionsViewSectionHeader reuseIdentifier](CNAutocompleteSuggestionsViewSectionHeader, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v12, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "suggestionsHeaderTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", WeakRetained, sel_titleLabelTapped_);
    objc_msgSend(v15, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v10, "addGestureRecognizer:", v15);
    objc_msgSend(v10, "setUserInteractionEnabled:", 1);

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CEA408]);
  }

  return v10;
}

- (void)fetchRecipientsIfNeeded
{
  void *v3;

  -[CNAutocompleteSuggestionsViewController recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNAutocompleteSuggestionsViewController fetchRecipients](self, "fetchRecipients");
}

- (void)setOtherRecipientAddresses:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSArray isEqual:](self->_otherRecipientAddresses, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_otherRecipientAddresses, a3);
    if (-[CNAutocompleteSuggestionsViewController isViewLoaded](self, "isViewLoaded"))
      -[CNAutocompleteSuggestionsViewController fetchRecipients](self, "fetchRecipients");
  }

}

- (void)fetchRecipients
{
  void *v3;
  NSObject *v4;
  void *v5;
  CNAutocompleteSearchManager *v6;
  void *v7;
  CNAutocompleteSearchManager *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[8];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteSuggestionsViewController taskID](self, "taskID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B10FF000, v4, OS_LOG_TYPE_INFO, "Suggestions fetchRecipients called while fetch already in flight, ignoring", buf, 2u);
    }
  }
  else
  {
    -[CNAutocompleteSuggestionsViewController searchManager](self, "searchManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = [CNAutocompleteSearchManager alloc];
      -[CNAutocompleteSuggestionsViewController options](self, "options");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CNAutocompleteSearchManager initWithAutocompleteSearchType:](v6, "initWithAutocompleteSearchType:", objc_msgSend(v7, "searchType"));
      -[CNAutocompleteSuggestionsViewController setSearchManager:](self, "setSearchManager:", v8);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[CNAutocompleteSuggestionsViewController otherRecipientAddresses](self, "otherRecipientAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          -[NSObject addObject:](v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v11);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CNAutocompleteSuggestionsViewController selectedRecipients](self, "selectedRecipients", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "address");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v4, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v16);
    }

    v20 = objc_alloc_init(MEMORY[0x1E0D135B0]);
    v21 = -[NSObject copy](v4, "copy");
    objc_msgSend(v20, "setOtherAddressesAlreadyChosen:", v21);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController setFetchedRecipients:](self, "setFetchedRecipients:", v22);

    -[CNAutocompleteSuggestionsViewController searchManager](self, "searchManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "searchForText:withAutocompleteFetchContext:consumer:", &stru_1E62C0368, v20, self);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController setTaskID:](self, "setTaskID:", v24);

  }
}

- (void)fetchSuggestedRecipientsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNAutocompleteSuggestionsViewController setTaskID:](self, "setTaskID:", &unk_1E62D2EF0);
  v5 = (void *)objc_msgSend(v4, "copy");

  -[CNAutocompleteSuggestionsViewController setSuggestionPreWarmCompletionBlock:](self, "setSuggestionPreWarmCompletionBlock:", v5);
  -[CNAutocompleteSuggestionsViewController fetchRecipients](self, "fetchRecipients");
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;

  v15 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "integerValue") == -1
    && (-[CNAutocompleteSuggestionsViewController suggestionPreWarmCompletionBlock](self, "suggestionPreWarmCompletionBlock"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    -[CNAutocompleteSuggestionsViewController suggestionPreWarmCompletionBlock](self, "suggestionPreWarmCompletionBlock");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v14)[2](v14, v15);

    -[CNAutocompleteSuggestionsViewController setSuggestionPreWarmCompletionBlock:](self, "setSuggestionPreWarmCompletionBlock:", 0);
  }
  else
  {
    -[CNAutocompleteSuggestionsViewController taskID](self, "taskID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToNumber:", v6);

    if (v8)
    {
      -[CNAutocompleteSuggestionsViewController fetchedRecipients](self, "fetchedRecipients");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v15);

      -[CNAutocompleteSuggestionsViewController fetchedRecipients](self, "fetchedRecipients");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_cn_take:", 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      -[CNAutocompleteSuggestionsViewController setRecipients:](self, "setRecipients:", v12);

    }
  }

}

- (void)finishedTaskWithID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[CNAutocompleteSuggestionsViewController taskID](self, "taskID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CNAutocompleteSuggestionsViewController taskID](self, "taskID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isEqualToNumber:", v6);

    if (v7)
    {
      -[CNAutocompleteSuggestionsViewController fetchedRecipients](self, "fetchedRecipients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (!v9)
        -[CNAutocompleteSuggestionsViewController setRecipients:](self, "setRecipients:", MEMORY[0x1E0C9AA60]);
      -[CNAutocompleteSuggestionsViewController setTaskID:](self, "setTaskID:", 0);
    }
  }

}

- (void)setRecipients:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = (NSArray *)a3;
  if (self->_recipients != v7)
  {
    objc_storeStrong((id *)&self->_recipients, a3);
    -[NSArray _cn_map:](v7, "_cn_map:", &__block_literal_global_126);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController setItems:](self, "setItems:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0CEA210]);
    if (-[NSArray count](v7, "count"))
    {
      v14[0] = CFSTR("Main");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendSectionsWithIdentifiers:", v10);

      -[CNAutocompleteSuggestionsViewController items](self, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendItemsWithIdentifiers:", v11);

    }
    -[CNAutocompleteSuggestionsViewController diffableDataSource](self, "diffableDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__CNAutocompleteSuggestionsViewController_setRecipients_animated___block_invoke_2;
    v13[3] = &unk_1E62BF258;
    v13[4] = self;
    objc_msgSend(v12, "applySnapshot:animatingDifferences:completion:", v9, v4, v13);

  }
  -[CNAutocompleteSuggestionsViewController setSuggestionsAreUpdating:](self, "setSuggestionsAreUpdating:", 0);

}

CNSuggestedRecipientItem *__66__CNAutocompleteSuggestionsViewController_setRecipients_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNSuggestedRecipientItem *v3;

  v2 = a2;
  v3 = -[CNSuggestedRecipientItem initWithRecipient:]([CNSuggestedRecipientItem alloc], "initWithRecipient:", v2);

  return v3;
}

uint64_t __66__CNAutocompleteSuggestionsViewController_setRecipients_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSuggestionsAreUpdating:", 0);
}

- (void)setRecipients:(id)a3
{
  -[CNAutocompleteSuggestionsViewController setRecipients:animated:](self, "setRecipients:animated:", a3, 1);
}

- (CGSize)avatarSize
{
  double v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;

  if (-[CNAutocompleteSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout"))
    v3 = 1.0;
  else
    v3 = 4.0;
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (CGRectGetWidth(v10) + (v3 + 1.0) * -20.0) / v3;

  v6 = -[CNAutocompleteSuggestionsViewController useAccessibleLayout](self, "useAccessibleLayout");
  v7 = 80.0;
  if (v6)
    v7 = 60.0;
  if (v7 >= v5)
    v7 = v5;
  v8 = v7;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)imageForRecipient:(id)a3 imageUpdateBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  CNAUIMessagesImagesFacade *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  id v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  double v46;
  double v47;
  double v48;

  v6 = a3;
  v7 = a4;
  -[CNAutocompleteSuggestionsViewController avatarRenderer](self, "avatarRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C97450]);
    objc_msgSend(MEMORY[0x1E0C97458], "defaultSettingsWithCacheSize:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithSettings:", v10);
    -[CNAutocompleteSuggestionsViewController setAvatarRenderer:](self, "setAvatarRenderer:", v11);

  }
  -[CNAutocompleteSuggestionsViewController avatarSize](self, "avatarSize");
  v13 = v12;
  v15 = v14;
  -[CNAutocompleteSuggestionsViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v17, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;

  -[CNAutocompleteSuggestionsViewController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_opt_respondsToSelector();

  v22 = MEMORY[0x1E0C809B0];
  if ((v17 & 1) == 0)
    goto LABEL_14;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke;
  v44[3] = &unk_1E62BF2A8;
  v46 = v13;
  v47 = v15;
  v48 = v20;
  v45 = v7;
  v23 = (void *)MEMORY[0x1B5E16810](v44);
  -[CNAutocompleteSuggestionsViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "suggestionsController:imageDataForRecipient:imageUpdateBlock:", self, v6, v23);

  if ((v25 & 1) == 0)
  {
LABEL_14:
    if (objc_msgSend(v6, "isGroup"))
    {
      v26 = objc_alloc_init(CNAUIMessagesImagesFacade);
      objc_msgSend(v6, "autocompleteResult");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAUIMessagesImagesFacade imageForResult:](v26, "imageForResult:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        +[CNUIImage resizeImage:toFitWidth:scale:](CNUIImage, "resizeImage:toFitWidth:scale:", v28, v13, v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "schedulerProvider");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "mainThreadScheduler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v22;
        v41[1] = 3221225472;
        v41[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_3;
        v41[3] = &unk_1E62BF280;
        v33 = &v43;
        v42 = v29;
        v43 = v7;
        v34 = v29;
        objc_msgSend(v32, "performBlock:", v41);

        v35 = v42;
LABEL_10:

        goto LABEL_11;
      }

    }
    -[CNAutocompleteSuggestionsViewController contactsForAvatarForRecipient:](self, "contactsForAvatarForRecipient:", v6);
    v26 = (CNAUIMessagesImagesFacade *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController traitCollection](self, "traitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "layoutDirection") == 1;

    objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v37, 0, v13, v15, v20);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController avatarRenderer](self, "avatarRenderer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v22;
    v39[1] = 3221225472;
    v39[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_4;
    v39[3] = &unk_1E62BF2D0;
    v33 = &v40;
    v40 = v7;
    v38 = (id)objc_msgSend(v35, "renderAvatarsForContacts:scope:imageHandler:", v26, v34, v39);
    goto LABEL_10;
  }
LABEL_11:

}

void __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIImage resizeImage:toFitWidth:scale:](CNUIImage, "resizeImage:toFitWidth:scale:", v3, *(double *)(a1 + 40), *(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_2;
  v10[3] = &unk_1E62BF280;
  v8 = *(id *)(a1 + 32);
  v11 = v4;
  v12 = v8;
  v9 = v4;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_5;
  v9[3] = &unk_1E62BF280;
  v7 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "performBlock:", v9);

}

uint64_t __78__CNAutocompleteSuggestionsViewController_imageForRecipient_imageUpdateBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)contactsForAvatarForRecipient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C97200]);
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v4, "isGroup"))
    {
      objc_msgSend(v4, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __73__CNAutocompleteSuggestionsViewController_contactsForAvatarForRecipient___block_invoke;
      v14[3] = &unk_1E62BF2F8;
      v14[4] = self;
      objc_msgSend(v7, "_cn_map:", v14);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97450], "descriptorForRequiredKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactWithKeysToFetch:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[CNAutocompleteSuggestionsViewController unknownContactForRecipient:](self, "unknownContactForRecipient:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v8;

    v6 = v11;
  }
  v12 = v6;

  return v12;
}

id __73__CNAutocompleteSuggestionsViewController_contactsForAvatarForRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97450], "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactWithKeysToFetch:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "unknownContactForRecipient:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)unknownContactForRecipient:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
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
  void *v19;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v3, "compositeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0D13AD8];
    objc_msgSend(v3, "displayString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGivenName:", v11);

    objc_msgSend(v10, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFamilyName:", v12);

  }
  if (objc_msgSend(v3, "kind") == 1)
  {
    v13 = (void *)MEMORY[0x1E0C97398];
    objc_msgSend(v3, "normalizedAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "phoneNumberWithStringValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPhoneNumbers:", v17);

LABEL_7:
    goto LABEL_8;
  }
  if (!objc_msgSend(v3, "kind"))
  {
    v18 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v3, "normalizedAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "labeledValueWithLabel:value:", 0, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmailAddresses:", v16);
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return !-[CNAutocompleteSuggestionsViewController suggestionsAreUpdating](self, "suggestionsAreUpdating", a3, a4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[CNAutocompleteSuggestionsViewController items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIsSelected:", 1);
  -[CNAutocompleteSuggestionsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestionsController:didSelectRecipient:", self, v8);

  -[CNAutocompleteSuggestionsViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deselectItemAtIndexPath:animated:", v5, 1);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNAutocompleteSuggestionsViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAutocompleteSuggestionsViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestionsControllerWillBeginScroll:", self);

  }
}

- (void)invalidateSelectedRecipients
{
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];

  -[CNAutocompleteSuggestionsViewController suggestionsFetchDebounceTimer](self, "suggestionsFetchDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAutocompleteSuggestionsViewController suggestionsFetchDebounceTimer](self, "suggestionsFetchDebounceTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[CNAutocompleteSuggestionsViewController setSuggestionsFetchDebounceTimer:](self, "setSuggestionsFetchDebounceTimer:", 0);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CNAutocompleteSuggestionsViewController_invalidateSelectedRecipients__block_invoke;
  v6[3] = &unk_1E62BF258;
  v6[4] = self;
  CreateSuggestionsFetchDebounceDispatchTimer(MEMORY[0x1E0C80D38], v6, 0.2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewController setSuggestionsFetchDebounceTimer:](self, "setSuggestionsFetchDebounceTimer:", v5);

}

void __71__CNAutocompleteSuggestionsViewController_invalidateSelectedRecipients__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setSuggestionsAreUpdating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedRecipientsForSuggestionsController:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setSelectedRecipients:", v3);
  objc_msgSend(*(id *)(a1 + 32), "fetchRecipients");

}

- (id)selectedRecipientHandles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteSuggestionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedRecipientsForSuggestionsController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "normalizedAddress", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)conformResultsForSelection
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CNAutocompleteSuggestionsViewController *v8;

  -[CNAutocompleteSuggestionsViewController selectedRecipientHandles](self, "selectedRecipientHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewController items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__CNAutocompleteSuggestionsViewController_conformResultsForSelection__block_invoke;
  v6[3] = &unk_1E62BF320;
  v7 = v3;
  v8 = self;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __69__CNAutocompleteSuggestionsViewController_conformResultsForSelection__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(v8, "isSelectedForHandles:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(v8, "isSelected") & 1) == 0 && v5)
  {
    objc_msgSend(v8, "setIsSelected:", 1);
    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v7, 1, 0);

  }
}

- (void)conformResultsForDeselection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CNAutocompleteSuggestionsViewController *v9;

  v4 = a3;
  -[CNAutocompleteSuggestionsViewController items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CNAutocompleteSuggestionsViewController_conformResultsForDeselection___block_invoke;
  v7[3] = &unk_1E62BF320;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __72__CNAutocompleteSuggestionsViewController_conformResultsForDeselection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "shouldDeselectForHandles:", v5);

  if (objc_msgSend(v12, "isSelected") && v6)
  {
    objc_msgSend(v12, "setIsSelected:", 0);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "recipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionsController:didDeselectRecipient:", v8, v9);

    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v11, 1);

  }
}

- (CNAutocompleteSuggestionsViewControllerDelegate)delegate
{
  return (CNAutocompleteSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSArray)otherRecipientAddresses
{
  return self->_otherRecipientAddresses;
}

- (NSString)suggestionsHeaderTitle
{
  return self->_suggestionsHeaderTitle;
}

- (void)setSuggestionsHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsHeaderTitle, a3);
}

- (NSDirectionalEdgeInsets)additionalContentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_additionalContentInsets.top;
  leading = self->_additionalContentInsets.leading;
  bottom = self->_additionalContentInsets.bottom;
  trailing = self->_additionalContentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setAdditionalContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_additionalContentInsets = a3;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (NSNumber)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_taskID, a3);
}

- (NSArray)selectedRecipients
{
  return self->_selectedRecipients;
}

- (void)setSelectedRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRecipients, a3);
}

- (CNAutocompleteSearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchManager, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (NSMutableArray)fetchedRecipients
{
  return self->_fetchedRecipients;
}

- (void)setFetchedRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedRecipients, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (BOOL)suggestionsAreUpdating
{
  return self->_suggestionsAreUpdating;
}

- (void)setSuggestionsAreUpdating:(BOOL)a3
{
  self->_suggestionsAreUpdating = a3;
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (void)setAvatarRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRenderer, a3);
}

- (NSObject)keyboardWillShowNotificationObserver
{
  return self->_keyboardWillShowNotificationObserver;
}

- (void)setKeyboardWillShowNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardWillShowNotificationObserver, a3);
}

- (NSObject)keyboardWillHideNotificationObserver
{
  return self->_keyboardWillHideNotificationObserver;
}

- (void)setKeyboardWillHideNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, a3);
}

- (CGRect)latestKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_latestKeyboardFrame.origin.x;
  y = self->_latestKeyboardFrame.origin.y;
  width = self->_latestKeyboardFrame.size.width;
  height = self->_latestKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLatestKeyboardFrame:(CGRect)a3
{
  self->_latestKeyboardFrame = a3;
}

- (id)suggestionPreWarmCompletionBlock
{
  return self->_suggestionPreWarmCompletionBlock;
}

- (void)setSuggestionPreWarmCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (OS_dispatch_source)suggestionsFetchDebounceTimer
{
  return self->_suggestionsFetchDebounceTimer;
}

- (void)setSuggestionsFetchDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsFetchDebounceTimer, a3);
}

- (CNAutocompleteSuggestionsViewControllerOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_suggestionsFetchDebounceTimer, 0);
  objc_storeStrong(&self->_suggestionPreWarmCompletionBlock, 0);
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillShowNotificationObserver, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_fetchedRecipients, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_suggestionsHeaderTitle, 0);
  objc_storeStrong((id *)&self->_otherRecipientAddresses, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
