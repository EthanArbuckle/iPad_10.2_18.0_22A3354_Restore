@implementation SKStarRatingControl

- (SKStarRatingControl)initWithBackgroundImage:(id)a3 foregroundImage:(id)a4
{
  id v6;
  id v7;
  SKStarRatingControl *v8;
  uint64_t v9;
  UIImageView *backgroundImageView;
  UIImageView *v11;
  uint64_t v12;
  UIImageView *foregroundImageView;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SKStarRatingControl;
  v8 = -[SKStarRatingControl init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    backgroundImageView = v8->_backgroundImageView;
    v8->_backgroundImageView = (UIImageView *)v9;

    v11 = v8->_backgroundImageView;
    -[SKStarRatingControl bounds](v8, "bounds");
    -[UIImageView setFrame:](v11, "setFrame:");
    -[UIImageView setUserInteractionEnabled:](v8->_backgroundImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView sizeToFit](v8->_backgroundImageView, "sizeToFit");
    -[SKStarRatingControl addSubview:](v8, "addSubview:", v8->_backgroundImageView);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    foregroundImageView = v8->_foregroundImageView;
    v8->_foregroundImageView = (UIImageView *)v12;

    -[UIImageView setClipsToBounds:](v8->_foregroundImageView, "setClipsToBounds:", 1);
    -[UIImageView setUserInteractionEnabled:](v8->_foregroundImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView sizeToFit](v8->_foregroundImageView, "sizeToFit");
    -[SKStarRatingControl addSubview:](v8, "addSubview:", v8->_foregroundImageView);
  }

  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  uint64_t v5;
  UIImageView *foregroundImageView;
  UILabel *explanationLabel;
  double v8;

  -[SKStarRatingControl bounds](self, "bounds");
  v4 = v3;
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:");
  if (-[SKStarRatingControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    v5 = 8;
  else
    v5 = 7;
  -[UIImageView setContentMode:](self->_foregroundImageView, "setContentMode:", v5);
  foregroundImageView = self->_foregroundImageView;
  -[SKStarRatingControl _foregroundImageClipBounds](self, "_foregroundImageClipBounds");
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  explanationLabel = self->_explanationLabel;
  if (explanationLabel)
  {
    -[UILabel frame](explanationLabel, "frame");
    -[UILabel setFrame:](self->_explanationLabel, "setFrame:", floor((v4 - v8) * 0.5), 24.0);
  }
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SKStarRatingControl frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[UIImageView bounds](self->_backgroundImageView, "bounds");
  -[SKStarRatingControl setFrame:](self, "setFrame:", v4, v6);
}

- (NSString)explanationText
{
  return -[UILabel text](self->_explanationLabel, "text");
}

- (void)setHitPadding:(CGSize)a3
{
  self->_hitPadding = a3;
}

- (void)setExplanationText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *explanationLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  id v11;

  v11 = a3;
  -[UILabel text](self->_explanationLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v11);

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    explanationLabel = self->_explanationLabel;
    if (v11)
    {
      if (!explanationLabel)
      {
        v8 = -[SKStarRatingControl _newExplanationLabel](self, "_newExplanationLabel", v11);
        v9 = self->_explanationLabel;
        self->_explanationLabel = v8;

        -[SKStarRatingControl addSubview:](self, "addSubview:", self->_explanationLabel);
        v6 = v11;
        explanationLabel = self->_explanationLabel;
      }
      -[UILabel setText:](explanationLabel, "setText:", v6);
      -[UILabel sizeToFit](self->_explanationLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](explanationLabel, "removeFromSuperview");
      v10 = self->_explanationLabel;
      self->_explanationLabel = 0;

    }
    -[SKStarRatingControl setNeedsLayout](self, "setNeedsLayout");
    v6 = v11;
  }

}

- (void)setValue:(float)a3
{
  self->_value = a3;
  -[SKStarRatingControl setNeedsLayout](self, "setNeedsLayout");
}

- (float)value
{
  return self->_value;
}

- (BOOL)_alwaysHandleScrollerMouseEvent
{
  return 1;
}

- (BOOL)canHandleSwipes
{
  return 1;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  CGPoint *p_trackingStartPoint;
  CGFloat v5;
  CGFloat v6;

  p_trackingStartPoint = &self->_trackingStartPoint;
  objc_msgSend(a3, "locationInView:", self, a4);
  p_trackingStartPoint->x = v5;
  p_trackingStartPoint->y = v6;
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  CGFloat v5;
  double v6;
  CGFloat v7;

  objc_msgSend(a3, "locationInView:", self, a4);
  v6 = v5 - self->_trackingStartPoint.y;
  self->_trackingLastPoint.x = v7;
  self->_trackingLastPoint.y = v5;
  if (v6 <= 40.0)
  {
    -[SKStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");
    -[SKStarRatingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  return v6 <= 40.0;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  CGPoint *p_trackingLastPoint;
  CGFloat v6;
  CGFloat v7;

  p_trackingLastPoint = &self->_trackingLastPoint;
  objc_msgSend(a3, "locationInView:", self, a4);
  p_trackingLastPoint->x = v6;
  p_trackingLastPoint->y = v7;
  -[SKStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");
  -[SKStarRatingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[SKStarRatingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (CGRect)hitRect
{
  CGRect v3;

  -[SKStarRatingControl bounds](self, "bounds");
  return CGRectInset(v3, -self->_hitPadding.width, -self->_hitPadding.height);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SKStarRatingControl hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGRect)_foregroundImageClipBounds
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[SKStarRatingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v7 * self->_value;
  if (-[SKStarRatingControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    v4 = CGRectGetMaxX(v16) - v11;
  }
  v12 = v4;
  v13 = v6;
  v14 = v11;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_newExplanationLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 11.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v5);

  return v2;
}

- (void)_updateValueForPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;

  x = a3.x;
  -[SKStarRatingControl starWidth](self, "starWidth", a3.x, a3.y);
  v6 = v5;
  -[SKStarRatingControl bounds](self, "bounds");
  v8 = ceil((v7 - v6 * 5.0) * 0.25);
  v9 = v6 + v8;
  v10 = -(v8 - v9 * 5.0);
  if (x <= v9 * 5.0)
    v10 = x;
  if (v10 >= 0.0)
    v11 = v10;
  else
    v11 = 0.0;
  if (-[SKStarRatingControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[SKStarRatingControl bounds](self, "bounds");
    v11 = CGRectGetMaxX(v13) - v11;
  }
  v12 = v11 / v9;
  *(float *)&v12 = (float)vcvtpd_u64_f64(v11 / v9) / 5.0;
  -[SKStarRatingControl setValue:](self, "setValue:", v12);
}

- (double)starWidth
{
  return self->_starWidth;
}

- (void)setStarWidth:(double)a3
{
  self->_starWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
