@implementation CNPosterOnboardingWelcomeViewController

- (CNPosterOnboardingWelcomeViewController)initWithContact:(id)a3
{
  id v5;
  CNPosterOnboardingWelcomeViewController *v6;
  CNPosterOnboardingWelcomeViewController *v7;
  CNPosterOnboardingWelcomeViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPosterOnboardingWelcomeViewController;
  v6 = -[CNPosterOnboardingWelcomeViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPosterOnboardingWelcomeViewController;
  -[CNPosterOnboardingWelcomeViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CNPosterOnboardingWelcomeViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBackgroundHidden:", 1);

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  _TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *v8;
  void *v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  _TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *v15;
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
  objc_super v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)CNPosterOnboardingWelcomeViewController;
  -[CNPosterOnboardingWelcomeViewController viewIsAppearing:](&v37, sel_viewIsAppearing_, a3);
  -[CNPosterOnboardingWelcomeViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  v8 = [_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper alloc];
  -[CNPosterOnboardingWelcomeViewController contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNPosterOnboardingWelcomeViewController hasOptionToSkip](self, "hasOptionToSkip");
  v11 = -[CNPosterOnboardingWelcomeViewController hasExistingNickname](self, "hasExistingNickname");
  -[CNPosterOnboardingWelcomeViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CNPosterOnboardingWelcomeViewWrapper initWithContact:hasOptionToSkip:hasExistingNickname:navigationBarHeight:delegate:windowScene:](v8, "initWithContact:hasOptionToSkip:hasExistingNickname:navigationBarHeight:delegate:windowScene:", v9, v10, v11, self, v14, v7);
  -[CNPosterOnboardingWelcomeViewWrapper hostingController](v15, "hostingController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPosterOnboardingWelcomeViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v17);

  v29 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v17, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingWelcomeViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v33;
  objc_msgSend(v17, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingWelcomeViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v28;
  objc_msgSend(v17, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingWelcomeViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v22;
  objc_msgSend(v17, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingWelcomeViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v27);

}

- (void)onboardingWelcomeViewDidTapContinue
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  -[CNPosterOnboardingWelcomeViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPosterOnboardingWelcomeViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "posterOnboardingViewControllerDidTapContinue:", self);

  }
  else
  {
    CNUILogPosters();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding view delegate is unexpectedly nil", buf, 2u);
    }

    -[CNPosterOnboardingWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)onboardingWelcomeViewDidTapCancel
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  -[CNPosterOnboardingWelcomeViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPosterOnboardingWelcomeViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "posterOnboardingViewControllerDidDidTapCancel:", self);

  }
  else
  {
    CNUILogPosters();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding view delegate is unexpectedly nil", buf, 2u);
    }

    -[CNPosterOnboardingWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (BOOL)hasOptionToSkip
{
  return self->_hasOptionToSkip;
}

- (void)setHasOptionToSkip:(BOOL)a3
{
  self->_hasOptionToSkip = a3;
}

- (BOOL)hasExistingNickname
{
  return self->_hasExistingNickname;
}

- (void)setHasExistingNickname:(BOOL)a3
{
  self->_hasExistingNickname = a3;
}

- (CNPosterOnboardingWelcomeViewControllerDelegate)delegate
{
  return (CNPosterOnboardingWelcomeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
