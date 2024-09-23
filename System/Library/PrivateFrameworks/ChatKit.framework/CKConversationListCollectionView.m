@implementation CKConversationListCollectionView

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[CKConversationListCollectionView scrollIndicatorInsets](self, "scrollIndicatorInsets");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKConversationListCollectionView;
    -[CKConversationListCollectionView setScrollIndicatorInsets:](&v15, sel_setScrollIndicatorInsets_, top, left, bottom, right);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[CKConversationListCollectionView contentInset](self, "contentInset");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKConversationListCollectionView;
    -[CKConversationListCollectionView setContentInset:](&v15, sel_setContentInset_, top, left, bottom, right);
  }
}

- (id)_indexPathForInsertionAtPoint:(CGPoint)a3 sourceIndexPath:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    -[CKConversationListCollectionView collectionViewLayout](self, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_layoutAttributesForItemNearestPosition:maximumDistance:", x, y, 1000.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKConversationListCollectionView;
    -[CKConversationListCollectionView _indexPathForInsertionAtPoint:sourceIndexPath:](&v12, sel__indexPathForInsertionAtPoint_sourceIndexPath_, v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
