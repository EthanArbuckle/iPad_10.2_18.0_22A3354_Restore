@implementation JTCollectionView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;

  -[JTCollectionView setInLayout:](self, "setInLayout:", 1);
  -[JTCollectionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[JTCollectionView lastCollectionViewSize](self, "lastCollectionViewSize");
  if (v4 != v8 || v6 != v7)
  {
    -[JTCollectionView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[JTCollectionView delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "collectionView:didResize:", self, v4, v6);

    }
    -[JTCollectionView setLastCollectionViewSize:](self, "setLastCollectionViewSize:", v4, v6);
  }
  v13.receiver = self;
  v13.super_class = (Class)JTCollectionView;
  -[JTCollectionView layoutSubviews](&v13, sel_layoutSubviews);
  -[JTCollectionView setInLayout:](self, "setInLayout:", 0);
}

- (int64_t)selectedItem
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[JTCollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "item");
  else
    v5 = 0;

  return v5;
}

- (id)sortedIndexPathsForVisibleItems
{
  void *v2;
  void *v3;

  -[JTCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __51__JTCollectionView_sortedIndexPathsForVisibleItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "section");
  if (v6 >= objc_msgSend(v5, "section"))
  {
    v8 = objc_msgSend(v4, "section");
    if (v8 > objc_msgSend(v5, "section"))
    {
      v7 = 1;
      goto LABEL_9;
    }
    v9 = objc_msgSend(v4, "section");
    if (v9 != objc_msgSend(v5, "section"))
    {
      v7 = 0;
      goto LABEL_9;
    }
    v10 = objc_msgSend(v4, "item");
    if (v10 >= objc_msgSend(v5, "item"))
    {
      v11 = objc_msgSend(v4, "item");
      v7 = v11 > objc_msgSend(v5, "item");
      goto LABEL_9;
    }
  }
  v7 = -1;
LABEL_9:

  return v7;
}

- (id)firstVisibleIndexPath
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[JTCollectionView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JTCollectionView sortedIndexPathsForVisibleItems](self, "sortedIndexPathsForVisibleItems");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[JTCollectionView layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v9, (_QWORD)v25);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "frame");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;
          -[JTCollectionView superview](self, "superview");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[JTCollectionView convertRect:toView:](self, "convertRect:toView:", v19, v12, v14, v16, v18);
          v21 = v20;

          if (v21 >= 0.0)
          {
            v22 = v9;

            goto LABEL_12;
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v6)
          continue;
        break;
      }
    }
    v22 = 0;
LABEL_12:

    v23 = v22;
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (id)visibleSections
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[JTCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "section", (_QWORD)v10));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (void)layoutIfNeeded
{
  objc_super v3;

  if (!-[JTCollectionView inLayout](self, "inLayout"))
  {
    v3.receiver = self;
    v3.super_class = (Class)JTCollectionView;
    -[JTCollectionView layoutIfNeeded](&v3, sel_layoutIfNeeded);
  }
}

- (CGSize)lastCollectionViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastCollectionViewSize.width;
  height = self->_lastCollectionViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastCollectionViewSize:(CGSize)a3
{
  self->_lastCollectionViewSize = a3;
}

- (BOOL)inLayout
{
  return self->_inLayout;
}

- (void)setInLayout:(BOOL)a3
{
  self->_inLayout = a3;
}

@end
