@implementation CCUICustomContentModuleBackgroundViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CCUICustomContentModuleBackgroundViewController;
  -[CCUICustomContentModuleBackgroundViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[CCUICustomContentModuleBackgroundViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel__contentSizeCategoryDidChange);

  -[CCUICustomContentModuleBackgroundViewController _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUICustomContentModuleBackgroundViewController;
  -[CCUICustomContentModuleBackgroundViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CCUICustomContentModuleBackgroundViewController _updateHeaderLayoutIfNecessary](self, "_updateHeaderLayoutIfNecessary");
  -[CCUICustomContentModuleBackgroundViewController _updateCustomHeaderViewLayoutIfNecessary](self, "_updateCustomHeaderViewLayoutIfNecessary");
  -[CCUICustomContentModuleBackgroundViewController _updateFooterButtonsLayoutIfNecessary](self, "_updateFooterButtonsLayoutIfNecessary");
  -[CCUICustomContentModuleBackgroundViewController _updateCustomFooterViewLayoutIfNecessary](self, "_updateCustomFooterViewLayoutIfNecessary");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUICustomContentModuleBackgroundViewController;
  -[CCUICustomContentModuleBackgroundViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    -[CCUICustomContentModuleBackgroundViewController visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICustomContentModuleBackgroundViewController _visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:](self, "_visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:", v6, 1, v9);

  }
}

- (void)setHeaderTitle:(id)a3
{
  id v4;
  UILabel *headerTitleLabel;
  id v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v4 = a3;
  headerTitleLabel = self->_headerTitleLabel;
  if (v4)
  {
    v15 = v4;
    if (!headerTitleLabel)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3990]);
      v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_headerTitleLabel;
      self->_headerTitleLabel = v7;

      v9 = self->_headerTitleLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v9, "setTextColor:", v10);

      v11 = self->_headerTitleLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v11, "setFont:", v12);

      -[CCUICustomContentModuleBackgroundViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", self->_headerTitleLabel);

      headerTitleLabel = self->_headerTitleLabel;
    }
    -[UILabel setText:](headerTitleLabel, "setText:", v15);
    -[CCUICustomContentModuleBackgroundViewController _updateTitleFont](self, "_updateTitleFont");
    goto LABEL_7;
  }
  if (headerTitleLabel)
  {
    v15 = 0;
    -[UILabel removeFromSuperview](headerTitleLabel, "removeFromSuperview");
    v14 = self->_headerTitleLabel;
    self->_headerTitleLabel = 0;

LABEL_7:
    v4 = v15;
  }

}

- (void)setHeaderGlyphImage:(id)a3
{
  -[CCUICustomContentModuleBackgroundViewController setHeaderGlyphImage:unscaledSymbolPointSize:](self, "setHeaderGlyphImage:unscaledSymbolPointSize:", a3, 28.0);
}

- (void)setHeaderGlyphImage:(id)a3 unscaledSymbolPointSize:(double)a4
{
  id v6;
  UIImageView *headerImageView;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;
  id v18;
  UIImageView *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v6 = a3;
  headerImageView = self->_headerImageView;
  if (v6)
  {
    v22 = v6;
    if (!headerImageView)
    {
      v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v9 = self->_headerImageView;
      self->_headerImageView = v8;

      -[UIImageView controlCenterApplyPrimaryContentShadow](self->_headerImageView, "controlCenterApplyPrimaryContentShadow");
      -[UIImageView setContentMode:](self->_headerImageView, "setContentMode:", 1);
      v10 = self->_headerImageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v10, "setTintColor:", v11);

      -[CCUICustomContentModuleBackgroundViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_headerImageView);

      v6 = v22;
    }
    if (objc_msgSend(v6, "isSymbolImage"))
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceIdiom");

      v15 = 1.33333333;
      if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        v15 = 1.5;
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", round(v15 * a4));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageByApplyingSymbolConfiguration:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v17;
    }
    else
    {
      v18 = v22;
    }
    v23 = v18;
    -[UIImageView setImage:](self->_headerImageView, "setImage:", v18);
    -[CCUICustomContentModuleBackgroundViewController visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICustomContentModuleBackgroundViewController _updateHeaderGlyphVisualStylingWithProvider:](self, "_updateHeaderGlyphVisualStylingWithProvider:", v20);

    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeedsLayout");

  }
  else if (headerImageView)
  {
    -[UIImageView removeFromSuperview](headerImageView, "removeFromSuperview");
    v19 = self->_headerImageView;
    self->_headerImageView = 0;

  }
}

