@implementation AKGeometryHelper

+ (BOOL)isUnpresentableRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char v8;
  BOOL IsInfinite;
  double v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3) || (objc_msgSend(a1, "rectHasZeroSize:", x, y, width, height) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    IsInfinite = CGRectIsInfinite(v12);
    v10 = fabs(y);
    v8 = fabs(x) == INFINITY || IsInfinite;
    if (v10 == INFINITY)
      v8 = 1;
    if (fabs(width) == INFINITY)
      v8 = 1;
    if (fabs(height) == INFINITY)
      v8 = 1;
  }
  return v8 & 1;
}

+ (BOOL)rectHasZeroSize:(CGRect)a3
{
  return a3.size.height == *(double *)(MEMORY[0x24BDBF148] + 8) && a3.size.width == *MEMORY[0x24BDBF148];
}

+ (BOOL)isUnpresentableSize:(CGSize)a3
{
  BOOL v3;

  v3 = a3.width <= 0.0;
  if (a3.height <= 0.0)
    v3 = 1;
  if (fabs(a3.width) == INFINITY)
    v3 = 1;
  if (fabs(a3.height) == INFINITY)
    return 1;
  return v3;
}

+ (BOOL)isUnpresentablePoint:(CGPoint)a3
{
  BOOL v3;

  v3 = fabs(a3.x) == INFINITY;
  if (fabs(a3.y) == INFINITY)
    return 1;
  return v3;
}

+ (CGRect)integralRect:(CGRect)a3 withOptions:(unint64_t)a4
{
  return NSIntegralRectWithOptions(a3, a4);
}

+ (CGRect)stableIntegralRectForRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "integralRect:withOptions:", 3840, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)rectWithSize:(CGSize)a3 centeredAtPoint:(CGPoint)a4
{
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v6 = a4.x - a3.width * 0.5;
  v7 = a4.y - a3.height * 0.5;
  v8 = width;
  v9 = height;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)rectForSize:(CGSize)a3 inRect:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  y = a4.origin.y;
  x = a4.origin.x;
  v6 = a4.size.height / a3.height;
  if (a4.size.width / a3.width < a4.size.height / a3.height)
    v6 = a4.size.width / a3.width;
  v7 = a3.width * v6;
  v8 = a3.height * v6;
  v9 = x;
  v10 = y;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (CGPoint)centerOfRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MidX;
  double MidY;
  double v9;
  CGPoint result;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v9 = MidX;
  result.y = MidY;
  result.x = v9;
  return result;
}

+ (CGRect)constrainRect:(CGRect)a3 withinRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  rect = a3.size.height;
  v11 = CGRectGetWidth(a3);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (v11 <= CGRectGetWidth(v27))
  {
    if (v10 >= x)
      v14 = v10;
    else
      v14 = x;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxX = CGRectGetMaxX(v30);
    v31.origin.x = v14;
    v31.origin.y = v9;
    v31.size.width = v8;
    v31.size.height = rect;
    v16 = MaxX - CGRectGetWidth(v31);
    if (v14 >= v16)
      v13 = v16;
    else
      v13 = v14;
  }
  else
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v12 = CGRectGetWidth(v28);
    v29.origin.x = v10;
    v29.origin.y = v9;
    v29.size.width = v8;
    v29.size.height = rect;
    v13 = x + (v12 - CGRectGetWidth(v29)) * 0.5;
  }
  v32.origin.x = v13;
  v32.origin.y = v9;
  v32.size.width = v8;
  v32.size.height = rect;
  v17 = CGRectGetHeight(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (v17 <= CGRectGetHeight(v33))
  {
    if (v9 >= y)
      v20 = v9;
    else
      v20 = y;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MaxY = CGRectGetMaxY(v36);
    v37.origin.x = v13;
    v37.origin.y = v20;
    v37.size.width = v8;
    v37.size.height = rect;
    v22 = MaxY - CGRectGetHeight(v37);
    if (v20 >= v22)
      v19 = v22;
    else
      v19 = v20;
  }
  else
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v18 = CGRectGetHeight(v34);
    v35.origin.x = v13;
    v35.origin.y = v9;
    v35.size.width = v8;
    v35.size.height = rect;
    v19 = y + (v18 - CGRectGetHeight(v35)) * 0.5;
  }
  v23 = v13;
  v24 = v8;
  v25 = rect;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v19;
  result.origin.x = v23;
  return result;
}

+ (CGPoint)snapVectorTo45Degrees:(CGPoint)a3
{
  long double y;
  long double x;
  double v5;
  long double v6;
  __double2 v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = hypot(a3.x, a3.y);
  v6 = atan2(y, x);
  v7 = __sincos_stret(round(v6 / 0.785398163) * 0.785398163);
  v8 = v5 * v7.__sinval;
  v9 = v5 * v7.__cosval;
  result.y = v8;
  result.x = v9;
  return result;
}

+ (CGPoint)snapVector:(CGPoint)a3 toDiagonalForAspectRatio:(double)a4 ignoreWidth:(BOOL)a5 ignoreHeight:(BOOL)a6
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a6)
  {
    a3.y = a3.x / a4;
  }
  else
  {
    a3.x = a3.y * a4;
    if (!a5)
      a3.x = x;
  }
  v9 = hypot(a3.x, a3.y);
  +[AKGeometryHelper compareVectorDirectionsFirstVector:secondVector:](AKGeometryHelper, "compareVectorDirectionsFirstVector:secondVector:", x, y, a4, 1.0);
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v10 * a4);
  v12 = v9 * v11;
  v14 = v9 * v13;
  result.y = v14;
  result.x = v12;
  return result;
}

+ (CGPoint)projectVector:(CGPoint)a3 ontoAspectVector:(CGPoint)a4
{
  CGFloat v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = (a3.y * a4.y + a3.x * a4.x) / (a4.y * a4.y + a4.x * a4.x);
  v5 = a4.x * v4;
  v6 = a4.y * v4;
  result.y = v6;
  result.x = v5;
  return result;
}

+ (double)scaleOfTransform:(CGAffineTransform *)a3
{
  return sqrt(a3->c * a3->c + a3->a * a3->a);
}

+ (CGPoint)intersectRayStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withCircleWithCenter:(CGPoint)a5 andRadius:(double)a6 farthestResult:(BOOL)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  v7 = a4.x - a3.x;
  v8 = a4.y - a3.y;
  v9 = a5.x - a3.x;
  v10 = a5.y - a3.y;
  v11 = v7 * (a5.y - a3.y) - v8 * v9;
  v12 = v8 * v8 + v7 * v7;
  v13 = a6 * a6 * v12 - v11 * v11;
  if (v13 >= 0.0)
  {
    v16 = v8 * v10 + v7 * v9;
    v17 = sqrt(v13);
    v18 = (v16 + v17) / v12;
    v19 = (v16 - v17) / v12;
    if (v18 >= v19)
      v20 = v18;
    else
      v20 = v19;
    if (v18 < v19)
      v19 = v18;
    if (a7)
      v19 = v20;
    if (v19 < 0.0)
      v19 = v20;
    v14 = a3.x + v19 * v7;
    v15 = a3.y + v19 * v8;
  }
  else
  {
    v14 = 9.22337204e18;
    v15 = 9.22337204e18;
  }
  result.y = v15;
  result.x = v14;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withCircleWithCenter:(CGPoint)a5 andRadius:(double)a6 farthestResult:(BOOL)a7
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  +[AKGeometryHelper intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", a7, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6);
  if (v10 >= x)
    v13 = x;
  else
    v13 = v10;
  if (v11 + 0.0005 < v13
    || (v10 >= x ? (v14 = v10) : (v14 = x),
        v11 + -0.0005 > v14
     || (v9 >= y ? (v15 = y) : (v15 = v9), v12 + 0.0005 < v15 || (v9 >= y ? (v16 = v9) : (v16 = y), v12 + -0.0005 > v16))))
  {
    v11 = 9.22337204e18;
    v12 = 9.22337204e18;
  }
  result.y = v12;
  result.x = v11;
  return result;
}

