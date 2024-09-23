@implementation SFCapsuleView

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    self->_needsUpdateTheme = 1;
    -[SFCapsuleView setNeedsLayout](self, "setNeedsLayout");
    -[SFCapsuleView _updateContentViewState](self, "_updateContentViewState");
    -[SFCapsuleView _updateShadowViewTransform](self, "_updateShadowViewTransform");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    -[SFCapsuleView _updateContentViewState](self, "_updateContentViewState");
  }
}

- (void)setBackgroundHeight:(double)a3
{
  if (self->_backgroundHeight != a3)
  {
    self->_backgroundHeight = a3;
    -[SFCapsuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAccessoryView:(id)a3 coordinator:(id)a4
{
  id v7;
  id v8;
  UIView *v9;
  uint64_t v10;
  UIView *v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v15[4];
  UIView *v16;
  SFCapsuleView *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  _QWORD aBlock[4];
  UIView *v24;
  SFCapsuleView *v25;

  v7 = a3;
  v8 = a4;
  v9 = self->_accessoryView;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke;
  aBlock[3] = &unk_1E21E2258;
  v11 = v9;
  v24 = v11;
  v25 = self;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_storeStrong((id *)&self->_accessoryView, a3);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_2;
  v22[3] = &unk_1E21E3A50;
  v22[4] = self;
  v13 = _Block_copy(v22);
  if (self->_accessoryView)
  {
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_3;
    v19[3] = &unk_1E21E2280;
    v19[4] = self;
    v20 = v8;
    v21 = v13;
    objc_msgSend(v14, "performWithoutAnimation:", v19);

  }
  -[SFCapsuleView setNeedsLayout](self, "setNeedsLayout");
  if (v8)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_4;
    v15[3] = &unk_1E21E3A78;
    v18 = v13;
    v16 = v11;
    v17 = self;
    objc_msgSend(v8, "addAnimations:", v15);
    objc_msgSend(v8, "addCompletion:", v12);

  }
  else
  {
    v12[2](v12);
  }

}

void __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(_QWORD **)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v2[62];

    if (v3 != v4)
      objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  }
  else
  {

  }
}

- (void)setAccessoryView:(id)a3
{
  -[SFCapsuleView setAccessoryView:coordinator:](self, "setAccessoryView:coordinator:", a3, 0);
}

- (NSString)reusableContentViewIdentifier
{
  return self->_reusableContentViewIdentifier;
}

- (void)setReusableContentViewIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void)setContentView:(id)a3
{
  id v5;
  id v6;
  UIView **p_cachedContentView;
  void (**v8)(void *, SFCapsuleView *, id, id);
  char v9;
  uint64_t v10;
  void *v11;
  UIView *v12;
  UIView *v13;
  void *v14;
  _QWORD v15[5];
  UIView *v16;
  _QWORD v17[4];
  UIView *v18;
  SFCapsuleView *v19;
  UIView *v20;
  _QWORD v21[4];
  id v22;
  id location[2];

  v5 = a3;
  objc_initWeak(location, self);
  -[SFCapsuleView contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    p_cachedContentView = &self->_cachedContentView;
    objc_storeStrong((id *)&self->_cachedContentView, a3);
    v8 = (void (**)(void *, SFCapsuleView *, id, id))_Block_copy(self->_contentViewUpdateHandler);
    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "prepareForDeferredRemoval");
    }
    else
    {
      objc_msgSend(v6, "removeFromSuperview");
    }
    -[SFCapsuleView _updateStateWithContentView:](self, "_updateStateWithContentView:", v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setTheme:", self->_theme);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setLayoutStyle:", self->_layoutStyle);
    v9 = objc_opt_respondsToSelector();
    v10 = MEMORY[0x1E0C809B0];
    if ((v9 & 1) != 0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __32__SFCapsuleView_setContentView___block_invoke;
      v21[3] = &unk_1E21E2AE8;
      objc_copyWeak(&v22, location);
      objc_msgSend(v5, "setHighlightObserver:", v21);
      objc_destroyWeak(&v22);
    }
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __32__SFCapsuleView_setContentView___block_invoke_2;
    v17[3] = &unk_1E21E22F8;
    v12 = (UIView *)v5;
    v18 = v12;
    v19 = self;
    v13 = (UIView *)v6;
    v20 = v13;
    objc_msgSend(v11, "performWithoutAnimation:", v17);
    -[SFCapsuleView setNeedsLayout](self, "setNeedsLayout");
    if (*p_cachedContentView == v12)
    {
      if (v8 && v13)
      {
        v8[2](v8, self, v13, v12);
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0DC3F10];
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __32__SFCapsuleView_setContentView___block_invoke_3;
        v15[3] = &unk_1E21E2258;
        v15[4] = self;
        v16 = v12;
        objc_msgSend(v14, "performWithoutAnimation:", v15);

      }
    }
    else if (v13 != *p_cachedContentView
           && -[UIView isDescendantOfView:](v13, "isDescendantOfView:", self->_contentContainer))
    {
      -[UIView removeFromSuperview](v13, "removeFromSuperview");
    }

  }
  objc_destroyWeak(location);

}

