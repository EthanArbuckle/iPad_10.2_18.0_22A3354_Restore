@implementation BKUIHostedJindoPresentable

- (BKUIHostedJindoPresentable)initWithCustomLayout:(int64_t)a3 enrollView:(id)a4 destination:(int64_t)a5
{
  id v9;
  BKUIHostedJindoPresentable *v10;
  BKUIHostedJindoPresentable *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BKUIHostedJindoPresentable;
  v10 = -[BKUIHostedJindoPresentable initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    v10->_destination = a5;
    objc_storeStrong((id *)&v10->_enrollView, a4);
    v11->_preferredLayoutMode = 4;
    v11->_preferredCustomLayout = a3;
  }

  return v11;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (BKUIPearlEnrollView)enrollView
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return self->_enrollView;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__BKUIHostedJindoPresentable_viewWillLayoutSubviewsWithTransitionCoordinator___block_invoke;
  v3[3] = &unk_1EA2802E8;
  v3[4] = self;
  objc_msgSend(a3, "animateAlongsideTransition:completion:", v3, 0);
}

void __78__BKUIHostedJindoPresentable_viewWillLayoutSubviewsWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "enrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "enrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
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
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)BKUIHostedJindoPresentable;
  -[BKUIHostedJindoPresentable viewWillAppear:](&v21, sel_viewWillAppear_, a3);
  -[BKUIHostedJindoPresentable view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIHostedJindoPresentable enrollView](self, "enrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[BKUIHostedJindoPresentable enrollView](self, "enrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIHostedJindoPresentable view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIHostedJindoPresentable setCenterYAnchor:](self, "setCenterYAnchor:", v6);
  v7 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIHostedJindoPresentable enrollView](self, "enrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIHostedJindoPresentable view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  -[BKUIHostedJindoPresentable centerYAnchor](self, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateConstraints:", v14);

  -[BKUIHostedJindoPresentable enrollView](self, "enrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIHostedJindoPresentable view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setupAnimationViewWithSuperView:", v16);

}

- (void)revoke
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D01070];
  v4 = -[BKUIHostedJindoPresentable destination](self, "destination");
  -[BKUIHostedJindoPresentable requesterIdentifier](self, "requesterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerSourceForDestination:forRequesterIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKUIHostedJindoPresentable requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = (id)objc_msgSend(v6, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v7, CFSTR("revoke"), 1, 0, &v11);
  v9 = v11;

  if (v9)
  {
    _BKUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "Error revoking post  %{public}@", buf, 0xCu);
    }

  }
}

- (void)collapse
{
  id v3;

  -[BKUIHostedJindoPresentable setPreferredCustomLayout:](self, "setPreferredCustomLayout:", 1);
  -[BKUIHostedJindoPresentable systemApertureElementContext](self, "systemApertureElementContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setElementNeedsUpdate");

}

- (id)userInfoForPosting
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DACA38];
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "_bundleID");
}

- (NSString)requestIdentifier
{
  NSString *requestIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  requestIdentifier = self->_requestIdentifier;
  if (!requestIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_requestIdentifier;
    self->_requestIdentifier = v5;

    requestIdentifier = self->_requestIdentifier;
  }
  return requestIdentifier;
}

+ (id)_bundleID
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BKUIHostedJindoPresentable__bundleID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundleID_onceToken != -1)
    dispatch_once(&_bundleID_onceToken, block);
  return (id)_bundleID___bundleID;
}

void __39__BKUIHostedJindoPresentable__bundleID__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_bundleID___bundleID;
  _bundleID___bundleID = v1;

}

- (unint64_t)presentationBehaviors
{
  return 2;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  id v4;

  if (self->_activeLayoutMode != a3)
  {
    self->_activeLayoutMode = a3;
    -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeActiveLayoutMode:", self);

  }
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return 0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return 0;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return 0;
}

- (void)setCanRequestAlertingAssertion:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  BKUIHostedJindoPresentable *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_canRequestAlertingAssertion = a3;
  if (a3)
  {
    -[BKUIHostedJindoPresentable systemApertureElementContext](self, "systemApertureElementContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestAlertingAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutomaticallyInvalidatable:", 0);

    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = self;
      v7 = "Jindo: Acquired alert assertion %p";
LABEL_6:
      _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = self;
      v7 = "Jindo: Could not get alert assertion, host set setCanRequestAlertingAssertion NO %p";
      goto LABEL_6;
    }
  }

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  BKUIHostedJindoPresentable *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Jindo: Banner will appear %p", (uint8_t *)&v9, 0xCu);
  }

  -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentableWillAppearAsBanner:", v4);

  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  BKUIHostedJindoPresentable *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Jindo: Banner did appear %p", (uint8_t *)&v9, 0xCu);
  }

  -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentableDidAppearAsBanner:", v4);

  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentableWillDisappearAsBanner:withReason:", v10, v6);

  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentableDidDisappearAsBanner:withReason:", v10, v6);

  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[BKUIHostedJindoPresentable observingDelegate](self, "observingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentableWillNotAppearAsBanner:withReason:", v10, v6);

  }
}

- (int64_t)destination
{
  return self->_destination;
}

- (BNBannerSourceLayoutDescription)layoutDescription
{
  return self->_layoutDescription;
}

- (void)setLayoutDescription:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDescription, a3);
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)objc_loadWeakRetained((id *)&self->_presentableContext);
}

- (void)setPresentableContext:(id)a3
{
  objc_storeWeak((id *)&self->_presentableContext, a3);
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (BOOL)canRequestAlertingAssertion
{
  return self->_canRequestAlertingAssertion;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  self->_preferredLayoutMode = a3;
}

- (int64_t)preferredCustomLayout
{
  return self->_preferredCustomLayout;
}

- (void)setPreferredCustomLayout:(int64_t)a3
{
  self->_preferredCustomLayout = a3;
}

- (void)setEnrollView:(id)a3
{
  objc_storeStrong((id *)&self->_enrollView, a3);
}

- (BKJindoPresentableObserving)observingDelegate
{
  return (BKJindoPresentableObserving *)objc_loadWeakRetained((id *)&self->_observingDelegate);
}

- (void)setObservingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_observingDelegate, a3);
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (NSLayoutConstraint)centerYAnchor
{
  return self->_centerYAnchor;
}

- (void)setCenterYAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_centerYAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerYAnchor, 0);
  objc_destroyWeak((id *)&self->_observingDelegate);
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_presentableContext);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_storeStrong((id *)&self->_layoutDescription, 0);
}

@end
