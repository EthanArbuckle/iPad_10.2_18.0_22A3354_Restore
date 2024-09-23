@implementation NTKCFaceDetailKaleidoscopeEditOptionCell

- (void)_setupFromCollection
{
  objc_super v3;

  -[NTKCFaceDetailKaleidoscopeEditOptionCell setUserOptionIndex:](self, "setUserOptionIndex:", 0x7FFFFFFFFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailKaleidoscopeEditOptionCell;
  -[NTKCFaceDetailEditOptionCell _setupFromCollection](&v3, sel__setupFromCollection);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  objc_super v11;

  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKCFaceDetailKaleidoscopeEditOptionCell;
  v9 = a5;
  -[NTKCFaceDetailEditOptionCell collectionView:willDisplayCell:forItemAtIndexPath:](&v11, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v8, v9);
  v10 = objc_msgSend(v9, "row", v11.receiver, v11.super_class);

  if (v10 == self->_userOptionIndex)
    objc_msgSend(v8, "setActive:animated:", 0, 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row") == self->_userOptionIndex)
  {
    -[NTKCFaceDetailKaleidoscopeEditOptionCell delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "kaleidoscopeEditOptionCellDidSelectUserOption:", self);

    -[NTKCFaceDetailEditOptionCell _ensureIndexPathVisible:animated:](self, "_ensureIndexPathVisible:animated:", v7, 1);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKCFaceDetailKaleidoscopeEditOptionCell;
    -[NTKCFaceDetailEditOptionCell collectionView:didSelectItemAtIndexPath:](&v9, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);
  }

}

- (void)setUserOptionIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_userOptionIndex != a3)
  {
    self->_userOptionIndex = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NTKCFaceDetailEditOptionCell collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:", self->_userOptionIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setActive:animated:", 0, 0);
    }
  }
}

- (void)selectUserOption
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeCustomAssetOption, "optionWithAsset:forDevice:", 1000, v3);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v13);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailEditOptionCell collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathsForVisibleItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__NTKCFaceDetailKaleidoscopeEditOptionCell_selectUserOption__block_invoke;
      v14[3] = &unk_1E6BCD778;
      v14[4] = self;
      v15 = v7;
      objc_msgSend(v11, "performWithoutAnimation:", v14);

    }
    -[NTKCFaceDetailEditOptionCell collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailKaleidoscopeEditOptionCell collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v12, v7);

  }
}

void __60__NTKCFaceDetailKaleidoscopeEditOptionCell_selectUserOption__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadItemsAtIndexPaths:", v3);

}

- (NTKCFaceDetailKaleidoscopeEditOptionCellDelegate)delegate
{
  return (NTKCFaceDetailKaleidoscopeEditOptionCellDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (int64_t)userOptionIndex
{
  return self->_userOptionIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

@end
