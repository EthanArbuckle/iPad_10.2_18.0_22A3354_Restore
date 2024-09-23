@implementation SUUIScrollingTabBarContentCollectionView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  if (self->_performingLayout)
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingTabBarContentCollectionView;
    -[SUUIScrollingTabBarContentCollectionView layoutSubviews](&v4, sel_layoutSubviews);
  }
  else
  {
    self->_performingLayout = 1;
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingTabBarContentCollectionView;
    -[SUUIScrollingTabBarContentCollectionView layoutSubviews](&v4, sel_layoutSubviews);
    self->_performingLayout = 0;
  }
  -[SUUIScrollingTabBarContentCollectionView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "scrollingTabBarContentCollectionViewDidLayoutSubviews:", self);

}

- (void)_reuseCell:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIScrollingTabBarContentCollectionView.m"), 36, CFSTR("%@ only supports cells of type SUUIViewControllerContainerCollectionViewCell."), self);

  }
  objc_msgSend(v8, "removeFromSuperview");
  -[SUUIScrollingTabBarContentCollectionView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:didEndDisplayingCell:forItemAtIndexPath:", self, v8, v6);

  }
}

- (BOOL)isPerformingLayout
{
  return self->_performingLayout;
}

@end
