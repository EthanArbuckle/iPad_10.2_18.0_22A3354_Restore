@implementation MKLookAroundContainerView

- (UIColor)dimmingViewBackgroundColorGreyOpaque
{
  UIColor *dimmingViewBackgroundColorGreyOpaque;
  UIColor *v4;
  UIColor *v5;

  dimmingViewBackgroundColorGreyOpaque = self->_dimmingViewBackgroundColorGreyOpaque;
  if (!dimmingViewBackgroundColorGreyOpaque)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dimmingViewBackgroundColorGreyOpaque;
    self->_dimmingViewBackgroundColorGreyOpaque = v4;

    dimmingViewBackgroundColorGreyOpaque = self->_dimmingViewBackgroundColorGreyOpaque;
  }
  return dimmingViewBackgroundColorGreyOpaque;
}

- (UIColor)dimmingViewBackgroundColorBlackOpaque
{
  UIColor *dimmingViewBackgroundColorBlackOpaque;
  UIColor *v4;
  UIColor *v5;

  dimmingViewBackgroundColorBlackOpaque = self->_dimmingViewBackgroundColorBlackOpaque;
  if (!dimmingViewBackgroundColorBlackOpaque)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 1.0);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dimmingViewBackgroundColorBlackOpaque;
    self->_dimmingViewBackgroundColorBlackOpaque = v4;

    dimmingViewBackgroundColorBlackOpaque = self->_dimmingViewBackgroundColorBlackOpaque;
  }
  return dimmingViewBackgroundColorBlackOpaque;
}

- (UIColor)dimmingViewBackgroundColorBlackTranslucent
{
  UIColor *dimmingViewBackgroundColorBlackTranslucent;
  UIColor *v4;
  UIColor *v5;

  dimmingViewBackgroundColorBlackTranslucent = self->_dimmingViewBackgroundColorBlackTranslucent;
  if (!dimmingViewBackgroundColorBlackTranslucent)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.400000006);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dimmingViewBackgroundColorBlackTranslucent;
    self->_dimmingViewBackgroundColorBlackTranslucent = v4;

    dimmingViewBackgroundColorBlackTranslucent = self->_dimmingViewBackgroundColorBlackTranslucent;
  }
  return dimmingViewBackgroundColorBlackTranslucent;
}

- (UIColor)dimmingViewBackgroundColorClear
{
  UIColor *dimmingViewBackgroundColorClear;
  UIColor *v4;
  UIColor *v5;

  dimmingViewBackgroundColorClear = self->_dimmingViewBackgroundColorClear;
  if (!dimmingViewBackgroundColorClear)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dimmingViewBackgroundColorClear;
    self->_dimmingViewBackgroundColorClear = v4;

    dimmingViewBackgroundColorClear = self->_dimmingViewBackgroundColorClear;
  }
  return dimmingViewBackgroundColorClear;
}

