@implementation AXNamedReplayableGesture(AXPIAdditions)

+ (uint64_t)tapGestureAtPoint:()AXPIAdditions
{
  return objc_msgSend(a1, "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 0, 1);
}

+ (uint64_t)flickGestureAtPoint:()AXPIAdditions angle:
{
  return objc_msgSend(a1, "flickGestureAtPoint:angle:numberOfFingers:", 1);
}

+ (uint64_t)lineGestureBetweenPoints:()AXPIAdditions duration:
{
  return objc_msgSend(a1, "lineGestureBetweenPoints:duration:numberOfFingers:", a3, 1);
}

+ (uint64_t)tapGestureAtPoint:()AXPIAdditions isDoubleTap:numberOfFingers:
{
  return objc_msgSend(a1, "_tapGestureAtPoint:isDoubleTap:numberOfFingers:force:", a3, a4, 0.0);
}

+ (id)_tapGestureAtPoint:()AXPIAdditions isDoubleTap:numberOfFingers:force:
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;

  +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:", a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__AXNamedReplayableGesture_AXPIAdditions___tapGestureAtPoint_isDoubleTap_numberOfFingers_force___block_invoke;
  v16[3] = &unk_24F478B80;
  v12 = v10;
  v17 = v12;
  v13 = v11;
  v18 = v13;
  v19 = a3;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
  v14 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v14, "addPointsByFingerIdentifier:forces:atTime:", v12, v13, 0.0);
  objc_msgSend(v14, "addPointsByFingerIdentifier:forces:atTime:", MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], 0.1);
  if (a6)
  {
    objc_msgSend(v14, "addPointsByFingerIdentifier:forces:atTime:", v12, v13, 0.15);
    objc_msgSend(v14, "addPointsByFingerIdentifier:forces:atTime:", MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], 0.25);
  }

  return v14;
}

+ (uint64_t)longPressGestureAtPoint:()AXPIAdditions
{
  return objc_msgSend(a1, "holdGestureAtPoint:withDuration:numberOfFingers:", 1, a3, a4, 1.0);
}

+ (id)holdGestureAtPoint:()AXPIAdditions withDuration:numberOfFingers:
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, NSString *, uint64_t);
  void *v14;
  id v15;
  id v16;

  +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __91__AXNamedReplayableGesture_AXPIAdditions__holdGestureAtPoint_withDuration_numberOfFingers___block_invoke;
  v14 = &unk_24F478BA8;
  v15 = v5;
  v16 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v11);
  v9 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v9, "addPointsByFingerIdentifier:forces:atTime:", v8, v7, 0.0, v11, v12, v13, v14);
  objc_msgSend(v9, "addPointsByFingerIdentifier:forces:atTime:", MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], a3);

  return v9;
}

+ (uint64_t)flickGestureAtPoint:()AXPIAdditions angle:numberOfFingers:
{
  __double2 v10;

  v10 = __sincos_stret(a4);
  return objc_msgSend(a1, "flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:", a6, a2, a3, a2 + v10.__cosval * 100.0, a3 + v10.__sinval * 100.0);
}

