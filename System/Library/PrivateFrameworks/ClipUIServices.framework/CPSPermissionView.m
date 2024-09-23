@implementation CPSPermissionView

- (CPSPermissionView)initWithFrame:(CGRect)a3
{
  CPSPermissionView *v3;
  CPSButton *v4;
  CPSButton *permissionButton;
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
  CPSPermissionView *v19;
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
  objc_super v34;
  _QWORD v35[7];

  v35[5] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)CPSPermissionView;
  v3 = -[CPSPermissionView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CPSButton);
    permissionButton = v3->_permissionButton;
    v3->_permissionButton = v4;

    -[CPSButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_permissionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSButton setBackgroundColor:](v3->_permissionButton, "setBackgroundColor:", v6);

    -[CPSButton setAnimatesAlphaWhenHighlighted:](v3->_permissionButton, "setAnimatesAlphaWhenHighlighted:", 1);
    -[CPSButton setContentHorizontalAlignment:](v3->_permissionButton, "setContentHorizontalAlignment:", 1);
    -[CPSButton setContentEdgeInsets:](v3->_permissionButton, "setContentEdgeInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

    -[CPSButton addTarget:action:forControlEvents:](v3->_permissionButton, "addTarget:action:forControlEvents:", v3, sel_permissionButtonTapped_, 64);
    -[CPSPermissionView addSubview:](v3, "addSubview:", v3->_permissionButton);
    v25 = (void *)MEMORY[0x1E0CB3718];
    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSPermissionView leadingAnchor](v3, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSPermissionView topAnchor](v3, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v26;
    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSPermissionView bottomAnchor](v3, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v21;
    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSPermissionView trailingAnchor](v3, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v13;
    -[CPSButton trailingAnchor](v3->_permissionButton, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSButton titleLabel](v3->_permissionButton, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v18);

    v19 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CPSPermissionView;
  -[CPSPermissionView layoutSubviews](&v26, sel_layoutSubviews);
  if (!self->_permissionTextNeedsUpdate)
    return;
  self->_permissionTextNeedsUpdate = 0;
  if (self->_requestsNotificationPermission != self->_requestsLocationConfirmationPermission)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    v10 = (void *)MEMORY[0x1E0CB3940];
    _CPSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, self->_appName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v9, "initWithString:", v12);

    v8 = objc_alloc(MEMORY[0x1E0CB3778]);
    goto LABEL_7;
  }
  if (self->_requestsNotificationPermission)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3778]);
    v4 = (void *)MEMORY[0x1E0CB3940];
    _CPSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, self->_appName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

    v8 = objc_alloc(MEMORY[0x1E0CB3778]);
LABEL_7:
    _CPSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithString:", v14);

    goto LABEL_8;
  }
  v13 = 0;
  v7 = 0;
LABEL_8:
  objc_msgSend(v13, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSButton setExtraTapTargetSubstring:](self->_permissionButton, "setExtraTapTargetSubstring:", v15);

  v16 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v7, "length"));

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v7, "appendAttributedString:", v18);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v16, v19, 0, objc_msgSend(v13, "length"));

  if (UIAccessibilityButtonShapesEnabled())
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0CEA180], &unk_1E8E91A58, 0, objc_msgSend(v13, "length"));
  objc_msgSend(v7, "appendAttributedString:", v13);
  v20 = *MEMORY[0x1E0CEA098];
  v21 = (void *)MEMORY[0x1E0CEA5E8];
  v22 = *MEMORY[0x1E0CEB550];
  -[CPSPermissionView traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_preferredFontForTextStyle:design:variant:compatibleWithTraitCollection:", v22, 0, 256, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v20, v24, 0, objc_msgSend(v7, "length"));

  v25 = objc_alloc_init(MEMORY[0x1E0CEA230]);
  objc_msgSend(v25, "setLineBreakMode:", 0);
  objc_msgSend(v25, "setLineSpacing:", 2.0);
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0CEA0D0], v25, 0, objc_msgSend(v7, "length"));
  -[CPSButton setAttributedTitle:forState:](self->_permissionButton, "setAttributedTitle:forState:", v7, 0);

}

