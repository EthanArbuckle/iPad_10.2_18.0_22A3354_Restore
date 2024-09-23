@implementation ASCMiniProductPageMediaFlowLayout

- (ASCMiniProductPageMediaFlowLayout)init
{
  ASCMiniProductPageMediaFlowLayout *v2;
  ASCMiniProductPageMediaFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  v2 = -[UICollectionViewFlowLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UICollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 1);
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:", self, 0);

  v5.receiver = self;
  v5.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  -[ASCMiniProductPageMediaFlowLayout dealloc](&v5, sel_dealloc);
}

- (CGPoint)collectionViewBoundsMidpoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5 * 0.5;
    -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8 * 0.5;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v10 = v6;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v7, sel_prepareLayout);
  -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:", self, 0);

  -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:", self, sel_panGestureRecognizedByRecognizer_);

}

- (void)prepareForTransitionToLayout:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  -[ASCMiniProductPageMediaFlowLayout prepareForTransitionToLayout:](&v6, sel_prepareForTransitionToLayout_, a3);
  -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:", self, 0);

}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x;
  CGFloat y;
  double v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  BOOL v39;
  BOOL v40;
  CGPoint result;

  x = a4.x;
  y = a3.y;
  v6 = a3.x;
  -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView", a3.x, a3.y, a4.x, a4.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (objc_msgSend(v10, "count"))
      {
        -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "numberOfItemsInSection:", 0);

        -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        v15 = v6 + v14;
        -[UICollectionViewFlowLayout collectionViewContentSize](self, "collectionViewContentSize");
        v17 = v16;

        if (v15 < v17)
        {
          -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "traitCollection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "layoutDirection");

          v21 = 0;
          if (v6 <= 0.0)
          {
LABEL_12:
            if (v20 == 1)
              v21 = v12 + ~v21;
            if (-[ASCMiniProductPageMediaFlowLayout indexAtInitialScroll](self, "indexAtInitialScroll") == v21)
            {
              if ((x >= 0.0 || v20 == 1) && (x <= 0.0 || v20 != 1))
              {
                v39 = x >= 0.0 || v20 != 1;
                v40 = v20 == 1 || x <= 0.0;
                if (!v40 || !v39)
                {
                  if (v12 - 1 >= v21 + 1)
                    ++v21;
                  else
                    v21 = v12 - 1;
                }
              }
              else
              {
                if (v21 <= 1)
                  v28 = 1;
                else
                  v28 = v21;
                v21 = v28 - 1;
              }
            }
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(v30, "frame");
              v32 = v31;
              v34 = v33;
              -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "bounds");
              v6 = v32 + (v36 - v34) * -0.5;

            }
          }
          else
          {
            v22 = 0.0;
            while (1)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "bounds");
              if (!v24)
                break;
              v26 = v25;
              if (v22 + v25 * 0.5 >= v6)
              {

                goto LABEL_12;
              }
              -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
              v22 = v22 + v26 + v27;
              ++v21;

              if (v22 >= v6)
                goto LABEL_12;
            }
          }
        }
      }
    }

  }
  v37 = v6;
  v38 = y;
  result.y = v38;
  result.x = v37;
  return result;
}

- (void)panGestureRecognizedByRecognizer:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[ASCMiniProductPageMediaFlowLayout collectionView](self, "collectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageMediaFlowLayout collectionViewBoundsMidpoint](self, "collectionViewBoundsMidpoint");
    objc_msgSend(v5, "indexPathForItemAtPoint:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageMediaFlowLayout setIndexAtInitialScroll:](self, "setIndexAtInitialScroll:", objc_msgSend(v4, "item"));

  }
}

- (int64_t)indexAtInitialScroll
{
  return self->_indexAtInitialScroll;
}

- (void)setIndexAtInitialScroll:(int64_t)a3
{
  self->_indexAtInitialScroll = a3;
}

@end