- (void)setHeaderGlyphPackageDescription:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  CCUICAPackageView *packageView;
  CCUICAPackageView *v9;
  CCUICAPackageView *v10;
  void *v11;
  CCUICAPackageView *v12;
  double Width;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v6 = a3;
  v7 = 984;
  packageView = self->_packageView;
  v19 = v6;
  if (!packageView)
  {
    v9 = objc_alloc_init(CCUICAPackageView);
    v10 = self->_packageView;
    self->_packageView = v9;

    -[UIView controlCenterApplyPrimaryContentShadow](self->_packageView, "controlCenterApplyPrimaryContentShadow");
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_packageView);

    v6 = v19;
    packageView = self->_packageView;
  }
  -[CCUICAPackageView setPackageDescription:](packageView, "setPackageDescription:", v6);
  v12 = self->_packageView;
  v20.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v20);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    self = (CCUICustomContentModuleBackgroundViewController *)objc_claimAutoreleasedReturnValue();
    if (-[CCUICustomContentModuleBackgroundViewController userInterfaceIdiom](self, "userInterfaceIdiom") == 1
      && SBFEffectiveHomeButtonType() != 2)
    {
      -[CCUICAPackageView setScale:](v12, "setScale:", 1.25);
LABEL_40:

      goto LABEL_41;
    }
  }
  v21.origin.x = CCUIReferenceScreenBounds();
  v14 = CGRectGetWidth(v21);
  if (v14 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v7, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v22.origin.x = CCUIReferenceScreenBounds();
    v15 = CGRectGetWidth(v22);
    if (v15 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        -[CCUICAPackageView setScale:](v12, "setScale:", 1.25);
LABEL_36:

LABEL_37:
        if (v14 < 1024.0)
          goto LABEL_39;
        goto LABEL_38;
      }
    }
    v23.origin.x = CCUIReferenceScreenBounds();
    v16 = CGRectGetWidth(v23);
    if (v16 >= 834.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      -[CCUICAPackageView setScale:](v12, "setScale:", 1.25);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1.25;
      if (objc_msgSend(v17, "userInterfaceIdiom") != 1)
      {
        v24.origin.x = CCUIReferenceScreenBounds();
        v18 = 1.5;
        if (CGRectGetWidth(v24) < 430.0)
        {
          v25.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v25) < 428.0)
          {
            v26.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v26) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v27.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v27) < 414.0)
              {
                v28.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v28) < 393.0)
                {
                  v29.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v29) < 390.0)
                  {
                    v30.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v30) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      v31.origin.x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v31) < 375.0)
                        v18 = 1.25;
                      else
                        v18 = 1.5;
                    }
                  }
                }
              }
            }
          }
        }
      }
      -[CCUICAPackageView setScale:](v12, "setScale:", v18);

      if (v16 < 834.0)
      {
LABEL_35:
        if (v15 < 834.0)
          goto LABEL_37;
        goto LABEL_36;
      }
    }

    goto LABEL_35;
  }
  -[CCUICAPackageView setScale:](v12, "setScale:", 1.25);
LABEL_38:

LABEL_39:
  if (Width >= 1024.0)
    goto LABEL_40;
LABEL_41:

}

- (void)setHeaderGlyphState:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUICustomContentModuleBackgroundViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUICAPackageView setStateName:](self->_packageView, "setStateName:", v4);

}

- (void)setCustomHeaderView:(id)a3
{
  UIView *v5;
  UIView **p_customHeaderView;
  UIView *customHeaderView;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;

  v5 = (UIView *)a3;
  p_customHeaderView = &self->_customHeaderView;
  customHeaderView = self->_customHeaderView;
  if (customHeaderView != v5)
  {
    v14 = v5;
    if (customHeaderView)
      -[UIView removeFromSuperview](customHeaderView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customHeaderView, a3);
    v8 = *p_customHeaderView;
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "addSubview:", *p_customHeaderView);

      -[UILabel removeFromSuperview](self->_headerTitleLabel, "removeFromSuperview");
      -[UIImageView removeFromSuperview](self->_headerImageView, "removeFromSuperview");
      -[CCUICAPackageView removeFromSuperview](self->_packageView, "removeFromSuperview");
    }
    else
    {
      objc_msgSend(v9, "addSubview:", self->_headerTitleLabel);

      -[CCUICustomContentModuleBackgroundViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_headerImageView);

      -[CCUICustomContentModuleBackgroundViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_packageView);

    }
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    v5 = v14;
  }

}

