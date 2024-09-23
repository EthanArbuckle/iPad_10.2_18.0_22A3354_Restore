@implementation SFTabViewContainerView

- (void)setDataSource:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained != v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)-[NSMutableDictionary copy](self->_childIndexToViewMap, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:]((uint64_t)self, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "integerValue"), 1);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    objc_storeWeak((id *)&self->_dataSource, v4);
    -[SFTabViewContainerView reloadData](self, "reloadData");
  }

}

- (void)reloadData
{
  int64_t childCount;
  uint64_t v4;
  _QWORD v5[7];

  childCount = self->_childCount;
  v4 = -[SFTabViewContainerView currentChildIndex](self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SFTabViewContainerView_reloadData__block_invoke;
  v5[3] = &unk_1E21E4360;
  v5[4] = self;
  v5[5] = childCount;
  v5[6] = v4;
  -[SFTabViewContainerView reloadDataWithPostUpdateActions:](self, "reloadDataWithPostUpdateActions:", v5);
}

- (CGRect)frameForChildAtIndex:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat Width;
  double Height;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[SFTabViewContainerView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[SFTabViewContainerView convertIndex:](self, "convertIndex:", a3);
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v14 = CGRectGetWidth(v20) * (double)v13;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  Width = CGRectGetWidth(v21);
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Height = CGRectGetHeight(v22);
  v17 = 0.0;
  v18 = v14;
  v19 = Width;
  result.size.height = Height;
  result.size.width = v19;
  result.origin.y = v17;
  result.origin.x = v18;
  return result;
}

- (void)reloadDataWithPostUpdateActions:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  uint64_t (**v6)(id, uint64_t);

  v6 = (uint64_t (**)(id, uint64_t))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_childCount = objc_msgSend(WeakRetained, "numberOfChildrenForContainerView:", self);

  self->_visibleRange.location = 0;
  self->_visibleRange.length = 0;
  if (self->_childCount)
    v5 = 0;
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
    v5 = v6[2](v6, v5);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    -[SFTabViewContainerView revealChildAtIndex:](self, "revealChildAtIndex:", v5);
  -[SFTabViewContainerView updateVisibleIndexes]((uint64_t)self);

}

- (void)updateVisibleIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 432);
    v3 = *(_QWORD *)(a1 + 440);
    objc_msgSend((id)a1, "contentOffset");
    v4 = objc_msgSend((id)a1, "visibleRangeForContentOffset:nearestIndex:", 0);
    if (*(_BYTE *)(a1 + 448))
      v6 = v4 == 0;
    else
      v6 = 1;
    v7 = !v6;
    if (v6)
      v8 = v5;
    else
      v8 = v5 + 1;
    v9 = v4 - v7;
    if (*(_BYTE *)(a1 + 448) && (int64_t)(v9 + v8) < *(_QWORD *)(a1 + 416))
      ++v8;
    if (v2 != v9 || v3 != v8)
    {
      *(_QWORD *)(a1 + 432) = v9;
      *(_QWORD *)(a1 + 440) = v8;
      if (v2 < v3 + v2)
      {
        do
        {
          if (v9 > (unint64_t)v2 || v2 - v9 >= v8)
            -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:](a1, v2, 0);
          ++v2;
          --v3;
        }
        while (v3);
      }
      if (v9 < (uint64_t)(v8 + v9))
      {
        do
        {
          -[SFTabViewContainerView installChildViewAtIndex:](a1, v9++);
          --v8;
        }
        while (v8);
      }
    }
  }
}

- (_NSRange)visibleRangeForContentOffset:(double)a3 nearestIndex:(int64_t *)a4
{
  double Width;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  _BOOL4 v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;
  CGRect v19;

  -[SFTabViewContainerView bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  v8 = fmax(fmin(-[SFTabViewContainerView contentWidth]((uint64_t *)self) - Width, a3), 0.0) / Width;
  v9 = vcvtmd_s64_f64(v8);
  v10 = vcvtpd_s64_f64(v8);
  v11 = (double)(uint64_t)floor(v8);
  v12 = _SFEqualWithEpsilon(v8, v11, 0.01);
  if (a4)
  {
    if (v8 - v11 > 0.5)
      v13 = v10;
    else
      v13 = v9;
    *a4 = -[SFTabViewContainerView convertIndex:](self, "convertIndex:", v13, v8 - v11);
  }
  v14 = -[SFTabViewContainerView convertIndex:](self, "convertIndex:", v9);
  if (v14 >= -[SFTabViewContainerView convertIndex:](self, "convertIndex:", v10))
    v15 = v10;
  else
    v15 = v9;
  v16 = -[SFTabViewContainerView convertIndex:](self, "convertIndex:", v15);
  if (v12)
    v17 = 1;
  else
    v17 = 2;
  result.length = v17;
  result.location = v16;
  return result;
}

- (int64_t)convertIndex:(int64_t)a3
{
  int64_t result;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && self->_childCount)
  {
    if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      return a3;
    else
      return self->_childCount + ~a3;
  }
  return result;
}

