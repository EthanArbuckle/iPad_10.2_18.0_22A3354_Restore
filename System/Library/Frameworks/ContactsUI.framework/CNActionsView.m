@implementation CNActionsView

uint64_t __26__CNActionsView_setStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CNActionsView containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setEnableVisualEffectViewCaptureView:(BOOL)a3
{
  self->_enableVisualEffectViewCaptureView = a3;
}

- (void)setPosterTintColor:(id)a3
{
  void *v5;
  void *v6;
  UIColor *v7;
  _QWORD v8[4];
  UIColor *v9;

  v7 = (UIColor *)a3;
  if (self->_posterTintColor != v7)
  {
    objc_storeStrong((id *)&self->_posterTintColor, a3);
    -[CNActionsView containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrangedSubviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__CNActionsView_setPosterTintColor___block_invoke;
    v8[3] = &unk_1E204F3A8;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)addActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionsView actionViewForType:](self, "actionViewForType:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setActionDelegate:", self);
  objc_msgSend(v8, "setStyle:", -[CNActionsView style](self, "style"));
  sUpdateActionViewWithItem_block_invoke(v8, v4);
  -[CNActionsView actionItemsByType](self, "actionItemsByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  -[CNActionsView updateAxis](self, "updateAxis");
}

- (NSMutableDictionary)actionItemsByType
{
  return self->_actionItemsByType;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)actionViewShouldPresentDisambiguationUI:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CNActionsView actionItemsByType](self, "actionItemsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNActionsView actionsDelegate](self, "actionsDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNActionsView actionsDelegate](self, "actionsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "actionsView:shouldPresentDisambiguationUIForAction:", self, v7);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (CNActionsViewProtocol)actionsDelegate
{
  return (CNActionsViewProtocol *)objc_loadWeakRetained((id *)&self->_actionsDelegate);
}

- (void)setStyle:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  _QWORD v26[5];

  self->_style = a3;
  v5 = (a3 - 6) & 0xFFFFFFFFFFFFFFFALL;
  -[CNActionsView containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __26__CNActionsView_setStyle___block_invoke;
  v26[3] = &__block_descriptor_40_e29_v32__0__CNActionView_8Q16_B24l;
  v26[4] = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v26);

  +[CNActionView minimumSizeForStyle:](CNActionView, "minimumSizeForStyle:", a3);
  v9 = v8;
  v11 = v10;
  -[CNActionsView containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMinimumLayoutSize:", v9, v11);

  if (v5)
    -[CNActionsView spacing](self, "spacing");
  else
    v13 = 8.0;
  -[CNActionsView setSpacing:](self, "setSpacing:", v13);
  if (a3 == 10)
  {
    -[CNActionsView visualEffectViewCaptureView](self, "visualEffectViewCaptureView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if (!-[CNActionsView enableVisualEffectViewCaptureView](self, "enableVisualEffectViewCaptureView"))
      {
LABEL_9:
        -[CNActionsView bounds](self, "bounds");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[CNActionsView visualEffectViewCaptureView](self, "visualEffectViewCaptureView");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setBounds:", v18, v20, v22, v24);

        return;
      }
      v15 = objc_alloc(MEMORY[0x1E0DC4498]);
      -[CNActionsView bounds](self, "bounds");
      v14 = (void *)objc_msgSend(v15, "initWithFrame:");
      objc_msgSend(v14, "setAutoresizingMask:", 18);
      -[CNActionsView insertSubview:atIndex:](self, "insertSubview:atIndex:", v14, 0);
      objc_msgSend(v14, "setRenderMode:", 1);
      objc_msgSend(v14, "captureGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGroupName:", CFSTR("CNQuickActionsCaptureGroup"));

      -[CNActionsView setVisualEffectViewCaptureView:](self, "setVisualEffectViewCaptureView:", v14);
    }

    goto LABEL_9;
  }
  -[CNActionsView setVisualEffectViewCaptureView:](self, "setVisualEffectViewCaptureView:", 0);
}

- (_UIVisualEffectBackdropView)visualEffectViewCaptureView
{
  return self->_visualEffectViewCaptureView;
}

- (void)updateAxis
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[CNActionsView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_cn_any:", &__block_literal_global_9_59602);

  v6 = objc_msgSend((id)objc_opt_class(), "axisWithTitlesPresent:", v5);
  -[CNActionsView containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "axis");

  if (v6 != v8)
  {
    -[CNActionsView containerView](self, "containerView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAxis:", v6);

  }
}

- (NUIContainerStackView)containerView
{
  return self->_containerView;
}

+ (int64_t)axisWithTitlesPresent:(BOOL)a3
{
  if (a3)
    return objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  else
    return 0;
}

- (void)setSpacing:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v8;
  uint64_t v9;

  if (self->_spacing != a3)
  {
    if (a3 >= 0.0)
    {
      self->_spacing = a3;
      -[CNActionsView containerView](self, "containerView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSpacing:", a3);

    }
    else
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNActionsView.m", 184, 3, CFSTR("CNActionView: Spacing specified is < 0, would result in overlapping views. Leaving unchanged."), v3, v4, v5, v6, v9);
    }
  }
}

