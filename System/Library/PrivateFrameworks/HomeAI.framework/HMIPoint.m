@implementation HMIPoint

- (double)x
{
  return self->_point.x;
}

- (double)y
{
  return self->_point.y;
}

- (HMIPoint)initWithPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  HMIPoint *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)HMIPoint;
  result = -[HMIPoint init](&v6, sel_init);
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
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMIPoint point](self, "point");
  v5 = v4;
  -[HMIPoint point](self, "point");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%0.3f %0.3f>"), v5, v6);
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

- (HMIPoint)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIP.x"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIP.y"));
  v8 = v7;

  return -[HMIPoint initWithPoint:](self, "initWithPoint:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[HMIPoint x](self, "x");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIP.x"));
  -[HMIPoint y](self, "y");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIP.y"));

}

- (BOOL)isEqual:(id)a3
{
  HMIPoint *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = (HMIPoint *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMIPoint point](v4, "point");
      v6 = v5;
      v8 = v7;
      -[HMIPoint point](self, "point");
      v11 = v8 == v10 && v6 == v9;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  unint64_t v19;

  -[HMIPoint x](self, "x");
  v4 = -v3;
  if (v3 >= 0.0)
    v4 = v3;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  -[HMIPoint y](self, "y");
  v13 = -v12;
  if (v12 >= 0.0)
    v13 = v12;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  v17 = v16 + (unint64_t)v15;
  v18 = fabs(v15);
  if (v15 <= 0.0)
    v17 = v16;
  v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0)
    v19 = v17;
  return v19 ^ v11;
}

@end
