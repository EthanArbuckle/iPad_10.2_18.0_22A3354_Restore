@implementation NAEndOfArticleCollectionView

- (NAEndOfArticleCollectionView)initWithFrame:(CGRect)a3
{
  NAEndOfArticleCollectionView *v3;
  NAEndOfArticleCollectionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NAEndOfArticleCollectionView;
  v3 = -[NAEndOfArticleCollectionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NAEndOfArticleCollectionView setBoundsHandling:](v3, "setBoundsHandling:", 0);
  return v4;
}

- (NAEndOfArticleCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  NAEndOfArticleCollectionView *v4;
  NAEndOfArticleCollectionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NAEndOfArticleCollectionView;
  v4 = -[NAEndOfArticleCollectionView initWithFrame:collectionViewLayout:](&v7, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[NAEndOfArticleCollectionView setBoundsHandling:](v4, "setBoundsHandling:", 0);
  return v5;
}

- (CGRect)_visibleBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double x;
  double y;
  double width;
  double height;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;

  v38.receiver = self;
  v38.super_class = (Class)NAEndOfArticleCollectionView;
  -[NAEndOfArticleCollectionView _visibleBounds](&v38, sel__visibleBounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[NAEndOfArticleCollectionView boundsHandling](self, "boundsHandling");
  if (v11)
  {
    if (v11 == 1)
    {
      -[NAEndOfArticleCollectionView bounds](self, "bounds");
      v4 = v12;
      -[NAEndOfArticleCollectionView bounds](self, "bounds");
      v8 = v13;
    }
  }
  else
  {
    -[NAEndOfArticleCollectionView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NAEndOfArticleCollectionView window](self, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v39.origin.x = v4;
    v39.origin.y = v6;
    v39.size.width = v8;
    v39.size.height = v10;
    if (CGRectIsEmpty(v39) && v15)
    {
      objc_msgSend(v15, "frame");
      objc_msgSend(v15, "convertRect:toLayer:", v17);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(v17, "bounds");
      v43.origin.x = v19;
      v43.origin.y = v21;
      v43.size.width = v23;
      v43.size.height = v25;
      v41 = CGRectIntersection(v40, v43);
      x = v41.origin.x;
      y = v41.origin.y;
      width = v41.size.width;
      height = v41.size.height;
      if (CGRectIsEmpty(v41))
      {
        v8 = *MEMORY[0x1E0C9D820];
        v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      else
      {
        objc_msgSend(v17, "convertRect:toLayer:", v15, x, y, width, height);
        v4 = v30;
        v6 = v31;
        v8 = v32;
        v10 = v33;
      }
    }

  }
  v34 = v4;
  v35 = v6;
  v36 = v8;
  v37 = v10;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (int64_t)boundsHandling
{
  return self->_boundsHandling;
}

- (void)setBoundsHandling:(int64_t)a3
{
  self->_boundsHandling = a3;
}

@end