+ (CGPoint)intersectRayStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withEllipseOfRect:(CGRect)a5 farthestResult:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float64x2_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.y;
  v12 = a4.x;
  v13 = a3.y;
  v14 = a3.x;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v21 = v15;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", x, y, width, height);
  +[AKGeometryHelper intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", v6, v13 * 0.0 + 0.0 * v14 + 0.0, v13 * 0.0 + 0.0 * v14 + 0.0, v11 * 0.0 + 0.0 * v12 + 0.0, v11 * 0.0 + 0.0 * v12 + 0.0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v21);
  v20 = v17;
  v22 = v16;
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", x, y, width, height);
  v18 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v20), (float64x2_t)0, v22));
  v19 = v18.f64[1];
  result.x = v18.f64[0];
  result.y = v19;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withEllipseOfRect:(CGRect)a5 farthestResult:(BOOL)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  +[AKGeometryHelper intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:", a6, a3.x, a3.y, a4.x, a4.y, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (v9 >= x)
    v12 = x;
  else
    v12 = v9;
  if (v10 + 0.0005 < v12
    || (v9 >= x ? (v13 = v9) : (v13 = x),
        v10 + -0.0005 > v13
     || (v8 >= y ? (v14 = y) : (v14 = v8), v11 + 0.0005 < v14 || (v8 >= y ? (v15 = v8) : (v15 = y), v11 + -0.0005 > v15))))
  {
    v10 = 9.22337204e18;
    v11 = 9.22337204e18;
  }
  result.y = v11;
  result.x = v10;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withAnotherSegmentStartingAt:(CGPoint)a5 ending:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  BOOL v27;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = a4.y - y;
  v9 = a3.x - a4.x;
  v10 = a6.y - a5.y;
  v11 = a5.x - a6.x;
  v12 = (a4.y - y) * (a5.x - a6.x) - (a6.y - a5.y) * v9;
  if (v12 == 0.0)
    goto LABEL_36;
  v13 = a5.y * v11 + v10 * a5.x;
  v14 = y * v9 + v8 * x;
  v15 = (v11 * v14 - v9 * v13) / v12;
  v16 = v15 + 0.0005;
  v17 = x >= a4.x ? a4.x : x;
  if (v16 < v17)
    goto LABEL_36;
  v18 = v15 + -0.0005;
  if (x < a4.x)
    x = a4.x;
  if (v18 > x)
    goto LABEL_36;
  v19 = (v14 * -v10 + v8 * v13) / v12;
  v20 = v19 + 0.0005;
  v21 = y >= a4.y ? a4.y : y;
  if (v20 < v21)
    goto LABEL_36;
  v22 = v19 + -0.0005;
  if (y >= a4.y)
    a4.y = y;
  if (v22 > a4.y)
    goto LABEL_36;
  if (a5.x >= a6.x)
    v23 = a6.x;
  else
    v23 = a5.x;
  if (a5.x < a6.x)
    a5.x = a6.x;
  v24 = v16 < v23 || v18 > a5.x;
  if (v24
    || (a5.y >= a6.y ? (v25 = a6.y) : (v25 = a5.y),
        a5.y >= a6.y ? (v26 = a5.y) : (v26 = a6.y),
        v20 >= v25 ? (v27 = v22 > v26) : (v27 = 1),
        v27))
  {
LABEL_36:
    v15 = 9.22337204e18;
    v19 = 9.22337204e18;
  }
  result.y = v19;
  result.x = v15;
  return result;
}

+ (void)_checkIntersectionOfLineSegmentStartingAt:(CGPoint)a3 endingAt:(CGPoint)a4 withCircleAt:(CGPoint)a5 andRadius:(double)a6 results:(id)a7
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  id v18;

  y = a5.y;
  x = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v18 = a7;
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 1, v13, v12, v11, v10, x, y, a6);
  if (v15 != 9.22337204e18 && v14 != 9.22337204e18)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v17);

  }
}

+ (void)_collectIntersectionsOfLineSegmentStartingAt:(CGPoint)a3 endingAt:(CGPoint)a4 withCornerCirclesOfRoundedRect:(CGRect)a5 withRadius:(double)a6 results:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v16;
  double MaxY;
  double v18;
  double MinY;
  double v20;
  double v21;
  double MaxX;
  double MinX;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v24 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v25 = a7;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MinY = CGRectGetMinY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MaxX = CGRectGetMaxX(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v18 = CGRectGetMinY(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v21 = CGRectGetMaxX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MaxY = CGRectGetMaxY(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v20 = CGRectGetMinX(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v16 = CGRectGetMaxY(v33);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, MinX + a6, MinY + a6, a6);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, MaxX - a6, v18 + a6, a6);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, v21 - a6, MaxY - a6, a6);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, v20 + a6, v16 - a6, a6);

}

+ (CGPoint)_farthestPointFrom:(CGPoint)a3 inArray:(id)a4
{
  double y;
  double x;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = 0.0;
    v11 = y;
    v12 = x;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "akPointValue");
        v15 = v14;
        v17 = v16;
        v18 = hypot(v14 - x, v16 - y);
        if (v18 > v10)
        {
          v10 = v18;
          v11 = v17;
          v12 = v15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  else
  {
    v11 = y;
    v12 = x;
  }

  v19 = v12;
  v20 = v11;
  result.y = v20;
  result.x = v19;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withRect:(CGRect)a5 andRoundedCornerRadius:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MaxY;
  double MaxX;
  double v37;
  double MinY;
  double MinX;
  double v40;
  CGPoint result;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v40 = a4.y;
  v10 = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  MinX = CGRectGetMinX(a5);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  MinY = CGRectGetMinY(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MaxX = CGRectGetMaxX(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v37 = CGRectGetMinY(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v34 = CGRectGetMaxX(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MaxY = CGRectGetMaxY(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v33 = CGRectGetMinX(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v32 = CGRectGetMaxY(v48);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKGeometryHelper _collectIntersectionsOfLineSegmentStartingAt:endingAt:withCornerCirclesOfRoundedRect:withRadius:results:](AKGeometryHelper, "_collectIntersectionsOfLineSegmentStartingAt:endingAt:withCornerCirclesOfRoundedRect:withRadius:results:", v13, v12, v11, v10, *(_QWORD *)&a6);
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11, v10, v40, MinX + a6, MinY, MaxX - a6);
  v16 = v15 == 9.22337204e18 || v14 == 9.22337204e18;
  if (v16
    && ((+[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11, v10, v40, MaxX, v37 + a6, v34, MaxY - a6), v18 != 9.22337204e18)? (v19 = v17 == 9.22337204e18): (v19 = 1), v19&& ((+[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11,
            v10,
            v40,
            v34 - a6,
            MaxY,
            v33 + a6,
            v32),
          v21 != 9.22337204e18)
       ? (v22 = v20 == 9.22337204e18)
       : (v22 = 1),
         v22
      && ((+[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11, v10, v40, v33, v32 - a6, MinX, MinY + a6), v24 == 9.22337204e18)|| v23 == 9.22337204e18))))
  {
    if (!objc_msgSend(v13, "count"))
    {
      *(double *)&v27 = 9.22337204e18;
      *(double *)&v29 = 9.22337204e18;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v25);

  }
  +[AKGeometryHelper _farthestPointFrom:inArray:](AKGeometryHelper, "_farthestPointFrom:inArray:", v13, v12, v11);
  v27 = v26;
  v29 = v28;
LABEL_20:

  v30 = *(double *)&v27;
  v31 = *(double *)&v29;
  result.y = v31;
  result.x = v30;
  return result;
}

+ (CGPoint)projectPoint:(CGPoint)a3 ontoRayWithFirstPoint:(CGPoint)a4 andSecondPoint:(CGPoint)a5
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  CGPoint result;

  v5 = a5.x - a4.x;
  v6 = a5.y - a4.y;
  v7 = ((a3.y - a4.y) * v6 + (a3.x - a4.x) * v5) / (v6 * v6 + v5 * v5);
  v8 = v5 * v7;
  v9 = v6 * v7;
  v10 = a4.x + v8;
  v11 = a4.y + v9;
  result.y = v11;
  result.x = v10;
  return result;
}

+ (BOOL)isPointOnLeft:(CGPoint)a3 ofRayWithFirstPoint:(CGPoint)a4 andSecondPoint:(CGPoint)a5
{
  return (a5.x - a4.x) * (a3.y - a4.y) - (a5.y - a4.y) * (a3.x - a4.x) > 0.0;
}

+ (CGAffineTransform)ellipseToCenteredCircleTransform:(SEL)a3
{
  double height;
  double width;
  double y;
  double x;
  double MidX;
  double MidY;
  double v11;
  double v12;
  CGAffineTransform *result;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform t2;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MidX = CGRectGetMidX(a4);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MidY = CGRectGetMidY(v20);
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  v12 = v11;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  result = CGAffineTransformMakeTranslation(retstr, -MidX, -MidY);
  if (v12 > 0.0)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v14 = CGRectGetWidth(v21);
    CGAffineTransformMakeScale(&t2, (v12 + v12) / v14, 1.0);
    v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v17.c = v15;
    *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v19, &v17, &t2);
    v16 = *(_OWORD *)&v19.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
    *(_OWORD *)&retstr->c = v16;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v19.tx;
  }
  return result;
}

+ (double)radiusOfCenteredCircleFor:(CGRect)a3
{
  return CGRectGetHeight(a3) * 0.5;
}

+ (CGAffineTransform)centeredCircleToEllipseTransform:(SEL)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat MidX;
  CGFloat MidY;
  double v11;
  double v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGFloat v17;
  __int128 v18;
  CGAffineTransform *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MidX = CGRectGetMidX(a4);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MidY = CGRectGetMidY(v28);
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  v12 = v11;
  v13 = MEMORY[0x24BDBD8B8];
  v14 = *MEMORY[0x24BDBD8B8];
  v15 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v15;
  v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)&retstr->tx = v16;
  if (v12 > 0.0)
  {
    v22 = v15;
    v23 = v14;
    v29.origin.x = x;
    v29.origin.y = y;
    v21 = v16;
    v29.size.width = width;
    v29.size.height = height;
    v17 = CGRectGetWidth(v29);
    CGAffineTransformMakeScale(&t2, v17 / (v12 + v12), 1.0);
    *(_OWORD *)&t1.a = v23;
    *(_OWORD *)&t1.c = v22;
    *(_OWORD *)&t1.tx = v21;
    CGAffineTransformConcat(retstr, &t1, &t2);
  }
  CGAffineTransformMakeTranslation(&v25, MidX, MidY);
  v18 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v24.c = v18;
  *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&t1, &v24, &v25);
  v20 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  return result;
}

