@implementation ASCSkeletonLabel

- (ASCSkeletonLabel)initWithFrame:(CGRect)a3
{
  ASCSkeletonLabel *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCSkeletonLabel;
  result = -[ASCSkeletonLabel initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_skeletonNumberOfLines = 1;
  return result;
}

- (ASCSkeletonLabel)initWithCoder:(id)a3
{
  -[ASCSkeletonLabel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCSkeletonLabel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (double)_firstBaselineOffsetFromTop
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  -[ASCSkeletonLabel skeleton](self, "skeleton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCSkeletonLabel font](self, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ascender");
    UIRoundToViewScale();
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ASCSkeletonLabel;
    -[ASCSkeletonLabel _firstBaselineOffsetFromTop](&v8, sel__firstBaselineOffsetFromTop);
  }
  return result;
}

- (double)_baselineOffsetFromBottom
{
  void *v3;
  void *v4;
  double result;
  objc_super v6;

  -[ASCSkeletonLabel skeleton](self, "skeleton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCSkeletonLabel font](self, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descender");

    UIRoundToViewScale();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ASCSkeletonLabel;
    -[ASCSkeletonLabel _baselineOffsetFromBottom](&v6, sel__baselineOffsetFromBottom);
  }
  return result;
}

- (void)setSkeletonNumberOfLines:(int64_t)a3
{
  if (self->_skeletonNumberOfLines != a3)
  {
    self->_skeletonNumberOfLines = a3;
    -[ASCSkeletonLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCSkeletonLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIColor)skeletonColor
{
  UIColor *skeletonColor;
  UIColor *v3;

  skeletonColor = self->_skeletonColor;
  if (skeletonColor)
  {
    v3 = skeletonColor;
  }
  else
  {
    if (-[ASCSkeletonLabel _textColorFollowsTintColor](self, "_textColorFollowsTintColor"))
      -[ASCSkeletonLabel tintColor](self, "tintColor");
    else
      -[ASCSkeletonLabel textColor](self, "textColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setSkeletonColor:(id)a3
{
  UIColor *v4;
  UIColor *skeletonColor;
  char v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;

  v4 = (UIColor *)a3;
  skeletonColor = self->_skeletonColor;
  v9 = v4;
  if (v4 && skeletonColor)
  {
    v6 = -[UIColor isEqual:](skeletonColor, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (skeletonColor != v4)
  {
LABEL_6:
    v7 = (UIColor *)-[UIColor copy](v4, "copy");
    v8 = self->_skeletonColor;
    self->_skeletonColor = v7;

    -[ASCSkeletonLabel setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v9;
  }
LABEL_7:

}

- (void)setSkeleton:(id)a3
{
  ASCContentSkeleton *v4;
  ASCContentSkeleton *skeleton;
  BOOL v6;
  ASCContentSkeleton *v7;
  ASCContentSkeleton *v8;
  ASCContentSkeleton *v9;

  v4 = (ASCContentSkeleton *)a3;
  skeleton = self->_skeleton;
  v9 = v4;
  if (v4 && skeleton)
  {
    v6 = -[ASCContentSkeleton isEqual:](skeleton, "isEqual:", v4);
    v4 = v9;
    if (v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (skeleton != v4)
  {
LABEL_6:
    v7 = (ASCContentSkeleton *)-[ASCContentSkeleton copy](v4, "copy");
    v8 = self->_skeleton;
    self->_skeleton = v7;

    -[ASCSkeletonLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCSkeletonLabel setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v9;
  }
LABEL_7:

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  -[ASCSkeletonLabel skeleton](self, "skeleton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x1E0DC55F0];
    -[ASCSkeletonLabel skeleton](self, "skeleton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "skeletonHeightFromContext:", self);
    v7 = v6;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ASCSkeletonLabel;
    -[ASCSkeletonLabel intrinsicContentSize](&v12, sel_intrinsicContentSize);
    v4 = v8;
    v7 = v9;
  }
  v10 = v4;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCSkeletonLabel skeleton](self, "skeleton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASCSkeletonLabel skeleton](self, "skeleton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "skeletonHeightFromContext:", self);
    v9 = v8;

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ASCSkeletonLabel;
    -[ASCSkeletonLabel sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
    width = v10;
    v9 = v11;
  }
  v12 = width;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ASCSkeletonLabel skeleton](self, "skeleton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASCSkeletonLabel skeleton](self, "skeleton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "drawSkeletonInRect:usingSkeletonContext:", self, x, y, width, height);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ASCSkeletonLabel;
    -[ASCSkeletonLabel drawRect:](&v10, sel_drawRect_, x, y, width, height);
  }
}

- (int64_t)skeletonNumberOfLines
{
  return self->_skeletonNumberOfLines;
}

- (ASCContentSkeleton)skeleton
{
  return self->_skeleton;
}

- (BOOL)wantsAncestorFocusMarqueeAfterClearingSkeleton
{
  return self->_wantsAncestorFocusMarqueeAfterClearingSkeleton;
}

- (void)setWantsAncestorFocusMarqueeAfterClearingSkeleton:(BOOL)a3
{
  self->_wantsAncestorFocusMarqueeAfterClearingSkeleton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_skeletonColor, 0);
}

@end