- (void)setFooterButtons:(id)a3
{
  id v4;
  NSArray *footerButtons;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSUInteger v14;
  id *v15;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  footerButtons = self->_footerButtons;
  if (footerButtons)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = footerButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeFromSuperview");

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v8);
    }

  }
  v12 = (NSArray *)objc_msgSend(v4, "copy");
  v13 = self->_footerButtons;
  self->_footerButtons = v12;

  v14 = -[NSArray count](self->_footerButtons, "count");
  if (v14 == 1)
  {
    v15 = (id *)MEMORY[0x1E0DC48D0];
  }
  else
  {
    v15 = (id *)MEMORY[0x1E0DC48F0];
    if (v14 != 2)
      v15 = (id *)MEMORY[0x1E0DC4900];
  }
  v16 = *v15;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_footerButtons;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v22, "setContentSizeCategoryThreshold:", v16, (_QWORD)v25);
        -[CCUICustomContentModuleBackgroundViewController view](self, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSubview:", v24);

      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

}

- (void)setCustomFooterView:(id)a3
{
  UIView *v5;
  UIView **p_customFooterView;
  UIView *customFooterView;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  p_customFooterView = &self->_customFooterView;
  customFooterView = self->_customFooterView;
  if (customFooterView != v5)
  {
    if (customFooterView)
      -[UIView removeFromSuperview](customFooterView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customFooterView, a3);
    if (*p_customFooterView)
    {
      -[CCUICustomContentModuleBackgroundViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_customFooterView);

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v9 = self->_footerButtons;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "view");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "removeFromSuperview");

          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v11);
      }
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = self->_footerButtons;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v9);
            v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
            -[CCUICustomContentModuleBackgroundViewController view](self, "view", (_QWORD)v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "view");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addSubview:", v21);

          }
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v16);
      }
    }

    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeedsLayout");

  }
}

- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id *p_headerImageView;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  NSUInteger v23;
  double v24;
  double v25;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  _QWORD recta[5];
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v61;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = CGRectGetWidth(a3);
  *(CGFloat *)recta = x;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  -[CCUICustomContentModuleBackgroundViewController _headerCenterForBounds:](self, "_headerCenterForBounds:", 0.0, 0.0, v8, CGRectGetHeight(v54));
  v10 = v9;
  v12 = v11;
  p_headerImageView = (id *)&self->_headerImageView;
  -[UIImageView image](self->_headerImageView, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    p_headerImageView = (id *)&self->_packageView;
  objc_msgSend(*p_headerImageView, "bounds");
  v16 = v15;
  v18 = v17;

  -[UILabel text](self->_headerTitleLabel, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = height;
  if (v19)
  {
    -[UILabel frame](self->_headerTitleLabel, "frame");
    v18 = v18 + CGRectGetHeight(v55) + 10.0;
    -[UILabel frame](self->_headerTitleLabel, "frame");
    v20 = CGRectGetWidth(v56);
    if (v16 < v20)
      v16 = v20;
  }
  v21 = v10 - v16 * 0.5;
  v22 = v12 - v18 * 0.5;
  v23 = -[NSArray count](self->_footerButtons, "count");
  v24 = v18;
  v25 = v16;
  v47 = v22;
  v48 = v21;
  if (v23)
  {
    v26 = v23;
    -[NSArray firstObject](self->_footerButtons, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "button");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sizeThatFits:", width, v46);
    v30 = v29;

    *(_QWORD *)&v57.origin.x = recta[0];
    v45 = y;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = v46;
    v44 = (double)v26;
    v21 = (CGRectGetWidth(v57) - (double)v26 * v30) / (double)(v26 + 1);
    v31 = v30 + v21 + -12.0;
    memset(&recta[1], 0, 32);
    v50 = 0u;
    v51 = 0u;
    v32 = self->_footerButtons;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &recta[1], v52, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)recta[3];
      v24 = 0.0;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)recta[3] != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(recta[2] + 8 * i), "view", *(_QWORD *)&v44);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "sizeThatFits:", v31, 0.0);
          v39 = v38;

          if (v24 < v39)
            v24 = v39;
        }
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &recta[1], v52, 16);
      }
      while (v34);
    }
    else
    {
      v24 = 0.0;
    }

    v25 = (double)(v26 - 1) * 12.0 + v44 * v31;
    *(_QWORD *)&v58.origin.x = recta[0];
    v58.origin.y = v45;
    v58.size.width = width;
    v58.size.height = v46;
    v40 = CGRectGetHeight(v58);
    -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
    v42 = (v40 - v41) * 0.5;
    -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
    v22 = v43 + v42;
  }
  v59.origin.y = v47;
  v59.origin.x = v48;
  v59.size.width = v16;
  v59.size.height = v18;
  v61.origin.x = v21;
  v61.origin.y = v22;
  v61.size.width = v25;
  v61.size.height = v24;
  return CGRectUnion(v59, v61);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  -[CCUICustomContentModuleBackgroundViewController requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[CCUICustomContentModuleBackgroundViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "visualStylingProviderForCategory:", a3);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)requiredVisualStyleCategories
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1E8E2BC08, 0);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_footerButtons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "requiredVisualStyleCategories");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[CCUICustomContentModuleBackgroundViewController requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v17)
    {
LABEL_10:

      goto LABEL_11;
    }
    v12 = self->_categoriesToVisualStylingProviders;
    if (v17)
    {
      if (!v12)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v14 = self->_categoriesToVisualStylingProviders;
        self->_categoriesToVisualStylingProviders = v13;

        v12 = self->_categoriesToVisualStylingProviders;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v17, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v16);

      if (-[NSMutableDictionary count](self->_categoriesToVisualStylingProviders, "count"))
        goto LABEL_9;
      v15 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = 0;
    }

