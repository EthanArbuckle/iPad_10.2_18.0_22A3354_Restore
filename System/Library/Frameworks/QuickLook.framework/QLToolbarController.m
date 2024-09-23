@implementation QLToolbarController

- (QLToolbarController)init
{
  QLToolbarController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLToolbarController;
  result = -[QLToolbarController init](&v3, sel_init);
  if (result)
  {
    result->_preferredAccesoryViewHeight = 44.0;
    result->_accessoryViewHidden = 1;
  }
  return result;
}

- (BOOL)_tryToSetUp:(BOOL)a3
{
  BOOL v4;
  id WeakRetained;
  void *v6;
  id v7;
  double v8;
  double v9;
  UIToolbar *customToolbar;
  UIToolbar *v11;
  UIToolbar *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  UIToolbar *v19;
  id v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *toolbarBottomConstraint;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *toolbarHeightConstraint;
  UIView *v31;
  UIView *clippingExtensionContainer;
  UIToolbar *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *clippingExtensionContainerBottomConstraint;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *clippingExtensionContainerHeightConstraint;
  UIView *v43;
  UIView *accessoryViewContainer;
  void *v45;
  UIView *v46;
  void *v47;
  void *v48;
  void *v49;
  UIView *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  NSLayoutConstraint *v55;
  NSLayoutConstraint *accessoryContainerHeightConstraint;
  id v57;
  id v58;
  _UIToolbarConfiguration *v59;
  _UIToolbarConfiguration *originalToolbarConfiguration;
  _UIToolbarConfiguration *v61;
  _UIToolbarConfiguration *customToolbarConfiguration;
  id v63;

  if (self->_customToolbar)
    v4 = !a3;
  else
    v4 = 0;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);

    if (!WeakRetained)
      return 0;
    -[QLToolbarController preferredSuperview](self, "preferredSuperview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_originalToolbar);
      objc_msgSend(v7, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        return 0;
    }
    -[QLToolbarController _originalToolbarHeightIncludingSafeAreaBottomInset:](self, "_originalToolbarHeightIncludingSafeAreaBottomInset:", 1);
    v9 = v8;
    customToolbar = self->_customToolbar;
    if (!customToolbar)
    {
      v11 = (UIToolbar *)objc_opt_new();
      v12 = self->_customToolbar;
      self->_customToolbar = v11;

      -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](self->_customToolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIToolbar setAccessibilityIdentifier:](self->_customToolbar, "setAccessibilityIdentifier:", CFSTR("QLCustomToolBarAccessibilityIdentifier"));
      customToolbar = self->_customToolbar;
    }
    -[UIToolbar constraints](customToolbar, "constraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIToolbar removeConstraints:](customToolbar, "removeConstraints:", v13);

    -[QLToolbarController preferredSuperview](self, "preferredSuperview");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_12;
    v15 = (void *)v14;
    -[QLToolbarController preferredSuperview](self, "preferredSuperview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    v18 = objc_msgSend(v16, "containsView:", v17);

    if (!v18)
    {
      objc_msgSend(v6, "addSubview:", self->_customToolbar);
    }
    else
    {
LABEL_12:
      v19 = self->_customToolbar;
      v20 = objc_loadWeakRetained((id *)&self->_originalToolbar);
      objc_msgSend(v6, "insertSubview:belowSubview:", v19, v20);

    }
    v22 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_customToolbar"), self->_customToolbar, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_customToolbar]|"), 0, 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraints:", v24);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_customToolbar, 4, 0, v6, 4, 1.0, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ql_activatedConstraint");
    v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    toolbarBottomConstraint = self->_toolbarBottomConstraint;
    self->_toolbarBottomConstraint = v26;

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_customToolbar, 8, 0, 0, 0, 1.0, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ql_activatedConstraint");
    v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    toolbarHeightConstraint = self->_toolbarHeightConstraint;
    self->_toolbarHeightConstraint = v29;

    v31 = (UIView *)objc_opt_new();
    clippingExtensionContainer = self->_clippingExtensionContainer;
    self->_clippingExtensionContainer = v31;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_clippingExtensionContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIToolbar addSubview:](self->_customToolbar, "addSubview:", self->_clippingExtensionContainer);
    -[UIView setClipsToBounds:](self->_clippingExtensionContainer, "setClipsToBounds:", 1);
    v33 = self->_customToolbar;
    v34 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_clippingExtensionContainer"), self->_clippingExtensionContainer, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_clippingExtensionContainer]|"), 0, 0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIToolbar addConstraints:](v33, "addConstraints:", v36);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_clippingExtensionContainer, 4, 0, self->_customToolbar, 4, 1.0, -v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "ql_activatedConstraint");
    v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    clippingExtensionContainerBottomConstraint = self->_clippingExtensionContainerBottomConstraint;
    self->_clippingExtensionContainerBottomConstraint = v38;

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_clippingExtensionContainer, 8, 0, 0, 0, 0.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "ql_activatedConstraint");
    v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    clippingExtensionContainerHeightConstraint = self->_clippingExtensionContainerHeightConstraint;
    self->_clippingExtensionContainerHeightConstraint = v41;

    v43 = (UIView *)objc_opt_new();
    accessoryViewContainer = self->_accessoryViewContainer;
    self->_accessoryViewContainer = v43;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_clippingExtensionContainer, "addSubview:", self->_accessoryViewContainer);
    v45 = (void *)MEMORY[0x24BDD1628];
    v46 = self->_clippingExtensionContainer;
    _NSDictionaryOfVariableBindings(CFSTR("_accessoryViewContainer"), self->_accessoryViewContainer, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_accessoryViewContainer]|"), 0, 0, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v46, "addConstraints:", v48);

    v49 = (void *)MEMORY[0x24BDD1628];
    v50 = self->_clippingExtensionContainer;
    _NSDictionaryOfVariableBindings(CFSTR("_accessoryViewContainer"), self->_accessoryViewContainer, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_accessoryViewContainer]|"), 0, 0, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v50, "addConstraints:", v52);

    -[QLToolbarController _toolbarExtensionHeight](self, "_toolbarExtensionHeight");
    self->_derivedToolbarExtensionHeight = v53;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_accessoryViewContainer, 8, 0, 0, 0, 1.0, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "ql_activatedConstraint");
    v55 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    accessoryContainerHeightConstraint = self->_accessoryContainerHeightConstraint;
    self->_accessoryContainerHeightConstraint = v55;

    -[UIToolbar layoutIfNeeded](self->_customToolbar, "layoutIfNeeded");
    v57 = objc_loadWeakRetained((id *)&self->_accessoryView);

    if (v57)
    {
      -[QLToolbarController _embedAccessoryView](self, "_embedAccessoryView");
      -[UIToolbar bringSubviewToFront:](self->_customToolbar, "bringSubviewToFront:", self->_clippingExtensionContainer);
    }
    -[QLToolbarController updateLayout](self, "updateLayout");

  }
  if (!self->_originalToolbarConfiguration)
  {
    v58 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    objc_msgSend(v58, "configuration");
    v59 = (_UIToolbarConfiguration *)objc_claimAutoreleasedReturnValue();
    originalToolbarConfiguration = self->_originalToolbarConfiguration;
    self->_originalToolbarConfiguration = v59;

    v61 = (_UIToolbarConfiguration *)-[_UIToolbarConfiguration copy](self->_originalToolbarConfiguration, "copy");
    customToolbarConfiguration = self->_customToolbarConfiguration;
    self->_customToolbarConfiguration = v61;

    -[_UIToolbarConfiguration setBarTintColor:](self->_customToolbarConfiguration, "setBarTintColor:", self->_barTintColor);
    -[UIToolbar configureWithConfiguration:](self->_customToolbar, "configureWithConfiguration:", self->_customToolbarConfiguration);
    v63 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    objc_msgSend(v63, "configureTransparent");

  }
  return 1;
}

