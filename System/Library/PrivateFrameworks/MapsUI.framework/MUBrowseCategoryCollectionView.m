@implementation MUBrowseCategoryCollectionView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUBrowseCategoryCollectionView;
  -[MUBrowseCategoryCollectionView layoutSubviews](&v3, sel_layoutSubviews);
  -[MUBrowseCategoryCollectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

@end