- (UIView)contentView
{
  UIView *v3;
  UIView *contentContainer;
  UIView *v5;

  -[UIView superview](self->_cachedContentView, "superview");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentContainer = self->_contentContainer;

  if (v3 == contentContainer)
    v5 = self->_cachedContentView;
  else
    v5 = 0;
  return v5;
}

- (void)setVisualEffectGroupName:(id)a3
{
  -[UIVisualEffectView _setGroupName:](self->_background, "_setGroupName:", a3);
}

- (void)setMinimizedTheme:(id)a3
{
  _BOOL4 v5;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5 = -[SFCapsuleView _usesMinimizedTheme](self, "_usesMinimizedTheme");
    objc_storeStrong((id *)&self->_minimizedTheme, a3);
    if (-[SFCapsuleView _usesMinimizedTheme](self, "_usesMinimizedTheme") || v5)
      -[SFCapsuleView applyTheme](self, "applyTheme");
  }

}

- (void)setTheme:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[_SFBarTheme isEqual:](self->_theme, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_theme, a3);
    if (!-[SFCapsuleView _usesMinimizedTheme](self, "_usesMinimizedTheme"))
      -[SFCapsuleView applyTheme](self, "applyTheme");
  }

}

- (void)setLayoutStyle:(int64_t)a3
{
  id v5;

  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[SFCapsuleView applyTheme](self, "applyTheme");
    -[SFCapsuleView contentView](self, "contentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setLayoutStyle:", a3);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double contentHeight;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double *v29;
  double v30;
  double v31;
  CGFloat Height;
  void *v33;
  SFCapsuleView *v34;
  double trailing;
  CGFloat v36;
  double v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v38.receiver = self;
  v38.super_class = (Class)SFCapsuleView;
  -[SFCapsuleView layoutSubviews](&v38, sel_layoutSubviews);
  -[SFCapsuleView _accessoryEdge](self, "_accessoryEdge");
  -[UIView sizeThatFits:](self->_accessoryView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v37 = v3;
  v5 = v4;
  -[SFCapsuleView bounds](self, "bounds");
  v36 = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SFCapsuleView _boundsForContent](self, "_boundsForContent");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  contentHeight = v19;
  -[SFCapsuleView _backgroundFrame](self, "_backgroundFrame");
  -[UIVisualEffectView ss_setUntransformedFrame:](self->_background, "ss_setUntransformedFrame:");
  if (self->_needsUpdateTheme)
  {
    self->_needsUpdateTheme = 0;
    -[SFCapsuleView applyTheme](self, "applyTheme");
  }
  if (-[SFCapsuleView isMinimized](self, "isMinimized"))
  {
    -[SFCapsuleView safeAreaInsets](self, "safeAreaInsets");
    UIEdgeInsetsMin();
    v14 = v14 + v21;
    v16 = v16 + v22;
    v18 = v18 - (v21 + v23);
    contentHeight = contentHeight - (v22 + v24);
  }
  -[SFCapsuleView _collapsedContentInsetEdge](self, "_collapsedContentInsetEdge");
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = contentHeight;
  CGRectGetWidth(v39);
  UIEdgeInsetsMakeWithEdges();
  -[UIView ss_setUntransformedFrame:](self->_contentContainer, "ss_setUntransformedFrame:", v14 + v28, v16 + v25, v18 - (v28 + v26), contentHeight - (v25 + v27));
  if (!self->_reloadingWithCoordinator)
  {
    v29 = (double *)MEMORY[0x1E0C9D538];
    if (-[SFCapsuleView _collapsedContentInsetEdge](self, "_collapsedContentInsetEdge") == 8)
    {
      v40.origin.x = v14;
      v40.origin.y = v16;
      v40.size.width = v18;
      v40.size.height = contentHeight;
      v30 = -CGRectGetWidth(v40);
    }
    else
    {
      v30 = *v29;
    }
    v31 = v29[1];
    if (self->_contentHeight != 0.0)
    {
      v41.origin.x = v30;
      v41.origin.y = v29[1];
      v41.size.width = v18;
      v41.size.height = contentHeight;
      Height = CGRectGetHeight(v41);
      contentHeight = self->_contentHeight;
      v31 = (Height - contentHeight) * 0.5;
    }
    -[SFCapsuleView contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "ss_setUntransformedFrame:", v30, v31, v18, contentHeight);

  }
  -[SFShadowView superview](self->_shadowView, "superview");
  v34 = (SFCapsuleView *)objc_claimAutoreleasedReturnValue();

  if (v34 == self)
  {
    -[SFCapsuleView frameForShadowView](self, "frameForShadowView");
    -[UIView ss_setUntransformedFrame:](self->_shadowView, "ss_setUntransformedFrame:");
    -[SFCapsuleView _updateShadowViewTransform](self, "_updateShadowViewTransform");
  }
  if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
  {
    v42.origin.x = v36;
    v42.origin.y = v8;
    v42.size.width = v10;
    v42.size.height = v12;
    trailing = CGRectGetWidth(v42) - (v37 + self->_accessoryViewInsets.trailing);
  }
  else
  {
    trailing = self->_accessoryViewInsets.trailing;
  }
  v43.origin.x = v36;
  v43.origin.y = v8;
  v43.size.width = v10;
  v43.size.height = v12;
  -[UIView setFrame:](self->_accessoryView, "setFrame:", trailing, (CGRectGetHeight(v43) - v5) * 0.5, v37, v5);
}