+ (BOOL)isPoint:(CGPoint)a3 onEllipse:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  return vabdd_f64(hypot(v8 * 0.0 + 0.0 * v9 + 0.0, v8 * 0.0 + 0.0 * v9 + 0.0), v10) < 0.0005;
}

+ (void)intersectCircleAtPoint:(CGPoint)a3 withRadius:(double)a4 withCircleAtPoint:(CGPoint)a5 withRadius:(double)a6 firstOutPoint:(CGPoint *)a7 secondOutPoint:(CGPoint *)a8
{
  double y;
  double x;
  CGFloat v14;
  CGFloat v15;
  long double v16;
  long double v17;
  double v18;
  long double v19;
  double v20;
  long double v21;
  double v22;

  y = a3.y;
  x = a3.x;
  v14 = a5.x - a3.x;
  v15 = a5.y - a3.y;
  v16 = hypot(a5.x - a3.x, a5.y - a3.y);
  v17 = (a4 * a4 - a6 * a6 + v16 * v16) / (v16 + v16);
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v14, v15);
  v19 = x + v17 * v18;
  v21 = y + v17 * v20;
  v22 = sqrt(a4 * a4 - v17 * v17);
  a7->x = v19 - v22 * v20;
  a7->y = v21 + v22 * v18;
  a8->x = v19 + v22 * v20;
  a8->y = v21 - v22 * v18;
}

+ (void)tangentPointsToEllipse:(CGRect)a3 fromPoint:(CGPoint)a4 firstOutPoint:(CGPoint *)a5 secondOutPoint:(CGPoint *)a6
{
  double y;
  double x;
  double height;
  double width;
  double v12;
  double v13;
  long double v14;
  long double v15;
  long double v16;
  double v17;
  long double v18;
  double v19;
  long double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", a3.origin.x);
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", v13, v12, width, height);
  v14 = *(double *)&v34 + y * *(double *)&v33 + *(double *)&v32 * x;
  v15 = *((double *)&v34 + 1) + y * *((double *)&v33 + 1) + *((double *)&v32 + 1) * x;
  v16 = hypot(v14, v15) * 0.5;
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", (double)(0.0 - v14), (double)(0.0 - v15));
  v18 = v14 + v16 * v17;
  v20 = v15 + v16 * v19;
  v27 = 0.0;
  v28 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v13, v12, width, height);
  +[AKGeometryHelper intersectCircleAtPoint:withRadius:withCircleAtPoint:withRadius:firstOutPoint:secondOutPoint:](AKGeometryHelper, "intersectCircleAtPoint:withRadius:withCircleAtPoint:withRadius:firstOutPoint:secondOutPoint:", &v27, &v25, (double)v18, (double)v20, (double)v16, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v21);
  v22 = *((double *)&v31 + 1) + v28 * *((double *)&v30 + 1) + *((double *)&v29 + 1) * v27;
  v23 = *(double *)&v31 + *(double *)&v30 * v26 + *(double *)&v29 * v25;
  v24 = *((double *)&v31 + 1) + *((double *)&v30 + 1) * v26 + *((double *)&v29 + 1) * v25;
  a5->x = *(double *)&v31 + v28 * *(double *)&v30 + *(double *)&v29 * v27;
  a5->y = v22;
  a6->x = v23;
  a6->y = v24;
}

+ (CGPoint)tangentOfEllipse:(CGRect)a3 throughRayWithFirstPoint:(CGPoint)a4 goingThrough:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double height;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGPoint result;
  CGRect v27;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  v21 = v13;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v12, v11, width, height);
  +[AKGeometryHelper intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:", 0, v8, v7, x, y, v12, v11, width, height);
  v19 = *((double *)&v25 + 1) + v14 * *((double *)&v24 + 1) + *((double *)&v23 + 1) * v15;
  v20 = *(double *)&v25 + v14 * *(double *)&v24 + *(double *)&v23 * v15;
  v27.origin.x = v12;
  v27.origin.y = v11;
  v27.size.width = width;
  v27.size.height = height;
  v16 = CGRectGetWidth(v27);
  CGAffineTransformMakeScale(&v22, v16 / (v21 + v21), 1.0);
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", vaddq_f64(*(float64x2_t *)&v22.tx, vmlsq_lane_f64(vmulq_n_f64(*(float64x2_t *)&v22.c, v20), *(float64x2_t *)&v22.a, v19, 0)));
  result.y = v18;
  result.x = v17;
  return result;
}

+ (id)verticesOfPolygonWithPointCount:(unint64_t)a3 inRect:(CGRect)a4 rotation:(double)a5 flippedVertically:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  __double2 v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  double v27;
  double v28;
  void *v29;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v6 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = height;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  if (a3)
  {
    v16 = v15;
    v17 = 360.0 / (double)a3;
    do
    {
      v18 = __sincos_stret(a5 * 3.14159265 / 180.0 + 1.57079633);
      v19 = v16 * v18.__cosval;
      v20 = v16 * v18.__sinval;
      if (v6)
        +[AKGeometryHelper flipPointVertically:inRect:](AKGeometryHelper, "flipPointVertically:inRect:", v19, v20, -v16, -v16, v16 + v16, v16 + v16);
      objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v21);

      a5 = v17 + a5;
      --a3;
    }
    while (a3);
  }
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", x, y, width, v31);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = v13;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "akPointValue");
        objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", vaddq_f64(v38, vmlaq_n_f64(vmulq_n_f64(v37, v27), v36, v28)));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v29);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v24);
  }

  return v14;
}