LABEL_9:
    -[CCUICustomContentModuleBackgroundViewController _visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:](self, "_visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:", v17, a4, v11);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_updateHeaderLayoutIfNecessary
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  CGFloat v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  _BOOL4 v19;
  _BOOL4 v20;
  CGFloat v21;
  CGFloat v22;
  UIImageView *headerImageView;
  CCUICAPackageView *packageView;
  UIImageView *v25;
  double Height;
  CCUICAPackageView *v27;
  UILabel *headerTitleLabel;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  -[CCUICustomContentModuleBackgroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[CCUICustomContentModuleBackgroundViewController _headerCenterForBounds:](self, "_headerCenterForBounds:");

  if (!CGFloatIsValid() || !CGFloatIsValid())
    return;
  -[CCUICustomContentModuleBackgroundViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");

  -[UIImageView image](self->_headerImageView, "image");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "size");
  if ((objc_msgSend(v39, "isSymbolImage") & 1) == 0)
  {
    v40.origin.x = CCUIReferenceScreenBounds();
    Width = CGRectGetWidth(v40);
    v6 = (void *)0x1E0DC3000;
    if (Width >= 1024.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v36, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      v38 = 0;
      v9 = 0;
      v10 = 0;
      v8 = 0;
    }
    else
    {
      v41.origin.x = CCUIReferenceScreenBounds();
      v7 = CGRectGetWidth(v41);
      v8 = v7 >= 1024.0;
      if (v7 >= 1024.0
        && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v34, "userInterfaceIdiom") == 1)
        && SBFEffectiveHomeButtonType() == 2)
      {
        v38 = 0;
        v9 = 0;
        v10 = 0;
        v8 = 1;
      }
      else
      {
        v42.origin.x = CCUIReferenceScreenBounds();
        v11 = CGRectGetWidth(v42);
        v10 = v11 >= 834.0;
        if (v11 >= 834.0
          && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v32, "userInterfaceIdiom") == 1)
          && SBFEffectiveHomeButtonType() == 2)
        {
          v38 = 0;
          v9 = 0;
          v10 = 1;
        }
        else
        {
          v43.origin.x = CCUIReferenceScreenBounds();
          v12 = CGRectGetWidth(v43);
          v9 = v12 >= 834.0;
          if (v12 >= 834.0
            && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
                v30 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v30, "userInterfaceIdiom") == 1)
            && SBFEffectiveHomeButtonType() != 2)
          {
            v38 = 0;
            v9 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v37, "userInterfaceIdiom") != 1)
            {
              v44.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v44) < 430.0)
              {
                v45.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v45) < 428.0)
                {
                  v46.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v46) < 414.0 || SBFEffectiveHomeButtonType() != 2)
                  {
                    v47.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v47) < 414.0)
                    {
                      v48.origin.x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v48) < 393.0)
                      {
                        v49.origin.x = CCUIReferenceScreenBounds();
                        if (CGRectGetWidth(v49) < 390.0)
                        {
                          v50.origin.x = CCUIReferenceScreenBounds();
                          if (CGRectGetWidth(v50) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                          {
                            v51.origin.x = CCUIReferenceScreenBounds();
                            CGRectGetWidth(v51);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            v38 = 1;
          }
        }
      }
    }
    v52.origin.x = CCUIReferenceScreenBounds();
    v13 = CGRectGetWidth(v52);
    if (v13 >= 1024.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        v16 = v10;
        v17 = v8;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v15 = 0;
        goto LABEL_66;
      }
    }
    v53.origin.x = CCUIReferenceScreenBounds();
    v14 = CGRectGetWidth(v53);
    v15 = v14 >= 1024.0;
    if (v14 >= 1024.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        v16 = v10;
        v17 = v8;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v15 = 1;
        goto LABEL_66;
      }
    }
    v54.origin.x = CCUIReferenceScreenBounds();
    v21 = CGRectGetWidth(v54);
    v20 = v21 >= 834.0;
    if (v21 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        v16 = v10;
        v17 = v8;
        v18 = 0;
        v19 = 0;
        v20 = 1;
        goto LABEL_66;
      }
    }
    v55.origin.x = CCUIReferenceScreenBounds();
    v22 = CGRectGetWidth(v55);
    v19 = v22 >= 834.0;
    if (v22 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        v16 = v10;
        v17 = v8;
        v18 = 0;
        v19 = 1;
        goto LABEL_66;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom") == 1)
    {
      v16 = v10;
      v17 = v8;
LABEL_61:
      v18 = 1;
      goto LABEL_66;
    }
    v56.origin.x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v56) >= 430.0)
      goto LABEL_59;
    v57.origin.x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v57) >= 428.0)
      goto LABEL_59;
    v58.origin.x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v58) >= 414.0 && SBFEffectiveHomeButtonType() == 2
      || (v59.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v59) >= 414.0))
    {
      v16 = v10;
      v17 = v8;
LABEL_65:
      v18 = 1;
LABEL_66:
      UISizeRoundToScale();
      if (v18)
      {

        if (!v19)
          goto LABEL_68;
      }
      else if (!v19)
      {
LABEL_68:
        if (v20)
          goto LABEL_69;
        goto LABEL_73;
      }

      if (v20)
      {
LABEL_69:

        if (!v15)
        {
LABEL_75:
          if (v13 >= 1024.0)

          if (v38)
          {

            if (!v9)
              goto LABEL_79;
          }
          else if (!v9)
          {
LABEL_79:
            if (v16)
              goto LABEL_80;
            goto LABEL_84;
          }

          if (v16)
          {
LABEL_80:

            if (!v17)
            {
LABEL_86:
              if (Width >= 1024.0)

              goto LABEL_88;
            }
LABEL_85:

            goto LABEL_86;
          }
LABEL_84:
          if (!v17)
            goto LABEL_86;
          goto LABEL_85;
        }
LABEL_74:

        goto LABEL_75;
      }
LABEL_73:
      if (!v15)
        goto LABEL_75;
      goto LABEL_74;
    }
    v60.origin.x = CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v60) >= 393.0)
    {
LABEL_59:
      v16 = v10;
    }
    else
    {
      v16 = v10;
      v61.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v61) < 390.0)
      {
        v17 = v8;
        v62.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v62) < 375.0 || SBFEffectiveHomeButtonType() != 2)
        {
          v63.origin.x = CCUIReferenceScreenBounds();
          CGRectGetWidth(v63);
        }
        goto LABEL_65;
      }
    }
    v17 = v8;
    goto LABEL_61;
  }