+ (id)flickGestureStartingAtPoint:()AXPIAdditions endingAtPoint:numberOfFingers:
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  CGPoint v17;

  v16[2] = *MEMORY[0x24BDAC8D0];
  NSStringFromCGPoint(*(CGPoint *)&a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v17.x = a4;
  v17.y = a5;
  NSStringFromCGPoint(v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lineGestureBetweenPoints:duration:numberOfFingers:", v13, a7, 0.1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)lineGestureBetweenPoints:()AXPIAdditions duration:numberOfFingers:
{
  return objc_msgSend(a1, "lineGestureBetweenPoints:duration:numberOfFingers:initialHoldDuration:", a3, 0.0);
}

+ (id)lineGestureBetweenPoints:()AXPIAdditions duration:numberOfFingers:initialHoldDuration:
{
  id v8;
  unint64_t v9;
  double v10;
  uint64_t i;
  NSString *v12;
  NSString *v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  NSString *v20;
  CGPoint v21;
  NSString *v22;
  double v23;
  unint64_t v24;
  double v25;
  unint64_t j;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSString *v32;
  CGPoint v33;
  double v35;
  double v36;
  double v39;
  double v40;

  v8 = a5;
  v9 = objc_msgSend(v8, "count");
  v10 = 0.0;
  if (v9 >= 2)
  {
    for (i = 1; i != v9; ++i)
    {
      objc_msgSend(v8, "objectAtIndex:", i - 1);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      CGPointFromString(v12);

      objc_msgSend(v8, "objectAtIndex:", i);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      CGPointFromString(v13);

      AX_CGPointGetDistanceToPoint();
      v10 = v10 + v14;
    }
  }
  v15 = (double)(unint64_t)ceil(v10 / 20.0);
  if (vcvtpd_u64_f64(v10 / 20.0) && a2 / v15 > 0.05)
    v15 = (double)(unint64_t)ceil(a2 / 0.05);
  v16 = objc_alloc_init((Class)objc_opt_class());
  if (v9 >= 2)
  {
    v17 = 1;
    v18 = 0.0;
    v35 = v10 / v15;
    v36 = v10;
    do
    {
      v40 = v18;
      v19 = a3;
      if (v17 != 1)
        v19 = 0.0;
      v39 = v19;
      objc_msgSend(v8, "objectAtIndex:", v17 - 1, *(_QWORD *)&v35);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      v21 = CGPointFromString(v20);

      objc_msgSend(v8, "objectAtIndex:", v17);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      CGPointFromString(v22);

      AX_CGPointGetDistanceToPoint();
      v24 = vcvtpd_u64_f64(v23 / v35);
      v25 = v23 / v10 * a2;
      if (v24)
      {
        for (j = 0; j != v24; ++j)
        {
          AX_CGPointGetOffsetAlongVectorWithDistance();
          v28 = v21.x + v27;
          v30 = v21.y + v29;
          v31 = -0.0;
          if (j)
            v31 = v39;
          objc_msgSend(a1, "_addAllFingerPointsForPoint:numberOfFingers:toReplayableGesture:atTime:", a6, v16, v28, v30, v31 + v40 + (double)j / (double)v24 * v25);
        }
      }
      v18 = v40 + v39 + v25;
      ++v17;
      v10 = v36;
    }
    while (v17 != v9);
  }
  objc_msgSend(v8, "lastObject");
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  v33 = CGPointFromString(v32);

  objc_msgSend(a1, "_addAllFingerPointsForPoint:numberOfFingers:toReplayableGesture:atTime:", a6, v16, v33.x, v33.y, a2 + a3);
  return v16;
}

+ (id)scrollGestureFromPoint:()AXPIAdditions toPoint:duration:
{
  _BOOL4 v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSPoint v31;
  NSPoint v32;
  NSPoint v33;
  NSPoint v34;
  NSPoint v35;

  v11 = a2 < a4;
  if (a3 != a5)
    v11 = a3 < a5;
  v12 = -0.5;
  if (v11)
    v13 = 0.5;
  else
    v13 = -0.5;
  if (!v11)
    v12 = 0.5;
  v14 = a3 == a5;
  if (a3 == a5)
    v15 = a4;
  else
    v15 = a5;
  v16 = v15 + v13;
  if (v14)
    v17 = v16;
  else
    v17 = a4 + 1.0;
  if (v14)
    v18 = a5 + 1.0;
  else
    v18 = v16;
  v19 = v15 + v12;
  if (v14)
    v20 = v19;
  else
    v20 = a4 + -1.0;
  if (v14)
    v21 = a5 + -1.0;
  else
    v21 = v19;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31.x = a2;
  v31.y = a3;
  NSStringFromPoint(v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v23);

  v32.x = v17;
  v32.y = v18;
  NSStringFromPoint(v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v24);

  v33.x = v20;
  v33.y = v21;
  NSStringFromPoint(v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v25);

  v34.x = a4;
  v34.y = a5;
  NSStringFromPoint(v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v26);

  v35.x = a4;
  v35.y = a5;
  NSStringFromPoint(v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v27);

  objc_msgSend(a1, "lineGestureBetweenPoints:duration:", v22, a6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)forceTouchGestureAtPoint:()AXPIAdditions
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double *v9;
  double v10;
  double v11;
  double *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init((Class)objc_opt_class());
  AXForceTouchThreshold();
  v6 = v5;
  v18 = &unk_24F47C990;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a1, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (double *)MEMORY[0x24BE00090];
  v10 = *MEMORY[0x24BE00090];
  if (*MEMORY[0x24BE00090] > 0.0)
  {
    v11 = 0.0;
    v12 = (double *)MEMORY[0x24BE000B0];
    do
    {
      v16 = &unk_24F47C990;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 * v11 / v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addPointsByFingerIdentifier:forces:atTime:", v8, v14, v11);
      v11 = v11 + *v12;
      v10 = *v9;
    }
    while (v11 < *v9);
  }
  objc_msgSend(v4, "addPointsByFingerIdentifier:forces:atTime:", MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], v10);

  return v4;
}

+ (uint64_t)pinchInGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, -25.0, 0.0, 0x4059000000000000);
}