+ (CGPoint)flipPointVertically:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double MidY;
  float64x2_t v10;
  double v11;
  double v12;
  double v13;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGPoint result;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.y;
  v13 = a3.x;
  MidX = CGRectGetMidX(a4);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MidY = CGRectGetMidY(v20);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -MidX, -MidY);
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &t2);
  v18 = v17;
  CGAffineTransformMakeTranslation(&v14, MidX, MidY);
  t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &v14);
  v10 = vaddq_f64(*(float64x2_t *)&v17.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v17.c, v12), *(float64x2_t *)&v17.a, v13));
  v11 = v10.f64[1];
  result.x = v10.f64[0];
  result.y = v11;
  return result;
}

+ (int64_t)exifOrientationWithConversionBlock:(id)a3
{
  double (*v4)(double, double);
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  _BOOL8 v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  _BOOL4 v32;
  BOOL v33;
  int64_t result;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  int v38;
  BOOL v39;
  int64_t v40;
  _BOOL4 v41;
  _BOOL4 v44;
  BOOL v45;

  v4 = (double (*)(double, double))*((_QWORD *)a3 + 2);
  v5 = a3;
  v6 = v4(0.0, 0.0);
  v8 = v7;
  v9 = (*((double (**)(id, double, double))a3 + 2))(v5, 1.0, 0.0);
  v11 = v10;
  v12 = (*((double (**)(id, double, double))a3 + 2))(v5, 0.0, 1.0);
  v14 = v13;

  v15 = v9 - v6 + -0.0005;
  v16 = v11 - v8 + 0.0005;
  v17 = v16 < 0.0;
  v18 = v15 > 0.0;
  v19 = v9 - v6 + 0.0005;
  v20 = v11 - v8 + -0.0005;
  v21 = 2;
  if (v15 <= 0.0)
    v21 = 1;
  if (v19 < 0.0)
    v18 = v21;
  if (v20 > 0.0)
    ++v17;
  v22 = v17 + v18;
  if (v22 != 1)
  {
    if (v22)
      NSLog(CFSTR("%s: Right vector was transformed to point in multiple directions (only right-angle orientations are representable via EXIF):\nright:%d\nleft:%d\nup:%d\ndown:%d\n"), "+[AKGeometryHelper exifOrientationWithConversionBlock:]", v15 > 0.0, v19 < 0.0, v20 > 0.0, v16 < 0.0);
    else
      NSLog(CFSTR("%s: Right vector was collapsed.\n"), "+[AKGeometryHelper exifOrientationWithConversionBlock:]");
    return 1;
  }
  v23 = v12 - v6 + -0.0005;
  v24 = v12 - v6 + 0.0005;
  v25 = v14 - v8 + -0.0005;
  v26 = v14 - v8 + 0.0005;
  v27 = v26 < 0.0;
  v28 = v23 > 0.0;
  v29 = 2;
  if (v23 <= 0.0)
    v29 = 1;
  if (v24 < 0.0)
    v28 = v29;
  if (v25 > 0.0)
    ++v27;
  v30 = v27 + v28;
  if (v30 != 1)
  {
    if (v30)
      NSLog(CFSTR("%s: Up vector was transformed to point in multiple directions (only right-angle orientations are representable via EXIF):\nright:%d\nleft:%d\nup:%d\ndown:%d\n"), "+[AKGeometryHelper exifOrientationWithConversionBlock:]", v23 > 0.0, v24 < 0.0, v25 > 0.0, v26 < 0.0);
    else
      NSLog(CFSTR("%s: Up vector was collapsed.\n"), "+[AKGeometryHelper exifOrientationWithConversionBlock:]");
    return 1;
  }
  v31 = v25 <= 0.0;
  v32 = v15 <= 0.0;
  v33 = v15 > 0.0 && v25 > 0.0;
  if (v33)
    return 1;
  if (v19 >= 0.0)
    v31 = 1;
  if (!v31)
    return 2;
  if (v26 >= 0.0)
    v32 = 1;
  if (!v32)
    return 4;
  if (v19 < 0.0 && v26 < 0.0)
    return 3;
  if (v16 < 0.0 && v23 > 0.0)
    return 6;
  if (v20 > 0.0 && v23 > 0.0)
    return 7;
  v35 = v20 <= 0.0;
  v36 = v24 < 0.0;
  if (v24 >= 0.0)
    v35 = 1;
  v37 = v16 < 0.0;
  v38 = v16 < 0.0 || v35;
  v39 = v37 && v36;
  v33 = !v37 || !v36;
  v40 = 5;
  if (v33)
    v40 = 0;
  if (v38)
    result = v40;
  else
    result = 8;
  if (v38 && !v39)
  {
    v41 = v24 < 0.0 || v23 > 0.0;
    if (v19 >= 0.0 && v15 <= 0.0 || !v41)
    {
      v44 = v26 < 0.0 || v25 > 0.0;
      v45 = v16 >= 0.0 && v20 <= 0.0;
      if (v45 || !v44)
        NSLog(&CFSTR("upVector and rightVector were transformed in an illegal way. Check for transformation with illegal scale,"
                     " or rotation other than 90-degree increments...").isa);
      else
        NSLog(CFSTR("upVector and rightVector were both collapsed onto the vertical axis."));
    }
    else
    {
      NSLog(CFSTR("upVector and rightVector were both collapsed onto the horizontal axis."));
    }
    return 1;
  }
  return result;
}

+ (int64_t)inverseExifOrientation:(int64_t)a3
{
  int64_t v3;

  v3 = 6;
  if (a3 != 8)
    v3 = a3;
  if (a3 == 6)
    return 8;
  else
    return v3;
}

+ (int64_t)concatExifOrientation:(int64_t)a3 withExifOrientation:(int64_t)a4
{
  return qword_2290929D8[9 * a3 + a4];
}

+ (CGAffineTransform)_rawAffineTransformForExifOrientation:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  __int128 v12;
  CGAffineTransform *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform t1;
  CGAffineTransform t2;

  v5 = MEMORY[0x24BDBD8B8];
  v6 = *MEMORY[0x24BDBD8B8];
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v7;
  v8 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v8;
  switch(a4)
  {
    case 2:
      v9 = -1.0;
      v10 = 1.0;
      return CGAffineTransformMakeScale(retstr, v9, v10);
    case 3:
      v11 = -3.14159265;
      goto LABEL_11;
    case 4:
      v9 = 1.0;
      v10 = -1.0;
      return CGAffineTransformMakeScale(retstr, v9, v10);
    case 5:
      v18 = v7;
      v20 = v6;
      v16 = v8;
      CGAffineTransformMakeScale(&t2, 1.0, -1.0);
      *(_OWORD *)&t1.a = v20;
      *(_OWORD *)&t1.c = v18;
      *(_OWORD *)&t1.tx = v16;
      CGAffineTransformConcat(retstr, &t1, &t2);
      CGAffineTransformMakeRotation(&v25, -1.57079633);
      v12 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v24.c = v12;
      *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
      v13 = &v25;
      goto LABEL_9;
    case 6:
      v11 = -1.57079633;
      goto LABEL_11;
    case 7:
      v19 = v7;
      v21 = v6;
      v17 = v8;
      CGAffineTransformMakeScale(&v23, 1.0, -1.0);
      *(_OWORD *)&t1.a = v21;
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.tx = v17;
      CGAffineTransformConcat(retstr, &t1, &v23);
      CGAffineTransformMakeRotation(&v22, -4.71238898);
      v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v24.c = v14;
      *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
      v13 = &v22;
LABEL_9:
      result = CGAffineTransformConcat(&t1, &v24, v13);
      v15 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v15;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
      break;
    case 8:
      v11 = -4.71238898;
LABEL_11:
      result = CGAffineTransformMakeRotation(retstr, v11);
      break;
    default:
      return result;
  }
  return result;
}