LABEL_88:
  headerImageView = self->_headerImageView;
  BSRectWithSize();
  UIRectCenteredAboutPointScale();
  -[UIImageView setFrame:](headerImageView, "setFrame:");
  packageView = self->_packageView;
  -[CCUICAPackageView bounds](packageView, "bounds");
  UIRectCenteredAboutPointScale();
  -[CCUICAPackageView setFrame:](packageView, "setFrame:");
  v25 = self->_headerImageView;
  if (v25)
  {
    -[UIImageView frame](v25, "frame");
    Height = CGRectGetHeight(v64);
  }
  else
  {
    Height = 0.0;
  }
  v27 = self->_packageView;
  if (v27)
  {
    -[CCUICAPackageView frame](v27, "frame", Height);
    Height = CGRectGetHeight(v65);
  }
  if (Height > 0.0)
  {
    -[UILabel frame](self->_headerTitleLabel, "frame");
    CGRectGetHeight(v66);
  }
  headerTitleLabel = self->_headerTitleLabel;
  -[UILabel bounds](headerTitleLabel, "bounds");
  UIRectCenteredAboutPointScale();
  -[UILabel setFrame:](headerTitleLabel, "setFrame:");

}

- (void)_updateCustomHeaderViewLayoutIfNecessary
{
  void *v3;
  UIView *customHeaderView;

  if (self->_customHeaderView)
  {
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    -[CCUICustomContentModuleBackgroundViewController _headerCenterForBounds:](self, "_headerCenterForBounds:");

    if (CGFloatIsValid())
    {
      if (CGFloatIsValid())
      {
        customHeaderView = self->_customHeaderView;
        -[UIView bounds](customHeaderView, "bounds");
        UIRectCenteredAboutPointScale();
        -[UIView setFrame:](customHeaderView, "setFrame:");
      }
    }
  }
}