- (CGRect)_boundsForContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[SFCapsuleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFCapsuleView _accessoryEdge](self, "_accessoryEdge");
  -[UIView sizeThatFits:](self->_accessoryView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  UIEdgeInsetsMakeWithEdges();
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (unint64_t)_accessoryEdge
{
  if (!self->_accessoryView)
    return 0;
  if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
    return 8;
  return 2;
}

- (void)_updateContentViewState
{
  id v3;

  -[SFCapsuleView contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleView _updateStateWithContentView:](self, "_updateStateWithContentView:", v3);

}

- (void)_updateStateWithContentView:(id)a3
{
  _BOOL8 v4;
  double backgroundCornerRadius;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v4 = -[SFCapsuleView isMinimized](self, "isMinimized");
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_background, "_setCornerRadius:continuous:maskedCorners:", 1, 15, self->_backgroundCornerRadius);
  backgroundCornerRadius = 0.0;
  if (!v4)
    backgroundCornerRadius = self->_backgroundCornerRadius;
  -[UIView _setContinuousCornerRadius:](self->_contentContainer, "_setContinuousCornerRadius:", backgroundCornerRadius);
  -[UIView setClipsToBounds:](self->_contentContainer, "setClipsToBounds:", v4 ^ 1);
  v6 = v8;
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setSelected:", self->_isSelected);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setMinimized:", v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setMinimizationPercent:", self->_minimizationPercent);
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "setUnclippedContainer:", self);
      v6 = v8;
    }
  }

}

- (BOOL)isMinimized
{
  return self->_state == 1;
}

