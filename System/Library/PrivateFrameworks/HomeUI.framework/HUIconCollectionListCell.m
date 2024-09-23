@implementation HUIconCollectionListCell

- (HUIconCollectionListCell)initWithFrame:(CGRect)a3
{
  HUIconCollectionListCell *v3;
  HUIconCollectionListCell *v4;
  uint64_t v5;
  UIColor *iconForegroundColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUIconCollectionListCell;
  v3 = -[HUIconCollectionListCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_iconSize = 0;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
    iconForegroundColor = v4->_iconForegroundColor;
    v4->_iconForegroundColor = (UIColor *)v5;

    v4->_iconForegroundColorFollowsTintColor = 1;
    v4->_iconAlpha = 1.0;
    v4->_iconDisplayStyle = 1;
    v4->_iconTintColorFollowsDisabledState = 1;
    v4->_separatorInsetLinesUpWithText = 1;
    -[HUIconCollectionListCell _createIconView](v4, "_createIconView");
  }
  return v4;
}

- (void)setIconForegroundColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *iconForegroundColor;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (UIColor *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  iconForegroundColor = self->_iconForegroundColor;
  self->_iconForegroundColor = v5;

  -[HUIconCollectionListCell _updateIcon](self, "_updateIcon");
}

- (void)setIconForegroundColorFollowsTintColor:(BOOL)a3
{
  self->_iconForegroundColorFollowsTintColor = a3;
  -[HUIconCollectionListCell _updateIcon](self, "_updateIcon");
}

- (void)setIconAlpha:(double)a3
{
  self->_iconAlpha = a3;
  -[HUIconCollectionListCell _updateIcon](self, "_updateIcon");
}

- (id)configurationState
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUIconCollectionListCell;
  -[HUIconCollectionListCell configurationState](&v5, sel_configurationState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisabled:", -[HUIconCollectionListCell isDisabled](self, "isDisabled"));
  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[HUIconCollectionListCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setIconDisplayStyle:(unint64_t)a3
{
  if (self->_iconDisplayStyle != a3)
  {
    self->_iconDisplayStyle = a3;
    -[HUIconCollectionListCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
  }
}

- (void)setIconSize:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[HUIconCollectionListCell iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconSize:", a3);

  -[HUIconCollectionListCell iconSize](self, "iconSize");
  HUDefaultSizeForIconSize();
  v7 = v6;
  -[HUIconCollectionListCell iconSizeConstraint](self, "iconSizeConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

}

- (void)setIconTintColorFollowsDisabledState:(BOOL)a3
{
  self->_iconTintColorFollowsDisabledState = a3;
  -[HUIconCollectionListCell _updateIcon](self, "_updateIcon");
}

- (BOOL)disableContinuousIconAnimation
{
  void *v2;
  char v3;

  -[HUIconCollectionListCell iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableContinuousAnimation");

  return v3;
}

- (void)setDisableContinuousIconAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUIconCollectionListCell iconView](self, "iconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableContinuousAnimation:", v3);

}

- (void)setEnableTappableIcon:(BOOL)a3
{
  self->_enableTappableIcon = a3;
  -[HUIconCollectionListCell _updateIcon](self, "_updateIcon");
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[HUIconCollectionListCell iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithIconDescriptor:displayStyle:animated:", v8, -[HUIconCollectionListCell iconDisplayStyle](self, "iconDisplayStyle"), v3);

  -[HUIconCollectionListCell updateAccessories](self, "updateAccessories");
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUIconCollectionListCell contentConfiguration](self, "contentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatedConfigurationForState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUIconCollectionListCell setContentConfiguration:](self, "setContentConfiguration:", v6);
  -[HUIconCollectionListCell _updateIcon](self, "_updateIcon");
}

- (void)updateAccessories
{
  id v3;

  -[HUIconCollectionListCell _buildAccessories](self, "_buildAccessories");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell setAccessories:](self, "setAccessories:", v3);

}

- (id)_buildAccessories
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HUIconCollectionListCell iconAccessoryView](self, "iconAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_createIconView
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
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
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;

  -[HUIconCollectionListCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Already have iconView: %@"), self);
  v4 = objc_alloc_init(MEMORY[0x1E0D33720]);
  -[HUIconCollectionListCell setIconView:](self, "setIconView:", v4);

  -[HUIconCollectionListCell iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 1);

  v6 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[HUIconCollectionListCell setIconContainerView:](self, "setIconContainerView:", v6);

  -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell iconSize](self, "iconSize");
  HUDefaultSizeForIconSize();
  v10 = v9;
  -[HUIconCollectionListCell iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUIconCollectionListCell iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell setIconSizeConstraint:](self, "setIconSizeConstraint:", v14);

  -[HUIconCollectionListCell iconSizeConstraint](self, "iconSizeConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObject:", v15);

  -[HUIconCollectionListCell iconView](self, "iconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell iconView](self, "iconView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObject:", v20);

  -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell iconView](self, "iconView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObject:", v25);

  -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell iconView](self, "iconView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObject:", v30);

  -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell frame](self, "frame");
  objc_msgSend(v32, "constraintEqualToConstant:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObject:", v34);

  -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "heightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObject:", v39);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);
  v40 = objc_alloc(MEMORY[0x1E0CEA3E0]);
  -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithCustomView:placement:", v41, 0);
  -[HUIconCollectionListCell setIconAccessoryView:](self, "setIconAccessoryView:", v42);

  -[HUIconCollectionListCell _updateIcon](self, "_updateIcon");
}

