@implementation SGBezierPathElement

- (SGBezierPathElement)initWithStartPoint:(CGPoint)a3 pathElement:(const CGPathElement *)a4
{
  CGFloat y;
  CGFloat x;
  SGBezierPathElement *v7;
  SGBezierPathElement *v8;
  uint64_t type;
  uint64_t v10;
  CGFloat *v11;
  CGFloat *v12;
  SGBezierPathElement *v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)SGBezierPathElement;
  v7 = -[SGBezierPathElement init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    type = a4->type;
    v10 = -[SGBezierPathElement numberOfPointsForCGPathElementType:](v7, "numberOfPointsForCGPathElementType:", type);
    v11 = (CGFloat *)malloc_type_malloc(16 * (v10 + 1), 0x5BACF1ACuLL);
    v12 = v11;
    *v11 = x;
    v11[1] = y;
    if (v10)
      memcpy(v11 + 2, a4->points, 16 * v10);
    -[SGBezierPathElement setPoints:](v8, "setPoints:", v12);
    -[SGBezierPathElement setType:](v8, "setType:", type);
    -[SGBezierPathElement setPointCount:](v8, "setPointCount:", v10 + 1);
    -[SGBezierPathElement computeLength](v8, "computeLength");
    -[SGBezierPathElement setLength:](v8, "setLength:");
    v13 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SGBezierPathElement points](self, "points"))
    free(-[SGBezierPathElement points](self, "points"));
  v3.receiver = self;
  v3.super_class = (Class)SGBezierPathElement;
  -[SGBezierPathElement dealloc](&v3, sel_dealloc);
}

- (CGPoint)startPoint
{
  CGPoint *v2;
  double x;
  double y;
  CGPoint result;

  v2 = -[SGBezierPathElement points](self, "points");
  x = v2->x;
  y = v2->y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  CGPoint *v3;
  CGPoint *v4;
  double x;
  double y;
  CGPoint result;

  v3 = -[SGBezierPathElement points](self, "points");
  v4 = &v3[-[SGBezierPathElement pointCount](self, "pointCount")];
  x = v4[-1].x;
  y = v4[-1].y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)pointOnPathForX:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint *v15;
  double x;
  double y;
  CGPoint *v18;
  double v19;
  CGPoint result;

  if (-[SGBezierPathElement type](self, "type") == 3)
  {
    -[SGBezierPathElement startPoint](self, "startPoint");
    v8 = v7;
    v10 = v9;
    -[SGBezierPathElement endPoint](self, "endPoint");
    v12 = v11;
    v14 = v13;
    v15 = -[SGBezierPathElement points](self, "points");
    x = v15[1].x;
    y = v15[1].y;
    v18 = -[SGBezierPathElement points](self, "points");
    v6 = SGComputeCubicBezierYForX(a3, v8, v10, x, y, v18[2].x, v18[2].y, v19, v12, v14);
    v5 = a3;
  }
  else
  {
    -[SGBezierPathElement endPoint](self, "endPoint");
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (unint64_t)numberOfPointsForCGPathElementType:(int)a3
{
  if (a3 > 3)
    return 0;
  else
    return qword_242975948[a3];
}

- (double)computeLength
{
  int v3;
  double result;
  CGPoint *v5;
  float64_t x;
  float64_t y;
  CGPoint *v8;
  float64_t v9;
  float64_t v10;
  double v11;
  float64_t v12;
  double v13;
  float64_t v14;
  float64_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64_t v20;

  v3 = -[SGBezierPathElement type](self, "type");
  if (v3 == 3)
  {
    v5 = -[SGBezierPathElement points](self, "points");
    x = v5[1].x;
    y = v5[1].y;
    v8 = -[SGBezierPathElement points](self, "points");
    v9 = v8[2].x;
    v10 = v8[2].y;
    -[SGBezierPathElement startPoint](self, "startPoint");
    v12 = v11;
    v14 = v13;
    -[SGBezierPathElement endPoint](self, "endPoint");
    v16.f64[0] = v15;
    v17.f64[0] = v12;
    v18.f64[0] = x;
    v19.f64[0] = v9;
    return SGComputeCubicBezierLength(v17, v14, v18, y, v19, v10, v16, v20);
  }
  else if (v3 == 1)
  {
    -[SGBezierPathElement startPoint](self, "startPoint");
    -[SGBezierPathElement endPoint](self, "endPoint");
    UIDistanceBetweenPoints();
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (void)setPointCount:(unint64_t)a3
{
  self->_pointCount = a3;
}

- (CGPoint)points
{
  return self->_points;
}

- (void)setPoints:(CGPoint *)a3
{
  self->_points = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

@end
