@implementation SUUIGiftThemePickerFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double currentPage;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  currentPage = (double)self->_currentPage;
  -[SUUIGiftThemePickerFlowLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5 * currentPage;

  v7 = 0.0;
  v8 = v6;
  result.y = v7;
  result.x = v8;
  return result;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

@end
