@implementation AVTZIndexEngagementListCollectionViewLayout

- (AVTZIndexEngagementListCollectionViewLayout)initWithEngagementLayout:(id)a3 minAlphaFactor:(double)a4 environment:(id)a5
{
  id v9;
  AVTZIndexEngagementListCollectionViewLayout *v10;
  AVTZIndexEngagementListCollectionViewLayout *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  v10 = -[AVTEngagementListCollectionViewLayout initWithEngagementLayout:](&v13, sel_initWithEngagementLayout_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_minAlphaFactor = a4;
    objc_storeStrong((id *)&v10->_environment, a5);
  }

  return v11;
}

- (UIEdgeInsets)engagementInsetsForCollectionViewBounds:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultCellSize");
  v5 = v4 * -0.5;

  v6 = 0.0;
  v7 = 0.0;
  v8 = v5;
  v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (void)setBackIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *v6;

  v5 = (NSIndexPath *)a3;
  if (self->_backIndexPath != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backIndexPath, a3);
    v5 = v6;
  }

}

- (void)setPlusButtonIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *v6;

  v5 = (NSIndexPath *)a3;
  if (self->_plusButtonIndexPath != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_plusButtonIndexPath, a3);
    v5 = v6;
  }

}

- (int64_t)zIndexForElementWithAttributes:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTZIndexEngagementListCollectionViewLayout backIndexPath](self, "backIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6 ^ 1u;
}

- (double)alphaForElementWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double Width;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  CGRect v30;

  v4 = a3;
  -[AVTZIndexEngagementListCollectionViewLayout environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceIsPad"))
  {

  }
  else
  {
    -[AVTZIndexEngagementListCollectionViewLayout environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceIsMac");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v4, "indexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTZIndexEngagementListCollectionViewLayout plusButtonIndexPath](self, "plusButtonIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      v11 = 1.0;
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
  }
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v30);
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "engagedCellSize");
  v15 = Width / v14;

  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultCellSize");
  v18 = v17;
  -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "engagedCellSize");
  v21 = v18 / v20;

  v22 = (1.0 - v15) / (1.0 - v21);
  -[AVTZIndexEngagementListCollectionViewLayout minAlphaFactor](self, "minAlphaFactor");
  v24 = v23;
  -[AVTZIndexEngagementListCollectionViewLayout environment](self, "environment");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "deviceIsPad"))
  {

  }
  else
  {
    -[AVTZIndexEngagementListCollectionViewLayout environment](self, "environment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "deviceIsMac");

    if (!v27)
    {
      v11 = 1.0 - v22 * (1.0 - v24);
      goto LABEL_10;
    }
  }
  -[AVTZIndexEngagementListCollectionViewLayout alphaForPadElementWithEngagement:](self, "alphaForPadElementWithEngagement:", v22);
  v11 = v28;
LABEL_10:

  return v11;
}

- (double)alphaForPadElementWithEngagement:(double)a3
{
  return exp(a3 * -2.4574) * 0.9996;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  -[AVTEngagementListCollectionViewLayout layoutAttributesForElementsInRect:](&v15, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setZIndex:", -[AVTZIndexEngagementListCollectionViewLayout zIndexForElementWithAttributes:](self, "zIndexForElementWithAttributes:", v9));
        -[AVTZIndexEngagementListCollectionViewLayout alphaForElementWithAttributes:](self, "alphaForElementWithAttributes:", v9);
        objc_msgSend(v9, "setAlpha:");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  -[AVTEngagementListCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v6, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZIndex:", -[AVTZIndexEngagementListCollectionViewLayout zIndexForElementWithAttributes:](self, "zIndexForElementWithAttributes:", v4));
  -[AVTZIndexEngagementListCollectionViewLayout alphaForElementWithAttributes:](self, "alphaForElementWithAttributes:", v4);
  objc_msgSend(v4, "setAlpha:");
  return v4;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  -[AVTZIndexEngagementListCollectionViewLayout prepareForCollectionViewUpdates:](&v7, sel_prepareForCollectionViewUpdates_, v4);
  if (objc_msgSend(v4, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Expected only one collection view update!"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise");

  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTZIndexEngagementListCollectionViewLayout setCurrentUpdateItem:](self, "setCurrentUpdateItem:", v6);

}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
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
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  -[AVTZIndexEngagementListCollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v33, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTZIndexEngagementListCollectionViewLayout currentUpdateItem](self, "currentUpdateItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "updateAction"))
  {

  }
  else
  {
    -[AVTZIndexEngagementListCollectionViewLayout currentUpdateItem](self, "currentUpdateItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathAfterUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v4);

    if (v9)
    {
      -[AVTZIndexEngagementListCollectionViewLayout collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      -[AVTEngagementListCollectionViewLayout ignoredProposedContentOffset](self, "ignoredProposedContentOffset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[AVTEngagementListCollectionViewLayout ignoredProposedContentOffset](self, "ignoredProposedContentOffset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "CGPointValue");
        v12 = v21;
        v14 = v22;

      }
      -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "initialFrameForAppearingElementAtOriginForVisibleBounds:", v12, v14, v16, v18);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      objc_msgSend(v5, "setAlpha:", 0.0);
      objc_msgSend(v5, "setFrame:", v25, v27, v29, v31);
    }
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  -[AVTZIndexEngagementListCollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v21, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTZIndexEngagementListCollectionViewLayout currentUpdateItem](self, "currentUpdateItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "updateAction") == 1)
  {
    -[AVTZIndexEngagementListCollectionViewLayout currentUpdateItem](self, "currentUpdateItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathBeforeUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v4);

    if (v9)
    {
      -[AVTEngagementListCollectionViewLayout engagementLayout](self, "engagementLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTZIndexEngagementListCollectionViewLayout collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      objc_msgSend(v10, "finalFrameForDisappearingElementAtOriginForVisibleBounds:");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      objc_msgSend(v5, "setAlpha:", 0.0);
      objc_msgSend(v5, "setFrame:", v13, v15, v17, v19);
    }
  }
  else
  {

  }
  return v5;
}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  -[AVTZIndexEngagementListCollectionViewLayout setCurrentUpdateItem:](self, "setCurrentUpdateItem:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  -[AVTZIndexEngagementListCollectionViewLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
}

- (NSIndexPath)backIndexPath
{
  return self->_backIndexPath;
}

- (NSIndexPath)plusButtonIndexPath
{
  return self->_plusButtonIndexPath;
}

- (UICollectionViewUpdateItem)currentUpdateItem
{
  return self->_currentUpdateItem;
}

- (void)setCurrentUpdateItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentUpdateItem, a3);
}

- (double)minAlphaFactor
{
  return self->_minAlphaFactor;
}

- (void)setMinAlphaFactor:(double)a3
{
  self->_minAlphaFactor = a3;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_currentUpdateItem, 0);
  objc_storeStrong((id *)&self->_plusButtonIndexPath, 0);
  objc_storeStrong((id *)&self->_backIndexPath, 0);
}

@end