- (UIColor)dimmingViewBackgroundColorPhotosOpaque
{
  UIColor *dimmingViewBackgroundColorPhotosOpaque;
  void *v4;
  UIColor *v5;
  UIColor *v6;

  dimmingViewBackgroundColorPhotosOpaque = self->_dimmingViewBackgroundColorPhotosOpaque;
  if (!dimmingViewBackgroundColorPhotosOpaque)
  {
    -[UIView mk_theme](self, "mk_theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalBackgroundColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dimmingViewBackgroundColorPhotosOpaque;
    self->_dimmingViewBackgroundColorPhotosOpaque = v5;

    dimmingViewBackgroundColorPhotosOpaque = self->_dimmingViewBackgroundColorPhotosOpaque;
  }
  return dimmingViewBackgroundColorPhotosOpaque;
}

- (void)_commonInitWithLookAroundView:(id)a3
{
  MKLookAroundView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  MKLookAroundView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  UIView *dimmingView;
  MKLookAroundContainerBadgeView *v16;
  MKLookAroundContainerBadgeView *badgeView;
  MKLookAroundView *v18;
  MKLookAroundView *v19;

  v18 = (MKLookAroundView *)a3;
  -[MKLookAroundContainerView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[MKLookAroundContainerView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("LookAroundContainer"));
  v4 = v18;
  if (v18)
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v9 = [MKLookAroundView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v4 = -[MKLookAroundView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  }
  v19 = v4;
  -[MKLookAroundView setCompassHidden:](v4, "setCompassHidden:", 1);
  -[MKLookAroundView setAlpha:](v19, "setAlpha:", 0.0);
  -[MKLookAroundView setNavigatingEnabled:](v19, "setNavigatingEnabled:", 0);
  -[MKLookAroundView setPanningEnabled:](v19, "setPanningEnabled:", 0);
  -[MKLookAroundView setZoomingEnabled:](v19, "setZoomingEnabled:", 0);
  -[MKLookAroundView setShowsRoadLabels:](v19, "setShowsRoadLabels:", 0);
  -[MKLookAroundView setShowsPointLabels:](v19, "setShowsPointLabels:", 0);
  -[MKLookAroundContainerView addSubview:](self, "addSubview:", v19);
  -[MKLookAroundContainerView bounds](self, "bounds");
  self->_dimmingState = -1;
  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v10, v11, v12, v13);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v14;

  -[UIView setClipsToBounds:](self->_dimmingView, "setClipsToBounds:", 1);
  -[UIView setUserInteractionEnabled:](self->_dimmingView, "setUserInteractionEnabled:", 0);
  -[MKLookAroundContainerView addSubview:](self, "addSubview:", self->_dimmingView);
  -[MKLookAroundContainerView _updateDimmingViewBackgroundColor](self, "_updateDimmingViewBackgroundColor");
  self->_badgeOnLeadingEdge = 1;
  v16 = -[MKLookAroundContainerBadgeView initWithFrame:]([MKLookAroundContainerBadgeView alloc], "initWithFrame:", v5, v6, v7, v8);
  badgeView = self->_badgeView;
  self->_badgeView = v16;

  -[MKLookAroundContainerBadgeView setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKLookAroundContainerView addSubview:](self, "addSubview:", self->_badgeView);
  -[MKLookAroundContainerView _updateBadgeConstraints](self, "_updateBadgeConstraints");
  -[MKLookAroundContainerView _updateDimmingViewActivityIndicator](self, "_updateDimmingViewActivityIndicator");
  -[MKLookAroundContainerView _updateDimmingStateForLookAroundView:completion:](self, "_updateDimmingStateForLookAroundView:completion:", v19, 0);

}

- (MKLookAroundContainerView)initWithCoder:(id)a3
{
  MKLookAroundContainerView *v3;
  MKLookAroundContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundContainerView;
  v3 = -[MKLookAroundContainerView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MKLookAroundContainerView _commonInitWithLookAroundView:](v3, "_commonInitWithLookAroundView:", 0);
  return v4;
}

- (MKLookAroundContainerView)initWithFrame:(CGRect)a3
{
  MKLookAroundContainerView *v3;
  MKLookAroundContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundContainerView;
  v3 = -[MKLookAroundContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKLookAroundContainerView _commonInitWithLookAroundView:](v3, "_commonInitWithLookAroundView:", 0);
  return v4;
}

- (MKLookAroundContainerView)initWithLookAroundView:(id)a3
{
  id v4;
  MKLookAroundContainerView *v5;
  MKLookAroundContainerView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKLookAroundContainerView;
  v5 = -[MKLookAroundContainerView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_pipDimmingStyle = 1;
    -[MKLookAroundContainerView _commonInitWithLookAroundView:](v5, "_commonInitWithLookAroundView:", v4);
  }

  return v6;
}

- (MKLookAroundContainerView)initWithPhotosDimmingStyle:(BOOL)a3
{
  MKLookAroundContainerView *v4;
  MKLookAroundContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundContainerView;
  v4 = -[MKLookAroundContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_photosDimmingStyle = a3;
    -[MKLookAroundContainerView _commonInitWithLookAroundView:](v4, "_commonInitWithLookAroundView:", 0);
  }
  return v5;
}

- (MKLookAroundContainerView)initWithFloatingDimmingStyle:(BOOL)a3
{
  MKLookAroundContainerView *v4;
  MKLookAroundContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundContainerView;
  v4 = -[MKLookAroundContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_floatingDimmingStyle = a3;
    -[MKLookAroundContainerView _commonInitWithLookAroundView:](v4, "_commonInitWithLookAroundView:", 0);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_lookAroundViewDidBecomeAdequatelyDrawnObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_lookAroundViewDidBecomeAdequatelyDrawnObserver);

  }
  if (self->_lookAroundViewDidBecomeFullyDrawnObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_lookAroundViewDidBecomeFullyDrawnObserver);

  }
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundContainerView;
  -[MKLookAroundContainerView dealloc](&v5, sel_dealloc);
}