- (double)_toolbarSafeAreaInsetBottom
{
  UIView **p_preferredParentViewForSafeAreaInset;
  id WeakRetained;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  p_preferredParentViewForSafeAreaInset = &self->_preferredParentViewForSafeAreaInset;
  WeakRetained = objc_loadWeakRetained((id *)&self->_preferredParentViewForSafeAreaInset);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_preferredParentViewForSafeAreaInset);
    objc_msgSend(v5, "safeAreaInsets");
    v7 = v6;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)&self->_originalToolbar);
    objc_msgSend(v5, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v7 = v9;

  }
  return v7;
}

- (double)_computeClippingExtensionContainerBottomConstraint
{
  _BOOL4 v3;
  BOOL v4;
  double result;
  double v6;

  v3 = -[QLToolbarController isOriginalToolbarHidden](self, "isOriginalToolbarHidden");
  v4 = -[QLToolbarController isAccessoryViewHidden](self, "isAccessoryViewHidden");
  result = 0.0;
  if (v3)
  {
    if (v4)
      return result;
    -[QLToolbarController _toolbarSafeAreaInsetBottom](self, "_toolbarSafeAreaInsetBottom", 0.0);
  }
  else
  {
    if (v4)
      return result;
    -[QLToolbarController _originalToolbarHeightIncludingSafeAreaBottomInset:](self, "_originalToolbarHeightIncludingSafeAreaBottomInset:", 1, 0.0);
  }
  return -v6;
}

