@implementation SUUIStarRatingControl

- (float)starSpacing
{
  float result;

  result = self->_starSpacing;
  if (result == 0.0)
    return 10.0;
  return result;
}

- (float)starWidth
{
  float result;

  result = self->_starWidth;
  if (result == 0.0)
    return 19.0;
  return result;
}

- (UIImage)emptyStarsImage
{
  return -[UIImageView image](self->_emptyStarsImageView, "image");
}

- (UIImage)filledStarsImage
{
  return -[UIImageView image](self->_filledStarsImageView, "image");
}

- (void)setEmptyStarsImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *emptyStarsImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UIImageView image](self->_emptyStarsImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4 != v11)
  {
    emptyStarsImageView = self->_emptyStarsImageView;
    if (!emptyStarsImageView)
    {
      v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      v8 = self->_emptyStarsImageView;
      self->_emptyStarsImageView = v7;

      -[UIImageView setContentMode:](self->_emptyStarsImageView, "setContentMode:", 4);
      v9 = self->_emptyStarsImageView;
      -[SUUIStarRatingControl backgroundColor](self, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[SUUIStarRatingControl addSubview:](self, "addSubview:", self->_emptyStarsImageView);
      emptyStarsImageView = self->_emptyStarsImageView;
    }
    -[UIImageView setImage:](emptyStarsImageView, "setImage:", v11);
    v5 = v11;
  }

}

- (void)setFilledStarsImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *filledStarsImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UIImageView image](self->_filledStarsImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4 != v11)
  {
    filledStarsImageView = self->_filledStarsImageView;
    if (!filledStarsImageView)
    {
      v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      v8 = self->_filledStarsImageView;
      self->_filledStarsImageView = v7;

      v9 = self->_filledStarsImageView;
      -[SUUIStarRatingControl backgroundColor](self, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[UIImageView setContentMode:](self->_filledStarsImageView, "setContentMode:", 7);
      -[UIImageView setClipsToBounds:](self->_filledStarsImageView, "setClipsToBounds:", 1);
      -[SUUIStarRatingControl addSubview:](self, "addSubview:", self->_filledStarsImageView);
      filledStarsImageView = self->_filledStarsImageView;
    }
    -[UIImageView setImage:](filledStarsImageView, "setImage:", v11);
    v5 = v11;
  }

}