- (CGRect)_backgroundFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double backgroundHeight;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect result;

  -[SFCapsuleView _boundsForContent](self, "_boundsForContent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFCapsuleView _collapsedContentInsetEdge](self, "_collapsedContentInsetEdge");
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  CGRectGetWidth(v22);
  UIEdgeInsetsMakeWithEdges();
  v13 = v6 + v12;
  v15 = v8 - (v11 + v14);
  v17 = v10 - (v12 + v16);
  if (self->_backgroundHeight == 0.0)
    backgroundHeight = v17;
  else
    backgroundHeight = self->_backgroundHeight;
  v19 = v4 + v11;
  v20 = v13;
  v21 = v15;
  result.size.height = backgroundHeight;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (unint64_t)_collapsedContentInsetEdge
{
  _BOOL4 v3;
  unint64_t directionalCollapsedContentEdge;
  BOOL v5;
  unint64_t v6;

  v3 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  directionalCollapsedContentEdge = self->_directionalCollapsedContentEdge;
  if (directionalCollapsedContentEdge == 8)
  {
    v5 = !v3;
    v6 = 2;
  }
  else
  {
    if (directionalCollapsedContentEdge != 2)
      return 0;
    v5 = !v3;
    v6 = 8;
  }
  if (v5)
    return self->_directionalCollapsedContentEdge;
  else
    return v6;
}

- (void)applyTheme
{
  _BOOL4 v3;
  int *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = -[SFCapsuleView _usesMinimizedTheme](self, "_usesMinimizedTheme");
  v4 = &OBJC_IVAR___SFCapsuleView__theme;
  if (v3)
    v4 = &OBJC_IVAR___SFCapsuleView__minimizedTheme;
  v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
  -[SFCapsuleView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "isHighlighted");
  else
    v7 = 0;
  if (self->_usesPlatterEffect)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_background, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", v7, objc_msgSend(v5, "tintStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setContentEffects:](self->_background, "setContentEffects:", v11);

    -[UIVisualEffectView setBackgroundEffects:](self->_background, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_msgSend(v5, "applyBackdropEffectsToView:", self->_background);
    if (v7 && self->_allowsHighlight)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](self->_background, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v12);

      objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", 1, objc_msgSend(v5, "tintStyle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setContentEffects:](self->_background, "setContentEffects:", v15);

    }
  }
  -[SFCapsuleView _updateAccessoryTheme](self, "_updateAccessoryTheme");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "contentTheme");
    v16 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v16;
  }
  objc_msgSend(v5, "controlsTintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleView setTintColor:](self, "setTintColor:", v17);

  -[SFCapsuleView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "overrideUserInterfaceStyle"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setTheme:", v5);

}

- (BOOL)_usesMinimizedTheme
{
  return (self->_state == 1 || self->_forceMinimizedTheme) && self->_minimizedTheme != 0;
}

- (void)_updateAccessoryTheme
{
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_SFBarTheme backgroundTheme](self->_theme, "backgroundTheme");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setOverrideUserInterfaceStyle:](self->_accessoryView, "setOverrideUserInterfaceStyle:", objc_msgSend(v3, "overrideUserInterfaceStyle"));

  }
}

- (void)setUsesPlatterEffect:(BOOL)a3
{
  if (self->_usesPlatterEffect != a3)
  {
    self->_usesPlatterEffect = a3;
    -[SFCapsuleView applyTheme](self, "applyTheme");
  }
}

- (void)setMinimizationPercent:(double)a3
{
  if (self->_minimizationPercent != a3)
  {
    self->_minimizationPercent = a3;
    -[SFCapsuleView _updateContentViewState](self, "_updateContentViewState");
  }
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_contentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  _OWORD v14[3];
  _OWORD v15[3];
  CGAffineTransform t2;
  CGAffineTransform t1;

  p_contentTransform = &self->_contentTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_contentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentTransform->tx = v9;
    *(_OWORD *)&p_contentTransform->a = v8;
    v10 = *(_OWORD *)&a3->c;
    v15[0] = *(_OWORD *)&a3->a;
    v15[1] = v10;
    v15[2] = *(_OWORD *)&a3->tx;
    -[UIView setTransform:](self->_contentContainer, "setTransform:", v15);
    v11 = *(_OWORD *)&a3->c;
    v14[0] = *(_OWORD *)&a3->a;
    v14[1] = v11;
    v14[2] = *(_OWORD *)&a3->tx;
    -[UIVisualEffectView setTransform:](self->_background, "setTransform:", v14);
    if ((-[SFShadowView isDescendantOfView:](self->_shadowView, "isDescendantOfView:", self) & 1) == 0)
    {
      v12 = *(_OWORD *)&a3->c;
      v13[0] = *(_OWORD *)&a3->a;
      v13[1] = v12;
      v13[2] = *(_OWORD *)&a3->tx;
      -[SFShadowView setTransform:](self->_shadowView, "setTransform:", v13);
    }
  }
}

- (void)setContentHeight:(double)a3
{
  self->_contentHeight = a3;
}

- (void)setAccessoryViewInsets:(NSDirectionalEdgeInsets)a3
{
  self->_accessoryViewInsets = a3;
}