- (double)_computeClippingExtensionContainerHeightForCurrentHiddenProgress
{
  double v3;
  double v4;

  -[QLToolbarController accessoryViewHiddenProgress](self, "accessoryViewHiddenProgress");
  v4 = (1.0 - v3) * self->_derivedToolbarExtensionHeight;
  if (self->_accessoryViewHiddenProgress > 0.0)
    v4 = v4 + -1.0;
  return fmax(v4, 0.0);
}

- (double)_originalToolbarHeightIncludingSafeAreaBottomInset:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  double Height;
  double v7;
  CGRect v9;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);
  objc_msgSend(WeakRetained, "frame");
  Height = CGRectGetHeight(v9);

  if (v3)
  {
    -[QLToolbarController _toolbarSafeAreaInsetBottom](self, "_toolbarSafeAreaInsetBottom");
    return Height + v7;
  }
  return Height;
}

- (void)_layoutAccessoryView:(id)a3
{
  double v4;
  UIView *accessoryViewContainer;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  id firstValue;

  firstValue = a3;
  -[QLToolbarController _toolbarExtensionHeight](self, "_toolbarExtensionHeight");
  self->_derivedToolbarExtensionHeight = v4;
  if (firstValue)
  {
    accessoryViewContainer = self->_accessoryViewContainer;
    v6 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("accessoryView"), firstValue, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[accessoryView]|"), 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](accessoryViewContainer, "addConstraints:", v8);

    v9 = self->_accessoryViewContainer;
    v10 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("accessoryView"), firstValue, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[accessoryView]|"), 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v9, "addConstraints:", v12);

    -[NSLayoutConstraint setConstant:](self->_accessoryContainerHeightConstraint, "setConstant:", self->_derivedToolbarExtensionHeight);
    -[UIView layoutIfNeeded](self->_accessoryViewContainer, "layoutIfNeeded");
  }

}

- (double)_totalHeight
{
  _BOOL4 v3;
  BOOL v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[QLToolbarController isOriginalToolbarHidden](self, "isOriginalToolbarHidden");
  v4 = -[QLToolbarController isAccessoryViewHidden](self, "isAccessoryViewHidden");
  v5 = v4;
  if (v3)
  {
    v6 = 0.0;
    if (!v4)
    {
      -[QLToolbarController _toolbarSafeAreaInsetBottom](self, "_toolbarSafeAreaInsetBottom");
      v6 = v7;
LABEL_5:
      -[QLToolbarController _computeClippingExtensionContainerHeightForCurrentHiddenProgress](self, "_computeClippingExtensionContainerHeightForCurrentHiddenProgress");
      return v6 + v9;
    }
  }
  else
  {
    -[QLToolbarController _originalToolbarHeightIncludingSafeAreaBottomInset:](self, "_originalToolbarHeightIncludingSafeAreaBottomInset:", 1);
    v6 = v8;
    if (!v5)
      goto LABEL_5;
  }
  return v6;
}

- (double)_toolbarExtensionHeight
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);
  objc_msgSend(WeakRetained, "intrinsicContentSize");
  v5 = v4;

  if (v5 <= 0.0)
    return self->_preferredAccesoryViewHeight;
  return v5;
}