- (void)setMapItem:(id)a3
{
  -[MKLookAroundContainerView setMapItem:wantsCloseUpView:](self, "setMapItem:wantsCloseUpView:", a3, 0);
}

- (void)setMapItem:(id)a3 wantsCloseUpView:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  objc_storeStrong((id *)&self->_mapItem, a3);
  v7 = v12;
  if (v12)
  {
    -[MKLookAroundContainerView lookAroundViewIfPresent](self, "lookAroundViewIfPresent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "mapItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v12)
      {
        if (v4)
          objc_msgSend(v9, "moveToCloseUpView");
      }
      else
      {
        +[MKLookAroundEntryPoint entryPointWithMapItem:wantsCloseUpView:triggerAction:](MKLookAroundEntryPoint, "entryPointWithMapItem:wantsCloseUpView:triggerAction:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enterLookAroundWithEntryPoint:", v11);

        -[MKLookAroundContainerView _updateDimmingStateForLookAroundView:completion:](self, "_updateDimmingStateForLookAroundView:completion:", v9, 0);
      }
    }

    v7 = v12;
  }

}

- (id)lookAroundViewIfPresent
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[MKLookAroundContainerView subviews](self, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)didAddSubview:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKLookAroundContainerView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[MKLookAroundContainerView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lookAroundContainerView:didAddLookAroundView:", self, v7);

    }
  }

}

- (void)layoutSubviews
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[16];

  MKGetMKLookAroundLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LookAroundContainerLayoutSubviews", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundContainerView;
  -[MKLookAroundContainerView layoutSubviews](&v14, sel_layoutSubviews);
  -[MKLookAroundContainerView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MKLookAroundContainerView lookAroundViewIfPresent](self, "lookAroundViewIfPresent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[UIView setFrame:](self->_dimmingView, "setFrame:", v5, v7, v9, v11);
  MKGetMKLookAroundLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LookAroundContainerLayoutSubviews", (const char *)&unk_18B2CC343, buf, 2u);
  }

}

- (void)setBadgeOnLeadingEdge:(BOOL)a3
{
  if (self->_badgeOnLeadingEdge != a3)
  {
    self->_badgeOnLeadingEdge = a3;
    -[MKLookAroundContainerView _updateBadgeConstraints](self, "_updateBadgeConstraints");
  }
}

- (void)_updateBadgeConstraints
{
  NSArray *badgeConstraints;
  void *v4;
  int v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MKLookAroundContainerBadgeView *badgeView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (self->_badgeConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    badgeConstraints = self->_badgeConstraints;
    self->_badgeConstraints = 0;

  }
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 2)
    v6 = 10.0;
  else
    v6 = 8.0;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[MKLookAroundContainerBadgeView bottomAnchor](self->_badgeView, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  badgeView = self->_badgeView;
  if (self->_badgeOnLeadingEdge)
  {
    -[MKLookAroundContainerBadgeView leadingAnchor](badgeView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    v19 = v17;
    v20 = v6;
  }
  else
  {
    -[MKLookAroundContainerBadgeView trailingAnchor](badgeView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    v19 = v17;
    v20 = -v6;
  }
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v21);

  v22 = (NSArray *)objc_msgSend(v13, "copy");
  v23 = self->_badgeConstraints;
  self->_badgeConstraints = v22;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_badgeConstraints);
}

- (BOOL)isBadgeHidden
{
  return -[MKLookAroundContainerBadgeView isHidden](self->_badgeView, "isHidden");
}