- (void)_updateIcon
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  if (-[HUIconCollectionListCell isDisabled](self, "isDisabled")
    && -[HUIconCollectionListCell iconTintColorFollowsDisabledState](self, "iconTintColorFollowsDisabledState"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCollectionListCell iconView](self, "iconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v3);

LABEL_8:
    goto LABEL_9;
  }
  v5 = -[HUIconCollectionListCell iconForegroundColorFollowsTintColor](self, "iconForegroundColorFollowsTintColor");
  if (v5)
  {
    v3 = 0;
  }
  else
  {
    -[HUIconCollectionListCell iconForegroundColor](self, "iconForegroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUIconCollectionListCell iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v3);

  if (!v5)
    goto LABEL_8;
LABEL_9:
  -[HUIconCollectionListCell iconAlpha](self, "iconAlpha");
  if (v7 != 0.0)
  {
    -[HUIconCollectionListCell iconAlpha](self, "iconAlpha");
    v9 = v8;
    -[HUIconCollectionListCell iconView](self, "iconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v9);

  }
  if (-[HUIconCollectionListCell enableTappableIcon](self, "enableTappableIcon"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__iconTapped_);
    -[HUIconCollectionListCell iconContainerView](self, "iconContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", v11);

  }
  v13 = -[HUIconCollectionListCell iconSize](self, "iconSize");
  -[HUIconCollectionListCell iconView](self, "iconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIconSize:", v13);

  -[HUIconCollectionListCell updateAccessories](self, "updateAccessories");
}

- (void)_iconTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (!-[HUIconCollectionListCell isAnimatingPop](self, "isAnimatingPop", a3))
  {
    -[HUIconCollectionListCell setIsAnimatingPop:](self, "setIsAnimatingPop:", 1);
    -[HUIconCollectionListCell iconView](self, "iconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__HUIconCollectionListCell__iconTapped___block_invoke;
    v7[3] = &unk_1E6F4D988;
    v7[4] = self;
    +[HUAnimationUtilities schedulePopAnimation:scaleFactor:beginDuration:endDuration:completion:](HUAnimationUtilities, "schedulePopAnimation:scaleFactor:beginDuration:endDuration:completion:", v4, v7, 0.7, 0.15, 0.3);

    -[HUIconCollectionListCell delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCollectionListCell item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didTapIconForCell:withItem:", self, v6);

  }
}

uint64_t __40__HUIconCollectionListCell__iconTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPop:", 0);
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (UIColor)iconForegroundColor
{
  return self->_iconForegroundColor;
}

- (BOOL)iconForegroundColorFollowsTintColor
{
  return self->_iconForegroundColorFollowsTintColor;
}

- (double)iconAlpha
{
  return self->_iconAlpha;
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (unint64_t)iconDisplayStyle
{
  return self->_iconDisplayStyle;
}

- (BOOL)iconTintColorFollowsDisabledState
{
  return self->_iconTintColorFollowsDisabledState;
}

- (BOOL)separatorInsetLinesUpWithText
{
  return self->_separatorInsetLinesUpWithText;
}

- (void)setSeparatorInsetLinesUpWithText:(BOOL)a3
{
  self->_separatorInsetLinesUpWithText = a3;
}

- (BOOL)enableTappableIcon
{
  return self->_enableTappableIcon;
}

- (HUIconCollectionListCellDelegate)delegate
{
  return (HUIconCollectionListCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (NSLayoutConstraint)iconSizeConstraint
{
  return self->_iconSizeConstraint;
}

- (void)setIconSizeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconSizeConstraint, a3);
}

- (UIView)iconContainerView
{
  return self->_iconContainerView;
}

- (void)setIconContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_iconContainerView, a3);
}

- (UICellAccessoryCustomView)iconAccessoryView
{
  return self->_iconAccessoryView;
}

- (void)setIconAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_iconAccessoryView, a3);
}

- (BOOL)isAnimatingPop
{
  return self->_isAnimatingPop;
}

- (void)setIsAnimatingPop:(BOOL)a3
{
  self->_isAnimatingPop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconAccessoryView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
  objc_storeStrong((id *)&self->_iconSizeConstraint, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconForegroundColor, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