- (CGPoint)_headerCenterForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double MidX;
  _BOOL4 v15;
  void *v16;
  double MidY;
  CGPoint result;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (CCUILayoutShouldBePortrait(v10))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        if (-[CCUICustomContentModuleBackgroundViewController positionHeaderToRightInLandscapeRight](self, "positionHeaderToRightInLandscapeRight"))
        {
          v15 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") == 4;
        }
        else
        {
          v15 = 0;
        }
        -[CCUICustomContentModuleBackgroundViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        MidY = CGRectGetMidY(v24);
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        objc_msgSend(v16, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v25), 1.0);
        CGRectGetMinX(v26);

        v27.origin.x = x;
        v27.origin.y = y;
        v27.size.width = width;
        v27.size.height = height;
        CGRectGetWidth(v27);
        -[CCUICustomContentModuleBackgroundViewController expandedContentModuleWidth](self, "expandedContentModuleWidth");
        if (v15)
        {
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          CGRectGetWidth(v28);
        }
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        CGRectGetMidY(v29);
        goto LABEL_13;
      }
    }
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MidX = CGRectGetMidX(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    objc_msgSend(v13, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 1, MidX, 0.0, 1.0, CGRectGetHeight(v20));
    CGRectGetMinY(v21);

    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    CGRectGetHeight(v22);
    -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    CGRectGetMidX(v23);
LABEL_13:
    UIPointRoundToViewScale();
    goto LABEL_14;
  }
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_14:
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_updateHeaderGlyphVisualStylingWithProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_headerImageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "renderingMode");

  if (v5 == 2)
    objc_msgSend(v6, "automaticallyUpdateView:withStyle:", self->_headerImageView, 0);
  else
    -[UIImageView mt_removeAllVisualStyling](self->_headerImageView, "mt_removeAllVisualStyling");

}

