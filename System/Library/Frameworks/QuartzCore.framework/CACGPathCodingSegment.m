@implementation CACGPathCodingSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addToCGPath:(CGPath *)a3
{
  switch(self->_type)
  {
    case 0:
      CGPathMoveToPoint(a3, 0, self->_points[0].x, self->_points[0].y);
      break;
    case 1:
      CGPathAddLineToPoint(a3, 0, self->_points[0].x, self->_points[0].y);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(a3, 0, self->_points[0].x, self->_points[0].y, self->_points[1].x, self->_points[1].y);
      break;
    case 3:
      CGPathAddCurveToPoint(a3, 0, self->_points[0].x, self->_points[0].y, self->_points[1].x, self->_points[1].y, self->_points[2].x, self->_points[2].y);
      break;
    case 4:
      CGPathCloseSubpath(a3);
      break;
    default:
      return;
  }
}

- (CACGPathCodingSegment)initWithCoder:(id)a3
{
  CACGPathCodingSegment *v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CACGPathCodingSegment;
  v4 = -[CACGPathCodingSegment init](&v15, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("LKCGPathType"));
    v4->_type = v5;
    if (v5 <= 3)
    {
      v6 = 0xCu >> (v5 & 0xF);
      v7 = v5 & 0xF;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("LKCGPathPoint0_x"));
      v4->_points[0].x = v8;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("LKCGPathPoint0_y"));
      v4->_points[0].y = v9;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("LKCGPathPoint1_x"));
        v4->_points[1].x = v10;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("LKCGPathPoint1_y"));
        v4->_points[1].y = v11;
      }
      if (v7 == 3)
      {
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("LKCGPathPoint2_x"));
        v4->_points[2].x = v12;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("LKCGPathPoint2_y"));
        v4->_points[2].y = v13;
      }
    }
  }
  return v4;
}

- (CACGPathCodingSegment)initWithCGPathElement:(const CGPathElement *)a3
{
  CACGPathCodingSegment *result;
  CGPathElementType type;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CACGPathCodingSegment;
  result = -[CACGPathCodingSegment init](&v6, sel_init);
  if (result)
  {
    result->_type = a3->type;
    type = a3->type;
    if (a3->type >= kCGPathElementAddQuadCurveToPoint)
    {
      if (type != kCGPathElementAddQuadCurveToPoint)
      {
        if (type != kCGPathElementAddCurveToPoint)
          return result;
        result->_points[2] = a3->points[2];
      }
      result->_points[1] = a3->points[1];
    }
    result->_points[0] = *a3->points;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int type;
  unsigned int v6;
  int v7;

  objc_msgSend(a3, "encodeInt:forKey:", self->_type, CFSTR("LKCGPathType"));
  type = self->_type;
  if (type <= 3)
  {
    v6 = 0xCu >> (type & 0xF);
    v7 = self->_type & 0xF;
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("LKCGPathPoint0_x"), self->_points[0].x);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("LKCGPathPoint0_y"), self->_points[0].y);
    if ((v6 & 1) != 0)
    {
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("LKCGPathPoint1_x"), self->_points[1].x);
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("LKCGPathPoint1_y"), self->_points[1].y);
    }
    if (v7 == 3)
    {
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("LKCGPathPoint2_x"), self->_points[2].x);
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("LKCGPathPoint2_y"), self->_points[2].y);
    }
  }
}

@end
