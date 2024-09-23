@implementation NTKOlympusMask

+ (double)normalizeAngle:(double)result
{
  if (result > 360.0 && result / 360.0 > 1.0)
  {
    do
      result = result + -360.0;
    while (result / 360.0 > 1.0);
  }
  if (result < 0.0)
    return result + 360.0;
  return result;
}

+ (id)clippingPathFromCenterPoint:(CGPoint)a3 startAngle:(double)a4 endAngle:(double)a5 radius:(double)a6
{
  void *v9;
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
  uint64_t v37;
  uint64_t v38;
  void *v39;
  double v40;
  BOOL v41;
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
  double v59;
  double v60;
  double v61;

  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CLKRoundForDevice();
  v12 = v11;
  CLKRoundForDevice();
  v14 = v13;
  CLKRoundForDevice();
  v16 = v15;
  objc_msgSend(a1, "normalizeAngle:", a4);
  v18 = v17;
  objc_msgSend(a1, "normalizeAngle:", a5);
  v20 = v19;
  +[NTKOlympusMask pointForAngle:radius:centerPoint:](NTKOlympusMask, "pointForAngle:radius:centerPoint:", v18, v16, v12, v14);
  v22 = v21;
  v59 = v23;
  v60 = v21;
  v24 = v23;
  +[NTKOlympusMask pointForAngle:radius:centerPoint:](NTKOlympusMask, "pointForAngle:radius:centerPoint:", v20, v16, v12, v14);
  v26 = v25;
  v28 = v27;
  objc_msgSend(a1, "convertPointFromViewCoordinatesToCartesianCoordiates:centerFromViewCoordinates:", v22, v24, v12, v14);
  v30 = v29;
  v32 = v31;
  objc_msgSend(a1, "convertPointFromViewCoordinatesToCartesianCoordiates:centerFromViewCoordinates:", v26, v28, v12, v14);
  v34 = v33;
  v36 = v35;
  v37 = objc_msgSend(a1, "quadrantForPoint:", v30, v32);
  v38 = objc_msgSend(a1, "quadrantForPoint:", v34, v36);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  v61 = v14;
  objc_msgSend(a1, "roundPoint:", v12, v14);
  objc_msgSend(v39, "moveToPoint:");
  objc_msgSend(a1, "roundPoint:", v60, v59);
  objc_msgSend(v39, "addLineToPoint:");
  if (v34 != v16)
  {
    v41 = v36 == -v16 || v36 == v16;
    if (!v41 && v34 != -v16)
      v34 = v16;
  }
  while (v30 != v34 || v32 != v36)
  {
    objc_msgSend(a1, "convertPoint:translantedQuadrantIndex:", v37, v30, v32);
    v44 = v43;
    v46 = v45;
    objc_msgSend(a1, "convertPoint:translantedQuadrantIndex:", v37, v34, v36);
    if (v38 == v37)
      v49 = v47;
    else
      v49 = v16;
    if (v38 == v37)
      v50 = v48;
    else
      v50 = 0.0;
    objc_msgSend(a1, "nextPointFromStartPoint:endPoint:radius:", v44, v46, v49, v50, v16);
    v52 = v51;
    v54 = v53;
    objc_msgSend(a1, "convertPoint:translantedFromFirstToQuadrantIndex:", v37);
    v30 = v55;
    v32 = v56;
    if (v52 == v16 && v54 == 0.0)
      v37 = objc_msgSend(a1, "nextQuadrantIndex:", v37);
    objc_msgSend(a1, "convertPointFromCartesianCoordiatesToViewCoordiates:centerFromViewCoordinates:", v30, v32, v40, v61);
    objc_msgSend(a1, "roundPoint:");
    objc_msgSend(v39, "addLineToPoint:");
  }
  objc_msgSend(a1, "roundPoint:", v40, v61);
  objc_msgSend(v39, "addLineToPoint:");
  objc_msgSend(v39, "closePath");

  return v39;
}

+ (CGPoint)roundPoint:(CGPoint)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  CLKRoundForDevice();
  v6 = v5;
  CLKRoundForDevice();
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (double)angleForHour:(unint64_t)a3 minutes:(unint64_t)a4
{
  return ((double)a4 / 60.0 + (double)a3) * 30.0;
}

+ (double)angleForMinute:(unint64_t)a3 seconds:(unint64_t)a4
{
  return ((double)a4 / 60.0 + (double)a3) * 6.0;
}

+ (double)hourHandAngleWithDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double result;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "component:fromDate:", 32, v5) % 12;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "component:fromDate:", 64, v5);

  objc_msgSend(a1, "angleForHour:minutes:", v7, v9);
  return result;
}

+ (double)minuteHandAngleWithDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double result;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "component:fromDate:", 64, v5);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "component:fromDate:", 128, v5);

  objc_msgSend(a1, "angleForMinute:seconds:", v7, v9);
  return result;
}

