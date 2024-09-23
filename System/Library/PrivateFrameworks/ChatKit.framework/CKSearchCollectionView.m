@implementation CKSearchCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSearchCollectionView;
  -[CKSearchCollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](&v7, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKSearchCollectionView marginInsets](self, "marginInsets");
    objc_msgSend(v5, "setMarginInsets:");
  }
  return v5;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKSearchCollectionView;
  -[CKSearchCollectionView dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:](&v12, sel_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKSearchCollectionView marginInsets](self, "marginInsets");
    objc_msgSend(v6, "setMarginInsets:");
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend((id)objc_opt_class(), "desiredZPositionForMode:", -[CKSearchCollectionView mode](self, "mode"));
LABEL_7:
    v9 = v8;
    objc_msgSend(v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setZPosition:", v9);
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend((id)objc_opt_class(), "desiredZPosition");
    goto LABEL_7;
  }
  return v6;
}

- (void)setDataSource:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[CKSearchCollectionView suppressDatasourceUpdates](self, "suppressDatasourceUpdates"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKSearchCollectionView;
    -[CKSearchCollectionView setDataSource:](&v5, sel_setDataSource_, v4);
  }

}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  if (!-[CKSearchCollectionView lockContentOffset](self, "lockContentOffset"))
  {
    -[CKSearchCollectionView contentOffset](self, "contentOffset");
    if (x != v7 || y != v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)CKSearchCollectionView;
      -[CKSearchCollectionView setContentOffset:](&v9, sel_setContentOffset_, x, y);
    }
  }
}

- (void)_ck_setEditing:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->__ck_editing != a3)
  {
    self->__ck_editing = a3;
    if (!a3)
    {
      -[CKSearchCollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __41__CKSearchCollectionView__ck_setEditing___block_invoke;
      v5[3] = &unk_1E2756700;
      v5[4] = self;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

    }
  }
}

uint64_t __41__CKSearchCollectionView__ck_setEditing___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", a2, 0);
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marginInsets.top;
  left = self->_marginInsets.left;
  bottom = self->_marginInsets.bottom;
  right = self->_marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

- (BOOL)suppressDatasourceUpdates
{
  return self->_suppressDatasourceUpdates;
}

- (void)setSuppressDatasourceUpdates:(BOOL)a3
{
  self->_suppressDatasourceUpdates = a3;
}

- (BOOL)lockContentOffset
{
  return self->_lockContentOffset;
}

- (void)setLockContentOffset:(BOOL)a3
{
  self->_lockContentOffset = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

@end
