@implementation SFTabGroupBanner

- (SFTabGroupBanner)initWithFrame:(CGRect)a3
{
  SFTabGroupBanner *v3;
  SFTabGroupBanner *v4;
  SFThemeColorEffectView *v5;
  void *v6;
  uint64_t v7;
  SFThemeColorEffectView *backdrop;
  SFTabGroupTitleView *v9;
  SFTabGroupTitleView *titleView;
  UIToolbar *v11;
  UIToolbar *toolbar;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SFTabGroupBanner *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)SFTabGroupBanner;
  v3 = -[SFPinnableBanner initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFPinnableBanner setSeparableFromStatusBar:](v3, "setSeparableFromStatusBar:", 0);
    v5 = [SFThemeColorEffectView alloc];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SFThemeColorEffectView initWithEffect:](v5, "initWithEffect:", v6);
    backdrop = v4->_backdrop;
    v4->_backdrop = (SFThemeColorEffectView *)v7;

    -[SFTabGroupBanner bounds](v4, "bounds");
    -[SFThemeColorEffectView setFrame:](v4->_backdrop, "setFrame:");
    -[SFThemeColorEffectView setAutoresizingMask:](v4->_backdrop, "setAutoresizingMask:", 18);
    -[SFTabGroupBanner insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_backdrop, 0);
    v9 = objc_alloc_init(SFTabGroupTitleView);
    titleView = v4->_titleView;
    v4->_titleView = v9;

    v11 = (UIToolbar *)objc_alloc_init(MEMORY[0x1E0DC3E68]);
    toolbar = v4->_toolbar;
    v4->_toolbar = v11;

    v29 = objc_alloc_init(MEMORY[0x1E0DC3E70]);
    objc_msgSend(v29, "configureWithTransparentBackground");
    -[UIToolbar setStandardAppearance:](v4->_toolbar, "setStandardAppearance:", v29);
    -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](v4->_toolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFTabGroupBanner addSubview:](v4, "addSubview:", v4->_toolbar);
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UIToolbar leadingAnchor](v4->_toolbar, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupBanner leadingAnchor](v4, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    -[UIToolbar widthAnchor](v4->_toolbar, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupBanner widthAnchor](v4, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v14;
    -[UIToolbar topAnchor](v4->_toolbar, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupBanner topAnchor](v4, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v17;
    -[UIToolbar heightAnchor](v4->_toolbar, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupBanner heightAnchor](v4, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v21);

    v22 = v4;
  }

  return v4;
}

- (void)setTabGroup:(id)a3
{
  WBTabGroup *v5;

  v5 = (WBTabGroup *)a3;
  if (self->_tabGroup != v5)
  {
    objc_storeStrong((id *)&self->_tabGroup, a3);
    -[SFTabGroupTitleView setTabGroup:](self->_titleView, "setTabGroup:", v5);
    -[SFTabGroupTitleView sizeToFit](self->_titleView, "sizeToFit");
    -[SFTabGroupBanner _updateToolbarItems](self, "_updateToolbarItems");
  }

}

- (void)setTabGroupTapAction:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tabGroupTapAction, a3);
    -[SFTabGroupTitleView removeActionForIdentifier:forControlEvents:](self->_titleView, "removeActionForIdentifier:forControlEvents:", CFSTR("com.apple.mobilesafari.TabGroupTap"), 64);
    -[SFTabGroupTitleView addAction:forControlEvents:](self->_titleView, "addAction:forControlEvents:", v5, 64);
  }

}

- (void)setCollaborationButton:(id)a3
{
  _SWCollaborationButtonView *v5;
  _SWCollaborationButtonView *v6;

  v5 = (_SWCollaborationButtonView *)a3;
  if (self->_collaborationButton != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collaborationButton, a3);
    -[SFTabGroupBanner _updateToolbarItems](self, "_updateToolbarItems");
    v5 = v6;
  }

}

- (void)updateTitle
{
  -[SFTabGroupTitleView updateTitle](self->_titleView, "updateTitle");
}

- (BOOL)shouldUsePlainTheme
{
  return 1;
}

- (void)themeDidChange
{
  id v3;

  -[SFPinnableBanner theme](self, "theme");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFThemeColorEffectView setTheme:](self->_backdrop, "setTheme:", v3);
  -[SFTabGroupBanner setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFTabGroupBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_titleView);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_collaborationButton)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_collaborationButton);
    objc_msgSend(v7, "addObject:", v8);

  }
  -[UIToolbar setItems:](self->_toolbar, "setItems:", v7);

}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (UIAction)tabGroupTapAction
{
  return self->_tabGroupTapAction;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return self->_collaborationButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButton, 0);
  objc_storeStrong((id *)&self->_tabGroupTapAction, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end