- (CGRect)frameForShadowView
{
  SFCapsuleView *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  SFShadowView *v29;
  void *v30;
  double x;
  double y;
  double width;
  double height;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  SFShadowView *shadowView;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect result;

  -[SFShadowView superview](self->_shadowView, "superview");
  v3 = (SFCapsuleView *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    shadowView = self->_shadowView;
    -[SFCapsuleView bounds](self, "bounds");
    -[SFShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:");
    v37 = v45;
    v39 = v46;
    v41 = v47;
    v43 = v48;
  }
  else
  {
    -[SFCapsuleView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[SFCapsuleView _backgroundFrame](self, "_backgroundFrame");
    v54 = v12;
    v55 = v13;
    v56 = v14;
    v16 = v15;
    -[SFCapsuleView center](self, "center");
    v18 = v17;
    v53 = v19;
    -[SFCapsuleView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anchorPoint");
    v22 = v21;
    v24 = v23;

    v57.origin.x = v5;
    v57.origin.y = v7;
    v57.size.width = v9;
    v57.size.height = v11;
    v25 = v54 + v18 - v22 * CGRectGetWidth(v57);
    v58.origin.x = v5;
    v58.origin.y = v7;
    v58.size.width = v9;
    v58.size.height = v11;
    v26 = v55 + v53 - v24 * CGRectGetHeight(v58);
    v59.origin.x = v25;
    v59.origin.y = v26;
    v59.size.width = v56;
    v59.size.height = v16;
    v27 = fmin(CGRectGetWidth(v59) * 0.5, 2.0);
    v60.origin.x = v25;
    v60.origin.y = v26;
    v60.size.width = v56;
    v60.size.height = v16;
    v28 = fmin(CGRectGetHeight(v60) * 0.5, 1.0);
    v29 = self->_shadowView;
    -[SFCapsuleView superview](self, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v61.origin.x = v25;
    v61.origin.y = v26;
    v61.size.width = v56;
    v61.size.height = v16;
    v62 = CGRectInset(v61, v27, v28);
    x = v62.origin.x;
    y = v62.origin.y;
    width = v62.size.width;
    height = v62.size.height;
    -[SFShadowView superview](self->_shadowView, "superview");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertRect:toView:", v35, x, y, width, height);
    -[SFShadowView frameWithContentWithFrame:](v29, "frameWithContentWithFrame:");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;

  }
  v49 = v37;
  v50 = v39;
  v51 = v41;
  v52 = v43;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

- (UIView)shadowView
{
  return &self->_shadowView->super.super;
}

- (UIVisualEffectView)backgroundView
{
  return self->_background;
}

- (void)setForceMinimizedTheme:(BOOL)a3
{
  if (self->_forceMinimizedTheme != a3)
  {
    self->_forceMinimizedTheme = a3;
    -[SFCapsuleView applyTheme](self, "applyTheme");
  }
}

- (SFCapsuleView)initWithFrame:(CGRect)a3
{
  char *v3;
  SFCapsuleView *v4;
  uint64_t v5;
  __int128 v6;
  SFShadowView *v7;
  SFShadowView *shadowView;
  void *v9;
  uint64_t v10;
  UIVisualEffectView *background;
  id v12;
  uint64_t v13;
  UIView *contentContainer;
  void *v15;
  SFCapsuleView *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SFCapsuleView;
  v3 = -[SFCapsuleView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (SFCapsuleView *)v3;
  if (v3)
  {
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v3 + 600) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v3 + 616) = v6;
    *(_OWORD *)(v3 + 632) = *(_OWORD *)(v5 + 32);
    v7 = objc_alloc_init(SFShadowView);
    shadowView = v4->_shadowView;
    v4->_shadowView = v7;

    -[SFCapsuleView addSubview:](v4, "addSubview:", v4->_shadowView);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v9);
    background = v4->_background;
    v4->_background = (UIVisualEffectView *)v10;

    -[SFCapsuleView bounds](v4, "bounds");
    -[UIVisualEffectView setFrame:](v4->_background, "setFrame:");
    -[SFCapsuleView addSubview:](v4, "addSubview:", v4->_background);
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[SFCapsuleView bounds](v4, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    contentContainer = v4->_contentContainer;
    v4->_contentContainer = (UIView *)v13;

    -[UIView setClipsToBounds:](v4->_contentContainer, "setClipsToBounds:", 1);
    -[SFCapsuleView addSubview:](v4, "addSubview:", v4->_contentContainer);
    -[SFCapsuleView setBackgroundCornerRadius:](v4, "setBackgroundCornerRadius:", 20.0);
    objc_msgSend((id)objc_opt_class(), "maximumContentSizeCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleView setMaximumContentSizeCategory:](v4, "setMaximumContentSizeCategory:", v15);

    v16 = v4;
  }

  return v4;
}

- (void)setBackgroundCornerRadius:(double)a3
{
  if (self->_backgroundCornerRadius != a3)
  {
    self->_backgroundCornerRadius = a3;
    -[SFCapsuleView _updateContentViewState](self, "_updateContentViewState");
  }
}

+ (NSString)maximumContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x1E0DC48D0];
}

_BYTE *__32__SFCapsuleView_setContentView___block_invoke_3(uint64_t a1)
{
  _BYTE *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "addSubview:", *(_QWORD *)(a1 + 40));
  result = *(_BYTE **)(a1 + 32);
  if (!result[441])
    return (_BYTE *)objc_msgSend(result, "layoutIfNeeded");
  return result;
}

_BYTE *__32__SFCapsuleView_setContentView___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  objc_msgSend(*(id *)(a1 + 32), "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAutoresizingMask:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  result = *(_BYTE **)(a1 + 40);
  if (result[441])
  {
    result = (_BYTE *)objc_msgSend(result, "_shouldFadeNonKeyContentForContentView:withPreviousContentView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    if ((_DWORD)result)
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "setNonKeyContentAlpha:", 0.0);
  }
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleView;
  -[SFCapsuleView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[SFCapsuleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDirectionalCollapsedContentEdge:(unint64_t)a3
{
  if (self->_directionalCollapsedContentEdge != a3)
  {
    self->_directionalCollapsedContentEdge = a3;
    -[SFCapsuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  _OWORD v5[3];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCapsuleView;
  v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  -[SFCapsuleView setTransform:](&v6, sel_setTransform_, v5);
  -[SFCapsuleView _updateShadowViewTransform](self, "_updateShadowViewTransform");
}

- (NSString)visualEffectGroupName
{
  return (NSString *)-[UIVisualEffectView _groupName](self->_background, "_groupName");
}

- (void)_performHighlightAnimation
{
  _QWORD v3[5];

  if (self->_reloadingWithCoordinator)
  {
    -[SFCapsuleView setNeedsLayout](self, "setNeedsLayout");
    self->_needsUpdateTheme = 1;
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43__SFCapsuleView__performHighlightAnimation__block_invoke;
    v3[3] = &unk_1E21E2050;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331650, v3, 0, 0.2, 0.0);
  }
}

uint64_t __43__SFCapsuleView__performHighlightAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyTheme");
}

void __32__SFCapsuleView_setContentView___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "layoutStyle") == 1
      && (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v2, "isHighlighted"))
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", v6, sel__performHighlightAnimation, 0, 0, 0.1);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v6[56];
      v6[56] = v3;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addTimer:forMode:", v6[56], *MEMORY[0x1E0C99860]);

    }
    else
    {
      objc_msgSend(v6, "_performHighlightAnimation");
    }

    WeakRetained = v6;
  }

}