+ (uint64_t)pinchOutGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, 25.0, 0.0, 0x4049000000000000);
}

+ (uint64_t)rotateRightGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, 0.0, 1.04719755, 0);
}

+ (uint64_t)rotateLeftGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, 0.0, -1.04719755, 0);
}

+ (id)_pinchGestureWithCenter:()AXPIAdditions bounds:radiusDelta:angleDelta:startingWidth:
{
  void *v21;
  NSString *v22;
  CGPoint v23;
  NSString *v24;
  CGPoint v25;
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
  CGFloat v41;
  CGFloat v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t i;
  void *v58;
  void *v59;
  void *v60;
  double v62;
  double v63;
  CGFloat rect;
  CGRect rect_8;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[4];
  CGPoint v73;
  CGPoint v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v72[2] = *MEMORY[0x24BDAC8D0];
  rect = a4;
  +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  v23 = CGPointFromString(v22);

  memset(&rect_8, 0, sizeof(rect_8));
  objc_msgSend(v21, "lastObject");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  v25 = CGPointFromString(v24);

  if (a10 == 0.0)
  {
    AX_CGPointGetMidpointToPoint();
    v27 = v26;
    v29 = v28;
    AX_CGPointGetDistanceToPoint();
    v31 = v30;
    v75.origin.x = rect;
    v75.origin.y = a5;
    v75.size.width = a6;
    v75.size.height = a7;
    v32 = fmax(v27, v31 + CGRectGetMinX(v75));
    v76.origin.x = rect;
    v76.origin.y = a5;
    v76.size.width = a6;
    v76.size.height = a7;
    v62 = fmin(v32, CGRectGetMaxX(v76) - v31);
    v77.origin.x = rect;
    v77.origin.y = a5;
    v77.size.width = a6;
    v77.size.height = a7;
    v33 = fmax(v29, v31 + CGRectGetMinY(v77));
    v78.origin.x = rect;
    v78.origin.y = a5;
    v78.size.width = a6;
    v78.size.height = a7;
    v34 = fmin(v33, CGRectGetMaxY(v78) - v31);
    v35 = v23.x + v62 - v27;
    v36 = v34 - v29;
    v37 = v23.y + v36;
    rect_8.size.width = v35;
    rect_8.size.height = v23.y + v36;
    v38 = v62 - v27 + v25.x;
    v39 = v36 + v25.y;
    rect_8.origin.x = v38;
    rect_8.origin.y = v36 + v25.y;
    v40 = a8;
  }
  else
  {
    v35 = a2 - a10 * 0.5;
    rect_8.size.width = v35;
    rect_8.size.height = a3;
    v38 = a2 + a10 * 0.5;
    rect_8.origin.x = v38;
    rect_8.origin.y = a3;
    v40 = a8;
    v63 = fmax(a8, 0.0);
    v79.size.height = a7;
    v79.origin.x = rect;
    v79.origin.y = a5;
    v79.size.width = a6;
    v39 = a3;
    if (v35 - v63 < CGRectGetMinX(v79))
    {
      v80.size.height = a7;
      v80.origin.x = rect;
      v80.origin.y = a5;
      v80.size.width = a6;
      v41 = CGRectGetMinX(v80) - (v35 - v63);
      v35 = v35 + v41;
      rect_8.size.width = v35;
      v38 = v41 + v38;
      rect_8.origin.x = v38;
    }
    v81.origin.x = rect;
    v81.origin.y = a5;
    v81.size.width = a6;
    v81.size.height = a7;
    if (v63 + v38 > CGRectGetMaxX(v81))
    {
      v82.origin.x = rect;
      v82.origin.y = a5;
      v82.size.width = a6;
      v82.size.height = a7;
      v42 = CGRectGetMaxX(v82) - (v63 + v38);
      v35 = v35 + v42;
      rect_8.size.width = v35;
      v38 = v42 + v38;
      rect_8.origin.x = v38;
    }
    v37 = a3;
  }
  objc_opt_class();
  v43 = (void *)objc_opt_new();
  v73.x = v35;
  v73.y = v37;
  NSStringFromCGPoint(v73);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v44;
  v74.x = v38;
  v74.y = v39;
  NSStringFromCGPoint(v74);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_addFingerPoints:toReplayableGesture:atTime:", v46, v43, 0.0);

  v47 = -5.0;
  if (v40 >= 0.0)
    v47 = 0.0;
  if (v40 > 0.0)
    v47 = 5.0;
  v48 = -0.0872664626;
  if (a9 >= 0.0)
    v48 = 0.0;
  if (a9 > 0.0)
    v48 = 0.0872664626;
  v49 = (v40 - v47) / 18.0;
  v50 = v47 / 6.0;
  v51 = (a9 - v48) / 18.0;
  v52 = 1;
  v53 = v48 / 6.0;
  do
  {
    +[AXPIFingerUtilities updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:](AXPIFingerUtilities, "updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:", &rect_8.size, &rect_8, v49, v51, *(_QWORD *)&v62);
    NSStringFromCGPoint((CGPoint)rect_8.size);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v54;
    NSStringFromCGPoint(rect_8.origin);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v55;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_addFingerPoints:toReplayableGesture:atTime:", v56, v43, (double)v52 * 0.0166666667);

    if (v52 == 18)
    {
      for (i = 19; i != 25; ++i)
      {
        +[AXPIFingerUtilities updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:](AXPIFingerUtilities, "updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:", &rect_8.size, &rect_8, v50, v53);
        NSStringFromCGPoint((CGPoint)rect_8.size);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v58;
        NSStringFromCGPoint(rect_8.origin);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v59;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_addFingerPoints:toReplayableGesture:atTime:", v60, v43, (double)i * 0.0166666667);

      }
    }
    ++v52;
  }
  while (v52 != 19);

  return v43;
}

+ (void)_addAllFingerPointsForPoint:()AXPIAdditions numberOfFingers:toReplayableGesture:atTime:
{
  id v12;
  id v13;

  v12 = a7;
  +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:", a6, a2, a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_addFingerPoints:toReplayableGesture:atTime:", v13, v12, a4);

}

+ (void)_addFingerPoints:()AXPIAdditions toReplayableGesture:atTime:
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSString *v12;
  void *v13;
  CGPoint v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v17, "count");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v17, "objectAtIndex:", i);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1968];
      v14 = CGPointFromString(v12);
      objc_msgSend(v13, "valueWithCGPoint:", v14.x, v14.y);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

    }
  }
  objc_msgSend(v7, "addPointsByFingerIdentifier:forces:atTime:", v8, MEMORY[0x24BDBD1B8], a1);

}

@end