- (unint64_t)insertionIndexForType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CNActionsView sortedActionTypes](self, "sortedActionTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v11 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      -[CNActionsView actionViewsByType](self, "actionViewsByType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        ++v8;

      if (v11 == v4)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)actionViewForType:(id)a3
{
  id v4;
  void *v5;
  CNActionView *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CNActionsView actionViewsByType](self, "actionViewsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (CNActionView *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = -[CNActionsView insertionIndexForType:](self, "insertionIndexForType:", v4);
    -[CNActionsView actionViewsByType](self, "actionViewsByType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v6 = objc_alloc_init(CNActionView);
    -[CNActionView setHidden:](v6, "setHidden:", 1);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v4);
    -[CNActionsView titleFont](self, "titleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView setTitleFont:](v6, "setTitleFont:", v10);

    -[CNActionsView setActionViewsByType:](self, "setActionViewsByType:", v9);
    -[CNActionsView containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertArrangedSubview:atIndex:", v6, v7);

  }
  return v6;
}

- (NSMutableDictionary)actionViewsByType
{
  return self->_actionViewsByType;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (NSArray)sortedActionTypes
{
  return self->_sortedActionTypes;
}

- (void)setActionViewsByType:(id)a3
{
  objc_storeStrong((id *)&self->_actionViewsByType, a3);
}

- (BOOL)enableVisualEffectViewCaptureView
{
  return self->_enableVisualEffectViewCaptureView;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setVisualEffectViewCaptureView:(id)a3
{
  void *v5;
  void *v6;
  _UIVisualEffectBackdropView *v7;
  _QWORD v8[4];
  _UIVisualEffectBackdropView *v9;

  v7 = (_UIVisualEffectBackdropView *)a3;
  if (self->_visualEffectViewCaptureView != v7)
  {
    objc_storeStrong((id *)&self->_visualEffectViewCaptureView, a3);
    -[CNActionsView containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrangedSubviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__CNActionsView_setVisualEffectViewCaptureView___block_invoke;
    v8[3] = &unk_1E204F3A8;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (void)updateActionItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionsView actionViewForType:](self, "actionViewForType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isHidden"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNActionsView.m"), 156, CFSTR("If updating an existing action item, the action view can't be hidden"));

  }
  sUpdateActionViewWithItem_block_invoke(v6, v8);

}

uint64_t __36__CNActionsView_setPosterTintColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPosterTintColor:", *(_QWORD *)(a1 + 32));
}

BOOL __27__CNActionsView_updateAxis__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isHidden") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (void)setSortedActionTypes:(id)a3
{
  unint64_t v4;
  NSArray *sortedActionTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t)a3;
  sortedActionTypes = self->_sortedActionTypes;
  if (v4 | (unint64_t)sortedActionTypes && (-[NSArray isEqual:](sortedActionTypes, "isEqual:", v4) & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend((id)v4, "copy");
    v7 = self->_sortedActionTypes;
    self->_sortedActionTypes = v6;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (id)v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          -[CNActionsView actionViewsByType](self, "actionViewsByType", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[CNActionsView actionViewsByType](self, "actionViewsByType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v13);

            -[CNActionsView containerView](self, "containerView");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeArrangedSubview:", v15);

            -[CNActionsView containerView](self, "containerView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "insertArrangedSubview:atIndex:", v15, -[CNActionsView insertionIndexForType:](self, "insertionIndexForType:", v13));

            -[CNActionsView actionViewsByType](self, "actionViewsByType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v13);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
}

- (void)setActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionsDelegate, a3);
}

- (void)resetActions
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  -[CNActionsView containerView](self, "containerView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setHidden:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (CNActionsView)initWithFrame:(CGRect)a3
{
  CNActionsView *v3;
  int v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *actionItemsByType;
  NSMutableDictionary *v7;
  NSMutableDictionary *actionViewsByType;
  double v9;
  id v10;
  void *v11;
  NUIContainerStackView *containerView;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CNActionsView;
  v3 = -[CNActionsView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    actionItemsByType = v3->_actionItemsByType;
    v3->_actionItemsByType = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    actionViewsByType = v3->_actionViewsByType;
    v3->_actionViewsByType = v7;

    v9 = 8.0;
    if (v4)
      v9 = 16.0;
    v3->_spacing = v9;
    v10 = objc_alloc(MEMORY[0x1E0CFAAB0]);
    -[CNActionsView bounds](v3, "bounds");
    v11 = (void *)objc_msgSend(v10, "initWithFrame:");
    objc_msgSend(v11, "setAutoresizingMask:", 18);
    objc_msgSend(v11, "setAxis:", objc_msgSend((id)objc_opt_class(), "axisWithTitlesPresent:", 1));
    objc_msgSend(v11, "setDistribution:", v4 ^ 1u);
    objc_msgSend(v11, "setSpacing:", v3->_spacing);
    objc_msgSend(v11, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
    +[CNActionView minimumSizeForStyle:](CNActionView, "minimumSizeForStyle:", -[CNActionsView style](v3, "style"));
    objc_msgSend(v11, "setMinimumLayoutSize:");
    objc_msgSend(v11, "setDelegate:", v3);
    containerView = v3->_containerView;
    v3->_containerView = (NUIContainerStackView *)v11;
    v13 = v11;

    -[CNActionsView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(v13, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[CNActionsView addSubview:](v3, "addSubview:", v13);

  }
  return v3;
}

- (void)removeActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionsView actionViewForType:](self, "actionViewForType:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CNActionsView actionItemsByType](self, "actionItemsByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v7);
  objc_msgSend(v8, "setHidden:", 1);
  -[CNActionsView updateAxis](self, "updateAxis");

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CNActionsView containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)didPressActionView:(id)a3 longPress:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[CNActionsView actionItemsByType](self, "actionItemsByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNActionsView actionsDelegate](self, "actionsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNActionsView actionsDelegate](self, "actionsDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didSelectAction:withSourceView:longPress:", v8, v11, v4);

  }
}

- (void)setActionItemsByType:(id)a3
{
  objc_storeStrong((id *)&self->_actionItemsByType, a3);
}

- (UIColor)posterTintColor
{
  return self->_posterTintColor;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectViewCaptureView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_posterTintColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_actionViewsByType, 0);
  objc_storeStrong((id *)&self->_actionItemsByType, 0);
  objc_storeStrong((id *)&self->_sortedActionTypes, 0);
  objc_destroyWeak((id *)&self->_actionsDelegate);
}

uint64_t __48__CNActionsView_setVisualEffectViewCaptureView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisualEffectViewCaptureView:", *(_QWORD *)(a1 + 32));
}

@end