- (void)_updateTitleFont
{
  UILabel *headerTitleLabel;
  void *v4;
  id v5;

  headerTitleLabel = self->_headerTitleLabel;
  -[CCUICustomContentModuleBackgroundViewController _titleFont](self, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](headerTitleLabel, "setFont:", v4);

  -[UILabel sizeToFit](self->_headerTitleLabel, "sizeToFit");
  -[CCUICustomContentModuleBackgroundViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (id)_titleFont
{
  id v3;
  void *v4;
  UIImageView *headerImageView;
  BOOL v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  if (-[CCUICustomContentModuleBackgroundViewController _shouldLimitContentSizeCategory](self, "_shouldLimitContentSizeCategory"))
  {
    v3 = (id)*MEMORY[0x1E0DC48D0];
  }
  else
  {
    -[CCUICustomContentModuleBackgroundViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  headerImageView = self->_headerImageView;
  v6 = headerImageView == 0;
  if (headerImageView)
    v7 = (_QWORD *)MEMORY[0x1E0DC4AD0];
  else
    v7 = (_QWORD *)MEMORY[0x1E0DC4B50];
  if (v6)
    v8 = 1;
  else
    v8 = 8;
  objc_msgSend(MEMORY[0x1E0DC1350], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *v7, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldLimitContentSizeCategory
{
  void *v2;
  NSString *v3;
  BOOL v4;

  -[CCUICustomContentModuleBackgroundViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  v4 = (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3) <= 1
    && UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;

  return v4;
}

- (void)_updateFooterButtonsLayoutIfNecessary
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t k;
  void *v27;
  double v28;
  double v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double MidY;
  double v40;
  double MaxX;
  double v42;
  double Width;
  double v44;
  double v45;
  NSArray *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v93 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_footerButtons, "count"))
  {
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = -[NSArray count](self->_footerButtons, "count");
    -[NSArray firstObject](self->_footerButtons, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeThatFits:", v9, v11);
    v16 = v15;

    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (CCUILayoutShouldBePortrait(v17))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "userInterfaceIdiom");

      if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        -[CCUICustomContentModuleBackgroundViewController view](self, "view");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v96.origin.x = v5;
        v96.origin.y = v7;
        v96.size.width = v9;
        v96.size.height = v11;
        MidY = CGRectGetMidY(v96);
        v97.origin.x = v5;
        v97.origin.y = v7;
        v97.size.width = v9;
        v97.size.height = v11;
        v40 = 0.0;
        objc_msgSend(v38, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v97), 1.0);
        MaxX = CGRectGetMaxX(v98);

        v99.origin.x = v5;
        v99.origin.y = v7;
        v99.size.width = v9;
        v99.size.height = v11;
        v42 = CGRectGetMaxX(v99) + -16.0;
        if (MaxX >= v42)
          MaxX = v42;
        if (CGFloatIsValid())
        {
          v100.origin.x = v5;
          v100.origin.y = v7;
          v100.size.width = v9;
          v100.size.height = v11;
          v40 = CGRectGetMaxX(v100) - MaxX;
        }
        v101.origin.x = v5;
        v101.origin.y = v7;
        v101.size.width = v9;
        v101.size.height = v11;
        Width = CGRectGetWidth(v101);
        -[CCUICustomContentModuleBackgroundViewController expandedContentModuleWidth](self, "expandedContentModuleWidth");
        v45 = (Width - v44) * 0.5 - v40 + -16.0;
        if (!-[CCUICustomContentModuleBackgroundViewController positionHeaderToRightInLandscapeRight](self, "positionHeaderToRightInLandscapeRight")|| objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") != 4)
        {
          v102.origin.x = v5;
          v102.origin.y = v7;
          v102.size.width = v9;
          v102.size.height = v11;
          CGRectGetWidth(v102);
        }
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v46 = self->_footerButtons;
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
        v48 = 0.0;
        if (v47)
        {
          v49 = v47;
          v50 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v78 != v50)
                objc_enumerationMutation(v46);
              v52 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
              objc_msgSend(v52, "view");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "sizeThatFits:", v45, 0.0);
              v55 = v54;

              objc_msgSend(v52, "view");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              UIRectIntegralWithScale();
              objc_msgSend(v56, "setBounds:");

              v48 = v48 + v55;
            }
            v49 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
          }
          while (v49);
        }

        -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
        v103.origin.x = v5;
        v103.origin.y = v7;
        v103.size.width = v9;
        v103.size.height = v11;
        CGRectGetHeight(v103);
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v30 = self->_footerButtons;
        v57 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v74;
          do
          {
            for (j = 0; j != v58; ++j)
            {
              if (*(_QWORD *)v74 != v59)
                objc_enumerationMutation(v30);
              v61 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
              objc_msgSend(v61, "view");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "bounds");
              v64 = v63;
              v66 = v65;
              v68 = v67;
              v70 = v69;

              objc_msgSend(v61, "view");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v104.origin.x = v64;
              v104.origin.y = v66;
              v104.size.width = v68;
              v104.size.height = v70;
              CGRectGetHeight(v104);
              UIPointIntegral();
              objc_msgSend(v71, "setCenter:");

              objc_msgSend(v61, "view");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "frame");
              CGRectGetMaxY(v105);

            }
            v58 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
          }
          while (v58);
        }
        goto LABEL_43;
      }
    }
    v94.origin.x = v5;
    v94.origin.y = v7;
    v94.size.width = v9;
    v94.size.height = v11;
    CGRectGetHeight(v94);
    -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
    v95.origin.x = v5;
    v95.origin.y = v7;
    v95.size.width = v9;
    v95.size.height = v11;
    v20 = v16 + (CGRectGetWidth(v95) - (double)v12 * v16) / (double)(v12 + 1);
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v21 = self->_footerButtons;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v86;
      v25 = 0.0;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v86 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * k), "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sizeThatFits:", v20 + -12.0, 0.0);
          v29 = v28;

          if (v25 < v29)
            v25 = v29;
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
      }
      while (v23);
    }

    -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v30 = self->_footerButtons;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    if (v31)
    {
      v32 = v31;
      v33 = 0;
      v34 = *(_QWORD *)v82;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v82 != v34)
            objc_enumerationMutation(v30);
          v36 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v35++);
          objc_msgSend(v36, "view");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          UIRectCenteredAboutPoint();
          UIRectIntegralWithScale();
          objc_msgSend(v37, "setFrame:");

        }
        while (v32 != v35);
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
        v33 += v35;
      }
      while (v32);
    }