- (CGFloat)contentWidth
{
  CGRect v3;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "bounds");
  return CGRectGetWidth(v3) * (double)a1[52];
}

- (void)installChildViewAtIndex:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  char *v18;

  if (a1)
  {
    if (a2 < 0 || *(_QWORD *)(a1 + 416) <= a2)
    {
      v13 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[SFTabViewContainerView installChildViewAtIndex:].cold.1(v13, sel_installChildViewAtIndex_);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 456));
      objc_msgSend(WeakRetained, "containerView:childViewAtIndex:", a1, a2);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v5 = *(void **)(a1 + 424);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7)
        v8 = v7 == v14;
      else
        v8 = 0;
      if (!v8)
      {
        -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:](a1, a2, 1);
        v9 = (void *)MEMORY[0x1E0DC3F10];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __50__SFTabViewContainerView_installChildViewAtIndex___block_invoke;
        v15[3] = &unk_1E21E4388;
        v15[4] = a1;
        v10 = v14;
        v16 = v10;
        v17 = a2;
        v18 = sel_installChildViewAtIndex_;
        objc_msgSend(v9, "performWithoutAnimation:", v15);
        v11 = *(void **)(a1 + 424);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

      }
    }
  }
}

void __47__SFTabViewContainerView_reloadViewsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:](*(_QWORD *)(a1 + 32), a2, 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 432);
  v7 = a2 >= v5;
  v6 = a2 - v5;
  v7 = !v7 || v6 >= *(_QWORD *)(v4 + 440);
  if (!v7)
    -[SFTabViewContainerView installChildViewAtIndex:](v4, a2);
}

- (void)uninstallChildViewAtIndex:(int)a3 ignoringDelegateResult:
{
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = *(void **)(a1 + 424);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 456));
      if ((a3 & 1) != 0
        || (objc_opt_respondsToSelector() & 1) == 0
        || objc_msgSend(WeakRetained, "containerView:shouldDismantleChildView:atIndex:", a1, v8, a2))
      {
        v10 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v14 = v10;
          NSStringFromSelector(sel_uninstallChildViewAtIndex_ignoringDelegateResult_);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = CFSTR("NO");
          if (a3)
            v16 = CFSTR("YES");
          v17 = v16;
          v18 = 138412802;
          v19 = v15;
          v20 = 2048;
          v21 = a2;
          v22 = 2112;
          v23 = v17;
          _os_log_debug_impl(&dword_18B7B2000, v14, OS_LOG_TYPE_DEBUG, "%@%zd (teardown, ignoreDelegate=%@)", (uint8_t *)&v18, 0x20u);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "containerView:dismantleChildView:", a1, v8);
        objc_msgSend(v8, "removeFromSuperview");
        v11 = *(void **)(a1 + 424);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v12);

      }
      else
      {
        v13 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:].cold.1(v13, sel_uninstallChildViewAtIndex_ignoringDelegateResult_);
      }

    }
  }
}

void __50__SFTabViewContainerView_installChildViewAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  CGRect v19;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "allKeysForObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeObjectForKey:", v3),
        objc_msgSend(*(id *)(a1 + 40), "superview"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = *(void **)(a1 + 32),
        v4,
        v4 != v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "frameForChildAtIndex:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  v6 = WBS_LOG_CHANNEL_PREFIXTabGroupSwitcher();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(const char **)(a1 + 56);
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "frame");
    NSStringFromCGRect(v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v9;
    v14 = 2048;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_18B7B2000, v8, OS_LOG_TYPE_DEBUG, "%@%zd (installed, initial frame %@)", (uint8_t *)&v12, 0x20u);

  }
}

uint64_t __36__SFTabViewContainerView_reloadData__block_invoke(_QWORD *a1, uint64_t a2)
{
  if (a1[5] == *(_QWORD *)(a1[4] + 416))
    return a1[6];
  return a2;
}