- (void)_embedAccessoryView
{
  UIView **p_accessoryView;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  UIView *accessoryViewContainer;
  id v10;
  id v11;

  p_accessoryView = &self->_accessoryView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_accessoryView);
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)p_accessoryView);
      objc_msgSend(v7, "removeFromSuperview");

    }
    v8 = objc_loadWeakRetained((id *)p_accessoryView);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    accessoryViewContainer = self->_accessoryViewContainer;
    v10 = objc_loadWeakRetained((id *)p_accessoryView);
    -[UIView addSubview:](accessoryViewContainer, "addSubview:", v10);

    v11 = objc_loadWeakRetained((id *)p_accessoryView);
    -[QLToolbarController _layoutAccessoryView:](self, "_layoutAccessoryView:", v11);

  }
}

- (void)restoreOriginalToolbar
{
  UIToolbar *customToolbar;
  NSLayoutConstraint *toolbarHeightConstraint;
  NSLayoutConstraint *clippingExtensionContainerHeightConstraint;
  UIView *accessoryViewContainer;

  -[QLToolbarController restoreOriginalConfiguration](self, "restoreOriginalConfiguration");
  -[UIToolbar removeFromSuperview](self->_customToolbar, "removeFromSuperview");
  customToolbar = self->_customToolbar;
  self->_customToolbar = 0;

  toolbarHeightConstraint = self->_toolbarHeightConstraint;
  self->_toolbarHeightConstraint = 0;

  clippingExtensionContainerHeightConstraint = self->_clippingExtensionContainerHeightConstraint;
  self->_clippingExtensionContainerHeightConstraint = 0;

  accessoryViewContainer = self->_accessoryViewContainer;
  self->_accessoryViewContainer = 0;

  objc_storeWeak((id *)&self->_originalToolbar, 0);
}

- (void)restoreOriginalConfiguration
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);
  objc_msgSend(WeakRetained, "configureWithConfiguration:", self->_originalToolbarConfiguration);

}

