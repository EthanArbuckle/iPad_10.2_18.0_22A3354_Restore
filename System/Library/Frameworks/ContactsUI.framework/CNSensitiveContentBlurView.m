@implementation CNSensitiveContentBlurView

- (CNSensitiveContentBlurView)initWithManager:(id)a3
{
  id v5;
  CNSensitiveContentBlurView *v6;
  CNSensitiveContentBlurView *v7;
  CNSensitiveContentBlurView *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNSensitiveContentBlurView;
  v6 = -[CNSensitiveContentBlurView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensitiveContentAnalysisManager, a3);
    -[CNSensitiveContentBlurView configureSubviews](v7, "configureSubviews");
    -[CNSensitiveContentBlurView configureConstraints](v7, "configureConstraints");
    v8 = v7;
  }

  return v7;
}

- (void)setCanRevealContent:(BOOL)a3
{
  if (self->_canRevealContent != a3)
  {
    self->_canRevealContent = a3;
    -[CNSensitiveContentBlurView configureButtons](self, "configureButtons");
    -[CNSensitiveContentBlurView configureConstraints](self, "configureConstraints");
    -[CNSensitiveContentBlurView configureButtonsConstraints](self, "configureButtonsConstraints");
  }
}

- (BOOL)canShowButtons
{
  void *v2;
  char v3;

  -[CNSensitiveContentBlurView sensitiveContentAnalysisManager](self, "sensitiveContentAnalysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEntitledForSensitiveContentUI");

  return v3;
}