void __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v13 = a2;
  objc_msgSend(v13, "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout"))
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    Width = CGRectGetWidth(v14);
    objc_msgSend(v13, "bounds");
    v12 = Width + (CGRectGetWidth(v15) + *(double *)(*(_QWORD *)(a1 + 32) + 576)) * 0.5;
  }
  else
  {
    objc_msgSend(v13, "bounds");
    v12 = (CGRectGetWidth(v16) + *(double *)(*(_QWORD *)(a1 + 32) + 576)) * -0.5;
  }
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  objc_msgSend(v13, "setCenter:", v12, CGRectGetHeight(v17) * 0.5);

}

uint64_t __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAutoresizingMask:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 32), "_updateAccessoryTheme");
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496));
}

uint64_t __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "setAlpha:", 1.0);
}

- (void)_updateShadowViewTransform
{
  SFCapsuleView *v3;
  SFShadowView *shadowView;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  -[SFShadowView superview](self->_shadowView, "superview");
  v3 = (SFCapsuleView *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    shadowView = self->_shadowView;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = v6;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v5 = &v7;
  }
  else
  {
    -[SFCapsuleView transform](self, "transform");
    shadowView = self->_shadowView;
    v10 = v13;
    v11 = v14;
    v12 = v15;
    v5 = &v10;
  }
  -[SFShadowView setTransform:](shadowView, "setTransform:", v5, v7, v8, v9, v10, v11, v12);
}

- (void)allowsHighlight:(BOOL)a3
{
  self->_allowsHighlight = a3;
  if (a3)
  {
    if (-[NSTimer isValid](self->_waitToHighlight, "isValid"))
      -[NSTimer fire](self->_waitToHighlight, "fire");
  }
}

