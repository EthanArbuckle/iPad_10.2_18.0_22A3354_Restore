@implementation CNPosterOnboardingPrivacyViewController

- (CNPosterOnboardingPrivacyViewController)init
{
  CNPosterOnboardingPrivacyViewController *v2;
  uint64_t v3;
  CNIDSDeviceListService *service;
  CNPosterOnboardingPrivacyViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPosterOnboardingPrivacyViewController;
  v2 = -[CNPosterOnboardingPrivacyViewController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    service = v2->_service;
    v2->_service = (CNIDSDeviceListService *)v3;

    v5 = v2;
  }

  return v2;
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
  void *v27;
  _TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper *v28;
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)CNPosterOnboardingPrivacyViewController;
  -[CNPosterOnboardingPrivacyViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[CNPosterOnboardingPrivacyViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBackgroundHidden:", 1);

  v28 = -[CNPosterOnboardingPrivacyViewWrapper initWithDelegate:]([_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper alloc], "initWithDelegate:", self);
  -[CNPosterOnboardingPrivacyViewWrapper hostingController](v28, "hostingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPosterOnboardingPrivacyViewWrapper model](v28, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingPrivacyViewController setModel:](self, "setModel:", v6);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPosterOnboardingPrivacyViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  v20 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingPrivacyViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  objc_msgSend(v5, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingPrivacyViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(v5, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingPrivacyViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v10;
  objc_msgSend(v5, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterOnboardingPrivacyViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v15);

  -[CNPosterOnboardingPrivacyViewController model](self, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNIDSDeviceListService fetch](self->_service, "fetch");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithItems:", v17);

}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNPosterOnboardingPrivacyViewController;
  -[CNPosterOnboardingPrivacyViewController viewIsAppearing:](&v3, sel_viewIsAppearing_, a3);
}

- (void)onboardingPrivacyViewDidTapContinue
{
  void *v3;
  NSObject *v4;
  void (**v5)(id, CNPosterOnboardingPrivacyViewController *);
  uint8_t buf[16];

  -[CNPosterOnboardingPrivacyViewController onContinue](self, "onContinue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPosterOnboardingPrivacyViewController onContinue](self, "onContinue");
    v5 = (void (**)(id, CNPosterOnboardingPrivacyViewController *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
  else
  {
    CNUILogPosters();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding privacy view delegate is unexpectedly nil", buf, 2u);
    }

    -[CNPosterOnboardingPrivacyViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)onboardingPrivacyViewDidTapCancel
{
  void *v3;
  NSObject *v4;
  void (**v5)(id, CNPosterOnboardingPrivacyViewController *);
  uint8_t buf[16];

  -[CNPosterOnboardingPrivacyViewController onCancel](self, "onCancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPosterOnboardingPrivacyViewController onCancel](self, "onCancel");
    v5 = (void (**)(id, CNPosterOnboardingPrivacyViewController *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
  else
  {
    CNUILogPosters();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding privacy view delegate is unexpectedly nil", buf, 2u);
    }

    -[CNPosterOnboardingPrivacyViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (id)onCancel
{
  return self->_onCancel;
}

- (void)setOnCancel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (id)onContinue
{
  return self->_onContinue;
}

- (void)setOnContinue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (CNIDSDeviceListService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_onContinue, 0);
  objc_storeStrong(&self->_onCancel, 0);
}

@end
