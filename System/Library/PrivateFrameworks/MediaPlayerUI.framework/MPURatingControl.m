@implementation MPURatingControl

+ (id)ratingStarImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "mediaPlayerUIBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("rating-star"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ratingDotImage
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__MPURatingControl_ratingDotImage__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  +[MPUTheme cachedObjectWithKey:block:](MPUTheme, "cachedObjectWithKey:block:", CFSTR("MPURatingControl_ratingDot"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__MPURatingControl_ratingDotImage__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v7[6];

  objc_msgSend(*(id *)(a1 + 32), "ratingStarImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "size");
  v3 = v2;
  v5 = v4;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__MPURatingControl_ratingDotImage__block_invoke_2;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v7[4] = v3;
  *(double *)&v7[5] = v5;
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithSize:opaque:fromBlock:", 0, v7, v3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __34__MPURatingControl_ratingDotImage__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.8, 0.8, 0.8, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  UIRectCenteredIntegralRectScale();
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fill");

}

- (MPURatingControl)initWithFrame:(CGRect)a3
{
  MPURatingControl *v3;
  uint64_t v4;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v6;
  UIPanGestureRecognizer *panGestureRecognizer;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *imageViews;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MPURatingControl;
  v3 = -[MPURatingControl initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v3, sel__handleTapGesture_);
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", v3, sel__handlePanGesture_);
    panGestureRecognizer = v3->_panGestureRecognizer;
    v3->_panGestureRecognizer = (UIPanGestureRecognizer *)v6;

    -[MPURatingControl addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGestureRecognizer);
    -[MPURatingControl addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_panGestureRecognizer);
    -[MPURatingControl setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDDC6F8], "easyTouchDefaultHitRectInsets");
    -[MPURatingControl setHitTestEdgeInsets:](v3, "setHitTestEdgeInsets:");
    v8 = 5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v9 = objc_claimAutoreleasedReturnValue();
    imageViews = v3->_imageViews;
    v3->_imageViews = (NSMutableArray *)v9;

    objc_msgSend((id)objc_opt_class(), "ratingStarImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    v15 = v14;

    do
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", 0.0, 0.0, v13, v15);
      objc_msgSend(v16, "setContentMode:", 4);
      -[NSMutableArray addObject:](v3->_imageViews, "addObject:", v16);
      -[MPURatingControl addSubview:](v3, "addSubview:", v16);

      --v8;
    }
    while (v8);
    -[MPURatingControl _updateImageViewsForRatingAnimated:](v3, "_updateImageViewsForRatingAnimated:", 0);
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  -[MPURatingControl bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MPURatingControl hitTestEdgeInsets](self, "hitTestEdgeInsets");
  v16 = v10 + v15;
  v19 = v12 - (v17 + v18);
  v23.size.height = v14 - (v15 + v20);
  v23.origin.x = v8 + v17;
  v23.origin.y = v16;
  v23.size.width = v19;
  v22.x = x;
  v22.y = y;
  return CGRectContainsPoint(v23, v22);
}

- (void)layoutSubviews
{
  double Width;
  double Height;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;
  CGRect v20;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)MPURatingControl;
  -[MPURatingControl layoutSubviews](&v16, sel_layoutSubviews);
  -[MPURatingControl bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  -[MPURatingControl bounds](self, "bounds");
  Height = CGRectGetHeight(v20);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_imageViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = Height * 0.5;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "setCenter:", Width/ 6.0* (double)(unint64_t)(-[NSMutableArray indexOfObject:](self->_imageViews, "indexOfObject:", v11, (_QWORD)v12)+ 1), v8);
        objc_msgSend(v11, "bounds");
        objc_msgSend(v11, "center");
        UIRectCenteredAboutPointScale();
        objc_msgSend(v11, "setFrame:");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

}

- (double)ratingValueForLocationInView:(CGPoint)a3
{
  double x;
  void *v5;
  double MinX;
  double result;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;

  x = a3.x;
  v23 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray firstObject](self->_imageViews, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  MinX = CGRectGetMinX(v24);

  result = 0.0;
  if (x >= MinX)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_imageViews;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      v12 = -1;
      v13 = 1.79769313e308;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "center", (_QWORD)v18);
          UIDistanceBetweenPoints();
          if (v16 < v13)
          {
            v17 = v16;
            v12 = -[NSMutableArray indexOfObject:](self->_imageViews, "indexOfObject:", v15);
            v13 = v17;
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
    else
    {
      v12 = -1;
    }

    return (double)((v12 & ~(v12 >> 63)) + 1)
         / (double)(unint64_t)-[NSMutableArray count](self->_imageViews, "count");
  }
  return result;
}

- (void)_handleTapGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 3)
  {
    objc_msgSend(v5, "locationInView:", self);
    -[MPURatingControl ratingValueForLocationInView:](self, "ratingValueForLocationInView:");
    -[MPURatingControl setRating:animated:](self, "setRating:animated:", 1);
    -[MPURatingControl delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ratingDidChangeForRatingControl:", self);

  }
}

- (void)_handlePanGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 2)
  {
    objc_msgSend(v5, "locationInView:", self);
    -[MPURatingControl ratingValueForLocationInView:](self, "ratingValueForLocationInView:");
    -[MPURatingControl setRating:animated:](self, "setRating:animated:", 1);
  }
  if (objc_msgSend(v5, "state") == 3)
  {
    -[MPURatingControl delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ratingDidChangeForRatingControl:", self);

  }
}

- (void)setRating:(double)a3
{
  -[MPURatingControl setRating:animated:](self, "setRating:animated:", 0, a3);
}

- (void)setRating:(double)a3 animated:(BOOL)a4
{
  if (self->_rating != a3)
  {
    self->_rating = a3;
    -[MPURatingControl _updateImageViewsForRatingAnimated:](self, "_updateImageViewsForRatingAnimated:", a4);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "ratingStarImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = (v5 + 16.0) * 5.0;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)viewDidMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPURatingControl;
  -[MPURatingControl viewDidMoveToSuperview](&v3, sel_viewDidMoveToSuperview);
  -[MPURatingControl _updateImageViewsForRatingAnimated:](self, "_updateImageViewsForRatingAnimated:", 0);
}

- (void)_updateImageView:(id)a3 proposedImage:(id)a4 filled:(BOOL)a5
{
  objc_msgSend(a3, "setImage:", a4);
}

- (void)_updateImageViewsForRatingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MPURatingControl *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v5 = 0;
  v6 = llround(self->_rating * 5.0);
  do
  {
    -[NSMutableArray objectAtIndex:](self->_imageViews, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_animatesContents");
    objc_msgSend(v7, "_setAnimatesContents:", v3);
    v9 = (void *)objc_opt_class();
    if (v6 && v5 < v6)
    {
      objc_msgSend(v9, "ratingStarImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = v7;
      v13 = v10;
      v14 = 1;
    }
    else
    {
      objc_msgSend(v9, "ratingDotImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = v7;
      v13 = v10;
      v14 = 0;
    }
    -[MPURatingControl _updateImageView:proposedImage:filled:](v11, "_updateImageView:proposedImage:filled:", v12, v13, v14);

    objc_msgSend(v7, "_setAnimatesContents:", v8);
    ++v5;
  }
  while (v5 != 5);
}

- (MPURatingControlDelegate)delegate
{
  return (MPURatingControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeInsets.top;
  left = self->_hitTestEdgeInsets.left;
  bottom = self->_hitTestEdgeInsets.bottom;
  right = self->_hitTestEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (double)rating
{
  return self->_rating;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end
