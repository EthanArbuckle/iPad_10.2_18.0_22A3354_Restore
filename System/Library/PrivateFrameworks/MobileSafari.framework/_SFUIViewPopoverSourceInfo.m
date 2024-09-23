@implementation _SFUIViewPopoverSourceInfo

- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3
{
  return -[_SFUIViewPopoverSourceInfo initWithView:insets:](self, "initWithView:insets:", a3, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v10;
  _SFUIViewPopoverSourceInfo *v11;
  _SFUIViewPopoverSourceInfo *v12;
  _SFUIViewPopoverSourceInfo *v13;
  objc_super v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFUIViewPopoverSourceInfo;
  v11 = -[_SFUIViewPopoverSourceInfo init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_view, a3);
    v12->_insets.top = top;
    v12->_insets.left = left;
    v12->_insets.bottom = bottom;
    v12->_insets.right = right;
    v12->_permittedArrowDirections = 15;
    v13 = v12;
  }

  return v12;
}

- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _SFUIViewPopoverSourceInfo *v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "bounds");
  v14 = -[_SFUIViewPopoverSourceInfo initWithView:insets:](self, "initWithView:insets:", v9, SFEdgeInsetsForInsetingRectToRect(v10, v11, v12, v13, x, y, width, height));

  return v14;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  UIView *view;
  void *v7;
  UIView *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGPoint v16;
  CGRect v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  view = self->_view;
  if (view)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = view;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView center](v8, "center");
    NSStringFromCGPoint(v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](v8, "bounds");
    NSStringFromCGRect(v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p; center = %@, bounds = %@>"), v10, v8, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; view = %@>"), v5, self, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (CGRect)popoverSourceRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[UIView bounds](self->_view, "bounds");
  top = self->_insets.top;
  left = self->_insets.left;
  v6 = v5 + left;
  v8 = top + v7;
  v10 = v9 - (left + self->_insets.right);
  v12 = v11 - (top + self->_insets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (UIView)popoverSourceView
{
  return self->_view;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (BOOL)shouldPassthroughSuperview
{
  return self->_shouldPassthroughSuperview;
}

- (void)setShouldPassthroughSuperview:(BOOL)a3
{
  self->_shouldPassthroughSuperview = a3;
}

- (BOOL)shouldHideArrow
{
  return self->_shouldHideArrow;
}

- (void)setShouldHideArrow:(BOOL)a3
{
  self->_shouldHideArrow = a3;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
