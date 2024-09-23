@implementation _UIDocumentPickerFlowLayout

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerFlowLayout;
  -[UICollectionViewFlowLayout collectionViewContentSize](&v14, sel_collectionViewContentSize);
  v4 = v3;
  v6 = v5;
  -[_UIDocumentPickerFlowLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  -[_UIDocumentPickerFlowLayout contentSizeAdjustment](self, "contentSizeAdjustment");
  v11 = fmax(v6, v10 + v9);

  v12 = v4;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)canBeEdited
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection");
  -[_UIDocumentPickerFlowLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  if (!v8 && v11 != width || v8 == 1 && v13 != height)
    return 1;
  v15.receiver = self;
  v15.super_class = (Class)_UIDocumentPickerFlowLayout;
  return -[UICollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](&v15, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
}

- (int64_t)cellStyle
{
  return self->cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->cellStyle = a3;
}

- (double)contentSizeAdjustment
{
  return self->_contentSizeAdjustment;
}

- (void)setContentSizeAdjustment:(double)a3
{
  self->_contentSizeAdjustment = a3;
}

@end