- (void)configureSubviews
{
  void *v3;
  void *v4;

  -[CNSensitiveContentBlurView blurView](self, "blurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentBlurView addSubview:](self, "addSubview:", v3);

  -[CNSensitiveContentBlurView descriptionLabel](self, "descriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentBlurView addSubview:](self, "addSubview:", v4);

  -[CNSensitiveContentBlurView configureButtons](self, "configureButtons");
}

- (void)configureButtons
{
  void *v3;
  id v4;

  if (-[CNSensitiveContentBlurView canShowButtons](self, "canShowButtons")
    && (-[CNSensitiveContentBlurView revealButton](self, "revealButton"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[CNSensitiveContentBlurView revealButton](self, "revealButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNSensitiveContentBlurView addSubview:](self, "addSubview:");
  }
  else
  {
    -[CNSensitiveContentBlurView revealButton](self, "revealButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");
  }

}

- (void)configureConstraints
{
  void *v3;
  void *v4;
  double v5;
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
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  -[CNSensitiveContentBlurView blurView](self, "blurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView constrainViewToEdgesConstraints:](self, "constrainViewToEdgesConstraints:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0.0;
  if (-[CNSensitiveContentBlurView canShowButtons](self, "canShowButtons"))
  {
    if (-[CNSensitiveContentBlurView canRevealContent](self, "canRevealContent"))
      v5 = -50.0;
    else
      v5 = 0.0;
  }
  -[CNSensitiveContentBlurView descriptionLabel](self, "descriptionLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentBlurView centerYAnchor](self, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  -[CNSensitiveContentBlurView descriptionLabel](self, "descriptionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentBlurView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v6, 17.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  -[CNSensitiveContentBlurView descriptionLabel](self, "descriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentBlurView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -17.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
  -[CNSensitiveContentBlurView configureButtonsConstraints](self, "configureButtonsConstraints");

}

- (void)configureButtonsConstraints
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
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (-[CNSensitiveContentBlurView canShowButtons](self, "canShowButtons"))
  {
    -[CNSensitiveContentBlurView revealButton](self, "revealButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CNSensitiveContentBlurView revealButton](self, "revealButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSensitiveContentBlurView descriptionLabel](self, "descriptionLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 8.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      -[CNSensitiveContentBlurView revealButton](self, "revealButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSensitiveContentBlurView centerXAnchor](self, "centerXAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
    }
  }
}

- (UIVisualEffectView)blurView
{
  UIVisualEffectView *blurView;
  UIVisualEffectView *v3;
  void *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;

  blurView = self->_blurView;
  if (blurView)
  {
    v3 = blurView;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = self->_blurView;
    self->_blurView = v6;
    v8 = v6;

    v3 = self->_blurView;
  }
  return v3;
}

- (UILabel)descriptionLabel
{
  UILabel *descriptionLabel;
  UILabel *v3;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *v11;

  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    v3 = descriptionLabel;
  }
  else
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v7);

    -[UILabel setNumberOfLines:](v5, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v5, "setTextAlignment:", 1);
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SENSITIVE_CONTENT_DESCRIPTION"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5, "setText:", v9);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = self->_descriptionLabel;
    self->_descriptionLabel = v5;
    v11 = v5;

    v3 = self->_descriptionLabel;
  }
  return v3;
}

- (UIButton)revealButton
{
  BOOL v3;
  UIButton *revealButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  UIButton *v14;
  UIButton *v15;
  UIButton *v16;

  v3 = -[CNSensitiveContentBlurView canRevealContent](self, "canRevealContent");
  revealButton = self->_revealButton;
  if (!v3)
  {
    self->_revealButton = 0;

    revealButton = self->_revealButton;
    goto LABEL_5;
  }
  if (revealButton)
  {
LABEL_5:
    v16 = revealButton;
    return v16;
  }
  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisualEffect:", v8);

  objc_msgSend(v5, "setBackground:", v7);
  objc_msgSend(v5, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseForegroundColor:", v9);

  objc_msgSend(v5, "setButtonSize:", 2);
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SENSITIVE_CONTENT_BUTTON_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v11);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye.fill"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v12);

  objc_msgSend(v5, "setImagePlacement:", 2);
  objc_msgSend(v5, "setImagePadding:", 2.0);
  objc_msgSend(v5, "setContentInsets:", 6.0, 15.0, 6.0, 15.0);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v5, 0);
  v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", self, sel_revealContent, 64);
  v14 = self->_revealButton;
  self->_revealButton = v13;
  v15 = v13;

  v16 = self->_revealButton;
  return v16;
}

- (void)resetRevealState
{
  void *v3;

  -[CNSensitiveContentBlurView interventionViewController](self, "interventionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[CNSensitiveContentBlurView setInterventionViewController:](self, "setInterventionViewController:", 0);
}

- (void)revealContent
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNSensitiveContentBlurView sensitiveContentAnalysisManager](self, "sensitiveContentAnalysisManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiresDescriptiveInterventions");

  if (v4)
  {
    -[CNSensitiveContentBlurView interventionViewController](self, "interventionViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0D8C9F0], "viewControllerWithWorkflow:contextDictionary:", 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSensitiveContentBlurView setInterventionViewController:](self, "setInterventionViewController:", v6);

      -[CNSensitiveContentBlurView interventionViewController](self, "interventionViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInterventionDelegate:", self);

    }
    -[CNSensitiveContentBlurView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CNSensitiveContentBlurView interventionViewController](self, "interventionViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sensitiveContentBlurView:wantsToPresentInterventionController:", self, v8);

  }
  else
  {
    -[CNSensitiveContentBlurView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sensitiveContentBlurView:didSetContentHidden:", self, 0);
  }

}

- (void)didConfirmForInterventionViewController:(id)a3
{
  void *v4;

  -[CNSensitiveContentBlurView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensitiveContentBlurView:didSetContentHidden:", self, 0);

  -[CNSensitiveContentBlurView resetRevealState](self, "resetRevealState");
}

- (void)didRejectForInterventionViewController:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CNSensitiveContentBlurView interventionViewController](self, "interventionViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__CNSensitiveContentBlurView_didRejectForInterventionViewController___block_invoke;
  v5[3] = &unk_1E204F648;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (CNSensitiveContentBlurViewDelegate)delegate
{
  return (CNSensitiveContentBlurViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canRevealContent
{
  return self->_canRevealContent;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (void)setRevealButton:(id)a3
{
  objc_storeStrong((id *)&self->_revealButton, a3);
}

- (CNSensitiveContentAnalysisManager)sensitiveContentAnalysisManager
{
  return self->_sensitiveContentAnalysisManager;
}

- (void)setSensitiveContentAnalysisManager:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveContentAnalysisManager, a3);
}

- (SCUIInterventionViewController)interventionViewController
{
  return self->_interventionViewController;
}

- (void)setInterventionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_interventionViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interventionViewController, 0);
  objc_storeStrong((id *)&self->_sensitiveContentAnalysisManager, 0);
  objc_storeStrong((id *)&self->_revealButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __69__CNSensitiveContentBlurView_didRejectForInterventionViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetRevealState");
}

@end
