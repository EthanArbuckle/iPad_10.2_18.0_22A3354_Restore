@implementation AMPOnboardingViewController

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMPOnboardingViewController;
  -[AMPOnboardingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AMPOnboardingViewController viewHasAppeared](self, "viewHasAppeared");
  -[AMPOnboardingViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMPOnboardingViewController;
  -[AMPOnboardingViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[AMPOnboardingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMPOnboardingViewController onboardingController](self, "onboardingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

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
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AMPOnboardingViewController;
  -[AMPOnboardingViewController viewDidLoad](&v11, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPOnboardingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AMPOnboardingViewController onboardingController](self, "onboardingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMPOnboardingViewController onboardingController](self, "onboardingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPOnboardingViewController addChildViewController:](self, "addChildViewController:", v6);

    -[AMPOnboardingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPOnboardingViewController onboardingController](self, "onboardingController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v9);

    -[AMPOnboardingViewController onboardingController](self, "onboardingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didMoveToParentViewController:", self);

  }
}

- (AMSUIOnboardingViewController)onboardingController
{
  return self->_onboardingController;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMPOnboardingViewController;
  -[AMPOnboardingViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[AMPOnboardingViewController updateOverrideTraits](self, "updateOverrideTraits");
  -[AMPOnboardingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)updateOverrideTraits
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AMPOnboardingViewController childViewControllers](self, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[AMPOnboardingViewController childTraitCollectionForViewController:](self, "childTraitCollectionForViewController:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMPOnboardingViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)childTraitCollectionForViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getOBPrivacyLinkControllerClass_softClass;
  v13 = getOBPrivacyLinkControllerClass_softClass;
  if (!getOBPrivacyLinkControllerClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getOBPrivacyLinkControllerClass_block_invoke;
    v9[3] = &unk_24F966CF8;
    v9[4] = &v10;
    __getOBPrivacyLinkControllerClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AMPOnboardingViewController cappedTraitCollection](self, "cappedTraitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AMPOnboardingViewController)initWithHeaderImage:(id)a3 titleText:(id)a4 descriptionText:(id)a5 primaryButtonText:(id)a6 privacyLinkController:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AMPOnboardingViewController *v17;
  AMPOnboardingViewController *v18;
  uint64_t v19;
  AMSUIOnboardingViewController *onboardingController;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AMPOnboardingViewController;
  v17 = -[AMPOnboardingViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_titleText, a4);
    objc_storeStrong((id *)&v18->_descriptionText, a5);
    objc_storeStrong((id *)&v18->_primaryButtonText, a6);
    objc_storeStrong((id *)&v18->_image, a3);
    v19 = objc_msgSend(objc_alloc((Class)getAMSUIOnboardingViewControllerClass()), "initWithHeaderImage:titleText:descriptionText:primaryButtonText:privacyLinkController:", v12, v13, v14, v15, v16);
    onboardingController = v18->_onboardingController;
    v18->_onboardingController = (AMSUIOnboardingViewController *)v19;

    objc_initWeak(&location, v18);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __117__AMPOnboardingViewController_initWithHeaderImage_titleText_descriptionText_primaryButtonText_privacyLinkController___block_invoke;
    v23[3] = &unk_24F966C90;
    objc_copyWeak(&v24, &location);
    -[AMSUIOnboardingViewController setPrimaryButtonCallback:](v18->_onboardingController, "setPrimaryButtonCallback:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __117__AMPOnboardingViewController_initWithHeaderImage_titleText_descriptionText_primaryButtonText_privacyLinkController___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "primaryButtonCallback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "primaryButtonCallback");
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v2)[2](v2, WeakRetained);

  }
}

- (AMPOnboardingViewController)initWithTitleText:(id)a3 features:(id)a4 primaryButtonText:(id)a5 privacyLinkController:(id)a6
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  AMSUIOnboardingViewController *onboardingController;
  id v26;
  id v27;
  id v28;
  id v29;
  AMPOnboardingViewController *val;
  id obj;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  id location[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v29 = a4;
  v27 = a5;
  v28 = a6;
  v38.receiver = self;
  v38.super_class = (Class)AMPOnboardingViewController;
  val = -[AMPOnboardingViewController initWithNibName:bundle:](&v38, sel_initWithNibName_bundle_, 0, 0);
  if (val)
  {
    objc_storeStrong((id *)&val->_titleText, a3);
    objc_storeStrong((id *)&val->_primaryButtonText, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v29;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v35;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
          v40 = 0;
          v41 = &v40;
          v42 = 0x2050000000;
          v16 = (void *)getAMSUIOnboardingFeatureClass_softClass;
          v43 = getAMSUIOnboardingFeatureClass_softClass;
          if (!getAMSUIOnboardingFeatureClass_softClass)
          {
            location[0] = (id)MEMORY[0x24BDAC760];
            location[1] = (id)3221225472;
            location[2] = __getAMSUIOnboardingFeatureClass_block_invoke;
            location[3] = &unk_24F966CF8;
            location[4] = &v40;
            __getAMSUIOnboardingFeatureClass_block_invoke((uint64_t)location);
            v16 = (void *)v41[3];
          }
          v17 = objc_retainAutorelease(v16);
          _Block_object_dispose(&v40, 8);
          v18 = [v17 alloc];
          objc_msgSend(v15, "image");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "titleText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "descriptionText");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v18, "initWithImage:titleText:descriptionText:", v19, v20, v21);

          objc_msgSend(v11, "addObject:", v22);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v12);
    }

    v23 = objc_msgSend(objc_alloc((Class)getAMSUIOnboardingViewControllerClass()), "initWithTitleText:features:primaryButtonText:privacyLinkController:", v26, v11, v27, v28);
    onboardingController = val->_onboardingController;
    val->_onboardingController = (AMSUIOnboardingViewController *)v23;

    objc_initWeak(location, val);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __98__AMPOnboardingViewController_initWithTitleText_features_primaryButtonText_privacyLinkController___block_invoke;
    v32[3] = &unk_24F966C90;
    objc_copyWeak(&v33, location);
    -[AMSUIOnboardingViewController setPrimaryButtonCallback:](val->_onboardingController, "setPrimaryButtonCallback:", v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(location);

  }
  return val;
}

void __98__AMPOnboardingViewController_initWithTitleText_features_primaryButtonText_privacyLinkController___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "primaryButtonCallback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "primaryButtonCallback");
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v2)[2](v2, WeakRetained);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AMPOnboardingViewController;
  -[AMPOnboardingViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  -[AMPOnboardingViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

  -[AMPOnboardingViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setModalInPresentation:", 1);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  -[AMPOnboardingViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (UITraitCollection)cappedTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (cappedTraitCollection_onceToken != -1)
    dispatch_once(&cappedTraitCollection_onceToken, &__block_literal_global);
  -[AMPOnboardingViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

    goto LABEL_7;
  }
  v5 = (void *)cappedTraitCollection_cappedSizes;
  -[AMPOnboardingViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v7);

  if (!(_DWORD)v5)
  {
LABEL_7:
    v12 = 0;
    return (UITraitCollection *)v12;
  }
  v8 = (void *)MEMORY[0x24BDF6F30];
  -[AMPOnboardingViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BDF7658]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollectionWithTraitsFromCollections:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v12;
}

void __52__AMPOnboardingViewController_cappedTraitCollection__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDF7648];
  v3[0] = *MEMORY[0x24BDF7650];
  v3[1] = v0;
  v3[2] = *MEMORY[0x24BDF7640];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cappedTraitCollection_cappedSizes;
  cappedTraitCollection_cappedSizes = v1;

}

- (void)didTapPrimaryButton:(id)a3
{
  void *v4;
  void (**v5)(id, AMPOnboardingViewController *);

  -[AMPOnboardingViewController primaryButtonCallback](self, "primaryButtonCallback", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMPOnboardingViewController primaryButtonCallback](self, "primaryButtonCallback");
    v5 = (void (**)(id, AMPOnboardingViewController *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
}

- (BOOL)isPresentedInFormSheet
{
  uint64_t v3;
  void *v4;
  AMPOnboardingViewController *v5;
  AMPOnboardingViewController *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[AMPOnboardingViewController navigationController](self, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (AMPOnboardingViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  -[AMPOnboardingViewController presentationController](v6, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_activePresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "presentationStyle") == 2;

  return v9;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (void)setPrimaryButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButtonText, a3);
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (id)primaryButtonCallback
{
  return self->_primaryButtonCallback;
}

- (void)setPrimaryButtonCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (void)setOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingController, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIVisualEffectView)statusBarVisualEffectView
{
  return self->_statusBarVisualEffectView;
}

- (void)setStatusBarVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarVisualEffectView, a3);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metricsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_statusBarVisualEffectView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong(&self->_primaryButtonCallback, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_primaryButtonText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
