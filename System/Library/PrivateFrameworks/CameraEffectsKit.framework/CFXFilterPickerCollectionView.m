@implementation CFXFilterPickerCollectionView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  long double v6;
  double v7;
  double v8;
  CGFloat Width;
  BOOL v10;
  double v11;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)CFXFilterPickerCollectionView;
  -[JTCollectionView layoutSubviews](&v13, sel_layoutSubviews);
  if (-[CFXFilterPickerCollectionView enableInfiniteHorizontalScrolling](self, "enableInfiniteHorizontalScrolling"))
  {
    -[CFXFilterPickerCollectionView contentSize](self, "contentSize");
    v4 = v3;
    -[CFXFilterPickerCollectionView contentOffset](self, "contentOffset");
    v6 = v5;
    v8 = v7;
    -[CFXFilterPickerCollectionView bounds](self, "bounds");
    Width = CGRectGetWidth(v14);
    v10 = v6 < Width * 0.25;
    v11 = v4 - Width - Width * 0.25;
    if (v10 || v6 > v11)
      -[CFXFilterPickerCollectionView setContentOffset:](self, "setContentOffset:", floor(v4 / 3.0 + fmod(v6, v4 / 3.0)), v8);
  }
}

- (BOOL)enableInfiniteHorizontalScrolling
{
  return self->_enableInfiniteHorizontalScrolling;
}

- (void)setEnableInfiniteHorizontalScrolling:(BOOL)a3
{
  self->_enableInfiniteHorizontalScrolling = a3;
}

@end
