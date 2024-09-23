@implementation HMPoint

- (HMPoint)initWithPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  HMPoint *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)HMPoint;
  result = -[HMPoint init](&v6, sel_init);
  if (result)
  {
    result->_point.x = x;
    result->_point.y = y;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSPoint v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMPoint point](self, "point");
  NSStringFromPoint(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMPoint description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMPoint *v4;
  HMPoint *v5;
  HMPoint *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  BOOL v13;
  NSPoint v15;
  NSPoint v16;

  v4 = (HMPoint *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMPoint point](self, "point");
      v8 = v7;
      v10 = v9;
      -[HMPoint point](v6, "point");
      v16.x = v11;
      v16.y = v12;
      v15.x = v8;
      v15.y = v10;
      v13 = NSEqualPoints(v15, v16);
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[HMPoint point](self, "point");
  objc_msgSend(v4, "encodePoint:forKey:", CFSTR("HMC.p.ck.point"));

}

- (HMPoint)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodePointForKey:", CFSTR("HMC.p.ck.point"));
  return -[HMPoint initWithPoint:](self, "initWithPoint:");
}

- (CGPoint)point
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