- (void)configureWithAppName:(id)a3 requestsNotificationPermission:(BOOL)a4 requestsLocationConfirmationPermission:(BOOL)a5
{
  NSString *v8;
  NSString *appName;

  v8 = (NSString *)a3;
  -[CPSPermissionView layoutIfNeeded](self, "layoutIfNeeded");
  appName = self->_appName;
  self->_appName = v8;

  self->_requestsNotificationPermission = a4;
  self->_requestsLocationConfirmationPermission = a5;
  -[CPSPermissionView transitionViewAnimated:](self, "transitionViewAnimated:", 0);
}

- (void)permissionButtonTapped:(id)a3
{
  void *v4;
  void (**v5)(void);
  id v6;

  v6 = a3;
  if (self->_requestsNotificationPermission)
  {
    if (self->_requestsLocationConfirmationPermission)
    {
      -[CPSPermissionView optionsAction](self, "optionsAction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[CPSPermissionView optionsAction](self, "optionsAction");
        v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v5[2]();

      }
    }
    else
    {
      -[CPSPermissionView toggleNotificationPermission](self, "toggleNotificationPermission");
    }
  }
  else if (self->_requestsLocationConfirmationPermission)
  {
    -[CPSPermissionView toggleLocationConfirmationPermission](self, "toggleLocationConfirmationPermission");
  }

}

- (void)setNotificationPermissionEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_notificationPermissionEnabled != a3)
  {
    v4 = a4;
    -[CPSPermissionView layoutIfNeeded](self, "layoutIfNeeded");
    self->_notificationPermissionEnabled = a3;
    -[CPSPermissionView transitionViewAnimated:](self, "transitionViewAnimated:", v4);
  }
}

- (void)setNotificationPermissionEnabled:(BOOL)a3
{
  -[CPSPermissionView setNotificationPermissionEnabled:animated:](self, "setNotificationPermissionEnabled:animated:", a3, 0);
}

- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_locationConfirmationPermissionEnabled != a3)
  {
    v4 = a4;
    -[CPSPermissionView layoutIfNeeded](self, "layoutIfNeeded");
    self->_locationConfirmationPermissionEnabled = a3;
    -[CPSPermissionView transitionViewAnimated:](self, "transitionViewAnimated:", v4);
  }
}

- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3
{
  -[CPSPermissionView setLocationConfirmationPermissionEnabled:animated:](self, "setLocationConfirmationPermissionEnabled:animated:", a3, 0);
}

- (void)transitionViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  self->_permissionTextNeedsUpdate = 1;
  -[CPSPermissionView setNeedsLayout](self, "setNeedsLayout");
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__CPSPermissionView_transitionViewAnimated___block_invoke;
    v5[3] = &unk_1E8E8AE88;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", self, 5242880, v5, 0, 0.35);
  }
  else
  {
    -[CPSPermissionView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

uint64_t __44__CPSPermissionView_transitionViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)toggleNotificationPermission
{
  -[CPSPermissionView setNotificationPermissionEnabled:animated:](self, "setNotificationPermissionEnabled:animated:", -[CPSPermissionView notificationPermissionEnabled](self, "notificationPermissionEnabled") ^ 1, 0);
}

- (void)toggleLocationConfirmationPermission
{
  -[CPSPermissionView setLocationConfirmationPermissionEnabled:animated:](self, "setLocationConfirmationPermissionEnabled:animated:", -[CPSPermissionView locationConfirmationPermissionEnabled](self, "locationConfirmationPermissionEnabled") ^ 1, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  self->_permissionTextNeedsUpdate = 1;
  -[CPSPermissionView setNeedsLayout](self, "setNeedsLayout", a3);
  -[CPSPermissionView layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  CPSButton *permissionButton;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPSPermissionView;
  if (-[CPSPermissionView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    permissionButton = self->_permissionButton;
    -[CPSPermissionView convertPoint:toView:](self, "convertPoint:toView:", permissionButton, x, y);
    v8 = -[CPSButton pointInside:withEvent:](permissionButton, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (id)optionsAction
{
  return self->_optionsAction;
}

- (void)setOptionsAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (BOOL)notificationPermissionEnabled
{
  return self->_notificationPermissionEnabled;
}

- (BOOL)locationConfirmationPermissionEnabled
{
  return self->_locationConfirmationPermissionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_optionsAction, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_permissionButton, 0);
}

@end
