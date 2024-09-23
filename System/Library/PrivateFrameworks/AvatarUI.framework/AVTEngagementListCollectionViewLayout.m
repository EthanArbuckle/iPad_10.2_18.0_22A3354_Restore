@implementation AVTEngagementListCollectionViewLayout

- (UIEdgeInsets)engagementInsetsForCollectionViewBounds:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (AVTEngagementListCollectionViewLayout)initWithEngagementLayout:(id)a3
{
  id v5;
  AVTEngagementListCollectionViewLayout *v6;
  AVTEngagementListCollectionViewLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTEngagementListCollectionViewLayout;
  v6 = -[AVTEngagementListCollectionViewLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_engagementLayout, a3);

  return v7;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)setTargetContentOffsetForAnimations:(CGPoint)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a3.x, a3.y);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTEngagementListCollectionViewLayout setTargetContentOffset:](self, "setTargetContentOffset:", v4);

}

- (void)clearTargetContentOffsetForAnimations
{
  -[AVTEngagementListCollectionViewLayout setTargetContentOffset:](self, "setTargetContentOffset:", 0);
  -[AVTEngagementListCollectionViewLayout setIgnoredProposedContentOffset:](self, "setIgnoredProposedContentOffset:", 0);
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AVTEngagementListCollectionViewLayout targetContentOffset](self, "targetContentOffset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEngagementListCollectionViewLayout setIgnoredProposedContentOffset:](self, "setIgnoredProposedContentOffset:", v7);

    -[AVTEngagementListCollectionViewLayout targetContentOffset](self, "targetContentOffset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGPointValue");
    x = v9;
    y = v10;

  }
  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)invalidateLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[AVTEngagementListCollectionViewLayout engagementInsetsForCollectionViewBounds:](self, "engagementInsetsForCollectionViewBounds:", v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEngagementBoundsInsets:", v7, v9, v11, v13);

  v15.receiver = self;
  v15.super_class = (Class)AVTEngagementListCollectionViewLayout;
  -[AVTEngagementListCollectionViewLayout invalidateLayout](&v15, sel_invalidateLayout);
}

- (CGSize)collectionViewContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 <= 0)
  {
    v10 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfItemsInSection:", 0);

    -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "contentSizeForVisibleBounds:numberOfItems:", v6);
    v10 = v9;
    v12 = v11;

  }
  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  AVTEngagementListCollectionViewLayout *v30;
  id v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfSections");

  if (v9 < 1)
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexesForElementsInRect:visibleBounds:numberOfItems:", objc_msgSend(v21, "numberOfItemsInSection:", 0), x, y, width, height, v14, v16, v18, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __75__AVTEngagementListCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
    v29 = &unk_1EA51F190;
    v30 = self;
    v31 = v10;
    v23 = v10;
    objc_msgSend(v22, "enumerateIndexesUsingBlock:", &v26);
    v24 = (void *)objc_msgSend(v23, "copy", v26, v27, v28, v29, v30);

  }
  return v24;
}

void __75__AVTEngagementListCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CEA460];
  v5 = a3;
  objc_msgSend(v4, "layoutAttributesForCellWithIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  -[AVTEngagementListCollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "frameForElementAtIndex:visibleBounds:", v8);
  objc_msgSend(v6, "setFrame:");

  return v6;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameForElementAtIndex:visibleBounds:", a3, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexesForElementsInRect:visibleBounds:numberOfItems:", a5, v13, v12, v11, v10, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CGPoint)centerForCenteringElementAtIndex:(int64_t)a3 visibleBoundsSize:(CGSize)a4 proposedOrigin:(CGPoint)a5
{
  double y;
  double x;
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerForCenteringElementAtIndex:visibleBoundsSize:proposedOrigin:", a3, width, height, x, y);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGSize)contentSizeForVisibleBounds:(CGRect)a3 numberOfItems:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSizeForVisibleBounds:numberOfItems:", a4, x, y, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (AVTEngagementLayout)engagementLayout
{
  return self->_engagementLayout;
}

- (NSValue)ignoredProposedContentOffset
{
  return self->_ignoredProposedContentOffset;
}

- (void)setIgnoredProposedContentOffset:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredProposedContentOffset, a3);
}

- (NSValue)targetContentOffset
{
  return self->_targetContentOffset;
}

- (void)setTargetContentOffset:(id)a3
{
  objc_storeStrong((id *)&self->_targetContentOffset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentOffset, 0);
  objc_storeStrong((id *)&self->_ignoredProposedContentOffset, 0);
  objc_storeStrong((id *)&self->_engagementLayout, 0);
}

@end
