@implementation AVTMinimumContentSizeCollectionViewLayout

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGSize result;

  v24.receiver = self;
  v24.super_class = (Class)AVTMinimumContentSizeCollectionViewLayout;
  -[UICollectionViewFlowLayout collectionViewContentSize](&v24, sel_collectionViewContentSize);
  v4 = v3;
  v6 = v5;
  -[AVTMinimumContentSizeCollectionViewLayout minimumContentSize](self, "minimumContentSize");
  v8 = v7;
  -[AVTMinimumContentSizeCollectionViewLayout minimumContentSize](self, "minimumContentSize");
  v10 = v9;
  -[AVTMinimumContentSizeCollectionViewLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "contentInsetAdjustmentBehavior");

  if (v12 != 2)
  {
    -[AVTMinimumContentSizeCollectionViewLayout collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "adjustedContentInset");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v8 = v8 - (v17 + v21);
    v10 = v10 - (v15 + v19);
  }
  if (v4 >= v8)
    v22 = v4;
  else
    v22 = v8;
  if (v6 >= v10)
    v23 = v6;
  else
    v23 = v10;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)minimumContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumContentSize.width;
  height = self->_minimumContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumContentSize:(CGSize)a3
{
  self->_minimumContentSize = a3;
}

@end