+ (CGAffineTransform)affineTransformRecenteringAboutOriginForExifOrientation:(SEL)a3 withOriginalSize:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  __int128 v9;
  CGFloat v10;
  CGFloat v11;
  CGAffineTransform v13;
  CGAffineTransform t1;
  CGAffineTransform v15;
  CGAffineTransform v16;

  height = a5.height;
  width = a5.width;
  memset(&v16, 0, sizeof(v16));
  objc_msgSend(a2, "_rawAffineTransformForExifOrientation:");
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v15.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v15.c = v9;
  *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  switch(a4)
  {
    case 2:
    case 8:
      v11 = 0.0;
      v10 = width;
      goto LABEL_6;
    case 3:
    case 5:
      v10 = width;
      goto LABEL_4;
    case 4:
    case 6:
      v10 = 0.0;
LABEL_4:
      v11 = height;
LABEL_6:
      CGAffineTransformMakeTranslation(&v15, v10, v11);
      break;
    default:
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v16;
  v13 = v15;
  return CGAffineTransformConcat(retstr, &t1, &v13);
}

+ (CGAffineTransform)affineTransformFlatteningOriginalModelExif:(SEL)a3 withOriginalModelSize:(int64_t)a4
{
  double height;
  double width;
  _BOOL4 v9;
  double v10;
  double v11;

  height = a5.height;
  width = a5.width;
  v9 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:");
  if (v9)
    v10 = height;
  else
    v10 = width;
  if (v9)
    v11 = width;
  else
    v11 = height;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  return +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:](AKGeometryHelper, "affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:", a4, v10, v11);
}

+ (CGAffineTransform)affineTransformForExifOrientation:(SEL)a3 aboutCenter:(int64_t)a4
{
  double y;
  double x;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGAffineTransform *result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v22;

  y = a5.y;
  x = a5.x;
  memset(&v22, 0, sizeof(v22));
  objc_msgSend(a2, "_rawAffineTransformForExifOrientation:", a4);
  v8 = MEMORY[0x24BDBD8B8];
  v15 = *MEMORY[0x24BDBD8B8];
  v16 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v16;
  v14 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)&retstr->tx = v14;
  CGAffineTransformMakeTranslation(&t2, -x, -y);
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = v14;
  CGAffineTransformConcat(retstr, &t1, &t2);
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v19.c = v9;
  *(_OWORD *)&v19.tx = *(_OWORD *)&retstr->tx;
  v18 = v22;
  CGAffineTransformConcat(&t1, &v19, &v18);
  v10 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v17, x, y);
  v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v19.c = v11;
  *(_OWORD *)&v19.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&t1, &v19, &v17);
  v13 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  return result;
}

+ (void)adjustOriginalExifOrientationOnAnnotation:(id)a3 flatteningOriginalModelExif:(int64_t)a4
{
  int64_t v5;
  id v6;

  v6 = a3;
  v5 = +[AKGeometryHelper concatExifOrientation:withExifOrientation:](AKGeometryHelper, "concatExifOrientation:withExifOrientation:", objc_msgSend(v6, "originalExifOrientation"), +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", a4));
  objc_msgSend(v6, "setOriginalExifOrientation:", 0);
  objc_msgSend(v6, "setOriginalExifOrientation:", v5);

}

+ (CGPoint)adjustPoint:(CGPoint)a3 forExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5
{
  float64x2_t v5;
  double v6;
  double y;
  double x;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a1, "affineTransformForExifOrientation:aboutCenter:", a4, a5.x, a5.y);
  v5 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x));
  v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v6;
  return result;
}

+ (CGRect)adjustRect:(CGRect)a3 forExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MinY;
  double MaxX;
  CGFloat MaxY;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "affineTransformForExifOrientation:aboutCenter:", a4, a5.x, a5.y);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MinX = CGRectGetMinX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MinY = CGRectGetMinY(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MaxX = CGRectGetMaxX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxY = CGRectGetMaxY(v16);
  v17.origin.y = MinY * 0.0 + 0.0 * MinX + 0.0;
  v17.size.width = MaxY * 0.0 + 0.0 * MaxX + 0.0 - v17.origin.y;
  v17.size.height = v17.size.width;
  v17.origin.x = v17.origin.y;
  return CGRectStandardize(v17);
}

+ (CGPath)newPathWithPath:(CGPath *)a3 applyingExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5
{
  __int128 v7;

  objc_msgSend(a1, "affineTransformForExifOrientation:aboutCenter:", a4, a5.x, a5.y, 0, 0, 0, 0, 0, 0);
  return (CGPath *)MEMORY[0x22E2C0A54](a3, &v7);
}

+ (CGPoint)convertModelToScreenOrientationForPoint:(CGPoint)a3 relativeToRect:(CGRect)a4 withPageController:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  id v11;
  double MidX;
  double MidY;
  uint64_t v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v11 = a5;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidY = CGRectGetMidY(v19);
  v14 = objc_msgSend(v11, "currentModelToScreenExifOrientation");

  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v14, v10, v9, MidX, MidY);
  result.y = v16;
  result.x = v15;
  return result;
}

+ (CGRect)convertModelToScreenOrientationForRect:(CGRect)a3 withPageController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double MidX;
  double MidY;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  v11 = objc_msgSend(v8, "currentModelToScreenExifOrientation");

  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v11, x, y, width, height, MidX, MidY);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (CGPoint)convertScreenToModelOrientationForPoint:(CGPoint)a3 relativeToRect:(CGRect)a4 withPageController:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  id v11;
  double MidX;
  double MidY;
  uint64_t v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v11 = a5;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidY = CGRectGetMidY(v19);
  v14 = objc_msgSend(v11, "currentModelToScreenExifOrientation");

  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v14), v10, v9, MidX, MidY);
  result.y = v16;
  result.x = v15;
  return result;
}

+ (CGRect)convertScreenToModelOrientationForRect:(CGRect)a3 withPageController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double MidX;
  double MidY;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  v11 = objc_msgSend(v8, "currentModelToScreenExifOrientation");

  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v11), x, y, width, height, MidX, MidY);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (BOOL)exifOrientationHasFlip:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xB4u >> a3);
}

+ (BOOL)exifOrientationHasReversedAxes:(int64_t)a3
{
  return a3 > 4;
}

+ (unint64_t)draggableArea:(unint64_t)a3 convertedForExif:(int64_t)a4
{
  unint64_t result;
  int64_t v5;
  _QWORD *v6;

  result = a3;
  switch(a3)
  {
    case 1uLL:
      v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        v6 = &unk_229092C60;
        goto LABEL_18;
      }
      result = 1;
      break;
    case 2uLL:
      v5 = a4 - 3;
      if ((unint64_t)(a4 - 3) < 6)
      {
        v6 = &unk_229092C98;
        goto LABEL_18;
      }
      result = 2;
      break;
    case 3uLL:
      v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        v6 = &unk_229092CC8;
        goto LABEL_18;
      }
      result = 3;
      break;
    case 4uLL:
      v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        v6 = &unk_229092D38;
        goto LABEL_18;
      }
      result = 4;
      break;
    case 5uLL:
      v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        v6 = &unk_229092DD8;
        goto LABEL_18;
      }
      result = 5;
      break;
    case 6uLL:
      v5 = a4 - 3;
      if ((unint64_t)(a4 - 3) < 6)
      {
        v6 = &unk_229092DA8;
        goto LABEL_18;
      }
      result = 6;
      break;
    case 7uLL:
      v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        v6 = &unk_229092D70;
        goto LABEL_18;
      }
      result = 7;
      break;
    case 8uLL:
      v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) >= 7)
      {
        result = 8;
      }
      else
      {
        v6 = &unk_229092D00;
LABEL_18:
        result = v6[v5];
      }
      break;
    default:
      return result;
  }
  return result;
}

+ (CGVector)normalizeVector:(CGVector)a3
{
  double dy;
  double dx;
  double v5;
  double v6;
  double v7;
  CGVector result;

  dy = a3.dy;
  dx = a3.dx;
  objc_msgSend(a1, "lengthOfVector:");
  v6 = dy / v5;
  v7 = dx / v5;
  result.dy = v6;
  result.dx = v7;
  return result;
}

