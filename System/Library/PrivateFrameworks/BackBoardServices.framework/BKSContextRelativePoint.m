@implementation BKSContextRelativePoint

- (BKSContextRelativePoint)initWithPoint:(CGPoint)a3 contextID:(unsigned int)a4
{
  CGFloat y;
  CGFloat x;
  BKSContextRelativePoint *result;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)BKSContextRelativePoint;
  result = -[BKSContextRelativePoint init](&v8, sel_init);
  if (result)
  {
    result->_point.x = x;
    result->_point.y = y;
    result->_contextID = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)self->_point.x ^ self->_contextID ^ (unint64_t)self->_point.y;
}

- (BOOL)isEqual:(id)a3
{
  BKSContextRelativePoint *v4;
  unsigned int v5;
  char v6;

  v4 = (BKSContextRelativePoint *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[BKSContextRelativePoint contextID](self, "contextID"),
          v5 == -[BKSContextRelativePoint contextID](v4, "contextID")))
    {
      -[BKSContextRelativePoint point](self, "point");
      -[BKSContextRelativePoint point](v4, "point");
      v6 = BSPointEqualToPoint();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  double x;
  double y;
  id v6;

  x = self->_point.x;
  y = self->_point.y;
  v6 = a3;
  objc_msgSend(v6, "encodeCGPoint:forKey:", CFSTR("point"), x, y);
  objc_msgSend(v6, "encodeInt64:forKey:", self->_contextID, CFSTR("contextID"));

}

- (BKSContextRelativePoint)initWithBSXPCCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("point"));
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("contextID"));

  return -[BKSContextRelativePoint initWithPoint:contextID:](self, "initWithPoint:contextID:", v9, v6, v8);
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unsigned)contextID
{
  return self->_contextID;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