- (void)updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;

  -[QLToolbarController _originalToolbarHeightIncludingSafeAreaBottomInset:](self, "_originalToolbarHeightIncludingSafeAreaBottomInset:", 1);
  v4 = v3;
  -[QLToolbarController _computeClippingExtensionContainerBottomConstraint](self, "_computeClippingExtensionContainerBottomConstraint");
  -[NSLayoutConstraint setConstant:](self->_clippingExtensionContainerBottomConstraint, "setConstant:");
  -[QLToolbarController _computeClippingExtensionContainerHeightForCurrentHiddenProgress](self, "_computeClippingExtensionContainerHeightForCurrentHiddenProgress");
  -[NSLayoutConstraint setConstant:](self->_clippingExtensionContainerHeightConstraint, "setConstant:");
  -[QLToolbarController hiddenProgress](self, "hiddenProgress");
  v6 = v5;
  -[QLToolbarController _totalHeight](self, "_totalHeight");
  -[NSLayoutConstraint setConstant:](self->_toolbarBottomConstraint, "setConstant:", v6 * v7);
  -[QLToolbarController _totalHeight](self, "_totalHeight");
  -[NSLayoutConstraint setConstant:](self->_toolbarHeightConstraint, "setConstant:");
  -[UIToolbar superview](self->_customToolbar, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v13 = *MEMORY[0x24BDBF148];
  v14 = *(double *)(MEMORY[0x24BDBF148] + 8);

  if (v10 != v13 || v12 != v14)
  {
    -[UIToolbar superview](self->_customToolbar, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsLayout");

    -[UIToolbar superview](self->_customToolbar, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutIfNeeded");

  }
  -[QLToolbarController accessoryViewHiddenProgress](self, "accessoryViewHiddenProgress");
  -[UIView setAlpha:](self->_accessoryViewContainer, "setAlpha:", 1.0 - v18);
  if (!_os_feature_enabled_impl()
    || !-[QLToolbarController isOriginalToolbarHidden](self, "isOriginalToolbarHidden"))
  {
    -[QLToolbarController originalToolbar](self, "originalToolbar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v21 = CGRectGetHeight(v28) - v4;

    if (-[QLToolbarController isOriginalToolbarHidden](self, "isOriginalToolbarHidden"))
    {
      -[QLToolbarController _totalHeight](self, "_totalHeight");
    }
    else
    {
      -[QLToolbarController hiddenProgress](self, "hiddenProgress");
      v24 = v23;
      -[QLToolbarController _totalHeight](self, "_totalHeight");
      v22 = v24 * v25;
    }
    v26 = v21 + v22;
    -[QLToolbarController originalToolbar](self, "originalToolbar");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrameOrigin:", 0.0, v26);

  }
}

- (void)setPreferredSuperview:(id)a3 preferredParentViewForSafeAreaInset:(id)a4
{
  id WeakRetained;
  void *v7;
  id obj;

  obj = a3;
  objc_storeWeak((id *)&self->_preferredParentViewForSafeAreaInset, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_preferredSuperview);

  v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_preferredSuperview, obj);
    -[QLToolbarController _tryToSetUp:](self, "_tryToSetUp:", 1);
    v7 = obj;
  }

}

- (void)setAccessoryViewHidden:(BOOL)a3
{
  double v3;

  self->_accessoryViewHidden = a3;
  v3 = 0.0;
  if (a3)
    v3 = 1.0;
  -[QLToolbarController setAccessoryViewHiddenProgress:](self, "setAccessoryViewHiddenProgress:", v3);
}

- (BOOL)isAccessoryViewHidden
{
  BOOL v2;
  void *v3;

  if (self->_accessoryViewHidden)
    return 1;
  -[QLToolbarController accessoryView](self, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 == 0;

  return v2;
}

- (void)setAccessoryViewHiddenProgress:(double)a3
{
  self->_accessoryViewHiddenProgress = a3;
}

- (double)accessoryViewHiddenProgress
{
  void *v3;
  double accessoryViewHiddenProgress;

  -[QLToolbarController accessoryView](self, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    accessoryViewHiddenProgress = self->_accessoryViewHiddenProgress;
  else
    accessoryViewHiddenProgress = 1.0;

  return accessoryViewHiddenProgress;
}

- (void)setBarTintColor:(id)a3
{
  _UIToolbarConfiguration *customToolbarConfiguration;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_barTintColor, a3);
  customToolbarConfiguration = self->_customToolbarConfiguration;
  if (customToolbarConfiguration)
  {
    -[_UIToolbarConfiguration setBarTintColor:](customToolbarConfiguration, "setBarTintColor:", self->_barTintColor);
    -[UIToolbar configureWithConfiguration:](self->_customToolbar, "configureWithConfiguration:", self->_customToolbarConfiguration);
  }

}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  -[QLToolbarController _tryToSetUp:](self, "_tryToSetUp:", 0);
  if (self->_hidden != v3)
  {
    self->_hidden = v3;
    v5 = 0.0;
    if (v3)
      v5 = 1.0;
    -[QLToolbarController setHiddenProgress:](self, "setHiddenProgress:", v5);
  }
}

- (void)setHiddenProgress:(double)a3
{
  self->_hiddenProgress = a3;
}

- (void)setAccessoryView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  _QWORD v16[4];
  id v17;
  QLToolbarController *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];

  v4 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);

  if (WeakRetained != v6)
  {
    v8 = objc_loadWeakRetained((id *)&self->_accessoryView);
    objc_storeWeak((id *)&self->_accessoryView, v6);
    if (-[QLToolbarController _tryToSetUp:](self, "_tryToSetUp:", 0))
    {
      v9 = objc_loadWeakRetained((id *)&self->_accessoryView);

      if (v9)
      {
        -[QLToolbarController _embedAccessoryView](self, "_embedAccessoryView");
        if (!v4)
        {
          objc_msgSend(v8, "removeFromSuperview");
          goto LABEL_12;
        }
        v10 = objc_loadWeakRetained((id *)&self->_accessoryView);
        objc_msgSend(v10, "setAlpha:", 0.0);

        v11 = (void *)MEMORY[0x24BEBDB00];
        v12 = MEMORY[0x24BDAC760];
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_3;
        v19[3] = &unk_24C724B00;
        v20 = v8;
        v16[0] = v12;
        v16[1] = 3221225472;
        v16[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_4;
        v16[3] = &unk_24C7250F0;
        v17 = v20;
        v18 = self;
        objc_msgSend(v11, "animateWithDuration:animations:completion:", v19, v16, 0.15);

        v13 = v20;
      }
      else
      {
        v14 = (void *)MEMORY[0x24BEBDB00];
        if (v4)
          v15 = 0.15;
        else
          v15 = 0.0;
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke;
        v23[3] = &unk_24C724B00;
        v23[4] = self;
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_2;
        v21[3] = &unk_24C724B28;
        v22 = v8;
        objc_msgSend(v14, "animateWithDuration:animations:completion:", v23, v21, v15);
        v13 = v22;
      }

    }
LABEL_12:

  }
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLayout");
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __49__QLToolbarController_setAccessoryView_animated___block_invoke_4(uint64_t a1)
{
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__QLToolbarController_setAccessoryView_animated___block_invoke_5;
  v3[3] = &unk_24C724B00;
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v3, 0, 0.15);
}