+ (double)angleOfVector:(CGVector)a3
{
  double result;

  result = atan2(a3.dy, a3.dx);
  if (result < 0.0)
    return result + 6.28318531;
  return result;
}

+ (double)angleBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double v5;
  double result;
  double y;
  double x;
  CGAffineTransform v9;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a1, "angleOfVector:", a3.x, a3.y);
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeRotation(&v9, -v5);
  objc_msgSend(a1, "angleOfVector:", vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x)));
  return result;
}

+ (double)distanceBetweenPoints:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return hypot(a3.x - a4.x, a3.y - a4.y);
}

+ (CGPoint)pointAtAngle:(double)a3 inCircleWithCenter:(CGPoint)a4 andRadius:(double)a5
{
  double y;
  double x;
  __double2 v8;
  double v9;
  double v10;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = __sincos_stret(a3);
  v9 = x + v8.__cosval * a5;
  v10 = y + v8.__sinval * a5;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (CGPoint)compareVectorDirectionsFirstVector:(CGPoint)a3 secondVector:(CGPoint)a4
{
  double y;
  double v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  CGPoint result;

  y = a3.y;
  v5 = -1.0;
  if ((y <= 0.0 || a4.y >= 0.0) && (y >= 0.0 || a4.y <= 0.0))
  {
    v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v6 = y < 0.0;
    v7 = y > 0.0;
    if (a4.y <= 0.0)
      v7 = 0;
    if (a4.y >= 0.0)
      v6 = 0;
    if (v7 || v6)
      v5 = 1.0;
  }
  v8 = -1.0;
  if ((a3.x <= 0.0 || a4.x >= 0.0) && (a3.x >= 0.0 || a4.x <= 0.0))
  {
    v8 = *MEMORY[0x24BDBEFB0];
    v9 = a3.x < 0.0;
    v10 = a3.x > 0.0;
    if (a4.x <= 0.0)
      v10 = 0;
    if (a4.x >= 0.0)
      v9 = 0;
    if (v10 || v9)
      v8 = 1.0;
  }
  v11 = v8;
  result.y = v5;
  result.x = v11;
  return result;
}

+ (CGRect)expandCGRect:(CGRect)a3 toContainPoint:(CGPoint)a4
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  double MinX;
  double v11;
  double MaxX;
  double v13;
  double MinY;
  double v15;
  double MaxY;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  if (MinX >= x)
    v11 = x;
  else
    v11 = MinX;
  v21.origin.x = v9;
  v21.origin.y = v8;
  v21.size.width = width;
  v21.size.height = height;
  MaxX = CGRectGetMaxX(v21);
  if (MaxX >= x)
    v13 = MaxX;
  else
    v13 = x;
  v22.origin.x = v9;
  v22.origin.y = v8;
  v22.size.width = width;
  v22.size.height = height;
  MinY = CGRectGetMinY(v22);
  if (MinY >= y)
    v15 = y;
  else
    v15 = MinY;
  v23.origin.x = v9;
  v23.origin.y = v8;
  v23.size.width = width;
  v23.size.height = height;
  MaxY = CGRectGetMaxY(v23);
  if (MaxY < y)
    MaxY = y;
  v17 = v13 - v11;
  v18 = MaxY - v15;
  v19 = v11;
  v20 = v15;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

+ (CGRect)effectiveDrawingBoundsForAnnotation:(id)a3 forDisplay:(BOOL)a4 pageControllerOrNil:(id)a5 outScaleFactor:(double *)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double Height;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double Width;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    objc_msgSend(v9, "integralDrawingBounds");
    v30 = v37;
    v24 = v38;
    v26 = v39;
    v28 = v40;
    v32 = 1.0;
    if (!a6)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v10, "geometryHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "annotationLayerFrameForAnnotation:layerIsClipped:", v9, 0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v11, "convertRectFromOverlayToModel:", v14, v16, v18, v20);
  v22 = v21;
  v41 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v43.origin.x = v14;
  v43.origin.y = v16;
  v43.size.width = v18;
  v43.size.height = v20;
  Width = CGRectGetWidth(v43);
  v44.origin.x = v22;
  v44.origin.y = v24;
  v44.size.width = v26;
  v44.size.height = v28;
  v29 = Width / CGRectGetWidth(v44);
  v45.origin.x = v14;
  v30 = v41;
  v45.origin.y = v16;
  v45.size.width = v18;
  v45.size.height = v20;
  Height = CGRectGetHeight(v45);
  v46.origin.x = v41;
  v46.origin.y = v24;
  v46.size.width = v26;
  v46.size.height = v28;
  v32 = Height / CGRectGetHeight(v46);
  if (v29 >= v32)
    v32 = v29;
  if (a6)
LABEL_5:
    *a6 = v32;
LABEL_6:

  v33 = v30;
  v34 = v24;
  v35 = v26;
  v36 = v28;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

+ (CGAffineTransform)verticalFlipTransformForRect:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double MidY;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform *result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MidX = CGRectGetMidX(a4);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  v11 = MEMORY[0x24BDBD8B8];
  v18 = *MEMORY[0x24BDBD8B8];
  v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v19;
  v17 = *(_OWORD *)(v11 + 32);
  *(_OWORD *)&retstr->tx = v17;
  CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
  *(_OWORD *)&t1.a = v18;
  *(_OWORD *)&t1.c = v19;
  *(_OWORD *)&t1.tx = v17;
  CGAffineTransformConcat(retstr, &t1, &t2);
  CGAffineTransformMakeScale(&v22, 1.0, -1.0);
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v12;
  *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v21, &v22);
  v13 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v20, MidX, MidY);
  v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&t1, &v21, &v20);
  v16 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  return result;
}

+ (CGAffineTransform)horizontalFlipTransformForRect:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double MidY;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform *result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MidX = CGRectGetMidX(a4);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  v11 = MEMORY[0x24BDBD8B8];
  v18 = *MEMORY[0x24BDBD8B8];
  v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v19;
  v17 = *(_OWORD *)(v11 + 32);
  *(_OWORD *)&retstr->tx = v17;
  CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
  *(_OWORD *)&t1.a = v18;
  *(_OWORD *)&t1.c = v19;
  *(_OWORD *)&t1.tx = v17;
  CGAffineTransformConcat(retstr, &t1, &t2);
  CGAffineTransformMakeScale(&v22, -1.0, 1.0);
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v12;
  *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v21, &v22);
  v13 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v20, MidX, MidY);
  v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&t1, &v21, &v20);
  v16 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  return result;
}

+ (BOOL)annotationHasRotation:(id)a3 outAngle:(double *)a4
{
  id v5;
  double v6;
  BOOL v7;

  v5 = a3;
  if (objc_msgSend(v5, "conformsToAKRotatableAnnotationProtocol"))
  {
    objc_msgSend(v5, "rotationAngle");
    v7 = fabs(v6) >= 0.0005;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = 0;
  v6 = 0.0;
  if (a4)
LABEL_5:
    *a4 = v6;
LABEL_6:

  return v7;
}

+ (CGAffineTransform)rotationTransformForRectangularAnnotation:(SEL)a3 hasRotation:(id)a4
{
  id v7;
  uint64_t v8;
  __int128 v9;
  _BOOL4 v10;
  BOOL v11;
  CGAffineTransform *result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v7 = a4;
  v8 = MEMORY[0x24BDBD8B8];
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  v16 = 0;
  v10 = +[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v7, &v16);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v7, "rectangle");
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:");
    *(_OWORD *)&retstr->a = v13;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = v15;
  }
  if (a5)
    *a5 = v11;

  return result;
}

+ (CGAffineTransform)rotationTransformForRect:(SEL)a3 withAngle:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MidX = CGRectGetMidX(a4);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return (CGAffineTransform *)objc_msgSend(a2, "rotationTransformAroundPoint:withAngle:", MidX, CGRectGetMidY(v13), a5);
}

