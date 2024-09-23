@implementation SUUIModernChartsView

- (SUUIModernChartsView)initWithFrame:(CGRect)a3
{
  SUUIModernChartsView *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  uint64_t v6;
  _UIBackdropView *backdropView;
  UIView *v8;
  UIView *headerView;
  UIView *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SUUIModernChartsView;
  v3 = -[SUUIModernChartsView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
    scrollView = v3->_scrollView;
    v3->_scrollView = v4;

    -[UIScrollView setAutoresizingMask:](v3->_scrollView, "setAutoresizingMask:", 18);
    -[UIScrollView setAlwaysBounceHorizontal:](v3->_scrollView, "setAlwaysBounceHorizontal:", 1);
    -[UIScrollView setBouncesHorizontally:](v3->_scrollView, "setBouncesHorizontally:", 1);
    -[UIScrollView setBouncesVertically:](v3->_scrollView, "setBouncesVertically:", 0);
    -[UIScrollView setCanCancelContentTouches:](v3->_scrollView, "setCanCancelContentTouches:", 0);
    -[UIScrollView setDelaysContentTouches:](v3->_scrollView, "setDelaysContentTouches:", 0);
    -[UIScrollView setDelegate:](v3->_scrollView, "setDelegate:", v3);
    -[SUUIModernChartsView addSubview:](v3, "addSubview:", v3->_scrollView);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 2010);
    backdropView = v3->_backdropView;
    v3->_backdropView = (_UIBackdropView *)v6;

    -[_UIBackdropView setAutoresizingMask:](v3->_backdropView, "setAutoresizingMask:", 2);
    -[SUUIModernChartsView addSubview:](v3, "addSubview:", v3->_backdropView);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    headerView = v3->_headerView;
    v3->_headerView = v8;

    -[UIView setAutoresizingMask:](v3->_headerView, "setAutoresizingMask:", 2);
    v10 = v3->_headerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SUUIModernChartsView addSubview:](v3, "addSubview:", v3->_headerView);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE088], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIModernChartsView;
  -[SUUIModernChartsView dealloc](&v4, sel_dealloc);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setColumnViewControllers:(id)a3
{
  id v5;
  NSArray *viewControllers;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  UIScrollView *scrollView;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  viewControllers = self->_viewControllers;
  if (viewControllers)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = viewControllers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeFromSuperview");

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

  }
  objc_storeStrong((id *)&self->_viewControllers, a3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_viewControllers;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        scrollView = self->_scrollView;
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "view", (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollView addSubview:](scrollView, "addSubview:", v19);

      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[SUUIModernChartsView _updateHeader](self, "_updateHeader");
  -[SUUIModernChartsView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SUUIModernChartsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)scrollViewDidScroll:(id)a3
{
  -[UIView bounds](self->_headerView, "bounds", a3);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[UIView setBounds:](self->_headerView, "setBounds:");
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double top;
  NSArray *viewControllers;
  double v11;
  double v12;
  double v13;
  double left;
  double v15;
  double bottom;
  double right;
  _UIBackdropView *backdropView;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)SUUIModernChartsView;
  -[SUUIModernChartsView layoutSubviews](&v19, sel_layoutSubviews);
  -[SUUIModernChartsView bounds](self, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v7 = CGRectGetWidth(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v8 = CGRectGetHeight(v21);
  top = self->_contentInset.top;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", 0.0, top, v7, 44.0);
  -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, top, v7, 44.0);
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, 0.0, v7, v8);
  viewControllers = self->_viewControllers;
  if (viewControllers)
  {
    v11 = (double)-[NSArray count](viewControllers, "count");
    v12 = (double)(-[NSArray count](self->_viewControllers, "count") - 1);
    v13 = fmax((v7 + -20.0 - v12 * 28.0 + -20.0) / v11, 285.0);
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v12 * 28.0 + 20.0 + v11 * v13 + 20.0, v8);
    v15 = self->_contentInset.top;
    left = self->_contentInset.left;
    bottom = self->_contentInset.bottom;
    right = self->_contentInset.right;
    backdropView = self->_backdropView;
    if (self->_hideHeader)
    {
      -[_UIBackdropView setHidden:](backdropView, "setHidden:", 1);
      -[UIView setHidden:](self->_headerView, "setHidden:", 1);
    }
    else
    {
      -[_UIBackdropView setHidden:](backdropView, "setHidden:", 0);
      -[UIView setHidden:](self->_headerView, "setHidden:", 0);
      v15 = v15 + 44.0;
      -[SUUIModernChartsView _layoutHeadersWithColumnSize:](self, "_layoutHeadersWithColumnSize:", v13, v8);
    }
    -[SUUIModernChartsView _layoutViewControllersWithColumnSize:contentInset:](self, "_layoutViewControllersWithColumnSize:contentInset:", v13, v8, v15, left, bottom, right);
  }
  else
  {
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[SUUIModernChartsView _updateHeader](self, "_updateHeader", a3);
  -[SUUIModernChartsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_layoutHeadersWithColumnSize:(CGSize)a3
{
  double width;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGRect v17;

  width = a3.width;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_headerViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = 20.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "frame", (_QWORD)v11);
        objc_msgSend(v10, "setFrame:", v8, floor((44.0 - CGRectGetHeight(v17)) * 0.5), width);
        v8 = width + 28.0 + v8;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_layoutViewControllersWithColumnSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4
{
  double top;
  double height;
  double width;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  top = a4.top;
  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_viewControllers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = 20.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "view", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setFrame:", v11, 0.0, width, height);
        objc_msgSend(v13, "contentScrollView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "contentInset");
          objc_msgSend(v16, "setContentInset:", top);
          objc_msgSend(v16, "scrollIndicatorInsets");
          objc_msgSend(v16, "setScrollIndicatorInsets:", top);
        }
        v11 = width + 28.0 + v11;

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_updateHeader
{
  NSMutableArray *headerViews;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SUUIModernChartHeaderView *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  headerViews = self->_headerViews;
  if (!headerViews)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_headerViews;
    self->_headerViews = v4;

    headerViews = self->_headerViews;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = headerViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10++), "removeFromSuperview");
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->_headerViews, "removeAllObjects");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_viewControllers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = objc_alloc_init(SUUIModernChartHeaderView);
        objc_msgSend(v16, "title", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIModernChartHeaderView setTitle:](v17, "setTitle:", v18);

        -[NSMutableArray addObject:](self->_headerViews, "addObject:", v17);
        -[UIView addSubview:](self->_headerView, "addSubview:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  self->_hideHeader = -[NSMutableArray count](self->_headerViews, "count") == 0;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
