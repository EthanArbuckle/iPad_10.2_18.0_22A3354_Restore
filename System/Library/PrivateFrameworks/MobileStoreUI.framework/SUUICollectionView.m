@implementation SUUICollectionView

- (SUUICollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  SUUICollectionView *v4;
  SUUICollectionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUICollectionView;
  v4 = -[SUUICollectionView initWithFrame:collectionViewLayout:](&v7, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_externalShowsHorizontalScrollIndicator = -[SUUICollectionView showsHorizontalScrollIndicator](v4, "showsHorizontalScrollIndicator");
    v5->_externalShowsVerticalScrollIndicator = -[SUUICollectionView showsVerticalScrollIndicator](v5, "showsVerticalScrollIndicator");
    -[SUUICollectionView setPrefetchingEnabled:](v5, "setPrefetchingEnabled:", 0);
    -[SUUICollectionView _setContentInsetAdjustmentBehavior:](v5, "_setContentInsetAdjustmentBehavior:", 101);
  }
  return v5;
}

- (id)collectionViewLayout
{
  UICollectionViewLayout *pendingCollectionViewLayout;
  objc_super v4;

  pendingCollectionViewLayout = self->_pendingCollectionViewLayout;
  if (pendingCollectionViewLayout)
    return pendingCollectionViewLayout;
  v4.receiver = self;
  v4.super_class = (Class)SUUICollectionView;
  -[SUUICollectionView collectionViewLayout](&v4, sel_collectionViewLayout);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCollectionViewLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionViewLayout **p_pendingCollectionViewLayout;
  id v8;
  UICollectionViewLayout *v9;
  objc_super v10;

  v4 = a4;
  p_pendingCollectionViewLayout = &self->_pendingCollectionViewLayout;
  objc_storeStrong((id *)&self->_pendingCollectionViewLayout, a3);
  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUICollectionView;
  -[SUUICollectionView setCollectionViewLayout:animated:](&v10, sel_setCollectionViewLayout_animated_, v8, v4);
  v9 = *p_pendingCollectionViewLayout;
  *p_pendingCollectionViewLayout = 0;

}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUICollectionView;
  v4 = a3;
  -[SUUICollectionView setDelegate:](&v6, sel_setDelegate_, v4);
  v5 = objc_opt_respondsToSelector();

  self->_delegateWantsWillLayoutSubviews = v5 & 1;
}

- (CGRect)bounds
{
  double v3;
  double v4;
  double overrideBoundsWidth;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)SUUICollectionView;
  -[SUUICollectionView bounds](&v7, sel_bounds);
  if (self->_overrideBoundsWidth > 0.00000011920929)
    overrideBoundsWidth = self->_overrideBoundsWidth;
  result.size.height = v6;
  result.size.width = overrideBoundsWidth;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  if (self->_delegateWantsWillLayoutSubviews)
  {
    -[SUUICollectionView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "SUUICollectionViewWillLayoutSubviews:", self);

  }
  if (self->_refreshControl)
    -[SUUICollectionView sendSubviewToBack:](self, "sendSubviewToBack:");
  v4.receiver = self;
  v4.super_class = (Class)SUUICollectionView;
  -[SUUICollectionView layoutSubviews](&v4, sel_layoutSubviews);
  -[SUUICollectionView _updateIndexBarControlFrame](self, "_updateIndexBarControlFrame");
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUICollectionView;
  -[SUUICollectionView setContentOffset:animated:](&v5, sel_setContentOffset_animated_, a4, a3.x, a3.y);
  -[SUUICollectionView _updateIndexBarControlFrame](self, "_updateIndexBarControlFrame");
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  if (self->_externalShowsHorizontalScrollIndicator != a3)
  {
    self->_externalShowsHorizontalScrollIndicator = a3;
    -[SUUICollectionView _updateShowsScrollIndicators](self, "_updateShowsScrollIndicators");
  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  if (self->_externalShowsVerticalScrollIndicator != a3)
  {
    self->_externalShowsVerticalScrollIndicator = a3;
    -[SUUICollectionView _updateShowsScrollIndicators](self, "_updateShowsScrollIndicators");
  }
}

