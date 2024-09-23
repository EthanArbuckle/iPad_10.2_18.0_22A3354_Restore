@implementation CKBrowserSwitcherScrollPreventer

- (CKBrowserSwitcherScrollPreventer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKBrowserSwitcherScrollPreventer *v7;
  CKBrowserSwitcherScrollPreventer *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CKBrowserSwitcherScrollPreventer;
  v7 = -[CKBrowserSwitcherScrollPreventer initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[CKBrowserSwitcherScrollPreventer setBackgroundColor:](v7, "setBackgroundColor:", 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA970]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v9, "setDelegate:", v8);
    objc_msgSend(v9, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v9, "setBouncesVertically:", 0);
    objc_msgSend(v9, "setPagingEnabled:", 1);
    -[CKBrowserSwitcherScrollPreventer setHorizontalScrollView:](v8, "setHorizontalScrollView:", v9);
    -[CKBrowserSwitcherScrollPreventer addSubview:](v8, "addSubview:", v9);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "browserSwitcherGutterWidth");
    v12 = v11;

    objc_msgSend(v9, "_setInterpageSpacing:", v12, 0.0);
    v13 = v12 * 0.5;
    if (CKMainScreenScale_once_58 != -1)
      dispatch_once(&CKMainScreenScale_once_58, &__block_literal_global_150);
    v14 = *(double *)&CKMainScreenScale_sMainScreenScale_58;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_58 == 0.0)
      v14 = 1.0;
    objc_msgSend(v9, "_setPagingOrigin:", round(v13 * v14) / v14, 0.0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "browserSwitcherEdgeGestureWidth");
    v17 = v16;

    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectInset(v21, v17, 0.0);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    -[CKBrowserSwitcherScrollPreventer setHorizontalScrollPreventerView:](v8, "setHorizontalScrollPreventerView:", v18);
    -[CKBrowserSwitcherScrollPreventer addSubview:](v8, "addSubview:", v18);

  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)layoutSubviews
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24.receiver = self;
  v24.super_class = (Class)CKBrowserSwitcherScrollPreventer;
  -[CKBrowserSwitcherScrollPreventer layoutSubviews](&v24, sel_layoutSubviews);
  v3 = -[CKBrowserSwitcherScrollPreventer isEngaged](self, "isEngaged");
  -[CKBrowserSwitcherScrollPreventer setEngaged:](self, "setEngaged:", 0);
  -[CKBrowserSwitcherScrollPreventer bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "browserSwitcherEdgeGestureWidth");
  v15 = v14;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v26 = CGRectInset(v25, v15, 0.0);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  -[CKBrowserSwitcherScrollPreventer horizontalScrollPreventerView](self, "horizontalScrollPreventerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", x, y, width, height);

  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  v21 = CGRectGetHeight(v27);
  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentSize:", 1.79769313e308, v21);

  -[CKBrowserSwitcherScrollPreventer delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scrollPreventerDidLayoutSubviews:", self);

  -[CKBrowserSwitcherScrollPreventer setEngaged:](self, "setEngaged:", v3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CKBrowserSwitcherScrollPreventer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollPreventerWillBeginDragging:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 == v12)
  {
    objc_msgSend(v12, "contentOffset");
    v7 = v6;
    v9 = v8;
    v10 = -[CKBrowserSwitcherScrollPreventer isEngaged](self, "isEngaged");
    v5 = v12;
    if (v10)
    {
      -[CKBrowserSwitcherScrollPreventer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scrollPreventer:scrolledToOffset:", self, v7, v9);

      v5 = v12;
    }
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
    goto LABEL_4;
  v5 = -[CKBrowserSwitcherScrollPreventer isEngaged](self, "isEngaged");

  if (v5)
  {
    -[CKBrowserSwitcherScrollPreventer delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollPreventerDidEndDecelerating:", self);
LABEL_4:

  }
}

- (CGPoint)contentOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", x, y);

}

- (CGSize)contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentSize:", width, height);

}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_scrollEnabled != a3)
  {
    v3 = a3;
    self->_scrollEnabled = a3;
    -[CKBrowserSwitcherScrollPreventer horizontalScrollView](self, "horizontalScrollView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScrollEnabled:", v3);

  }
}

- (void)setSwitching:(BOOL)a3
{
  if (self->_switching != a3)
    self->_switching = a3;
}

- (BOOL)isEngaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (BOOL)isSwitching
{
  return self->_switching;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (CKBrowserSwitcherScrollPreventerDelegate)delegate
{
  return (CKBrowserSwitcherScrollPreventerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIScrollView)horizontalScrollView
{
  return self->_horizontalScrollView;
}

- (void)setHorizontalScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalScrollView, a3);
}

- (UIView)horizontalScrollPreventerView
{
  return self->_horizontalScrollPreventerView;
}

- (void)setHorizontalScrollPreventerView:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalScrollPreventerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalScrollPreventerView, 0);
  objc_storeStrong((id *)&self->_horizontalScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
