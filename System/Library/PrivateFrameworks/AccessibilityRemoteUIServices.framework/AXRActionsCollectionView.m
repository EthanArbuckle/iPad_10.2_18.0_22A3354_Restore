@implementation AXRActionsCollectionView

- (void)setContentSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXRActionsCollectionView;
  -[AXRActionsCollectionView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  -[AXRActionsCollectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[AXRActionsCollectionView layoutIfNeeded](self, "layoutIfNeeded");
  v3 = *MEMORY[0x24BDF7FB8];
  -[AXRActionsCollectionView contentSize](self, "contentSize");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

@end
