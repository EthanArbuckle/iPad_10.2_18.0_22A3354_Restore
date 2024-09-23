@implementation SUUIScrollingSegmentedControllerCollectionView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  if (self->_performingLayout)
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingSegmentedControllerCollectionView;
    -[SUUIScrollingSegmentedControllerCollectionView layoutSubviews](&v4, sel_layoutSubviews);
  }
  else
  {
    self->_performingLayout = 1;
    v4.receiver = self;
    v4.super_class = (Class)SUUIScrollingSegmentedControllerCollectionView;
    -[SUUIScrollingSegmentedControllerCollectionView layoutSubviews](&v4, sel_layoutSubviews);
    self->_performingLayout = 0;
  }
  -[SUUIScrollingSegmentedControllerCollectionView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "scrollingSegmentedControllerCollectionViewDidLayoutSubviews:", self);

}

- (BOOL)isPerformingLayout
{
  return self->_performingLayout;
}

@end