+ (CGAffineTransform)rotationTransformAroundPoint:(SEL)a3 withAngle:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGAffineTransform *result;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v17;

  y = a4.y;
  x = a4.x;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, -a4.x, -a4.y);
  CGAffineTransformMakeRotation(&t2, a5);
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v17, &t1, &t2);
  v10 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  CGAffineTransformMakeTranslation(&v14, x, y);
  v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v11;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v17, &t1, &v14);
  v13 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  return result;
}

+ (id)_cornersOfRotatedRectangle:(CGRect)a3 angle:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double MinX;
  double MaxX;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rotationTransformForRect:withAngle:", x, y, width, height, a4);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MinX = CGRectGetMinX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMinY(v21)), (float64x2_t)0, MinX)));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxX = CGRectGetMaxX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMinY(v23)), (float64x2_t)0, MaxX)));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v18 = CGRectGetMaxX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMaxY(v25)), (float64x2_t)0, v18)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v19 = CGRectGetMinX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMaxY(v27)), (float64x2_t)0, v19)));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

  return v10;
}

+ (CGRect)boundsOfRotatedRectangle:(CGRect)a3 angle:(double)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect result;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_cornersOfRotatedRectangle:angle:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = 1.79769313e308;
    v9 = 2.22507386e-308;
    v10 = 2.22507386e-308;
    v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "akPointValue");
        if (v13 > v9)
          v9 = v13;
        if (v13 < v8)
          v8 = v13;
        if (v14 > v10)
          v10 = v14;
        if (v14 < v11)
          v11 = v14;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1.79769313e308;
    v9 = 2.22507386e-308;
    v10 = 2.22507386e-308;
    v11 = 1.79769313e308;
  }

  v15 = v9 - v8;
  v16 = v10 - v11;
  v17 = v8;
  v18 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 fromViewToScreenPixels:(id)a4 useNativeScale:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toView:", v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v11, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "coordinateSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertRect:toCoordinateSpace:", v21, v13, v15, v17, v19);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v11, "screen");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (a5)
    objc_msgSend(v30, "nativeScale");
  else
    objc_msgSend(v30, "scale");
  v33 = v32;

  CGAffineTransformMakeScale(&v42, v33, v33);
  v43.origin.x = v23;
  v43.origin.y = v25;
  v43.size.width = v27;
  v43.size.height = v29;
  v44 = CGRectApplyAffineTransform(v43, &v42);
  v45 = CGRectStandardize(v44);
  v34 = v45.origin.x;
  v35 = v45.origin.y;
  v36 = v45.size.width;
  v37 = v45.size.height;

  v38 = v34;
  v39 = v35;
  v40 = v36;
  v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 fromScreenPointsToView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v11, x, y, width, height);
  objc_msgSend(v8, "convertRect:fromView:", v9);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (AKGeometryHelper)initWithPageController:(id)a3
{
  id v4;
  AKGeometryHelper *v5;
  AKGeometryHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKGeometryHelper;
  v5 = -[AKGeometryHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKGeometryHelper setPageController:](v5, "setPageController:", v4);

  return v6;
}

- (CGRect)annotationLayerFrameForAnnotation:(id)a3 layerIsClipped:(BOOL *)a4
{
  id v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_class *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  v6 = a3;
  -[AKGeometryHelper pageController](self, "pageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawingBounds");
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  if (CGRectIsInfinite(v40))
  {
    objc_msgSend(v7, "overlayView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    objc_msgSend(v7, "convertRectFromOverlayToModel:", v14, v16, v18, v20);
    x = v21;
    y = v22;
    width = v23;
    height = v24;
  }
  else if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", x, y, width, height))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    j__NSStringFromCGRect(v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: %@ reported bogus drawingBounds %@."), "-[AKGeometryHelper annotationLayerFrameForAnnotation:layerIsClipped:]", v26, v27);

    if (+[AKGeometryHelper isUnpresentablePoint:](AKGeometryHelper, "isUnpresentablePoint:", x, y))
    {
      y = 0.0;
      x = 0.0;
    }
    height = 1.0;
    width = 1.0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AKGeometryHelper screenPixelAlignedRectForRect:](self, "screenPixelAlignedRectForRect:", x, y, width, height);
  else
    -[AKGeometryHelper _smartAlignedRectForRect:](self, "_smartAlignedRectForRect:", x, y, width, height);
  objc_msgSend(v7, "convertRectFromModelToOverlay:");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  if (a4)
    *a4 = 0;

  v36 = v29;
  v37 = v31;
  v38 = v33;
  v39 = v35;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)_clippingFrameForView:(id)a3
{
  id v3;
  void *v4;
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
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  CGRect v21;

  v3 = a3;
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v6, v8, v10, v12))
  {
    objc_msgSend(v3, "frame");
  }
  else
  {
    objc_msgSend(v3, "convertRect:fromView:", 0, v6, v8, v10, v12);
  }
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;

  v21.origin.x = v17;
  v21.origin.y = v18;
  v21.size.width = v19;
  v21.size.height = v20;
  return CGRectInset(v21, -v19, -v20);
}

