@implementation AVCacheLargestInscribedRectInBoundingPathKey

- (AVCacheLargestInscribedRectInBoundingPathKey)initWithCenter:(CGPoint)a3 aspectRatio:(double)a4
{
  double y;
  double x;
  AVCacheLargestInscribedRectInBoundingPathKey *v7;
  AVCacheLargestInscribedRectInBoundingPathKey *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)AVCacheLargestInscribedRectInBoundingPathKey;
  v7 = -[AVCacheLargestInscribedRectInBoundingPathKey init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AVCacheLargestInscribedRectInBoundingPathKey setCenter:](v7, "setCenter:", x, y);
    -[AVCacheLargestInscribedRectInBoundingPathKey setAspectRatio:](v8, "setAspectRatio:", a4);
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AVCacheLargestInscribedRectInBoundingPathKey *v4;
  AVCacheLargestInscribedRectInBoundingPathKey *v5;
  AVCacheLargestInscribedRectInBoundingPathKey *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  v4 = (AVCacheLargestInscribedRectInBoundingPathKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[AVCacheLargestInscribedRectInBoundingPathKey center](self, "center");
    v8 = v7;
    -[AVCacheLargestInscribedRectInBoundingPathKey center](v6, "center");
    if (v8 == v9
      && (-[AVCacheLargestInscribedRectInBoundingPathKey center](self, "center"),
          v11 = v10,
          -[AVCacheLargestInscribedRectInBoundingPathKey center](v6, "center"),
          v11 == v12))
    {
      -[AVCacheLargestInscribedRectInBoundingPathKey aspectRatio](self, "aspectRatio");
      v14 = v13;
      -[AVCacheLargestInscribedRectInBoundingPathKey aspectRatio](v6, "aspectRatio");
      v16 = v14 == v15;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

@end
