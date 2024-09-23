@implementation AXPIFingerUtilities

+ (id)defaultLocationsForNumberOfFingers:(unint64_t)a3 aroundPoint:(CGPoint)a4
{
  return (id)objc_msgSend(a1, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", a3, a4.x, a4.y, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

+ (id)defaultLocationsForNumberOfFingers:(unint64_t)a3 aroundPoint:(CGPoint)a4 withinBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v9;
  double v10;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v34;
  CGFloat v35;
  CGPoint v36;
  CGPoint v37;
  CGPoint v38;
  CGPoint v39;
  CGPoint v40;
  CGPoint v41;
  CGPoint v42;
  CGPoint v43;
  CGPoint v44;
  CGPoint v45;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  v13 = a4.y;
  v14 = a4.x;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = width;
  v35 = height;
  v16 = 20.0;
  v17 = 100.0;
  switch(a3)
  {
    case 2uLL:
      goto LABEL_12;
    case 3uLL:
      v36.x = v10 + -100.0;
      v36.y = v9 + 20.0;
      NSStringFromCGPoint(v36);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);

      v13 = v9 + -20.0;
      v16 = 40.0;
      *(double *)&v19 = 100.0;
      goto LABEL_11;
    case 4uLL:
      if (AXDeviceIsPad())
      {
        v37.x = v10 + -100.0;
        v37.y = v9 + 20.0;
        NSStringFromCGPoint(v37);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

        v38.y = v9 + -40.0;
        v38.x = v14;
        NSStringFromCGPoint(v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        v14 = v10 + 100.0;
        v13 = v9 + -30.0;
        v16 = 30.0;
        goto LABEL_7;
      }
      v25 = v10 + -80.0;
      v13 = v9 + 10.0;
      goto LABEL_10;
    case 5uLL:
      if (AXDeviceIsPad())
      {
        v39.x = v10 + -120.0;
        v39.y = v9 + 300.0;
        NSStringFromCGPoint(v39);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v22);

        v40.x = v10 + -100.0;
        v40.y = v9 + 20.0;
        NSStringFromCGPoint(v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v23);

        v41.y = v9 + -20.0;
        v41.x = v14;
        NSStringFromCGPoint(v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v24);

        v14 = v10 + 100.0;
        v13 = v9 + 40.0;
        v16 = 120.0;
LABEL_7:
        v17 = 220.0;
      }
      else
      {
        v42.y = v9 + 200.0;
        v42.x = v10 + -80.0;
        NSStringFromCGPoint(v42);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v26);

        v13 = v9 + 10.0;
        v25 = v10 + -80.0;
LABEL_10:
        v27 = v13;
        NSStringFromCGPoint(*(CGPoint *)&v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v28);

        v43.y = v9 + -10.0;
        v43.x = v14;
        NSStringFromCGPoint(v43);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v29);

        v14 = v10 + 80.0;
        v16 = 50.0;
        *(double *)&v19 = 160.0;
LABEL_11:
        v17 = *(double *)&v19;
      }
LABEL_12:
      v44.x = v14;
      v44.y = v13;
      NSStringFromCGPoint(v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v30);

      v14 = v10 + v17;
      v13 = v9 + v16;
      v17 = v34;
      v16 = v35;
LABEL_13:
      v45.x = v14;
      v45.y = v13;
      NSStringFromCGPoint(v45);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v31);

      objc_msgSend(a1, "_points:adjustedForBounds:", v15, x, y, v17, v16);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      return v32;
    default:
      goto LABEL_13;
  }
}