- (void)setBadgeHidden:(BOOL)a3
{
  -[MKLookAroundContainerView setBadgeHidden:animated:](self, "setBadgeHidden:animated:", a3, 0);
}

- (void)setBadgeHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  MKLookAroundContainerBadgeView *v6;
  uint64_t v7;
  MKLookAroundContainerBadgeView *v8;
  void (**v9)(_QWORD);
  MKLookAroundContainerBadgeView *v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  MKLookAroundContainerBadgeView *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  MKLookAroundContainerBadgeView *v22;
  BOOL v23;

  v4 = a4;
  v6 = self->_badgeView;
  if (-[MKLookAroundContainerBadgeView isHidden](v6, "isHidden"))
    -[MKLookAroundContainerBadgeView setHidden:](v6, "setHidden:", 0);
  v7 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke;
  v21 = &unk_1E20D8320;
  v23 = a3;
  v8 = v6;
  v22 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x18D778DB8](&v18);
  v12 = v7;
  v13 = 3221225472;
  v14 = __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke_2;
  v15 = &unk_1E20D8348;
  LOBYTE(v17) = a3;
  v16 = v8;
  v10 = v8;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](&v12);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v9, v11, 0.25, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    v9[2](v9);
    v11[2](v11, 1);
  }

}

uint64_t __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __53__MKLookAroundContainerView_setBadgeHidden_animated___block_invoke_2(uint64_t a1)
{
  double v2;

  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setDimmingState:(unint64_t)a3
{
  -[MKLookAroundContainerView setDimmingState:animated:](self, "setDimmingState:animated:", a3, 0);
}

- (void)setDimmingState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_dimmingState != a3)
  {
    self->_dimmingState = a3;
    -[MKLookAroundContainerView _setDimmingViewHidden:loading:animated:](self, "_setDimmingViewHidden:loading:animated:", a3 == 0, a3 == 2, a4);
  }
}

- (void)_setDimmingViewHidden:(BOOL)a3 loading:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  UIView *v9;
  void *v10;
  UIActivityIndicatorView *v11;
  UIActivityIndicatorView *v12;
  BOOL photosDimmingStyle;
  uint64_t v14;
  UIView *v15;
  id v16;
  void (**v17)(_QWORD);
  UIActivityIndicatorView *v18;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  UIActivityIndicatorView *v24;
  MKLookAroundContainerView *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  UIView *v31;
  id v32;
  BOOL v33;
  BOOL v34;

  v5 = a5;
  v6 = a4;
  v9 = self->_dimmingView;
  -[MKLookAroundContainerView lookAroundViewIfPresent](self, "lookAroundViewIfPresent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_activityIndicator;
  v12 = v11;
  if (v6)
    -[UIActivityIndicatorView startAnimating](v11, "startAnimating");
  photosDimmingStyle = self->_photosDimmingStyle;
  v14 = MEMORY[0x1E0C809B0];
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke;
  v30 = &unk_1E20DCC90;
  v33 = a3;
  v34 = photosDimmingStyle;
  v15 = v9;
  v31 = v15;
  v16 = v10;
  v32 = v16;
  v17 = (void (**)(_QWORD))MEMORY[0x18D778DB8](&v27);
  v20 = v14;
  v21 = 3221225472;
  v22 = __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke_2;
  v23 = &unk_1E20DCCB8;
  LOBYTE(v26) = v6;
  v24 = v12;
  v25 = self;
  BYTE1(v26) = a3;
  v18 = v12;
  v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](&v20);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v17, v19, 0.25, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
  }
  else
  {
    v17[2](v17);
    v19[2](v19, 1);
  }

}

uint64_t __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = 1.0;
    v3 = 0.0;
  }
  else
  {
    v3 = 1.0;
    if (*(_BYTE *)(a1 + 49))
      v2 = 0.0;
    else
      v2 = 1.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v2);
}

uint64_t __68__MKLookAroundContainerView__setDimmingViewHidden_loading_animated___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (!*(_BYTE *)(result + 48))
    result = objc_msgSend(*(id *)(result + 32), "stopAnimating");
  v2 = *(_QWORD *)(v1 + 40);
  if (*(_BYTE *)(v2 + 467) && *(_BYTE *)(v1 + 49) && !*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v2 + 467) = 0;
    objc_msgSend(*(id *)(v1 + 40), "_updateDimmingViewActivityIndicator");
    return objc_msgSend(*(id *)(v1 + 40), "_updateDimmingViewBackgroundColor");
  }
  return result;
}