- (BOOL)_shouldFadeNonKeyContentForContentView:(id)a3 withPreviousContentView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "microphoneContentOriginX");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v5, "microphoneContentOriginX");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

      }
      else
      {
        v9 = 1;
      }

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)willReloadWithCoordinator:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (**v15)(void *, void *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t (**v23)(void *, void *);
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  SFCapsuleView *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t (**v37)(void *, void *);
  id v38;
  id v39;
  id v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];
  id v49;
  _QWORD aBlock[5];
  _QWORD v51[5];

  v4 = a3;
  self->_reloadingWithCoordinator = 1;
  v5 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke;
  v51[3] = &unk_1E21E29B0;
  v51[4] = self;
  objc_msgSend(v4, "addAnimations:", v51);
  -[SFCapsuleView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ss_untransformedFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3;
  aBlock[3] = &unk_1E21E3AE0;
  aBlock[4] = self;
  v15 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  v16 = v15[2](v15, v6);
  v18 = v17;
  v20 = v19;
  __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2(v16, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__1;
  v48[4] = __Block_byref_object_dispose__1;
  v49 = 0;
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_47;
  v34[3] = &unk_1E21E3BD8;
  v41 = v48;
  v34[4] = self;
  v22 = v6;
  v35 = v22;
  v23 = v15;
  v37 = v23;
  v38 = &__block_literal_global_17;
  v42 = v8;
  v43 = v10;
  v44 = v12;
  v45 = v14;
  v46 = v18;
  v47 = v20;
  v39 = &__block_literal_global_40;
  v40 = &__block_literal_global_44;
  v24 = v21;
  v36 = v24;
  objc_msgSend(v4, "addAnimations:", v34);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_4_50;
  v29[3] = &unk_1E21E3C00;
  v32 = &__block_literal_global_40;
  v25 = v22;
  v33 = &__block_literal_global_44;
  v30 = v25;
  v31 = self;
  objc_msgSend(v4, "addCompletion:", v29);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_6;
  v27[3] = &unk_1E21E3C28;
  v27[4] = self;
  v26 = v25;
  v28 = v26;
  objc_msgSend(v4, "addAnimations:", v27);

  _Block_object_dispose(v48, 8);
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 441) = 0;
  return result;
}