+ (id)defaultPinchLocationsAroundPoint:(CGPoint)a3 withinBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGPoint v23;
  CGPoint v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXDeviceIsPad())
    v12 = 75.0;
  else
    v12 = 45.0;
  v13 = v9 - v12;
  if (AXDeviceIsPad())
    v14 = 75.0;
  else
    v14 = 45.0;
  v15 = v8 + v14;
  v23.x = v13;
  v23.y = v15;
  NSStringFromCGPoint(v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v16);

  if (AXDeviceIsPad())
    v17 = 150.0;
  else
    v17 = 90.0;
  v18 = v13 + v17;
  if (AXDeviceIsPad())
    v19 = 150.0;
  else
    v19 = 90.0;
  v24.y = v15 - v19;
  v24.x = v18;
  NSStringFromCGPoint(v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v20);

  objc_msgSend(a1, "_points:adjustedForBounds:", v11, x, y, width, height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (void)updateFirstLocation:(CGPoint *)a3 secondLocation:(CGPoint *)a4 forPinchWithRadiusDelta:(double)a5 angleDelta:(double)a6
{
  double x;
  double y;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __double2 v19;
  __double2 v20;

  x = a3->x;
  y = a3->y;
  AX_CGPointGetMidpointToPoint();
  v13 = v12;
  v15 = v14;
  AX_CGPointGetDistanceToPoint();
  v17 = v16 + a5;
  v18 = atan2(y - v15, x - v13) + a6;
  v19 = __sincos_stret(v18);
  v20 = __sincos_stret(v18 + 3.14159265);
  a3->x = v13 + v17 * v19.__cosval;
  a3->y = v15 + v17 * v19.__sinval;
  a4->x = v13 + v17 * v20.__cosval;
  a4->y = v15 + v17 * v20.__sinval;
}

+ (id)fingerModelsForPointStrings:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGPoint v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = CGPointFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", v10.x, v10.y, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)pointStringsForFingerModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGPoint v18;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "location", (_QWORD)v12);
        NSStringFromCGPoint(v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_points:(id)a3 adjustedForBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CGPoint v16;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  double v21;
  double v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  CGPoint v29;
  void *v30;
  id v31;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGPoint v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v50.origin.x = x;
  v50.origin.y = y;
  v35 = width;
  v36 = height;
  v50.size.width = width;
  v50.size.height = height;
  if (!CGRectEqualToRect(v50, *MEMORY[0x24BDBF090]))
  {
    v9 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    v33 = v10;
    v34 = v9;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          v37 = v9;
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(v11);
          v16 = CGPointFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          v51.origin.x = x;
          v51.origin.y = y;
          v51.size.width = v35;
          v51.size.height = v36;
          MinX = CGRectGetMinX(v51);
          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = v35;
          v52.size.height = v36;
          MaxX = CGRectGetMaxX(v52);
          v53.origin.x = x;
          v53.origin.y = y;
          v53.size.width = v35;
          v53.size.height = v36;
          MinY = CGRectGetMinY(v53);
          v54.origin.x = x;
          v54.origin.y = y;
          v54.size.width = v35;
          v54.size.height = v36;
          MaxY = CGRectGetMaxY(v54);
          v21 = MaxX - v16.x;
          if (v37 + v16.x <= MaxX)
            v21 = v37;
          if (v37 + v16.x < MinX)
            v9 = MinX - v16.x;
          else
            v9 = v21;
          v22 = v10 + v16.y;
          if (v10 + v16.y >= MinY)
          {
            if (v22 > MaxY)
              v10 = MaxY - v16.y;
          }
          else
          {
            v10 = MinY - v16.y;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16, MaxY, v22);
      }
      while (v13);
    }

    if (v9 == v34 && v10 == v33)
    {
      v8 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v24 = v11;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v39 != v27)
              objc_enumerationMutation(v24);
            v29 = CGPointFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
            v49.x = v9 + v29.x;
            v49.y = v10 + v29.y;
            NSStringFromCGPoint(v49);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v30);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v26);
      }

    }
  }
  v31 = v8;

  return v31;
}

+ (unint64_t)fingerShapeForCorner:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return qword_22A6DBF48[a3 - 1];
}

+ (BOOL)laserEnabled
{
  if (laserEnabled_onceToken != -1)
    dispatch_once(&laserEnabled_onceToken, &__block_literal_global_1);
  return laserEnabled__LaserEnabled;
}

void __35__AXPIFingerUtilities_laserEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  laserEnabled__LaserEnabled = objc_msgSend(v0, "laserEnabled");

}

+ (id)pointerFiltersForLuminanceLevel:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PSPointerVibrantColorMatrixForLuminance();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, *MEMORY[0x24BDE5AD8]);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pointerAnimationSettings
{
  if (pointerAnimationSettings_onceToken != -1)
    dispatch_once(&pointerAnimationSettings_onceToken, &__block_literal_global_180);
  return (id)pointerAnimationSettings__PointerAnimationSettings;
}

uint64_t __47__AXPIFingerUtilities_pointerAnimationSettings__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEB0860]), "initWithDefaultValues");
  v1 = (void *)pointerAnimationSettings__PointerAnimationSettings;
  pointerAnimationSettings__PointerAnimationSettings = v0;

  objc_msgSend((id)pointerAnimationSettings__PointerAnimationSettings, "setDampingRatio:", 1.0);
  return objc_msgSend((id)pointerAnimationSettings__PointerAnimationSettings, "setResponse:", 0.15);
}

@end
