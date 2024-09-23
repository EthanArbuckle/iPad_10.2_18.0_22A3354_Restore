@implementation ASCSkeletonTextView

- (ASCSkeletonTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  ASCSkeletonTextView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCSkeletonTextView;
  result = -[ASCSkeletonTextView initWithFrame:textContainer:](&v5, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_skeletonNumberOfLines = 1;
  return result;
}

- (ASCSkeletonTextView)initWithCoder:(id)a3
{
  -[ASCSkeletonTextView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCSkeletonTextView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setSkeletonNumberOfLines:(int64_t)a3
{
  if (self->_skeletonNumberOfLines != a3)
  {
    self->_skeletonNumberOfLines = a3;
    -[ASCSkeletonTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCSkeletonTextView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIColor)skeletonColor
{
  UIColor *skeletonColor;

  skeletonColor = self->_skeletonColor;
  if (skeletonColor)
    return skeletonColor;
  -[ASCSkeletonTextView textColor](self, "textColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
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

    -[ASCSkeletonTextView setNeedsDisplay](self, "setNeedsDisplay");
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

    -[ASCSkeletonTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCSkeletonTextView setNeedsDisplay](self, "setNeedsDisplay");
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

  -[ASCSkeletonTextView skeleton](self, "skeleton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x1E0DC55F0];
    -[ASCSkeletonTextView skeleton](self, "skeleton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "skeletonHeightFromContext:", self);
    v7 = v6;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ASCSkeletonTextView;
    -[ASCSkeletonTextView intrinsicContentSize](&v12, sel_intrinsicContentSize);
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
  -[ASCSkeletonTextView skeleton](self, "skeleton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASCSkeletonTextView skeleton](self, "skeleton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "skeletonHeightFromContext:", self);
    v9 = v8;

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ASCSkeletonTextView;
    -[ASCSkeletonTextView sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
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
  -[ASCSkeletonTextView skeleton](self, "skeleton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASCSkeletonTextView skeleton](self, "skeleton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "drawSkeletonInRect:usingSkeletonContext:", self, x, y, width, height);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ASCSkeletonTextView;
    -[ASCSkeletonTextView drawRect:](&v10, sel_drawRect_, x, y, width, height);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_skeletonColor, 0);
}

@end
