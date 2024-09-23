@implementation CPInterval

- (id)initLeft:(double)a3 right:(double)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPInterval;
  result = -[CPInterval init](&v7, sel_init);
  if (result)
  {
    *((double *)result + 1) = a3;
    *((double *)result + 2) = a4;
  }
  return result;
}

- (BOOL)intersects:(id)a3
{
  double right;
  double v4;
  double v5;
  double left;
  double v7;

  right = self->right;
  v4 = *((double *)a3 + 1);
  if (right < v4)
  {
    v5 = v4 - right;
    return v5 <= 10.0;
  }
  left = self->left;
  v7 = *((double *)a3 + 2);
  if (left > v7)
  {
    v5 = left - v7;
    return v5 <= 10.0;
  }
  return 1;
}

- (void)add:(id)a3
{
  double right;

  right = self->right;
  self->left = fmin(self->left, *((double *)a3 + 1));
  self->right = fmax(right, *((double *)a3 + 2));
}

- (double)left
{
  return self->left;
}

- (double)right
{
  return self->right;
}

- (BOOL)contains:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double x;
  CGFloat v9;
  double width;
  CGFloat v11;
  CGRect v13;
  CGRect v14;

  objc_msgSend(a3, "normalizedBounds");
  x = v4;
  v9 = v5;
  width = v6;
  v11 = v7;
  if (v6 >= 0.0 && v7 >= 0.0)
  {
    if (v4 >= self->left)
      return x + width <= self->right;
    return 0;
  }
  if (COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v4)) < self->left)
    return 0;
  v13.origin.x = x;
  v13.origin.y = v9;
  v13.size.width = width;
  v13.size.height = v11;
  v14 = CGRectStandardize(v13);
  x = v14.origin.x;
  width = v14.size.width;
  return x + width <= self->right;
}

@end
