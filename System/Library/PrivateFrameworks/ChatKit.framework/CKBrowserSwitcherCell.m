@implementation CKBrowserSwitcherCell

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherCell;
  -[CKBrowserSwitcherCell dealloc](&v4, sel_dealloc);
}

- (CKBrowserSwitcherCell)initWithFrame:(CGRect)a3
{
  CKBrowserSwitcherCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKBrowserSwitcherCell;
  v3 = -[CKBrowserSwitcherCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleBrowserSnapshotDidChange_, CFSTR("CKBalloonPluginManagerSnapshotsDidChange"), 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browserBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherCell setBackgroundColor:](v3, "setBackgroundColor:", v7);

  }
  return v3;
}

- (void)setPlugin:(id)a3 withSnapshotCacheKey:(id)a4
{
  id v6;

  v6 = a4;
  -[CKBrowserSwitcherCell setPlugin:](self, "setPlugin:", a3);
  -[CKBrowserSwitcherCell setSnapshotCacheKey:](self, "setSnapshotCacheKey:", v6);

}

- (void)setSnapshotCacheKey:(id)a3
{
  CKSnapshotCacheKey *v5;
  CKSnapshotCacheKey *snapshotCacheKey;
  BOOL v7;
  CKSnapshotCacheKey *v8;

  v5 = (CKSnapshotCacheKey *)a3;
  snapshotCacheKey = self->_snapshotCacheKey;
  if (snapshotCacheKey != v5)
  {
    v8 = v5;
    v7 = -[CKSnapshotCacheKey isEqual:](snapshotCacheKey, "isEqual:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_snapshotCacheKey, a3);
      v5 = v8;
      if (self->_snapshotCacheKey)
      {
        -[CKBrowserSwitcherCell _updateSnapshotView](self, "_updateSnapshotView");
        v5 = v8;
      }
    }
  }

}

- (void)setBrowserSnapshotView:(id)a3
{
  UIView *v5;
  UIView **p_browserSnapshotView;
  UIView *browserSnapshotView;
  CKBrowserSwitcherCell *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_browserSnapshotView = &self->_browserSnapshotView;
  browserSnapshotView = self->_browserSnapshotView;
  if (browserSnapshotView != v5)
  {
    v9 = v5;
    -[UIView superview](browserSnapshotView, "superview");
    v8 = (CKBrowserSwitcherCell *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UIView removeFromSuperview](*p_browserSnapshotView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_browserSnapshotView, a3);
    -[CKBrowserSwitcherCell addSubview:](self, "addSubview:", *p_browserSnapshotView);
    -[CKBrowserSwitcherCell setNeedsLayout](self, "setNeedsLayout");
    -[CKBrowserSwitcherCell layoutIfNeeded](self, "layoutIfNeeded");
    v5 = v9;
  }

}

- (void)showExtensionInterruptedViewWithDisplayName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v4 = a3;
  -[CKBrowserSwitcherCell extensionInterruptedView](self, "extensionInterruptedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKBrowserSwitcherCell extensionInterruptedView](self, "extensionInterruptedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  -[CKBrowserSwitcherCell browserSnapshotView](self, "browserSnapshotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKBrowserSwitcherCell browserSnapshotView](self, "browserSnapshotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[CKBrowserSwitcherCell setBrowserSnapshotView:](self, "setBrowserSnapshotView:", 0);
  }
  -[CKBrowserSwitcherCell bounds](self, "bounds");
  v10 = v9 + -50.0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chatChromeBottomInset");
  v13 = (v10 - v12) * 0.5;

  v14 = objc_alloc(MEMORY[0x1E0CEA700]);
  -[CKBrowserSwitcherCell bounds](self, "bounds");
  v25 = (id)objc_msgSend(v14, "initWithFrame:", 0.0, v13);
  v15 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("MESSAGES_EXTENSION_CRASHED_SWITCHER"), &stru_1E276D870, CFSTR("ChatKit"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v17, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceLayoutDirection");

  if (v20 == 1)
    v21 = CFSTR("\u200F");
  else
    v21 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setText:", v22);
  objc_msgSend(v25, "setTextAlignment:", 1);
  v23 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[CKBrowserSwitcherCell bounds](self, "bounds");
  v24 = (void *)objc_msgSend(v23, "initWithFrame:");
  objc_msgSend(v24, "addSubview:", v25);
  -[CKBrowserSwitcherCell setExtensionInterruptedView:](self, "setExtensionInterruptedView:", v24);
  -[CKBrowserSwitcherCell addSubview:](self, "addSubview:", v24);
  -[CKBrowserSwitcherCell setNeedsLayout](self, "setNeedsLayout");
  -[CKBrowserSwitcherCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherCell;
  -[CKBrowserSwitcherCell layoutSubviews](&v4, sel_layoutSubviews);
  -[CKBrowserSwitcherCell browserSnapshotView](self, "browserSnapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherCell bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (id)balloonPluginManager
{
  return +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
}

- (void)_updateSnapshotView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;

  -[CKBrowserSwitcherCell balloonPluginManager](self, "balloonPluginManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherCell snapshotCacheKey](self, "snapshotCacheKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserSnapshotForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBrowserSwitcherCell setUsingFallbackSnapshot:](self, "setUsingFallbackSnapshot:", v5 == 0);
  if (-[CKBrowserSwitcherCell isUsingFallbackSnapshot](self, "isUsingFallbackSnapshot"))
  {
    -[CKBrowserSwitcherCell plugin](self, "plugin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherCell traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
    v10 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v11 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[CKBrowserSwitcherCell bounds](self, "bounds");
    v28 = (id)objc_msgSend(v10, "initWithFrame:", v11, v12);

    objc_msgSend(v28, "addSubview:", v9);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appIconSize");
    v15 = v14;
    v17 = v16;
    -[CKBrowserSwitcherCell bounds](self, "bounds");
    v19 = v18;
    -[CKBrowserSwitcherCell bounds](self, "bounds");
    v21 = floor((v20 - v17) * 0.5) + 0.0;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "chatChromeBottomInset");
    v24 = v21 - v23 * 0.5;

    objc_msgSend(v9, "setFrame:", floor((v19 - v15) * 0.5) + 0.0, v24, v15, v17);
    if (_IMWillLog())
    {
      -[CKBrowserSwitcherCell plugin](self, "plugin");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v28;
      _IMAlwaysLog();

    }
    v25 = v28;
  }
  else
  {
    v25 = v5;
  }
  v29 = v25;
  -[CKBrowserSwitcherCell setBrowserSnapshotView:](self, "setBrowserSnapshotView:", v25, v26, v27);

}

- (void)_handleBrowserSnapshotDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CKBrowserSwitcherCell__handleBrowserSnapshotDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__CKBrowserSwitcherCell__handleBrowserSnapshotDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotView");
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_plugin, a3);
}

- (BOOL)isUsingFallbackSnapshot
{
  return self->_usingFallbackSnapshot;
}

- (void)setUsingFallbackSnapshot:(BOOL)a3
{
  self->_usingFallbackSnapshot = a3;
}

- (UIView)browserSnapshotView
{
  return self->_browserSnapshotView;
}

- (UIView)extensionInterruptedView
{
  return self->_extensionInterruptedView;
}

- (void)setExtensionInterruptedView:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInterruptedView, a3);
}

- (CKSnapshotCacheKey)snapshotCacheKey
{
  return self->_snapshotCacheKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCacheKey, 0);
  objc_storeStrong((id *)&self->_extensionInterruptedView, 0);
  objc_storeStrong((id *)&self->_browserSnapshotView, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
}

@end