void __49__QLToolbarController_setAccessoryView_animated___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);

}

- (void)setOriginalToolbar:(id)a3
{
  id WeakRetained;
  _UIToolbarConfiguration *originalToolbarConfiguration;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalToolbar);

  if (WeakRetained != obj)
  {
    originalToolbarConfiguration = self->_originalToolbarConfiguration;
    self->_originalToolbarConfiguration = 0;

    objc_storeWeak((id *)&self->_originalToolbar, obj);
    -[QLToolbarController _tryToSetUp:](self, "_tryToSetUp:", 0);
  }

}

- (BOOL)isOriginalToolbarHidden
{
  void *v2;
  char v3;

  -[QLToolbarController originalToolbar](self, "originalToolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setOriginalToolbarHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLToolbarController originalToolbar](self, "originalToolbar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setAccessoryView:(id)a3
{
  -[QLToolbarController setAccessoryView:animated:](self, "setAccessoryView:animated:", a3, 0);
}

- (void)setPreferredAccesoryViewHeight:(double)a3
{
  id WeakRetained;

  self->_preferredAccesoryViewHeight = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryView);
  -[QLToolbarController _layoutAccessoryView:](self, "_layoutAccessoryView:", WeakRetained);

}

- (void)setToolbarAlpha:(double)a3
{
  self->_toolbarAlpha = a3;
  -[UIToolbar setAlpha:](self->_customToolbar, "setAlpha:");
}

- (void)setAccessoryViewAlpha:(double)a3
{
  self->_accessoryViewAlpha = a3;
  -[UIView setAlpha:](self->_accessoryViewContainer, "setAlpha:");
}

- (void)setOriginalToolbarAlpha:(double)a3
{
  id v4;

  self->_originalToolbarAlpha = a3;
  -[QLToolbarController originalToolbar](self, "originalToolbar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (UIToolbar)originalToolbar
{
  return (UIToolbar *)objc_loadWeakRetained((id *)&self->_originalToolbar);
}

- (UIToolbar)customToolbar
{
  return (UIToolbar *)objc_getProperty(self, a2, 112, 1);
}

- (UIView)accessoryView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_accessoryView);
}

- (double)preferredAccesoryViewHeight
{
  return self->_preferredAccesoryViewHeight;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (double)toolbarAlpha
{
  return self->_toolbarAlpha;
}

- (double)originalToolbarAlpha
{
  return self->_originalToolbarAlpha;
}

- (double)accessoryViewAlpha
{
  return self->_accessoryViewAlpha;
}

- (double)hiddenProgress
{
  return self->_hiddenProgress;
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (UIView)preferredSuperview
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_preferredSuperview);
}

- (UIView)preferredParentViewForSafeAreaInset
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_preferredParentViewForSafeAreaInset);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredParentViewForSafeAreaInset);
  objc_destroyWeak((id *)&self->_preferredSuperview);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_destroyWeak((id *)&self->_accessoryView);
  objc_storeStrong((id *)&self->_customToolbar, 0);
  objc_destroyWeak((id *)&self->_originalToolbar);
  objc_storeStrong((id *)&self->_customToolbarConfiguration, 0);
  objc_storeStrong((id *)&self->_originalToolbarConfiguration, 0);
  objc_storeStrong((id *)&self->_accessoryViewContainer, 0);
  objc_storeStrong((id *)&self->_clippingExtensionContainer, 0);
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_clippingExtensionContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_clippingExtensionContainerHeightConstraint, 0);
}

@end
