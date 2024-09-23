@implementation CKComposeSubscriptionSelectorButton

- (CKComposeSubscriptionSelectorButton)init
{
  CKComposeSubscriptionSelectorButton *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  UITapGestureRecognizer *gestureRecognizer;
  UILabel *v7;
  UILabel *buttonTitleLabel;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIStackView *stackView;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CKComposeSubscriptionSelectorButton;
  v2 = -[CKComposeSubscriptionSelectorButton init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeSubscriptionSelectorButton setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[CKComposeSubscriptionSelectorButton setContextMenuIsPrimary:](v2, "setContextMenuIsPrimary:", 1);
    -[CKComposeSubscriptionSelectorButton setContextMenuEnabled:](v2, "setContextMenuEnabled:", 1);
    -[CKComposeSubscriptionSelectorButton gestureRecognizer](v2, "gestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);

    -[CKComposeSubscriptionSelectorButton setTitle:](v2, "setTitle:", &stru_1E276D870);
    -[CKComposeSubscriptionSelectorButton setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v2, sel_handleTap_);
    gestureRecognizer = v2->_gestureRecognizer;
    v2->_gestureRecognizer = (UITapGestureRecognizer *)v5;

    -[CKComposeSubscriptionSelectorButton addGestureRecognizer:](v2, "addGestureRecognizer:", v2->_gestureRecognizer);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    buttonTitleLabel = v2->_buttonTitleLabel;
    v2->_buttonTitleLabel = v7;

    -[UILabel setUserInteractionEnabled:](v2->_buttonTitleLabel, "setUserInteractionEnabled:", 0);
    v9 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    -[CKComposeSubscriptionSelectorButton badgeView](v2, "badgeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = v2->_buttonTitleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithArrangedSubviews:", v11);
    stackView = v2->_stackView;
    v2->_stackView = (UIStackView *)v12;

    -[UIStackView setAlignment:](v2->_stackView, "setAlignment:", 3);
    -[UIStackView setAxis:](v2->_stackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v2->_stackView, "setDistribution:", 3);
    -[UIStackView setLayoutMargins:](v2->_stackView, "setLayoutMargins:", 4.0, 5.0, 4.0, 5.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v2->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setSpacing:](v2->_stackView, "setSpacing:", 6.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v2->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setUserInteractionEnabled:](v2->_stackView, "setUserInteractionEnabled:", 1);
    -[CKComposeSubscriptionSelectorButton addSubview:](v2, "addSubview:", v2->_stackView);
    -[CKComposeSubscriptionSelectorButton loadConstraintsForButton](v2, "loadConstraintsForButton");
  }
  return v2;
}

- (void)loadConstraintsForButton
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  -[CKComposeSubscriptionSelectorButton stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeSubscriptionSelectorButton topAnchor](self, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[CKComposeSubscriptionSelectorButton stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeSubscriptionSelectorButton bottomAnchor](self, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[CKComposeSubscriptionSelectorButton stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeSubscriptionSelectorButton leadingAnchor](self, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[CKComposeSubscriptionSelectorButton stackView](self, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeSubscriptionSelectorButton trailingAnchor](self, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[CKComposeSubscriptionSelectorButton stackView](self, "stackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeSubscriptionSelectorButton centerYAnchor](self, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[CKComposeSubscriptionSelectorButton badgeView](self, "badgeView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeSubscriptionSelectorButton stackView](self, "stackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[CKComposeSubscriptionSelectorButton buttonTitleLabel](self, "buttonTitleLabel");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeSubscriptionSelectorButton stackView](self, "stackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

}

- (TPBadgeView)badgeView
{
  TPBadgeView *badgeView;
  TPBadgeView *v4;
  TPBadgeView *v5;

  badgeView = self->_badgeView;
  if (!badgeView)
  {
    if (badgeView_onceToken != -1)
      dispatch_once(&badgeView_onceToken, &__block_literal_global_273);
    if (objc_msgSend((id)badgeView__CKTPBadgeView, "instancesRespondToSelector:", sel_initWithTitle_))
    {
      v4 = (TPBadgeView *)objc_msgSend(objc_alloc((Class)badgeView__CKTPBadgeView), "initWithTitle:", &stru_1E276D870);
      v5 = self->_badgeView;
      self->_badgeView = v4;

    }
    -[TPBadgeView setSizeCategory:](self->_badgeView, "setSizeCategory:", 2);
    -[TPBadgeView setAutoresizesSubviews:](self->_badgeView, "setAutoresizesSubviews:", 1);
    -[TPBadgeView setAlpha:](self->_badgeView, "setAlpha:", 1.0);
    -[TPBadgeView setTheme:](self->_badgeView, "setTheme:", 0);
    badgeView = self->_badgeView;
  }
  return badgeView;
}

uint64_t __48__CKComposeSubscriptionSelectorButton_badgeView__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("TPBadgeView"), CFSTR("TelephonyUI"));
  badgeView__CKTPBadgeView = result;
  return result;
}

- (void)updateContentsWithTitle:(id)a3 badgeText:(id)a4 theme:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[CKComposeSubscriptionSelectorButton buttonTitleLabel](self, "buttonTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[CKComposeSubscriptionSelectorButton badgeView](self, "badgeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v8);

  -[CKComposeSubscriptionSelectorButton badgeView](self, "badgeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTheme:", 0);

  -[CKComposeSubscriptionSelectorButton setTheme:](self, "setTheme:", a5);
}

- (void)setDelegate:(id)a3
{
  CKComposeSubscriptionSelectorButtonDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)handleTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[CKComposeSubscriptionSelectorButton delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CKComposeSubscriptionSelectorButton delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "CKComposeSubscriptionSelectorButtonWasTapped:", self);

    }
  }
}

- (void)updateTheme
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[CKComposeSubscriptionSelectorButton theme](self, "theme");
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "_tp_greenPillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeSubscriptionSelectorButton buttonTitleLabel](self, "buttonTitleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "_tp_greenPillColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 1)
      return;
    objc_msgSend(MEMORY[0x1E0CEA478], "_tp_bluePillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeSubscriptionSelectorButton buttonTitleLabel](self, "buttonTitleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "_tp_bluePillColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v6;
  -[CKComposeSubscriptionSelectorButton badgeView](self, "badgeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

}

- (void)updateTitleFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKComposeSubscriptionSelectorButton buttonTitleLabel](self, "buttonTitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setTheme:(unint64_t)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    -[CKComposeSubscriptionSelectorButton updateTheme](self, "updateTheme");
  }
}

- (CKComposeSubscriptionSelectorButtonDelegate)delegate
{
  return (CKComposeSubscriptionSelectorButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)theme
{
  return self->_theme;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)buttonTitleLabel
{
  return self->_buttonTitleLabel;
}

- (void)setButtonTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitleLabel, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UITapGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_buttonTitleLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
