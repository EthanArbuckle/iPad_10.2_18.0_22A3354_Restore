@implementation AVMobileChromelessContainerView

- (void)setItemViews:(id)a3
{
  NSArray *v5;
  NSArray *itemViews;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  itemViews = self->_itemViews;
  if (itemViews != v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = itemViews;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_itemViews, a3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = self->_itemViews;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          -[AVMobileChromelessContainerView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

    -[AVMobileChromelessContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVMobileChromelessContainerView superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  NSArray *v6;
  void *v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float MaxX;
  float v23;
  _BOOL8 v24;
  double v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _OWORD v33[4];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)AVMobileChromelessContainerView;
  -[AVView layoutSubviews](&v32, sel_layoutSubviews);
  -[AVMobileChromelessContainerView bounds](self, "bounds");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_itemViews, "count"));
  -[AVMobileChromelessContainerView bounds](self, "bounds");
  UIRoundToViewScale();
  v5 = v4;
  memset(v33, 0, sizeof(v33));
  v6 = self->_itemViews;
  if (-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", v33, v35, 16))
  {
    v7 = (void *)**((_QWORD **)&v33[0] + 1);
    objc_msgSend(**((id **)&v33[0] + 1), "baselineOffsetFromBottom");
    objc_msgSend(v7, "intrinsicContentSize");
    objc_msgSend(v7, "baselineOffsetFromBottom");
    UIRoundToViewScale();
    v5 = v8;
  }

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_itemViews;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "intrinsicContentSize");
        v17 = v16;
        v19 = v18;
        objc_msgSend(v15, "baselineOffsetFromBottom");
        v21 = v5 + v20 - v19;
        -[AVMobileChromelessContainerView bounds](self, "bounds");
        MaxX = CGRectGetMaxX(v37);
        v38.origin.x = v13;
        v38.origin.y = v21;
        v38.size.width = v17;
        v38.size.height = v19;
        v23 = CGRectGetMaxX(v38);
        v24 = vabds_f32(MaxX, v23) >= 0.00000011921 && MaxX < v23;
        objc_msgSend(v15, "setHidden:", v24);
        if (v24)
          objc_msgSend(v3, "addObject:", v15);
        objc_msgSend(v15, "avkit_setFrame:inLayoutDirection:", -[AVMobileChromelessContainerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), v13, v21, v17, v19);
        -[AVMobileChromelessContainerView spacing](self, "spacing");
        v13 = v13 + v17 + v25;
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v11);
  }

  -[AVMobileChromelessContainerView delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AVMobileChromelessContainerView delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "containerView:layoutWithHiddenViews:", self, v3);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGSize result;

  width = a3.width;
  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_itemViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    v10 = 0.0;
    v11 = 0.0;
LABEL_3:
    v12 = 0;
    v13 = v8;
    v8 += v7;
    v14 = v11;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "intrinsicContentSize", (_QWORD)v19);
      v11 = v14 + v15;
      if (v14 + v15 + (double)(v13 + (int)v12) * self->_spacing > width)
        break;
      if (v10 < v16)
        v10 = v16;
      ++v12;
      v14 = v14 + v15;
      if (v7 == v12)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  UISizeRoundToViewScale();
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVMobileChromelessContainerView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)itemViews
{
  return self->_itemViews;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (AVMobileChromelessContainerViewDelegate)delegate
{
  return (AVMobileChromelessContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemViews, 0);
}

@end
