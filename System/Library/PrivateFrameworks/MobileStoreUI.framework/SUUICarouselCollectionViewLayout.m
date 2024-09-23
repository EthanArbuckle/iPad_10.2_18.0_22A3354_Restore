@implementation SUUICarouselCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SUUICarouselCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v17, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "collectionView:carouselLayout:willApplyLayoutAttributes:", v5, self, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }

  }
  return v4;
}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUICarouselCollectionViewLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v7, sel_prepareLayout);
  -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:", self, 0);

  -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:", self, sel__panGestureRecognized_);

}

- (void)prepareForTransitionToLayout:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUICarouselCollectionViewLayout;
  -[SUUICarouselCollectionViewLayout prepareForTransitionToLayout:](&v6, sel_prepareForTransitionToLayout_, a3);
  -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:", self, 0);

}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  int ShouldReverseLayoutDirection;
  int v25;
  _BOOL4 v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;
  CGPoint result;
  CGRect v44;

  x = a4.x;
  v42.receiver = self;
  v42.super_class = (Class)SUUICarouselCollectionViewLayout;
  -[SUUICarouselCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v42, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  v7 = v6;
  -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v12 = v11;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v14 = v12 + v13;
  -[SUUICarouselCollectionViewLayout startScrollingIndexPath](self, "startScrollingIndexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICarouselCollectionViewLayout _collectionViewBoundsCenter](self, "_collectionViewBoundsCenter");
  v17 = v16;
  v19 = v18;
  -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "indexPathForItemAtPoint:", v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (v10 - v14) * 0.5;
  v23 = floorf(v22);
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v25 = ShouldReverseLayoutDirection;
  if (ShouldReverseLayoutDirection)
    v26 = x > 0.0;
  else
    v26 = x < 0.0;
  if (v26)
  {
    v27 = objc_msgSend(v15, "item") - 1;
  }
  else
  {
    if (ShouldReverseLayoutDirection)
      v28 = x < 0.0;
    else
      v28 = x > 0.0;
    if (v28)
    {
      v27 = objc_msgSend(v15, "item") + 1;
    }
    else
    {
      v29 = objc_msgSend(v21, "item");
      if (v29 == objc_msgSend(v15, "item"))
        v30 = v15;
      else
        v30 = v21;
      v27 = objc_msgSend(v30, "item");
    }
  }
  v31 = -(v23 - (double)v27 * v14);
  if (v25)
  {
    objc_msgSend(v8, "contentSize");
    v33 = v32;
    objc_msgSend(v8, "bounds");
    v31 = v33 - CGRectGetWidth(v44) - v31;
  }
  objc_msgSend(v8, "contentSize");
  v35 = v34;
  objc_msgSend(v8, "contentInset");
  v37 = v35 + v36;
  objc_msgSend(v8, "bounds");
  if (v31 >= v37 - v38)
    v39 = v37 - v38;
  else
    v39 = v31;

  v40 = v39;
  v41 = v7;
  result.y = v41;
  result.x = v40;
  return result;
}

- (CGPoint)_collectionViewBoundsCenter
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat MidX;
  double MidY;
  double v13;
  CGPoint result;
  CGRect v15;
  CGRect v16;

  -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidY = CGRectGetMidY(v16);
  v13 = MidX;
  result.y = MidY;
  result.x = v13;
  return result;
}

- (void)_panGestureRecognized:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[SUUICarouselCollectionViewLayout _collectionViewBoundsCenter](self, "_collectionViewBoundsCenter");
    v5 = v4;
    v7 = v6;
    -[SUUICarouselCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForItemAtPoint:", v5, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[SUUICarouselCollectionViewLayout setStartScrollingIndexPath:](self, "setStartScrollingIndexPath:", v9);
  }
}

- (NSIndexPath)startScrollingIndexPath
{
  return self->_startScrollingIndexPath;
}

- (void)setStartScrollingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_startScrollingIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startScrollingIndexPath, 0);
}

@end
