@implementation CCUIContentModuleContentContainerView

- (void)layoutSubviews
{
  objc_super v3;

  -[CCUIContentModuleContentContainerView _configureModuleMaterialViewIfNecessary](self, "_configureModuleMaterialViewIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContentContainerView;
  -[CCUIContentModuleContentContainerView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)_configureModuleMaterialViewIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *moduleMaterialView;
  MTMaterialView *v5;

  if (!self->_moduleMaterialView && !self->_moduleProvidesOwnPlatter)
  {
    objc_msgSend(MEMORY[0x1E0D14790], "_moduleBackgroundMaterialView");
    v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    moduleMaterialView = self->_moduleMaterialView;
    self->_moduleMaterialView = v3;

    v5 = self->_moduleMaterialView;
    -[CCUIContentModuleContentContainerView bounds](self, "bounds");
    -[MTMaterialView setFrame:](v5, "setFrame:");
    -[MTMaterialView setAutoresizingMask:](self->_moduleMaterialView, "setAutoresizingMask:", 18);
    -[CCUIContentModuleContentContainerView addSubview:](self, "addSubview:", self->_moduleMaterialView);
    -[CCUIContentModuleContentContainerView sendSubviewToBack:](self, "sendSubviewToBack:", self->_moduleMaterialView);
    -[CCUIContentModuleContentContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setModuleProvidesOwnPlatter:(BOOL)a3
{
  MTMaterialView *moduleMaterialView;

  self->_moduleProvidesOwnPlatter = a3;
  if (a3)
  {
    -[MTMaterialView removeFromSuperview](self->_moduleMaterialView, "removeFromSuperview");
    moduleMaterialView = self->_moduleMaterialView;
    self->_moduleMaterialView = 0;

  }
  else
  {
    -[CCUIContentModuleContentContainerView _configureModuleMaterialViewIfNecessary](self, "_configureModuleMaterialViewIfNecessary");
  }
}

- (void)setExpandedContinuousCornerRadius:(double)a3
{
  self->_expandedContinuousCornerRadius = a3;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  self->_compactContinuousCornerRadius = a3;
}

- (CCUIContentModuleContentContainerView)init
{
  return -[CCUIContentModuleContentContainerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (CCUIContentModuleContentContainerView)initWithFrame:(CGRect)a3
{
  CCUIContentModuleContentContainerView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIContentModuleContentContainerView;
  v3 = -[CCUITouchPassThroughView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIContentModuleContentContainerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CCUIContentModuleContentContainerView setOpaque:](v3, "setOpaque:", 0);
    -[CCUIContentModuleContentContainerView _transitionToExpandedMode:force:](v3, "_transitionToExpandedMode:force:", 0, 1);
  }
  return v3;
}

- (void)addSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIContentModuleContentContainerView;
  -[CCUIContentModuleContentContainerView addSubview:](&v4, sel_addSubview_, a3);
  -[CCUIContentModuleContentContainerView _transitionToExpandedMode:force:](self, "_transitionToExpandedMode:force:", self->_expanded, 1);
}

- (void)_transitionToExpandedMode:(BOOL)a3 force:(BOOL)a4
{
  if (a4 || self->_expanded != a3)
  {
    self->_expanded = a3;
    -[CCUIContentModuleContentContainerView _updateContinuousCornerRadiusIgnoringSubviewClipping:](self, "_updateContinuousCornerRadiusIgnoringSubviewClipping:", a4);
  }
}

- (void)_setContinuousCornerRadius:(double)a3 ignoreSubviewClipping:(BOOL)a4
{
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = 0;
    v7 = 0.0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CCUIContentModuleContentContainerView subviews](self, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v8);
          if (-[CCUIContentModuleContentContainerView _isContentClippingRequiredForSubview:](self, "_isContentClippingRequiredForSubview:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10)))
          {
            v6 = 1;
            v11 = 0.0;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v6 != v10);
        v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = a3;
    a3 = 0.0;
LABEL_13:
    v7 = a3;

    a3 = v11;
  }
  -[MTMaterialView _setContinuousCornerRadius:](self->_moduleMaterialView, "_setContinuousCornerRadius:", a3);
  v12.receiver = self;
  v12.super_class = (Class)CCUIContentModuleContentContainerView;
  -[CCUIContentModuleContentContainerView _setContinuousCornerRadius:](&v12, sel__setContinuousCornerRadius_, v7);
  -[CCUIContentModuleContentContainerView setClipsToBounds:](self, "setClipsToBounds:", v6);
}

- (void)updateContinuousCornerRadius
{
  -[CCUIContentModuleContentContainerView _updateContinuousCornerRadiusIgnoringSubviewClipping:](self, "_updateContinuousCornerRadiusIgnoringSubviewClipping:", 1);
}

- (void)transitionToExpandedMode:(BOOL)a3
{
  -[CCUIContentModuleContentContainerView _transitionToExpandedMode:force:](self, "_transitionToExpandedMode:force:", a3, 0);
}

- (void)didEndTransitionToExpandedMode:(BOOL)a3
{
  if (!a3)
    -[CCUIContentModuleContentContainerView _setContinuousCornerRadius:ignoreSubviewClipping:](self, "_setContinuousCornerRadius:ignoreSubviewClipping:", 1, self->_compactContinuousCornerRadius);
}

- (BOOL)_isContentClippingRequiredForSubview:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "isContentClippingRequired") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          if (-[CCUIContentModuleContentContainerView _isContentClippingRequiredForSubview:](self, "_isContentClippingRequiredForSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)))
          {
            v5 = 1;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_14:

  }
  return v5;
}

- (void)_updateContinuousCornerRadiusIgnoringSubviewClipping:(BOOL)a3
{
  int *v3;

  if (self->_expanded)
    v3 = &OBJC_IVAR___CCUIContentModuleContentContainerView__expandedContinuousCornerRadius;
  else
    v3 = &OBJC_IVAR___CCUIContentModuleContentContainerView__compactContinuousCornerRadius;
  -[CCUIContentModuleContentContainerView _setContinuousCornerRadius:ignoreSubviewClipping:](self, "_setContinuousCornerRadius:ignoreSubviewClipping:", a3, *(double *)((char *)&self->super.super.super.super.isa + *v3));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (self->_expanded && objc_msgSend(v7, "type") == 10)
  {
    -[CCUIContentModuleContentContainerView bounds](self, "bounds");
    UIRectGetCenter();
    x = v9;
    y = v10;
  }
  v13.receiver = self;
  v13.super_class = (Class)CCUIContentModuleContentContainerView;
  -[CCUITouchPassThroughView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)moduleProvidesOwnPlatter
{
  return self->_moduleProvidesOwnPlatter;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (double)expandedContinuousCornerRadius
{
  return self->_expandedContinuousCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleMaterialView, 0);
}

@end
