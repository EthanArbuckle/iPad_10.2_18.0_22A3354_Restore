@implementation ICDocCamThumbnailContainerView

- (BOOL)isAccessibilityElement
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  BOOL v12;

  v3 = objc_opt_class();
  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DCDynamicCast(v3, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "collectionView:numberOfItemsInSection:", v9, 0);

  v11 = objc_msgSend(v6, "compactLayout");
  if (v10)
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v5, 0);

  return v6 == 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v5, 0);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("%lu_SCANNED_IMAGE_THUMBNAILS"), CFSTR("%lu_SCANNED_IMAGE_THUMBNAILS"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (-[ICDocCamThumbnailContainerView isAccessibilityElement](self, "isAccessibilityElement"))
  {
    -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailContainerView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v5, 0);

    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to preview %lu scanned images"), CFSTR("Double-tap to preview %lu scanned images"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (CGRect)accessibilityFrame
{
  CGRect *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (CGRect *)MEMORY[0x24BDBF090];
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ICDocCamThumbnailContainerView collectionView](self, "collectionView", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v31.origin.x = v3;
        v31.origin.y = v4;
        v31.size.width = v5;
        v31.size.height = v6;
        if (CGRectEqualToRect(v31, *v2))
        {
          objc_msgSend(v12, "accessibilityFrame");
        }
        else
        {
          objc_msgSend(v12, "accessibilityFrame");
          v34.origin.x = v17;
          v34.origin.y = v18;
          v34.size.width = v19;
          v34.size.height = v20;
          v32.origin.x = v3;
          v32.origin.y = v4;
          v32.size.width = v5;
          v32.size.height = v6;
          *(CGRect *)&v13 = CGRectUnion(v32, v34);
        }
        v3 = v13;
        v4 = v14;
        v5 = v15;
        v6 = v16;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v21 = v3;
  v22 = v4;
  v23 = v5;
  v24 = v6;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
