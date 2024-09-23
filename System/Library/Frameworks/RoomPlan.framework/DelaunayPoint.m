@implementation DelaunayPoint

- (DelaunayPoint)initWithValue:(DelaunayPoint *)self
{
  uint64_t v2;
  uint64_t v3;
  DelaunayPoint *v4;
  DelaunayPoint *v5;
  DelaunayPoint *v6;
  objc_super v8;

  v3 = v2;
  v8.receiver = self;
  v8.super_class = (Class)DelaunayPoint;
  v4 = -[DelaunayPoint init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)v4->_value = v3;
    v6 = v4;
  }

  return v5;
}

- (double)value
{
  return *(double *)(a1 + 8);
}

@end