LABEL_43:

  }
}

- (void)_updateCustomFooterViewLayoutIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (self->_customFooterView)
  {
    -[CCUICustomContentModuleBackgroundViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    -[CCUICustomContentModuleBackgroundViewController _footerCenterForBounds:](self, "_footerCenterForBounds:");
    v5 = v4;
    v7 = v6;

    if (CGFloatIsValid())
    {
      if (CGFloatIsValid())
        -[UIView setCenter:](self->_customFooterView, "setCenter:", v5, v7);
    }
  }
}

- (CGPoint)_footerCenterForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double MidY;
  double v19;
  double MaxX;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CCUICustomContentModuleBackgroundViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (CCUILayoutShouldBePortrait(v8))
  {

LABEL_4:
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v11 = CGRectGetHeight(v28);
    -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
    v13 = (v11 - v12) * 0.5;
    -[CCUICustomContentModuleBackgroundViewController expandedContentModuleHeight](self, "expandedContentModuleHeight");
    v15 = v14 + v13 + v13 * 0.5;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v16 = CGRectGetWidth(v29) * 0.5;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    goto LABEL_4;
  -[CCUICustomContentModuleBackgroundViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MidY = CGRectGetMidY(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v19 = 0.0;
  objc_msgSend(v17, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v31), 1.0);
  MaxX = CGRectGetMaxX(v32);

  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v21 = CGRectGetMaxX(v33) + -16.0;
  if (MaxX >= v21)
    MaxX = v21;
  if (CGFloatIsValid())
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v19 = CGRectGetMaxX(v34) - MaxX;
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v22 = CGRectGetWidth(v35);
  -[CCUICustomContentModuleBackgroundViewController expandedContentModuleWidth](self, "expandedContentModuleWidth");
  v24 = (v22 - v23) * 0.5 - v19 + -16.0;
  if (-[CCUICustomContentModuleBackgroundViewController positionHeaderToRightInLandscapeRight](self, "positionHeaderToRightInLandscapeRight")&& objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") == 4)
  {
    v16 = v19 + v24 * 0.5;
  }
  else
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v16 = CGRectGetWidth(v36) + v24 * -0.5 - v19;
  }
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v15 = CGRectGetHeight(v37) * 0.5;
LABEL_14:
  v25 = v16;
  v26 = v15;
  result.y = v26;
  result.x = v25;
  return result;
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingVisualStylingProvider:(id)a5
{
  id v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v8 = a5;
  v9 = v8;
  if (a4 == 1)
  {
    objc_msgSend(v8, "stopAutomaticallyUpdatingView:", self->_headerImageView);
    -[CCUICustomContentModuleBackgroundViewController _updateHeaderGlyphVisualStylingWithProvider:](self, "_updateHeaderGlyphVisualStylingWithProvider:", v20);
  }
  v19 = v9;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = self->_footerButtons;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "requiredVisualStyleCategories", v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "containsObject:", v17);

        if (v18)
          objc_msgSend(v15, "setVisualStylingProvider:forCategory:", v20, a4);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (double)expandedContentModuleHeight
{
  return self->_expandedContentModuleHeight;
}

- (void)setExpandedContentModuleHeight:(double)a3
{
  self->_expandedContentModuleHeight = a3;
}

- (double)expandedContentModuleWidth
{
  return self->_expandedContentModuleWidth;
}

- (void)setExpandedContentModuleWidth:(double)a3
{
  self->_expandedContentModuleWidth = a3;
}

- (BOOL)positionHeaderToRightInLandscapeRight
{
  return self->_positionHeaderToRightInLandscapeRight;
}

- (void)setPositionHeaderToRightInLandscapeRight:(BOOL)a3
{
  self->_positionHeaderToRightInLandscapeRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFooterView, 0);
  objc_storeStrong((id *)&self->_customHeaderView, 0);
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
}

@end