- (void)setUserRating:(int64_t)a3
{
  if (self->_userRating != a3)
  {
    self->_userRating = a3;
    -[SUUIStarRatingControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_previousUserRating = self->_userRating;
  -[SUUIStarRatingControl _updateUserRatingWithTouch:](self, "_updateUserRatingWithTouch:", a3, a4);
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[SUUIStarRatingControl _updateUserRatingWithTouch:](self, "_updateUserRatingWithTouch:", a3, a4);
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[SUUIStarRatingControl _updateUserRatingWithTouch:](self, "_updateUserRatingWithTouch:", a3, a4);
  -[SUUIStarRatingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  if (a3)
  {
    self->_userRating = self->_previousUserRating;
    -[SUUIStarRatingControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float userRating;
  float v14;
  double v15;
  int64_t v16;
  BOOL v17;
  uint64_t v18;
  float v19;
  float v20;
  double v21;
  double v22;
  double v23;

  -[SUUIStarRatingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_emptyStarsImageView, "setFrame:");
  -[SUUIStarRatingControl _unfilledStarsMinX](self, "_unfilledStarsMinX");
  v12 = v11;
  userRating = (float)self->_userRating;
  -[SUUIStarRatingControl starWidth](self, "starWidth");
  v15 = (float)(v14 * userRating);
  v16 = self->_userRating;
  v17 = v16 < 1;
  v18 = v16 - 1;
  if (!v17)
  {
    v19 = (float)v18;
    -[SUUIStarRatingControl starSpacing](self, "starSpacing");
    v15 = v15 + (float)(v20 * v19);
  }
  if (-[SUUIStarRatingControl _isRTL](self, "_isRTL"))
  {
    v12 = CGRectWithFlippedOriginRelativeToBoundingRect(v12, v6, v15, v10, v4, v6, v8, v10);
    v6 = v21;
    v15 = v22;
    v10 = v23;
  }
  -[UIImageView setFrame:](self->_filledStarsImageView, "setFrame:", v12, v6, v15, v10);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[SUUIStarRatingControl bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -20.0, -20.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *emptyStarsImageView;
  id v5;
  objc_super v6;

  emptyStarsImageView = self->_emptyStarsImageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](emptyStarsImageView, "setBackgroundColor:", v5);
  -[UIImageView setBackgroundColor:](self->_filledStarsImageView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIStarRatingControl;
  -[SUUIStarRatingControl setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

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

  -[UIImageView image](self->_emptyStarsImageView, "image", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)_isRTL
{
  return -[SUUIStarRatingControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (unint64_t)_lastStar
{
  return -[SUUIStarRatingControl _ratingForUIDirection:](self, "_ratingForUIDirection:", 5);
}

- (unint64_t)_firstStar
{
  return -[SUUIStarRatingControl _ratingForUIDirection:](self, "_ratingForUIDirection:", 1);
}

- (unint64_t)_ratingForUIDirection:(unint64_t)a3
{
  if (-[SUUIStarRatingControl _isRTL](self, "_isRTL"))
    return 6 - a3;
  else
    return a3;
}

- (double)_unfilledStarsWidth
{
  float v3;
  float v4;
  float v5;

  -[SUUIStarRatingControl starWidth](self, "starWidth");
  v4 = v3;
  -[SUUIStarRatingControl starSpacing](self, "starSpacing");
  return (float)((float)(v5 * 4.0) + (float)(v4 * 5.0));
}

- (double)_unfilledStarsMinX
{
  double v3;
  double v4;
  double v5;

  -[SUUIStarRatingControl bounds](self, "bounds");
  v4 = v3;
  -[SUUIStarRatingControl _unfilledStarsWidth](self, "_unfilledStarsWidth");
  return (v4 - v5) * 0.5;
}

- (void)_updateUserRatingWithTouch:(id)a3
{
  int64_t userRating;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;

  userRating = self->_userRating;
  objc_msgSend(a3, "locationInView:", self);
  v6 = v5;
  -[SUUIStarRatingControl _unfilledStarsMinX](self, "_unfilledStarsMinX");
  v8 = v7;
  -[SUUIStarRatingControl starSpacing](self, "starSpacing");
  if (v6 >= v8 - v9)
  {
    -[SUUIStarRatingControl _unfilledStarsMinX](self, "_unfilledStarsMinX");
    v12 = v11;
    -[SUUIStarRatingControl _unfilledStarsWidth](self, "_unfilledStarsWidth");
    if (v6 >= v12 + v13)
    {
      v10 = -[SUUIStarRatingControl _lastStar](self, "_lastStar");
    }
    else
    {
      -[SUUIStarRatingControl _unfilledStarsMinX](self, "_unfilledStarsMinX");
      v15 = v14;
      -[SUUIStarRatingControl starWidth](self, "starWidth");
      v17 = v15 + v16;
      v18 = 1;
      while (v6 >= v17)
      {
        -[SUUIStarRatingControl starWidth](self, "starWidth");
        v20 = v19;
        -[SUUIStarRatingControl starSpacing](self, "starSpacing");
        v17 = v17 + (float)(v20 + v21);
        if (++v18 == 6)
          goto LABEL_11;
      }
      v10 = -[SUUIStarRatingControl _ratingForUIDirection:](self, "_ratingForUIDirection:", v18);
    }
  }
  else
  {
    v10 = -[SUUIStarRatingControl _firstStar](self, "_firstStar");
  }
  userRating = v10;
LABEL_11:
  -[SUUIStarRatingControl setUserRating:](self, "setUserRating:", userRating);
}

- (void)setStarSpacing:(float)a3
{
  self->_starSpacing = a3;
}

- (void)setStarWidth:(float)a3
{
  self->_starWidth = a3;
}

- (int64_t)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledStarsImageView, 0);
  objc_storeStrong((id *)&self->_emptyStarsImageView, 0);
}

@end
