@implementation HUMosaicLayout

- (void)prepareLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  CGRect v35;

  v34.receiver = self;
  v34.super_class = (Class)HUMosaicLayout;
  -[HUMosaicLayout prepareLayout](&v34, sel_prepareLayout);
  -[HUMosaicLayout attributeCache](self, "attributeCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[HUMosaicLayout contentBounds](self, "contentBounds");
  if (CGRectIsEmpty(v35))
  {
    -[HUMosaicLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    -[HUMosaicLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[HUMosaicLayout setContentBounds:](self, "setContentBounds:", 0.0, 0.0, v6);

  }
  -[HUMosaicLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfSections");

  if (v9 >= 1)
  {
    -[HUMosaicLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfItemsInSection:", 0);

    -[HUMosaicLayout delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutGeometry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUMosaicLayout delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "cellSizeForItemAtIndexPath:", v16);

        +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:](HUMosaicCellSize, "createMosaicCellSizeForSizeDescription:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

      }
    }
    -[HUMosaicLayout contentBounds](self, "contentBounds");
    +[HUMosaicLayoutHelper framesForSizes:withGeometry:inBounds:](HUMosaicLayoutHelper, "framesForSizes:withGeometry:inBounds:", v14, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v21 = 0;
      do
      {
        objc_msgSend(v20, "objectAtIndex:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "CGRectValue");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;

        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForCellWithIndexPath:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setFrame:", v24, v26, v28, v30);
        -[HUMosaicLayout attributeCache](self, "attributeCache");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v32);

        ++v21;
      }
      while (v21 < objc_msgSend(v20, "count"));
    }

  }
}

- (NSMutableArray)attributeCache
{
  NSMutableArray *attributeCache;
  NSMutableArray *v4;
  NSMutableArray *v5;

  attributeCache = self->_attributeCache;
  if (!attributeCache)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_attributeCache;
    self->_attributeCache = v4;

    attributeCache = self->_attributeCache;
  }
  return attributeCache;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  _BOOL4 v8;

  height = a3.size.height;
  width = a3.size.width;
  -[HUMosaicLayout contentBounds](self, "contentBounds", a3.origin.x, a3.origin.y);
  v8 = v7 != height || v6 != width;
  if (v8)
    -[HUMosaicLayout setContentBounds:](self, "setContentBounds:", 0.0, 0.0, width, height);
  return v8;
}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[HUMosaicLayout contentBounds](self, "contentBounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
    NSLog(CFSTR("HUMosaicLayout indexPath section is %lu"), objc_msgSend(v4, "section"));
  -[HUMosaicLayout attributeCache](self, "attributeCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "item");

  if (v6 <= v7)
  {
    v9 = 0;
  }
  else
  {
    -[HUMosaicLayout attributeCache](self, "attributeCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUMosaicLayout attributeCache](self, "attributeCache", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v14, "frame");
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        if (CGRectIntersectsRect(v22, v23))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)currentMosaicFrames
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HUMosaicLayout attributeCache](self, "attributeCache", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "frame");
        objc_msgSend(v9, "valueWithCGRect:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (HUMosaicLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (HUMosaicLayoutDelegate *)a3;
}

- (void)setAttributeCache:(id)a3
{
  objc_storeStrong((id *)&self->_attributeCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeCache, 0);
}

@end