- (void)cancelIfPresent
{
  void *v2;
  id v3;

  -[MKLookAroundContainerView lookAroundViewIfPresent](self, "lookAroundViewIfPresent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "removeFromSuperview");
    v2 = v3;
  }

}

- (void)infoCardThemeChanged
{
  UIColor *dimmingViewBackgroundColorPhotosOpaque;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKLookAroundContainerView;
  -[UIView infoCardThemeChanged](&v4, sel_infoCardThemeChanged);
  dimmingViewBackgroundColorPhotosOpaque = self->_dimmingViewBackgroundColorPhotosOpaque;
  self->_dimmingViewBackgroundColorPhotosOpaque = 0;

  -[MKLookAroundContainerView _updateDimmingViewBackgroundColor](self, "_updateDimmingViewBackgroundColor");
}

- (void)_updateDimmingStateForLookAroundView:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  _BOOL4 floatingDimmingStyle;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  NSObject *v13;
  NSObject *lookAroundViewDidBecomeAdequatelyDrawnObserver;
  void *v15;
  int v16;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *lookAroundViewDidBecomeFullyDrawnObserver;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  id v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  id v28;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  floatingDimmingStyle = self->_floatingDimmingStyle;
  if ((objc_msgSend(v6, "adequatelyDrawn") & 1) == 0 && !floatingDimmingStyle)
  {
    -[MKLookAroundContainerView setDimmingState:animated:](self, "setDimmingState:animated:", 2, 0);
    objc_initWeak(&location, self);
    if (self->_lookAroundViewDidBecomeAdequatelyDrawnObserver)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:", self->_lookAroundViewDidBecomeAdequatelyDrawnObserver);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke;
    v26[3] = &unk_1E20DCCE0;
    v12 = &v28;
    objc_copyWeak(&v28, &location);
    v27 = v7;
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", CFSTR("MKLookAroundViewDidBecomeAdequatelyDrawn"), v6, v11, v26);
    v13 = objc_claimAutoreleasedReturnValue();
    lookAroundViewDidBecomeAdequatelyDrawnObserver = self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
    self->_lookAroundViewDidBecomeAdequatelyDrawnObserver = v13;

    v15 = v27;
LABEL_16:

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
    goto LABEL_17;
  }
  v16 = objc_msgSend(v6, "isLoading");
  if (floatingDimmingStyle && v16 != 0)
  {
    -[MKLookAroundContainerView setDimmingState:animated:](self, "setDimmingState:animated:", 2, 0);
    objc_initWeak(&location, self);
    if (self->_lookAroundViewDidBecomeFullyDrawnObserver)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObserver:", self->_lookAroundViewDidBecomeFullyDrawnObserver);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke_2;
    v23[3] = &unk_1E20DCCE0;
    v12 = &v25;
    objc_copyWeak(&v25, &location);
    v24 = v7;
    objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", CFSTR("MKLookAroundViewDidBecomeFullyDrawn"), v6, v20, v23);
    v21 = objc_claimAutoreleasedReturnValue();
    lookAroundViewDidBecomeFullyDrawnObserver = self->_lookAroundViewDidBecomeFullyDrawnObserver;
    self->_lookAroundViewDidBecomeFullyDrawnObserver = v21;

    v15 = v24;
    goto LABEL_16;
  }
  -[MKLookAroundContainerView setDimmingState:animated:](self, "setDimmingState:animated:", 0, 0);
  if (v7)
    v7[2](v7);
LABEL_17:

}

void __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEnteredLookAround");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "lookAroundViewDidBecomeAdequatelyDrawnObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v7);

    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "setLookAroundViewDidBecomeAdequatelyDrawnObserver:", 0);

    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "_updateDimmingViewBackgroundColor");

    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "setDimmingState:animated:", 0, 1);

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
  }
}