- (void)setIndexBarControl:(id)a3
{
  SUUIIndexBarControl *v5;
  SUUIIndexBarControl **p_indexBarControl;
  SUUIIndexBarControl *indexBarControl;
  SUUIIndexBarControl *v8;

  v5 = (SUUIIndexBarControl *)a3;
  p_indexBarControl = &self->_indexBarControl;
  indexBarControl = self->_indexBarControl;
  v8 = v5;
  if (indexBarControl != v5)
  {
    if (-[SUUIIndexBarControl isDescendantOfView:](indexBarControl, "isDescendantOfView:", self))
      -[SUUIIndexBarControl removeFromSuperview](*p_indexBarControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_indexBarControl, a3);
    -[SUUICollectionView _updateShowsScrollIndicators](self, "_updateShowsScrollIndicators");
    -[SUUICollectionView setNeedsLayout](self, "setNeedsLayout");
    v5 = *p_indexBarControl;
  }
  if (v5 && (-[SUUIIndexBarControl isDescendantOfView:](v5, "isDescendantOfView:", self) & 1) == 0)
  {
    -[SUUICollectionView addSubview:](self, "addSubview:", *p_indexBarControl);
    -[SUUICollectionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setRefreshControl:(id)a3
{
  UIRefreshControl *v5;
  UIRefreshControl *refreshControl;
  UIRefreshControl *v7;

  v5 = (UIRefreshControl *)a3;
  refreshControl = self->_refreshControl;
  if (refreshControl != v5)
  {
    v7 = v5;
    if (refreshControl)
      -[UIRefreshControl removeFromSuperview](refreshControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_refreshControl, a3);
    -[SUUICollectionView _addContentSubview:atBack:](self, "_addContentSubview:atBack:", self->_refreshControl, 1);
    v5 = v7;
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUICollectionView;
  -[SUUICollectionView setContentInset:](&v3, sel_setContentInset_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)_updateIndexBarControlFrame
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
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double Height;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double MaxX;
  CGFloat v30;
  CGFloat MinY;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[SUUICollectionView bounds](self, "bounds");
  v4 = v3;
  rect_24 = v5;
  v36 = v3;
  v6 = v5;
  v8 = v7;
  rect_8 = v9;
  rect_16 = v7;
  v10 = v9;
  -[SUUICollectionView contentInset](self, "contentInset");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[SUUIIndexBarControl frame](self->_indexBarControl, "frame");
  v20 = v19;
  rect = v19;
  v22 = v21;
  v37.origin.x = v12;
  v37.origin.y = v14;
  v37.size.width = v16;
  v37.size.height = v18;
  v23 = CGRectGetWidth(v37) * 0.25;
  v38.origin.x = v12;
  v38.origin.y = v14;
  v38.size.width = v16;
  v38.size.height = v18;
  Height = CGRectGetHeight(v38);
  -[SUUIIndexBarControl sizeThatFits:](self->_indexBarControl, "sizeThatFits:", v23, Height);
  v26 = v25;
  v39.size.height = v27;
  v39.origin.x = v20;
  v39.origin.y = v22;
  v39.size.width = v26;
  v28 = CGRectGetHeight(v39);
  if (v28 >= Height)
    Height = v28;
  v40.origin.x = v12;
  v40.origin.y = v14;
  v40.size.width = v16;
  v40.size.height = v18;
  MaxX = CGRectGetMaxX(v40);
  v41.origin.x = rect;
  v41.origin.y = v22;
  v41.size.width = v26;
  v41.size.height = Height;
  v30 = MaxX - CGRectGetWidth(v41);
  v42.origin.x = v12;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  MinY = CGRectGetMinY(v42);
  -[SUUIIndexBarControl setFrame:](self->_indexBarControl, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v30, MinY, v26, Height, v36, rect_24, rect_16, rect_8));
}

- (void)_updateShowsScrollIndicators
{
  _BOOL8 externalShowsHorizontalScrollIndicator;
  objc_super v4;
  objc_super v5;
  objc_super v6;
  objc_super v7;

  if (self->_indexBarControl)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUICollectionView;
    -[SUUICollectionView setShowsHorizontalScrollIndicator:](&v7, sel_setShowsHorizontalScrollIndicator_, 0);
    v6.receiver = self;
    v6.super_class = (Class)SUUICollectionView;
    -[SUUICollectionView setShowsVerticalScrollIndicator:](&v6, sel_setShowsVerticalScrollIndicator_, 0, v4.receiver, v4.super_class);
  }
  else
  {
    externalShowsHorizontalScrollIndicator = self->_externalShowsHorizontalScrollIndicator;
    v5.receiver = self;
    v5.super_class = (Class)SUUICollectionView;
    -[SUUICollectionView setShowsHorizontalScrollIndicator:](&v5, sel_setShowsHorizontalScrollIndicator_, externalShowsHorizontalScrollIndicator);
    -[SUUICollectionView setShowsVerticalScrollIndicator:](&v4, sel_setShowsVerticalScrollIndicator_, self->_externalShowsVerticalScrollIndicator, self, SUUICollectionView);
  }
}

- (double)overrideBoundsWidth
{
  return self->_overrideBoundsWidth;
}

- (void)setOverrideBoundsWidth:(double)a3
{
  self->_overrideBoundsWidth = a3;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (SUUIIndexBarControl)indexBarControl
{
  return self->_indexBarControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexBarControl, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_pendingCollectionViewLayout, 0);
}

@end