+ (CGPoint)pointForAngle:(double)a3 radius:(double)a4 centerPoint:(CGPoint)a5
{
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v8 = objc_msgSend(a1, "quadrantForAngle:");
  objc_msgSend(a1, "convertAngleForFirstQuadrant:", a3);
  v10 = v9;
  v11 = 90.0 - v9;
  if (v10 <= 45.0)
    v11 = v10;
  v12 = v11 * 3.14159265 / 180.0;
  v13 = tanf(v12);
  v14 = v13 * a4;
  if (v10 > 45.0)
    v15 = a4;
  else
    v15 = v13 * a4;
  if (v10 <= 45.0)
    v14 = a4;
  objc_msgSend(a1, "convertPoint:translantedFromFirstToQuadrantIndex:", v8, v15, v14);
  objc_msgSend(a1, "convertPointFromCartesianCoordiatesToViewCoordiates:centerFromViewCoordinates:");
  result.y = v17;
  result.x = v16;
  return result;
}

+ (CGPoint)convertPointFromViewCoordinatesToCartesianCoordiates:(CGPoint)a3 centerFromViewCoordinates:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x - a4.x;
  v5 = a4.y - a3.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)convertPointFromCartesianCoordiatesToViewCoordiates:(CGPoint)a3 centerFromViewCoordinates:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x + a4.x;
  v5 = a4.y - a3.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)result translantedQuadrantIndex:(unint64_t)a4
{
  double v4;
  double v5;
  double x;
  double v7;

  v4 = -result.x;
  v5 = -result.y;
  if (a4 == 2)
    x = result.x;
  else
    x = result.y;
  if (a4 == 2)
    result.x = -result.y;
  if (a4 == 3)
    result.x = v4;
  else
    v5 = x;
  if (a4 == 4)
    result.x = result.y;
  else
    v4 = v5;
  v7 = 0.0;
  if (result.x == 0.0)
    result.x = 0.0;
  if (v4 != 0.0)
    v7 = v4;
  result.y = v7;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)a3 translantedFromFirstToQuadrantIndex:(unint64_t)a4
{
  double v4;
  double y;
  double x;
  double v7;
  double v8;
  CGPoint result;

  v4 = -a3.y;
  if (a4 == 2)
    y = -a3.x;
  else
    y = a3.y;
  if (a4 != 2)
    a3.y = a3.x;
  if (a4 == 3)
  {
    y = v4;
    a3.y = -a3.x;
  }
  if (a4 == 4)
    x = a3.x;
  else
    x = y;
  if (a4 == 4)
    v7 = v4;
  else
    v7 = a3.y;
  v8 = 0.0;
  if (v7 == 0.0)
    v7 = 0.0;
  if (x != 0.0)
    v8 = x;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (unint64_t)nextQuadrantIndex:(unint64_t)a3
{
  if (a3 + 1 <= 4)
    return a3 + 1;
  else
    return 1;
}

+ (CGPoint)nextPointFromStartPoint:(CGPoint)result endPoint:(CGPoint)a4 radius:(double)a5
{
  BOOL v5;

  if (a4.x > a5 || (a4.x >= 0.0 ? (v5 = a4.y <= a5) : (v5 = 0), !v5 || a4.y < 0.0))
  {
    a4.y = 0.0;
    a4.x = a5;
  }
  if (result.y >= a5 && result.x < a5)
  {
    if (result.y != a4.y || result.x > a4.x)
    {
      result.x = a5;
    }
    else if (a4.x <= a5)
    {
      result.x = a4.x;
    }
    else
    {
      result.x = a5;
    }
  }
  else if (result.x == a4.x && result.y >= a4.y)
  {
    result.y = fmax(a4.y, 0.0);
  }
  else
  {
    result.y = 0.0;
  }
  return result;
}

+ (double)convertAngleForFirstQuadrant:(double)result
{
  for (; result / 90.0 > 1.0; result = result + -90.0)
    ;
  return result;
}

+ (unint64_t)quadrantForAngle:(double)a3
{
  if (a3 >= 0.0 && a3 <= 90.0)
    return 1;
  if (a3 > 90.0 && a3 <= 180.0)
    return 2;
  if (a3 > 180.0 && a3 <= 270.0)
    return 3;
  if (a3 > 360.0 || a3 <= 270.0)
    return 1;
  else
    return 4;
}

+ (unint64_t)quadrantForPoint:(CGPoint)a3
{
  if (a3.x >= 0.0 && a3.y < 0.0)
    return 2;
  if (a3.x < 0.0 && a3.y < 0.0)
    return 3;
  if (a3.y >= 0.0 && a3.x < 0.0)
    return 4;
  else
    return 1;
}

@end
