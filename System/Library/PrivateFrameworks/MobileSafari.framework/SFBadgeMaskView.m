@implementation SFBadgeMaskView

- (SFBadgeMaskView)initWithFrame:(CGRect)a3
{
  SFBadgeMaskView *v3;
  id v4;
  uint64_t v5;
  void *v6;
  SFBadgeMaskView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFBadgeMaskView;
  v3 = -[SFBadgeMaskView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[SFBadgeMaskView shapeLayer](v3, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFillColor:", v5);

    v7 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BOOL v12;
  CGRect BoundingBox;
  CGRect v14;
  CGRect v15;

  -[SFBadgeMaskView shapeLayer](self, "shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v3, "path"));
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  -[SFBadgeMaskView bounds](self, "bounds");
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v12 = CGRectEqualToRect(v14, v15);

  if (!v12)
    -[SFBadgeMaskView _updateShape](self, "_updateShape");
}

- (void)setBadgeRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_badgeRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_badgeRect = &self->_badgeRect;
  if (!CGRectEqualToRect(a3, self->_badgeRect))
  {
    p_badgeRect->origin.x = x;
    p_badgeRect->origin.y = y;
    p_badgeRect->size.width = width;
    p_badgeRect->size.height = height;
    -[SFBadgeMaskView _updateShape](self, "_updateShape");
  }
}

- (void)_updateShape
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  CGRect v11;

  v3 = (void *)MEMORY[0x1E0DC3508];
  -[SFBadgeMaskView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3508];
  v11 = CGRectInset(self->_badgeRect, -2.0, -2.0);
  objc_msgSend(v5, "bezierPathWithOvalInRect:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bezierPathByReversingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendPath:", v7);

  v10 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v10, "CGPath");
  -[SFBadgeMaskView shapeLayer](self, "shapeLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", v8);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (CGRect)badgeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_badgeRect.origin.x;
  y = self->_badgeRect.origin.y;
  width = self->_badgeRect.size.width;
  height = self->_badgeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