void __77__MKLookAroundContainerView__updateDimmingStateForLookAroundView_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEnteredLookAround");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "lookAroundViewDidBecomeFullyDrawnObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v7);

    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "setLookAroundViewDidBecomeFullyDrawnObserver:", 0);

    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "_updateDimmingViewBackgroundColor");

    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "setDimmingState:animated:", 0, 1);

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
  }
}

- (void)_updateDimmingViewActivityIndicator
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    if (self->_photosDimmingStyle || self->_pipDimmingStyle || self->_floatingDimmingStyle)
    {
      -[UIActivityIndicatorView removeFromSuperview](activityIndicator, "removeFromSuperview");
      v4 = self->_activityIndicator;
      self->_activityIndicator = 0;

    }
  }
  else if (!self->_photosDimmingStyle && !self->_pipDimmingStyle && !self->_floatingDimmingStyle)
  {
    v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    v6 = self->_activityIndicator;
    self->_activityIndicator = v5;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_activityIndicator, "setColor:", v7);

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_dimmingView, "addSubview:", self->_activityIndicator);
    v8 = (void *)MEMORY[0x1E0CB3718];
    -[UIActivityIndicatorView centerXAnchor](self->_activityIndicator, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_dimmingView, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    -[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_dimmingView, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v15);

  }
}

- (void)_updateDimmingViewBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[MKLookAroundContainerView lookAroundViewIfPresent](self, "lookAroundViewIfPresent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_floatingDimmingStyle)
  {
    -[MKLookAroundContainerView dimmingViewBackgroundColorGreyOpaque](self, "dimmingViewBackgroundColorGreyOpaque");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (self->_photosDimmingStyle)
  {
    -[MKLookAroundContainerView dimmingViewBackgroundColorPhotosOpaque](self, "dimmingViewBackgroundColorPhotosOpaque");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (self->_pipDimmingStyle)
  {
    -[MKLookAroundContainerView dimmingViewBackgroundColorClear](self, "dimmingViewBackgroundColorClear");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v3, "hasEnteredLookAround") & 1) != 0)
      -[MKLookAroundContainerView dimmingViewBackgroundColorBlackTranslucent](self, "dimmingViewBackgroundColorBlackTranslucent");
    else
      -[MKLookAroundContainerView dimmingViewBackgroundColorBlackOpaque](self, "dimmingViewBackgroundColorBlackOpaque");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v5;
  -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v5);

}

- (MKLookAroundContainerViewDelegate)delegate
{
  return (MKLookAroundContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)isBadgeOnLeadingEdge
{
  return self->_badgeOnLeadingEdge;
}

- (unint64_t)dimmingState
{
  return self->_dimmingState;
}

- (BOOL)floatingDimmingStyle
{
  return self->_floatingDimmingStyle;
}

- (void)setFloatingDimmingStyle:(BOOL)a3
{
  self->_floatingDimmingStyle = a3;
}

- (BOOL)photosDimmingStyle
{
  return self->_photosDimmingStyle;
}

- (void)setPhotosDimmingStyle:(BOOL)a3
{
  self->_photosDimmingStyle = a3;
}

- (BOOL)pipDimmingStyle
{
  return self->_pipDimmingStyle;
}

- (void)setPipDimmingStyle:(BOOL)a3
{
  self->_pipDimmingStyle = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (MKLookAroundContainerBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (NSObject)lookAroundViewDidBecomeAdequatelyDrawnObserver
{
  return self->_lookAroundViewDidBecomeAdequatelyDrawnObserver;
}

- (void)setLookAroundViewDidBecomeAdequatelyDrawnObserver:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeAdequatelyDrawnObserver, a3);
}

- (NSObject)lookAroundViewDidBecomeFullyDrawnObserver
{
  return self->_lookAroundViewDidBecomeFullyDrawnObserver;
}

- (void)setLookAroundViewDidBecomeFullyDrawnObserver:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeFullyDrawnObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeFullyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_lookAroundViewDidBecomeAdequatelyDrawnObserver, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorPhotosOpaque, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorClear, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorBlackTranslucent, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorBlackOpaque, 0);
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColorGreyOpaque, 0);
}

@end
