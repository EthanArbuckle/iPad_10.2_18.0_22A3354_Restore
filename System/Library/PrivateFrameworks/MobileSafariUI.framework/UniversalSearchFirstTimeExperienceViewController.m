@implementation UniversalSearchFirstTimeExperienceViewController

+ (BOOL)hasShownParsecFirstTimeUserExperience
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSParsecHasShownFirstTimeUserExperience"));

  return v3;
}

+ (void)userDidInteractWithParsecFirstTimeUserExperience
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("WBSParsecHasShownFirstTimeUserExperience"));
  objc_msgSend(v2, "synchronize");

}

- (UniversalSearchFirstTimeExperienceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  UniversalSearchFirstTimeExperienceViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  SearchUIFirstTimeExperienceViewController *firstTimeExperienceViewController;
  UniversalSearchFirstTimeExperienceViewController *v23;
  id v25;
  objc_super v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  v8 = -[UniversalSearchFirstTimeExperienceViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    +[WBSParsecDSession sharedPARSession](UniversalSearchSession, "sharedPARSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v11 = (void *)getSearchUIFirstTimeExperienceViewControllerClass_softClass;
    v31 = getSearchUIFirstTimeExperienceViewControllerClass_softClass;
    if (!getSearchUIFirstTimeExperienceViewControllerClass_softClass)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __getSearchUIFirstTimeExperienceViewControllerClass_block_invoke;
      v27[3] = &unk_1E9CF1780;
      v27[4] = &v28;
      __getSearchUIFirstTimeExperienceViewControllerClass_block_invoke((uint64_t)v27);
      v11 = (void *)v29[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v28, 8);
    v25 = [v12 alloc];
    objc_msgSend(v10, "enabledDomains");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0D8B1F8]);
    if (objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0D8B1F0]))
      v14 |= 8uLL;
    if (objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0D8B1E8]))
      v14 |= 0x20uLL;
    if (objc_msgSend(v13, "containsObject:", CFSTR("itunes")))
      v14 |= 2uLL;
    if (objc_msgSend(v13, "containsObject:", CFSTR("app_store")))
      v14 |= 4uLL;
    if (objc_msgSend(v13, "containsObject:", CFSTR("restaurants")))
      v15 = v14 | 0x10;
    else
      v15 = v14;
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "firstUseDescriptionText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ "), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstUseLearnMoreText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v25, "initWithSupportedDomains:explanationText:learnMoreText:continueButtonTitle:", v15, v18, v19, v20);
    firstTimeExperienceViewController = v8->_firstTimeExperienceViewController;
    v8->_firstTimeExperienceViewController = (SearchUIFirstTimeExperienceViewController *)v21;

    v23 = v8;
  }

  return v8;
}

- (void)loadView
{
  UIScrollView *v3;
  UIScrollView *scrollView;

  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setKeyboardDismissMode:](self->_scrollView, "setKeyboardDismissMode:", 2);
  -[UniversalSearchFirstTimeExperienceViewController setView:](self, "setView:", self->_scrollView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  -[UniversalSearchFirstTimeExperienceViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[UniversalSearchFirstTimeExperienceViewController addChildViewController:](self, "addChildViewController:", self->_firstTimeExperienceViewController);
  -[SearchUIFirstTimeExperienceViewController didMoveToParentViewController:](self->_firstTimeExperienceViewController, "didMoveToParentViewController:", self);
  -[SearchUIFirstTimeExperienceViewController setDelegate:](self->_firstTimeExperienceViewController, "setDelegate:", self);
  -[SearchUIFirstTimeExperienceViewController view](self->_firstTimeExperienceViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);

  -[UniversalSearchFirstTimeExperienceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIFirstTimeExperienceViewController view](self->_firstTimeExperienceViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  -[UniversalSearchFirstTimeExperienceViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIScrollView flashScrollIndicators](self->_scrollView, "flashScrollIndicators");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UniversalSearchFirstTimeExperienceViewController;
  -[UniversalSearchFirstTimeExperienceViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  -[SearchUIFirstTimeExperienceViewController view](self->_firstTimeExperienceViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v5 = v4;
  -[UniversalSearchFirstTimeExperienceViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = fmax(v5, v10);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v8, v11);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v8, v11);

}

- (void)unifiedFieldDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didInteractWithUniversalSearchFirstTimeExperienceViewController:", self);

}

- (void)firstTimeExperienceContinueButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "firstTimeExperienceContinueButtonPressed");

}

- (UniversalSearchFirstTimeExperienceViewControllerDelegate)delegate
{
  return (UniversalSearchFirstTimeExperienceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_firstTimeExperienceViewController, 0);
}

@end
