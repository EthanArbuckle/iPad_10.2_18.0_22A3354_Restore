@implementation LPButtonConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  id *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LPButtonConfiguration;
  v4 = -[UIButtonConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 34, self->_lp_indicatorColor);
    v6 = v5;
  }

  return v5;
}

- (id)_resolvedIndicatorColor
{
  return self->_lp_indicatorColor;
}

- (UIColor)_lp_indicatorColor
{
  return self->_lp_indicatorColor;
}

- (void)set_lp_indicatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_lp_indicatorColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lp_indicatorColor, 0);
}

@end