- (CGRect)adornmentLayerFrameForAnnotation:(id)a3
{
  id v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_class *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  v4 = a3;
  -[AKGeometryHelper pageController](self, "pageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawingBounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (CGRectIsInfinite(v30))
  {
    objc_msgSend(v5, "overlayView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", x, y, width, height))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      j__NSStringFromCGRect(v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: %@ reported bogus drawingBounds %@."), "-[AKGeometryHelper adornmentLayerFrameForAnnotation:]", v20, v21);

      if (+[AKGeometryHelper isUnpresentablePoint:](AKGeometryHelper, "isUnpresentablePoint:", x, y))
      {
        y = 0.0;
        x = 0.0;
      }
      height = 1.0;
      width = 1.0;
    }
    objc_msgSend(v5, "convertRectFromModelToOverlay:", x, y, width, height);
    v12 = v22;
    v14 = v23;
    v16 = v24;
    v18 = v25;
  }

  v26 = v12;
  v27 = v14;
  v28 = v16;
  v29 = v18;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromModelToLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[AKGeometryHelper pageController](self, "pageController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPointFromModelToOverlay:", x, y);
  objc_msgSend(v10, "convertPoint:toLayer:", v7);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromModelToLayer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[AKGeometryHelper pageController](self, "pageController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "overlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRectFromModelToOverlay:", x, y, width, height);
  objc_msgSend(v12, "convertRect:toLayer:", v9);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)contentAlignedPointForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[AKGeometryHelper _shouldAlignToContent](self, "_shouldAlignToContent"))
  {
    objc_msgSend((id)objc_opt_class(), "_alignedPointForPoint:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 1, 0, 0, 0, x, y);
    x = v5;
    y = v6;
  }
  v7 = x;
  v8 = y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGRect)contentAlignedRectForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[AKGeometryHelper _shouldAlignToContent](self, "_shouldAlignToContent"))
  {
    objc_msgSend((id)objc_opt_class(), "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 1, 0, 0, 0, x, y, width, height);
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)screenPixelAlignedPointForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_opt_class();
  -[AKGeometryHelper pageController](self, "pageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_alignedPointForPoint:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, v7, 0, 0, x, y);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)screenPixelAlignedRectForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class();
  -[AKGeometryHelper pageController](self, "pageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, v9, 0, 0, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_smartAlignedRectForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL8 v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class();
  v9 = -[AKGeometryHelper _shouldAlignToContent](self, "_shouldAlignToContent");
  if (-[AKGeometryHelper _shouldAlignToScreen](self, "_shouldAlignToScreen"))
  {
    -[AKGeometryHelper pageController](self, "pageController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", v9, v10, 0, 0, x, y, width, height);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    objc_msgSend(v8, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", v9, 0, 0, 0, x, y, width, height);
    v12 = v19;
    v14 = v20;
    v16 = v21;
    v18 = v22;
  }
  v23 = v12;
  v24 = v14;
  v25 = v16;
  v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)screenStrokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)objc_opt_class();
  -[AKGeometryHelper pageController](self, "pageController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_strokeAlignedRectForRect:withStrokeWidth:shouldAlignStrictlyToScreen:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 1, v11, 0, 0, x, y, width, height, a4);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)renderingStrokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4 alignToScreenUsingPageController:(id)a5 orAlignToContext:(CGContext *)a6 usingAnnotation:(id)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(a1, "_strokeAlignedRectForRect:withStrokeWidth:shouldAlignStrictlyToScreen:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)renderingAlignedTextRectForRect:(CGRect)a3 alignToScreenUsingPageController:(id)a4 orAlignToContext:(CGContext *)a5 usingAnnotation:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a6;
  if (!v14
    || !+[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v14, 0))
  {
    objc_msgSend(a1, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, v13, a5, v14, x, y, width, height);
    x = v15;
    y = v16;
    width = v17;
    height = v18;
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_rootLayer
{
  void *v2;
  void *v3;
  void *v4;

  -[AKGeometryHelper pageController](self, "pageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layerPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldAlignToContent
{
  void *v2;
  void *v3;
  char v4;

  -[AKGeometryHelper pageController](self, "pageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "shouldPixelate");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_shouldAlignToScreen
{
  void *v3;
  double v4;
  BOOL v5;

  -[AKGeometryHelper pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[AKGeometryHelper _shouldAlignToContent](self, "_shouldAlignToContent"))
    {
      objc_msgSend(v3, "currentModelToScreenScaleFactor");
      v5 = v4 <= 1.0;
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (CGRect)_alignedStableRectForRect:(CGRect)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7
{
  _BOOL8 v9;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[5];
  CGRect result;

  v9 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a7;
  v16 = a5;
  v17 = (void *)objc_opt_class();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_22903EAB8;
  v30[3] = &unk_24F1A7F90;
  v30[4] = a1;
  objc_msgSend(v17, "_rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:", v9, v16, a6, v15, v30, x, y, width, height);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

+ (CGRect)_strokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4 shouldAlignStrictlyToScreen:(BOOL)a5 alignToScreenUsingPageController:(id)a6 orAlignToBitmapContext:(CGContext *)a7 usingAnnotation:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD v33[5];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a6;
  v18 = a8;
  v19 = 0;
  if (v17 && !a5)
  {
    objc_msgSend(v17, "geometryHelper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "_shouldAlignToScreen") & 1) != 0)
      v19 = 0;
    else
      v19 = objc_msgSend(v20, "_shouldAlignToContent");

  }
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_22903EC3C;
  v33[3] = &unk_24F1A7F90;
  *(double *)&v33[4] = a4;
  objc_msgSend(a1, "_rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:", v19, v17, a7, v18, v33, x, y, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

+ (CGPoint)_alignedPointForPoint:(CGPoint)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7
{
  _BOOL8 v9;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[5];
  CGPoint result;

  v9 = a4;
  y = a3.y;
  x = a3.x;
  v13 = a7;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_22903EDA4;
  v22[3] = &unk_24F1A7F90;
  v22[4] = a1;
  objc_msgSend(v15, "_rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:", v9, v14, a6, v13, v22, x, y, 0.0, 0.0);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

+ (CGRect)_rectForRect:(CGRect)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7 withAlignmentBlock:(id)a8
{
  _BOOL4 v11;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void (**v19)(_QWORD, double, double, double, double, __n128);
  void (**v20)(_QWORD, double, double, double, double, __n128);
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  __n128 v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  __n128 v90;
  CGSize v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect result;

  v11 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a5;
  v18 = a7;
  v19 = (void (**)(_QWORD, double, double, double, double, __n128))a8;
  v20 = v19;
  if (v11)
  {
    v98.origin.x = ((double (*)(void (**)(_QWORD, double, double, double, double, __n128), double, double, double, double, double))v19[2])(v19, x, y, width, height, 1.0);
    v99 = CGRectStandardize(v98);
    x = v99.origin.x;
    y = v99.origin.y;
    width = v99.size.width;
    height = v99.size.height;
  }
  if (v17)
  {
    objc_msgSend(v17, "overlayView");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      NSLog(CFSTR("%s: Attempting to align rect to screen pixels, but unable to get the overlayView - probably because it's offscreen & relinquished."), "+[AKGeometryHelper _rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:]");
      goto LABEL_18;
    }
    v22 = (void *)v21;
    v23 = *MEMORY[0x24BDBEFB0];
    v24 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    objc_msgSend(v17, "convertRectFromModelToOverlay:", x, y, width, height);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v17, "convertPointFromModelToOverlay:", v23, v24);
    v34 = v33;
    v36 = v35;
    objc_msgSend(v17, "convertPointFromModelToOverlay:", 1.0, 1.0);
    v38 = v37;
    v40 = v39;
    objc_msgSend(v22, "superview");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertRect:toView:", v41, v26, v28, v30, v32);
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    objc_msgSend(v22, "convertPoint:toView:", v41, v34, v36);
    v51 = v50;
    v53 = v52;
    objc_msgSend(v22, "convertPoint:toView:", v41, v38, v40);
    v55 = v54;
    v57 = v56;
    objc_msgSend(v41, "window");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "screen");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "coordinateSpace");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "convertRect:toCoordinateSpace:", v60, v43, v45, v47, v49);
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v68 = v67;
    objc_msgSend(v41, "convertPoint:toCoordinateSpace:", v60, v51, v53);
    v70 = v69;
    v72 = v71;
    objc_msgSend(v41, "convertPoint:toCoordinateSpace:", v60, v55, v57);
    v75 = vabdd_f64(v74, v70);
    v77 = vabdd_f64(v76, v72);
    if (v75 >= v77)
      v73.n128_f64[0] = v75;
    else
      v73.n128_f64[0] = v77;
    v20[2](v20, v62, v64, v66, v68, v73);
    objc_msgSend(v22, "convertRect:fromCoordinateSpace:", v60);
    objc_msgSend(v17, "convertRectFromOverlayToModel:");
    x = v78;
    y = v79;
    width = v80;
    height = v81;

    goto LABEL_16;
  }
  if (!a6)
  {
LABEL_16:
    v104.origin.x = x;
    v104.origin.y = y;
    v104.size.width = width;
    v104.size.height = height;
    v105 = CGRectStandardize(v104);
    x = v105.origin.x;
    y = v105.origin.y;
    width = v105.size.width;
    height = v105.size.height;
    goto LABEL_18;
  }
  if (CGContextGetType() == 4 && CGBitmapContextGetBitsPerPixel(a6))
  {
    objc_msgSend(a1, "effectiveDrawingBoundsForAnnotation:forDisplay:pageControllerOrNil:outScaleFactor:", v18, 0, 0, 0);
    v83 = v82;
    v85 = v84;
    v100.origin.x = x - v82;
    v100.origin.y = y - v84;
    v100.size.width = width;
    v100.size.height = height;
    v101 = CGContextConvertRectToDeviceSpace(a6, v100);
    v86 = v101.origin.x;
    v87 = v101.origin.y;
    v88 = v101.size.width;
    v89 = v101.size.height;
    v101.origin.x = 1.0;
    v101.origin.y = 1.0;
    v91 = CGContextConvertSizeToDeviceSpace(a6, (CGSize)v101.origin);
    v92 = fabs(v91.width);
    v93 = fabs(v91.height);
    if (v92 >= v93)
      v90.n128_f64[0] = v92;
    else
      v90.n128_f64[0] = v93;
    v102.origin.x = ((double (*)(_QWORD, double, double, double, double, __n128))v20[2])(v20, v86, v87, v88, v89, v90);
    v103 = CGContextConvertRectToUserSpace(a6, v102);
    width = v103.size.width;
    height = v103.size.height;
    x = v83 + v103.origin.x;
    y = v85 + v103.origin.y;
    goto LABEL_16;
  }
LABEL_18:

  v94 = x;
  v95 = y;
  v96 = width;
  v97 = height;
  result.size.height = v97;
  result.size.width = v96;
  result.origin.y = v95;
  result.origin.x = v94;
  return result;
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageController);
}

@end