- (void)setContentOffset:(double)a3
{
  double v5;

  -[SFTabViewContainerView contentOffset](self, "contentOffset");
  if (!_SFEqualWithEpsilon(v5, a3, 0.01))
  {
    -[SFTabViewContainerView bounds](self, "bounds");
    -[SFTabViewContainerView setBounds:](self, "setBounds:", a3);
    -[SFTabViewContainerView updateVisibleIndexes]((uint64_t)self);
  }
}

- (void)revealChildAtIndex:(int64_t)a3
{
  -[SFTabViewContainerView setContentOffset:](self, "setContentOffset:", -[SFTabViewContainerView contentOffsetForFractionalIndex:]((uint64_t *)self, (double)a3));
}

- (uint64_t)currentChildIndex
{
  uint64_t v2;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (a1[52])
  {
    objc_msgSend(a1, "contentOffset");
    v4 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(a1, "visibleRangeForContentOffset:nearestIndex:", &v4);
    return v4;
  }
  return v2;
}

- (double)contentOffsetForFractionalIndex:(uint64_t *)a1
{
  double Width;
  CGRect v6;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "bounds");
  Width = CGRectGetWidth(v6);
  if ((objc_msgSend(a1, "_sf_usesLeftToRightLayout") & 1) == 0)
    a2 = (double)a1[52] + -1.0 - a2;
  return Width * a2;
}

- (SFTabViewContainerView)initWithFrame:(CGRect)a3
{
  SFTabViewContainerView *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *childIndexToViewMap;
  SFTabViewContainerView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFTabViewContainerView;
  v3 = -[SFTabViewContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    childIndexToViewMap = v3->_childIndexToViewMap;
    v3->_childIndexToViewMap = v4;

    v3->_visibleRange.location = 0;
    v3->_visibleRange.length = 0;
    v6 = v3;
  }

  return v3;
}

- (void)reloadViewsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[SFTabViewContainerView visibleChildIndexes](self, "visibleChildIndexes");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)-[NSMutableDictionary copy](self->_childIndexToViewMap, "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          -[SFTabViewContainerView uninstallChildViewAtIndex:ignoringDelegateResult:]((uint64_t)self, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "integerValue"), 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__SFTabViewContainerView_reloadViewsAtIndexes___block_invoke;
  v10[3] = &unk_1E21E2BB0;
  v10[4] = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v10);

}

- (SFTabViewContainerView)init
{
  void *v3;
  SFTabViewContainerView *v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = -[SFTabViewContainerView initWithFrame:](self, "initWithFrame:");

  return v4;
}

- (void)layoutSubviews
{
  NSMutableDictionary *childIndexToViewMap;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFTabViewContainerView;
  -[SFTabViewContainerView layoutSubviews](&v5, sel_layoutSubviews);
  childIndexToViewMap = self->_childIndexToViewMap;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SFTabViewContainerView_layoutSubviews__block_invoke;
  v4[3] = &unk_1E21E4338;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](childIndexToViewMap, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __40__SFTabViewContainerView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "frameForChildAtIndex:", objc_msgSend(a2, "integerValue"));
  objc_msgSend(v5, "setFrame:");

}

- (NSIndexSet)visibleChildIndexes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", self->_visibleRange.location, self->_visibleRange.length);
}

- (void)setExtendsVisibleRange:(BOOL)a3
{
  if (self->_extendsVisibleRange != a3)
  {
    self->_extendsVisibleRange = a3;
    -[SFTabViewContainerView updateVisibleIndexes]((uint64_t)self);
  }
}

- (void)revealChildAtFractionalIndex:(double)a3
{
  -[SFTabViewContainerView setContentOffset:](self, "setContentOffset:", -[SFTabViewContainerView contentOffsetForFractionalIndex:]((uint64_t *)self, a3));
}

- (SFTabViewContainerViewDataSource)dataSource
{
  return (SFTabViewContainerViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BOOL)extendsVisibleRange
{
  return self->_extendsVisibleRange;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_childIndexToViewMap, 0);
}

- (void)uninstallChildViewAtIndex:(void *)a1 ignoringDelegateResult:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_18B7B2000, v5, v6, "%@%zd (skipped)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)installChildViewAtIndex:(void *)a1 .cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_18B7B2000, v5, v6, "%@%zd (return, index out of bounds)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
