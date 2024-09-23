@implementation GKLeaderboardScoreFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[GKLeaderboardScoreFlowLayout heightOfInsertedItems](self, "heightOfInsertedItems");
  v7 = y + v6;
  -[GKLeaderboardScoreFlowLayout setHeightOfInsertedItems:](self, "setHeightOfInsertedItems:", 0.0);
  v8 = x;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKLeaderboardScoreFlowLayout;
  -[GKLeaderboardScoreFlowLayout prepareForCollectionViewUpdates:](&v19, sel_prepareForCollectionViewUpdates_, v4);
  if (-[GKLeaderboardScoreFlowLayout isInsertingItemsAbove](self, "isInsertingItemsAbove"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (!objc_msgSend(v11, "updateAction", (_QWORD)v15))
          {
            objc_msgSend(v11, "indexPathAfterUpdate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "frame");
              v9 = v9 + v14;

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    -[GKLeaderboardScoreFlowLayout setHeightOfInsertedItems:](self, "setHeightOfInsertedItems:", v9);
  }

}

- (BOOL)isInsertingItemsAbove
{
  return self->_isInsertingItemsAbove;
}

- (void)setIsInsertingItemsAbove:(BOOL)a3
{
  self->_isInsertingItemsAbove = a3;
}

- (double)heightOfInsertedItems
{
  return self->_heightOfInsertedItems;
}

- (void)setHeightOfInsertedItems:(double)a3
{
  self->_heightOfInsertedItems = a3;
}

- (CGSize)contentSizeBeforeInsertingItemsAbove
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSizeBeforeInsertingItemsAbove.width;
  height = self->_contentSizeBeforeInsertingItemsAbove.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSizeBeforeInsertingItemsAbove:(CGSize)a3
{
  self->_contentSizeBeforeInsertingItemsAbove = a3;
}

- (double)initialContentOffset
{
  return self->_initialContentOffset;
}

- (void)setInitialContentOffset:(double)a3
{
  self->_initialContentOffset = a3;
}

@end
