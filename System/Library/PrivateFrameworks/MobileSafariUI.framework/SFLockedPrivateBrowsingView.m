@implementation SFLockedPrivateBrowsingView

- (SFLockedPrivateBrowsingView)initWithFrame:(CGRect)a3
{
  return -[SFLockedPrivateBrowsingView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFLockedPrivateBrowsingView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Method not implemented"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (SFLockedPrivateBrowsingView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  SFLockedPrivateBrowsingView *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIContentUnavailableView *contentUnavailableView;
  void *v10;
  TabOverviewToolbar *v11;
  TabOverviewToolbar *toolbar;
  TabOverviewToolbar *v13;
  void *v14;
  SFLockedPrivateBrowsingView *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SFLockedPrivateBrowsingView;
  v5 = -[SFLockedPrivateBrowsingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC36B0]);
    configurationWithAction(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithConfiguration:", v7);
    contentUnavailableView = v5->_contentUnavailableView;
    v5->_contentUnavailableView = (UIContentUnavailableView *)v8;

    -[SFLockedPrivateBrowsingView bounds](v5, "bounds");
    -[UIContentUnavailableView setFrame:](v5->_contentUnavailableView, "setFrame:");
    -[UIContentUnavailableView setAutoresizingMask:](v5->_contentUnavailableView, "setAutoresizingMask:", 18);
    -[SFLockedPrivateBrowsingView addSubview:](v5, "addSubview:", v5->_contentUnavailableView);
    if (a4 == 1)
    {
      -[UIContentUnavailableView _setOverrideUserInterfaceRenderingMode:](v5->_contentUnavailableView, "_setOverrideUserInterfaceRenderingMode:", 2);
    }
    else if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFLockedPrivateBrowsingView setBackgroundColor:](v5, "setBackgroundColor:", v10);

      v11 = objc_alloc_init(TabOverviewToolbar);
      toolbar = v5->_toolbar;
      v5->_toolbar = v11;

      -[TabOverviewToolbar setAutoresizingMask:](v5->_toolbar, "setAutoresizingMask:", 0);
      -[TabOverviewToolbar setSearchBar:](v5->_toolbar, "setSearchBar:", 0);
      -[TabOverviewToolbar setUserInteractionEnabled:](v5->_toolbar, "setUserInteractionEnabled:", 1);
      -[TabOverviewToolbar setBarButton:hidden:](v5->_toolbar, "setBarButton:hidden:", 1, 1);
      -[TabOverviewToolbar setBarButton:hidden:](v5->_toolbar, "setBarButton:hidden:", 3, 1);
      -[TabOverviewToolbar setBarButton:hidden:](v5->_toolbar, "setBarButton:hidden:", 2, 1);
      -[TabOverviewToolbar setBarButton:enabled:](v5->_toolbar, "setBarButton:enabled:", 0, 1);
      v13 = v5->_toolbar;
      _WBSLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabOverviewToolbar setTabGroupButtonTitle:](v13, "setTabGroupButtonTitle:", v14);

      -[SFLockedPrivateBrowsingView addSubview:](v5, "addSubview:", v5->_toolbar);
    }
    v15 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  CGFloat Width;
  double v11;
  double v12;
  double v13;
  TabOverviewToolbar *toolbar;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)SFLockedPrivateBrowsingView;
  -[SFLockedPrivateBrowsingView layoutSubviews](&v21, sel_layoutSubviews);
  if (self->_toolbar)
  {
    -[SFLockedPrivateBrowsingView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    v5 = v4;
    v7 = v6;

    -[SFLockedPrivateBrowsingView bounds](self, "bounds");
    -[TabOverviewToolbar setPlacement:](self->_toolbar, "setPlacement:", SFTabOverviewShouldUseCompactAppearanceForSize());
    v8 = -[TabOverviewToolbar placement](self->_toolbar, "placement");
    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (v8)
        return;
      -[SFLockedPrivateBrowsingView bounds](self, "bounds");
      v19 = v18;
      -[TabOverviewToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v17 = v5 + v20;
      toolbar = self->_toolbar;
      v15 = 0.0;
      v13 = 0.0;
      v16 = v19;
    }
    else
    {
      v9 = *MEMORY[0x1E0C9D648];
      -[SFLockedPrivateBrowsingView bounds](self, "bounds");
      Width = CGRectGetWidth(v22);
      -[TabOverviewToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v12 = v7 + v11;
      -[SFLockedPrivateBrowsingView bounds](self, "bounds");
      v13 = CGRectGetHeight(v23) - v12;
      toolbar = self->_toolbar;
      v15 = v9;
      v16 = Width;
      v17 = v12;
    }
    -[TabOverviewToolbar setFrame:](toolbar, "setFrame:", v15, v13, v16, v17);
  }
}

- (UIAction)unlockAction
{
  void *v2;
  void *v3;
  void *v4;

  -[UIContentUnavailableView configuration](self->_contentUnavailableView, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAction *)v4;
}

- (void)setUnlockAction:(id)a3
{
  id v4;

  configurationWithAction(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView setConfiguration:](self->_contentUnavailableView, "setConfiguration:", v4);

}

- (void)setTabGroupPickerAction:(id)a3
{
  UIAction *tabGroupPickerAction;
  void *v6;
  id v7;

  v7 = a3;
  tabGroupPickerAction = self->_tabGroupPickerAction;
  if (tabGroupPickerAction)
    -[TabOverviewToolbar removePrimaryAction:forBarButton:](self->_toolbar, "removePrimaryAction:forBarButton:", tabGroupPickerAction, 0);
  objc_storeStrong((id *)&self->_tabGroupPickerAction, a3);
  v6 = v7;
  if (v7)
  {
    -[TabOverviewToolbar addPrimaryAction:forBarButton:](self->_toolbar, "addPrimaryAction:forBarButton:", v7, 0);
    v6 = v7;
  }

}

- (UIAction)tabGroupPickerAction
{
  return self->_tabGroupPickerAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupPickerAction, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

@end
