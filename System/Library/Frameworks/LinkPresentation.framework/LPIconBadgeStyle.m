@implementation LPIconBadgeStyle

- (id)copyWithZone:(_NSZone *)a3
{
  double *v4;
  double *v5;
  double *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LPIconBadgeStyle;
  v4 = -[LPImageViewStyle copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[25] = self->_offset;
    v6 = v4;
  }

  return v5;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

@end
