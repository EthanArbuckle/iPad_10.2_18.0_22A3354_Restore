@implementation HUTextViewController

- (HUTextViewController)initWithTextTitle:(id)a3
{
  id v5;
  HUTextViewController *v6;
  HUTextViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUTextViewController;
  v6 = -[HUTextViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_titleText, a3);
    -[HUActivityLoadingView textLabel](v7->_loadingView, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v5);

    v7->_showProgressIndicatorView = 1;
  }

  return v7;
}

- (void)viewDidLoad
{
  UITextView *v3;
  UITextView *textView;
  HUActivityLoadingView *v5;
  HUActivityLoadingView *v6;
  HUActivityLoadingView *loadingView;
  void *v8;
  UIView *v9;
  UIView *curtainView;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
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
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  objc_super v100;
  _QWORD v101[11];
  _QWORD v102[3];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v100.receiver = self;
  v100.super_class = (Class)HUTextViewController;
  -[HUTextViewController viewDidLoad](&v100, sel_viewDidLoad);
  v3 = (UITextView *)objc_opt_new();
  textView = self->_textView;
  self->_textView = v3;

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  v5 = [HUActivityLoadingView alloc];
  v6 = -[HUActivityLoadingView initWithFrame:activityIndicatorStyle:](v5, "initWithFrame:activityIndicatorStyle:", 100, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  loadingView = self->_loadingView;
  self->_loadingView = v6;

  -[HUActivityLoadingView textLabel](self->_loadingView, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineBreakMode:", 4);

  v9 = (UIView *)objc_opt_new();
  curtainView = self->_curtainView;
  self->_curtainView = v9;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_curtainView, "setBackgroundColor:", v11);

  -[UIView setAlpha:](self->_curtainView, "setAlpha:", 0.0);
  -[UIView setUserInteractionEnabled:](self->_curtainView, "setUserInteractionEnabled:", 0);
  -[UIView addSubview:](self->_curtainView, "addSubview:", self->_loadingView);
  -[HUTextViewController textContent](self, "textContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUTextViewController _textContentWithDefaultAttributes](self, "_textContentWithDefaultAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTextViewController textView](self, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedText:", v13);

  }
  -[HUTextViewController titleText](self, "titleText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HUTextViewController titleText](self, "titleText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTextViewController loadingView](self, "loadingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v16);

  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[HUTextViewController textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = v19;
  -[HUTextViewController curtainView](self, "curtainView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v102[1] = v20;
  -[HUTextViewController loadingView](self, "loadingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v102[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v97 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[HUTextViewController view](self, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addSubview:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
    }
    while (v24);
  }

  v29 = (void *)objc_opt_new();
  -[HUTextViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addLayoutGuide:", v29);

  objc_msgSend(v29, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:multiplier:", v33, 0.3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  v74 = v29;
  objc_msgSend(v29, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[HUTextViewController textView](self, "textView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v91;
  -[HUTextViewController textView](self, "textView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "bottomAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v86;
  -[HUTextViewController textView](self, "textView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v81;
  -[HUTextViewController textView](self, "textView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v76;
  -[HUTextViewController curtainView](self, "curtainView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v101[4] = v70;
  -[HUTextViewController curtainView](self, "curtainView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v101[5] = v65;
  -[HUTextViewController curtainView](self, "curtainView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v101[6] = v59;
  -[HUTextViewController curtainView](self, "curtainView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v101[7] = v54;
  -[HUTextViewController loadingView](self, "loadingView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v101[8] = v50;
  -[HUTextViewController loadingView](self, "loadingView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController curtainView](self, "curtainView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v101[9] = v42;
  -[HUTextViewController loadingView](self, "loadingView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutMarginsGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v101[10] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 11);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v63);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  UIBarButtonItem *v5;
  UIBarButtonItem *shareButton;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUTextViewController;
  -[HUTextViewController viewWillAppear:](&v12, sel_viewWillAppear_);
  if (-[HUTextViewController showsShareButton](self, "showsShareButton"))
  {
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__shareLog_);
    shareButton = self->_shareButton;
    self->_shareButton = v5;

    -[HUTextViewController shareButton](self, "shareButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTextViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

  }
  -[HUTextViewController _fulfillProgressIndicatorState:](self, "_fulfillProgressIndicatorState:", v3);
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[HUTextViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentOffset:", v9, v10);

}

- (id)hu_preloadContent
{
  void *v3;

  -[HUTextViewController loadingFuture](self, "loadingFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HUTextViewController loadingFuture](self, "loadingFuture");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTextContent:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *textContent;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[NSAttributedString isEqual:](self->_textContent, "isEqual:") & 1) == 0)
  {
    v4 = (NSAttributedString *)objc_msgSend(v8, "copy");
    textContent = self->_textContent;
    self->_textContent = v4;

    -[HUTextViewController _textContentWithDefaultAttributes](self, "_textContentWithDefaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTextViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);

  }
}

- (void)setShowProgressIndicatorView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_showProgressIndicatorView != a3)
  {
    v4 = a4;
    self->_showProgressIndicatorView = a3;
    if (-[HUTextViewController isViewLoaded](self, "isViewLoaded"))
      -[HUTextViewController _fulfillProgressIndicatorState:](self, "_fulfillProgressIndicatorState:", v4);
  }
}

- (void)setShowProgressIndicatorView:(BOOL)a3
{
  -[HUTextViewController setShowProgressIndicatorView:animated:](self, "setShowProgressIndicatorView:animated:", a3, 0);
}

- (void)loadTextFromFuture:(id)a3 textTitle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTextViewController.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loadFuture"));

  }
  -[HUTextViewController setTitleText:](self, "setTitleText:", v8);
  -[HUTextViewController loadingView](self, "loadingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  -[HUTextViewController loadingView](self, "loadingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeToFit");

  -[HUTextViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  if ((objc_msgSend(v7, "isFinished") & 1) == 0)
    -[HUTextViewController setShowProgressIndicatorView:animated:](self, "setShowProgressIndicatorView:animated:", 1, -[HUTextViewController isViewLoaded](self, "isViewLoaded") ^ 1);
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke;
  v15[3] = &unk_1E6F4D960;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "addCompletionBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController setLoadingFuture:](self, "setLoadingFuture:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke_2;
  block[3] = &unk_1E6F4C7A8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __53__HUTextViewController_loadTextFromFuture_textTitle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "setTextContent:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }
  objc_msgSend(WeakRetained, "setShowProgressIndicatorView:", 0);

}

- (id)_textContentWithDefaultAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTextViewController textContent](self, "textContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_attributedStringWithDefaultAttributes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_shareLog:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[HUTextViewController textContent](self, "textContent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, 0);

  objc_msgSend(v7, "setExcludedActivityCategories:", 1);
  v8 = *MEMORY[0x1E0CEB1E8];
  v14[0] = *MEMORY[0x1E0CEB1B8];
  v14[1] = v8;
  v9 = *MEMORY[0x1E0CEB228];
  v14[2] = *MEMORY[0x1E0CEB1A8];
  v14[3] = v9;
  v14[4] = *MEMORY[0x1E0CEB220];
  v14[5] = CFSTR("com.apple.mobilenotes.SharingExtension");
  v14[6] = CFSTR("com.apple.reminders.RemindersEditorExtension");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExcludedActivityTypes:", v10);

  -[HUTextViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBarButtonItem:", v12);

  -[HUTextViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)_fulfillProgressIndicatorState:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  void (**v14)(_QWORD);
  _QWORD aBlock[5];

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke;
  aBlock[3] = &unk_1E6F4D988;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v3)
  {
    v7 = objc_alloc(MEMORY[0x1E0CEABC8]);
    if (-[HUTextViewController showProgressIndicatorView](self, "showProgressIndicatorView"))
      v8 = 1;
    else
      v8 = 2;
    v10 = v5;
    v11 = 3221225472;
    v12 = __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke_2;
    v13 = &unk_1E6F4D9B0;
    v14 = v6;
    v9 = (void *)objc_msgSend(v7, "initWithDuration:curve:animations:", v8, &v10, 0.25);
    objc_msgSend(v9, "startAnimation", v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v6[2](v6);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

void __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showProgressIndicatorView");
  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    objc_msgSend(v4, "startAnimating");

    objc_msgSend(*(id *)(a1 + 32), "curtainView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.800000012);

    objc_msgSend(*(id *)(a1 + 32), "loadingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "shareButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "stopAnimating");

    objc_msgSend(*(id *)(a1 + 32), "curtainView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "loadingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "shareButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v9 = 1;
  }
  objc_msgSend(v8, "setEnabled:", v9);

}

uint64_t __55__HUTextViewController__fulfillProgressIndicatorState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSAttributedString)textContent
{
  return self->_textContent;
}

- (BOOL)showsShareButton
{
  return self->_showsShareButton;
}

- (void)setShowsShareButton:(BOOL)a3
{
  self->_showsShareButton = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (UIView)curtainView
{
  return self->_curtainView;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (HUActivityLoadingView)loadingView
{
  return self->_loadingView;
}

- (BOOL)showProgressIndicatorView
{
  return self->_showProgressIndicatorView;
}

- (UIBarButtonItem)shareButton
{
  return self->_shareButton;
}

- (NAFuture)loadingFuture
{
  return self->_loadingFuture;
}

- (void)setLoadingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_loadingFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingFuture, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
}

@end
