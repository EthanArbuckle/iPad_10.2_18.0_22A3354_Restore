@implementation VNPoint

- (double)distanceToPoint:(VNPoint *)point
{
  VNPoint *v4;
  VNVector *v5;
  double v6;
  double v7;

  v4 = point;
  v5 = -[VNVector initWithVectorHead:tail:]([VNVector alloc], "initWithVectorHead:tail:", self, v4);
  -[VNVector length](v5, "length");
  v7 = v6;

  return v7;
}

- (VNPoint)init
{
  return -[VNPoint initWithX:y:](self, "initWithX:y:", 0.0, 0.0);
}

- (VNPoint)initWithX:(double)x y:(double)y
{
  VNPoint *v6;
  VNPoint *v7;
  VNPoint *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNPoint;
  v6 = -[VNPoint init](&v10, sel_init);
  v7 = v6;
  if (v6
    && (*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v6->_x = x;
    v6->_y = y;
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (VNPoint)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  VNPoint *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("x"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("y"));
  v8 = -[VNPoint initWithX:y:](self, "initWithX:y:", v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("x"), self->_x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("y"), self->_y);

}

- (CGPoint)location
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[VNPoint x](self, "x");
  v4 = v3;
  -[VNPoint y](self, "y");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (id)transformedWith:(CGAffineTransform *)a3
{
  double v4;
  double v5;

  -[VNPoint location](self, "location");
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:", vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v4), *(float64x2_t *)&a3->a, v5)));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VNPoint x](self, "x");
    v7 = v6;
    objc_msgSend(v5, "x");
    if (v7 == v8)
    {
      -[VNPoint y](self, "y");
      v11 = v10;
      objc_msgSend(v5, "y");
      v9 = v11 == v12;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  double x;
  double y;

  x = self->_x;
  if (x == 0.0)
    x = 0.0;
  y = self->_y;
  if (y == 0.0)
    y = 0.0;
  return *(_QWORD *)&y ^ __ROR8__(*(_QWORD *)&x, 51);
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNPoint x](self, "x");
  v5 = v4;
  -[VNPoint y](self, "y");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("[%f; %f]"), v5, v6);
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

+ (VNPoint)zeroPoint
{
  if (+[VNPoint zeroPoint]::onceToken != -1)
    dispatch_once(&+[VNPoint zeroPoint]::onceToken, &__block_literal_global_5162);
  return (VNPoint *)(id)+[VNPoint zeroPoint]::zeroPoint;
}

+ (VNPoint)pointByApplyingVector:(VNVector *)vector toPoint:(VNPoint *)point
{
  VNVector *v5;
  VNPoint *v6;
  VNPoint *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  VNPoint *v15;

  v5 = vector;
  v6 = point;
  v7 = [VNPoint alloc];
  -[VNPoint x](v6, "x");
  v9 = v8;
  -[VNVector x](v5, "x");
  v11 = v10;
  -[VNPoint y](v6, "y");
  v13 = v12;
  -[VNVector y](v5, "y");
  v15 = -[VNPoint initWithLocation:](v7, "initWithLocation:", v9 + v11, v13 + v14);

  return v15;
}

+ (double)distanceBetweenPoint:(VNPoint *)point1 point:(VNPoint *)point2
{
  double result;

  -[VNPoint distanceToPoint:](point1, "distanceToPoint:", point2);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __20__VNPoint_zeroPoint__block_invoke()
{
  VNPoint *v0;
  uint64_t v1;
  void *v2;

  v0 = [VNPoint alloc];
  v1 = -[VNPoint initWithLocation:](v0, "initWithLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v2 = (void *)+[VNPoint zeroPoint]::zeroPoint;
  +[VNPoint zeroPoint]::zeroPoint = v1;

}

@end