id __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "microphoneContentOriginX");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  int v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MinX;
  void *v18;
  double v19;
  double v20;
  double v21;
  double MidY;
  _QWORD *v23;
  CGRect v25;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "keyContentRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout");
    v13 = v5;
    v14 = v7;
    v15 = v9;
    v16 = v11;
    if (v12)
      MinX = CGRectGetMinX(*(CGRect *)&v13);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v13);
    v20 = MinX;
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    MidY = CGRectGetMidY(v25);
    v23 = *(_QWORD **)(a1 + 32);
    v18 = v23;
  }
  else
  {
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v3, "center");
    v20 = v19;
    MidY = v21;

    v23 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v18, "convertPoint:fromView:", v23[58], v20, MidY);
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_4(uint64_t a1, void *a2, _OWORD *a3)
{
  id v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[3];
  _OWORD v8[3];

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = a3[1];
    v8[0] = *a3;
    v8[1] = v5;
    v8[2] = a3[2];
    objc_msgSend(v4, "setKeyContentTransform:", v8);
  }
  else
  {
    v6 = a3[1];
    v7[0] = *a3;
    v7[1] = v6;
    v7[2] = a3[2];
    objc_msgSend(v4, "setTransform:", v7);
  }

}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  float v9;
  float v10;
  float v11;
  CGAffineTransform *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v7 && v8)
    {
      objc_msgSend(v8, "floatValue");
      v10 = v9;
      objc_msgSend(v7, "floatValue");
      CGAffineTransformMakeTranslation(&v18, (float)(v10 - v11), 0.0);
      v17 = v18;
      v12 = &v17;
    }
    else
    {
      v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v14 = *MEMORY[0x1E0C9BAA8];
      v15 = v13;
      v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v12 = (CGAffineTransform *)&v14;
    }
    objc_msgSend(v6, "setMicrophoneContentTransform:", v12, v14, v15, v16, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
  }

}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_47(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  id v15;
  void (*v16)(void);
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  CGAffineTransform v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  _QWORD v37[6];

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 88);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(v5 + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "bounds");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setFrame:");
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2_48;
    v37[3] = &unk_1E21E3B88;
    v37[4] = *(_QWORD *)(a1 + 32);
    v37[5] = v5;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v37);
    v7 = (*(double (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v9 = v8;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3_49;
    v24[3] = &unk_1E21E3BB0;
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v25 = v12;
    v26 = v13;
    v14 = *(_OWORD *)(a1 + 112);
    v32 = *(_OWORD *)(a1 + 96);
    v33 = v14;
    v31 = *(_QWORD *)(a1 + 88);
    v29 = *(id *)(a1 + 72);
    v34 = *(_OWORD *)(a1 + 128);
    v35 = v7;
    v36 = v9;
    v30 = *(id *)(a1 + 80);
    v27 = v10;
    v28 = *(id *)(a1 + 48);
    v15 = v10;
    objc_msgSend(v11, "performWithoutAnimation:", v24);
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setAlpha:", 1.0);
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v21 = *MEMORY[0x1E0C9BAA8];
    v22 = v17;
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v16();
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    v18 = *(_QWORD *)(a1 + 72);
    v19 = *(_QWORD *)(a1 + 40);
    CGAffineTransformMakeTranslation(&v20, v7 - *(double *)(a1 + 128), v9 - *(double *)(a1 + 136));
    (*(void (**)(uint64_t, uint64_t, CGAffineTransform *))(v18 + 16))(v18, v19, &v20);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2_48(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layoutIfNeeded");
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3_49(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "_removeAllAnimations:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "addSubview:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "ss_setUntransformedFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setAlpha:", 0.0);
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  CGAffineTransformMakeTranslation(&v5, *(double *)(a1 + 120) - *(double *)(a1 + 136), *(double *)(a1 + 128) - *(double *)(a1 + 144));
  (*(void (**)(uint64_t, uint64_t, CGAffineTransform *))(v2 + 16))(v2, v3, &v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_4_50(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_5_51;
  v5[3] = &unk_1E21E3C00;
  v8 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v7 = v4;
  objc_msgSend(v2, "performWithoutAnimation:", v5);

}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_5_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t);
  __int128 v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _OWORD v15[3];

  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void (**)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v15[0] = *MEMORY[0x1E0C9BAA8];
  v15[1] = v10;
  v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v9(v7, v8, v15, a4, a5, a6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD **)(a1 + 40);
  if (v11 == (void *)v12[58])
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v12, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v14)
      objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  }
  else
  {

  }
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldFadeNonKeyContentForContentView:withPreviousContentView:", v2, *(_QWORD *)(a1 + 40)))
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
    v5 = v4;
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_7;
    v9[3] = &unk_1E21E2258;
    v10 = *(id *)(a1 + 40);
    v11 = v2;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_10;
    v7[3] = &unk_1E21E2190;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "animateKeyframesWithDuration:delay:options:animations:completion:", 3072, v9, v7, v5, 0.0);

  }
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_8;
  v7[3] = &unk_1E21E2050;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 0.67);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_9;
  v5[3] = &unk_1E21E2050;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.33, 0.67);

}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNonKeyContentAlpha:", 0.0);
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNonKeyContentAlpha:", 1.0);
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNonKeyContentAlpha:", 1.0);
}

- (void)willChangeToMinimized:(BOOL)a3 coordinator:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[SFCapsuleView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "willChangeToMinimized:coordinator:", v4, v7);

}

- (UIView)contentContainer
{
  return self->_contentContainer;
}

- (double)backgroundCornerRadius
{
  return self->_backgroundCornerRadius;
}

- (double)backgroundHeight
{
  return self->_backgroundHeight;
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (NSDirectionalEdgeInsets)accessoryViewInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_accessoryViewInsets.top;
  leading = self->_accessoryViewInsets.leading;
  bottom = self->_accessoryViewInsets.bottom;
  trailing = self->_accessoryViewInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (id)contentViewUpdateHandler
{
  return self->_contentViewUpdateHandler;
}

- (void)setContentViewUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (_SFBarTheme)minimizedTheme
{
  return self->_minimizedTheme;
}

- (BOOL)forceMinimizedTheme
{
  return self->_forceMinimizedTheme;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)usesPlatterEffect
{
  return self->_usesPlatterEffect;
}

- (BOOL)allowsHighlight
{
  return self->_allowsHighlight;
}

- (void)setAllowsHighlight:(BOOL)a3
{
  self->_allowsHighlight = a3;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (double)minimizationPercent
{
  return self->_minimizationPercent;
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].b;
  return self;
}

- (unint64_t)directionalCollapsedContentEdge
{
  return self->_directionalCollapsedContentEdge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimizedTheme, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong(&self->_contentViewUpdateHandler, 0);
  objc_storeStrong((id *)&self->_reusableContentViewIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_waitToHighlight, 0);
  objc_storeStrong((id *)&self->_cachedContentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end
