@implementation VKMapViewTourGuideManager

- (BOOL)_elementsInvalidForCenter:(id)a3
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[VKMapViewTourGuideManager mapView](self, "mapView", a3.var0, a3.var1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v8 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (v8 >= CGRectGetHeight(v11))
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    CGRectGetHeight(v13);
  }
  else
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    CGRectGetWidth(v12);
  }

  return 1;
}

- (BOOL)_elementsInvalidForOrientation:(int64_t)a3
{
  return -[VKMapViewTourGuideManager _orientation](self, "_orientation") != a3;
}

- (BOOL)_elementValidForCurrentDetailLevel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = -[VKMapViewTourGuideManager detailLevel](self, "detailLevel") > 0
    || (-[VKMapViewTourGuideManager detailLevel](self, "detailLevel") & 0x8000000000000000) == 0
    && (objc_msgSend(v6, "isPOI") & 1) != 0
    || -[VKMapViewTourGuideManager detailLevel](self, "detailLevel") >= -1 && (objc_msgSend(v6, "isRoad") & 1) != 0;

  return v7;
}

- (BOOL)_elementIntersectsElement:(id)a3 point:(CGPoint)a4 radius:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  CGPathRef CopyByStrokingPath;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;
  CGPoint v34;

  y = a4.y;
  x = a4.x;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  objc_msgSend(v10, "hitTestPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v10, "paths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v13);
          CopyByStrokingPath = CGPathCreateCopyByStrokingPath(*(CGPathRef *)(*((_QWORD *)&v27 + 1) + 8 * i), 0, a5, kCGLineCapRound, kCGLineJoinRound, 0.0);
          objc_msgSend(v12, "addObject:", CopyByStrokingPath);
          if (CopyByStrokingPath)
            CFRelease(CopyByStrokingPath);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v14);
    }

    objc_msgSend(v10, "setHitTestPaths:", v12);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v10, "hitTestPaths", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v18);
        v34.x = x;
        v34.y = y;
        if (CGPathContainsPoint(*(CGPathRef *)(*((_QWORD *)&v23 + 1) + 8 * j), 0, v34, 0))
        {
          LOBYTE(v19) = 1;
          goto LABEL_25;
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_25:

  return v19;
}

- (id)_tourPOIForUserPoint:(CGPoint)a3 radius:(double)a4 futureUserTheta:(double)a5 thetaFromCourse:(double *)a6 shouldFilterIfBehind:(BOOL)a7
{
  CGFloat y;
  CGFloat x;
  void *v14;
  id v15;
  _QWORD v17[12];
  BOOL v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];

  y = a3.y;
  x = a3.x;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0x7FEFFFFFFFFFFFFFLL;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[VKMapViewTourGuideManager _elements](self, "_elements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __110__VKMapViewTourGuideManager__tourPOIForUserPoint_radius_futureUserTheta_thetaFromCourse_shouldFilterIfBehind___block_invoke;
  v17[3] = &unk_2503C5330;
  *(CGFloat *)&v17[8] = x;
  *(CGFloat *)&v17[9] = y;
  v17[4] = self;
  v17[5] = v29;
  *(double *)&v17[10] = a4;
  *(double *)&v17[11] = a5;
  v18 = a7;
  v17[6] = &v23;
  v17[7] = &v19;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

  if (a6)
    *a6 = v20[3];
  v15 = (id)v24[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(v29, 8);
  return v15;
}

void __110__VKMapViewTourGuideManager__tourPOIForUserPoint_radius_futureUserTheta_thetaFromCourse_shouldFilterIfBehind___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double DistanceBetweenPoints;
  double v15;
  double v16;
  id v17;
  CGPoint v18;

  v17 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(*(id *)(a1 + 32), "_elementValidForCurrentDetailLevel:", v17))
  {
    v4 = v17;
    objc_msgSend(v4, "location");
    VKLocationCoordinate2DForVKPoint();
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "accessibilityContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityConvertCoordinateToWindow:", v6, v8);
    v11 = v10;
    v13 = v12;

    v18.x = v11;
    v18.y = v13;
    DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(*(CGPoint *)(a1 + 64), v18);
    if (DistanceBetweenPoints < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
      && DistanceBetweenPoints < *(double *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 32), "_normalizedThetaFromTheta:", (double)(atan2(v13 - *(double *)(a1 + 72), v11 - *(double *)(a1 + 64)) + 1.57079633 - *(double *)(a1 + 88)));
      v16 = v15;
      if (!*(_BYTE *)(a1 + 96) || v15 <= 1.3962634 && v15 >= -1.3962634)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = DistanceBetweenPoints;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v16;
      }
    }

  }
}

- (id)_tourLocationForUserPoint:(CGPoint)a3 radius:(double)a4 ignoreLocation:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  VKMapViewTourGuideManager *v16;
  uint64_t *v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  -[VKMapViewTourGuideManager _elements](self, "_elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__VKMapViewTourGuideManager__tourLocationForUserPoint_radius_ignoreLocation___block_invoke;
  v14[3] = &unk_2503C5358;
  v11 = v9;
  v15 = v11;
  v16 = self;
  v18 = x;
  v19 = y;
  v20 = a4;
  v17 = &v21;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  v12 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __77__VKMapViewTourGuideManager__tourLocationForUserPoint_radius_ignoreLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char v9;
  int v10;
  int v11;
  id v12;

  v7 = a2;
  v8 = v7;
  v12 = v7;
  if (!*(_QWORD *)(a1 + 32) || (v9 = objc_msgSend(v7, "isEqual:"), v8 = v12, (v9 & 1) == 0))
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "_elementIntersectsElement:point:radius:", v8, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v8 = v12;
    if (v10)
    {
      v11 = objc_msgSend(*(id *)(a1 + 40), "_elementValidForCurrentDetailLevel:", v12);
      v8 = v12;
      if (v11)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        v8 = v12;
        *a4 = 1;
      }
    }
  }

}

- (void)_queueTourStatusAnnouncement:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[VKMapViewTourGuideManager lastTourStatusAnnouncement](self, "lastTourStatusAnnouncement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", v8);

    if ((v5 & 1) == 0)
    {
      +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearOutputQueue");

      +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queueOutput:", v8);

    }
  }
  -[VKMapViewTourGuideManager setLastTourStatusAnnouncement:](self, "setLastTourStatusAnnouncement:", v8);

}

- (BOOL)_setZoomLevelForUserSpeed:(double)a3
{
  void *v4;
  float v5;
  float v6;
  time_t v7;
  float v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double MidX;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[VKMapViewTourGuideManager mapView](self, "mapView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityZoomLevel");
  v6 = v5;

  v7 = time(0);
  if (v7 > -[VKMapViewTourGuideManager secondsSinceZoomRequest](self, "secondsSinceZoomRequest"))
  {
    v8 = floorf(v6);
    if (v8 <= 16.0)
    {
      if (v8 >= 16.0)
      {
LABEL_7:
        AXPerformBlockOnMainThreadAfterDelay();
        return fabsf(v6 + -16.0) < 0.1;
      }
      -[VKMapViewTourGuideManager mapView](self, "mapView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapViewTourGuideManager mapView](self, "mapView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      MidX = CGRectGetMidX(v17);
      -[VKMapViewTourGuideManager mapView](self, "mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v9, "accessibilityZoomInAtPoint:", MidX, CGRectGetMidY(v18));
    }
    else
    {
      -[VKMapViewTourGuideManager mapView](self, "mapView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapViewTourGuideManager mapView](self, "mapView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v11 = CGRectGetMidX(v15);
      -[VKMapViewTourGuideManager mapView](self, "mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v9, "accessibilityZoomOutAtPoint:", v11, CGRectGetMidY(v16));
    }

    -[VKMapViewTourGuideManager setSecondsSinceZoomRequest:](self, "setSecondsSinceZoomRequest:", time(0));
    goto LABEL_7;
  }
  return fabsf(v6 + -16.0) < 0.1;
}

void __55__VKMapViewTourGuideManager__setZoomLevelForUserSpeed___block_invoke(uint64_t a1)
{
  float v2;
  void *v3;
  float v4;
  float v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(float *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityZoomLevel");
  v5 = v4;

  if (v2 != v5)
  {
    objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ignoreLogging");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE006F8], "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        AXColorizeFormatLog();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "mapView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessibilityZoomLevel");
        v15 = v13;
        v16 = *(float *)(a1 + 40);
        _AXStringForArgs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v14;
          _os_log_impl(&dword_232B35000, v9, v10, "%{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateElements", *(_QWORD *)&v15, *(_QWORD *)&v16);
  }
}

- (double)_normalizedThetaFromTheta:(double)result
{
  for (; result > 3.14159265; result = result + -6.28318531)
    ;
  for (; result < -3.14159265; result = result + 6.28318531)
    ;
  return result;
}

- (unint64_t)_tourPOISideFromTheta:(double)a3
{
  if (a3 <= 0.523598776)
    return a3 < -0.523598776;
  else
    return 2;
}

- (void)_updateTourStatusWithCenter:(id)a3 location:(id)a4 orientation:(int64_t)a5
{
  double var1;
  double var0;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  __float2 v21;
  void *v22;
  double sinval;
  unsigned int i;
  double v25;
  double v26;
  double v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  var1 = a3.var1;
  var0 = a3.var0;
  v64 = *MEMORY[0x24BDAC8D0];
  v56 = a4;
  -[VKMapViewTourGuideManager mapView](self, "mapView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "convertCoordinate:toPointToLayer:", v55, var0, var1);
  UIAccessibilityPointForPoint();
  v59 = v10;
  v60 = v9;

  -[VKMapViewTourGuideManager _yaw](self, "_yaw");
  v12 = v11;
  objc_msgSend(v56, "speed");
  v58 = v13;
  -[VKMapViewTourGuideManager _tourLocationForUserPoint:radius:ignoreLocation:](self, "_tourLocationForUserPoint:radius:ignoreLocation:", 0, v60, v59, 15.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[VKMapViewTourGuideManager _tourLocationForUserPoint:radius:ignoreLocation:](self, "_tourLocationForUserPoint:radius:ignoreLocation:", 0, v60, v59, 30.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[VKMapViewTourGuideManager lastCurrentTourLocation](self, "lastCurrentTourLocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v58 > 0.35)
  {
    objc_msgSend(v56, "course", v58);
    v18 = (v19 - v12) * 3.14159265 / 180.0;
    v61 = 0.0;
    v16 = *MEMORY[0x24BDBEFB0];
    v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[VKMapViewTourGuideManager _tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:](self, "_tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:", &v61, 1, v60, v59, 50.0, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v61 = 0.0;
    v16 = *MEMORY[0x24BDBEFB0];
    v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v18 = 0.0;
  }
  v20 = v18;
  v21 = __sincosf_stret(v20);
  v22 = 0;
  sinval = v21.__sinval;
  for (i = 15; i <= 0x41; i += 5)
  {
    if (v22 && v15)
      break;
    v25 = (double)(int)(i + 5) * v21.__cosval;
    v26 = v59 - v25;
    if (!v22)
    {
      -[VKMapViewTourGuideManager _tourLocationForUserPoint:radius:ignoreLocation:](self, "_tourLocationForUserPoint:radius:ignoreLocation:", v14, v60 + (double)(int)(i + 5) * sinval, v59 - v25, (double)(int)(i + 5) / 3.0);
      v16 = v60 + (double)(int)(i + 5) * sinval;
      v17 = v26;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v58 <= 0.35 && v15 == 0)
    {
      -[VKMapViewTourGuideManager _tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:](self, "_tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:", &v61, 0, v60 + (double)(int)(i + 5) * sinval, v26, (double)(int)(i + 5) / 3.0, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v28 = v58;
  if (v58 > 0.35)
    v29 = -[VKMapViewTourGuideManager _tourPOISideFromTheta:](self, "_tourPOISideFromTheta:", v61);
  else
    v29 = 0;
  +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 || objc_msgSend(MEMORY[0x24BE006F8], "willLogDebug"))
  {
    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v56, "coordinate");
    v33 = v32;
    objc_msgSend(v56, "coordinate");
    v35 = v34;
    objc_msgSend(v56, "speed");
    v37 = v36;
    objc_msgSend(v56, "course");
    v39 = v38;
    objc_msgSend(v14, "accessibilityLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accessibilityLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityLabel");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    v44 = CFSTR("Right");
    if (v29 == 1)
      v44 = CFSTR("Left");
    if (!v29)
      v44 = CFSTR("None");
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Location: %f,%f\nSpeed: %f\nCourse: %f\nYaw: %f\nFutureUserTheta: %f\nCurrent: %@\nFuture: %@\nPOI: %@\nPOIFromCourse: %f\nSide: %@"), v33, v35, v37, v39, *(_QWORD *)&v12, v18 * 180.0 / 3.14159265, v40, v41, v42, v61 * 180.0 / 3.14159265, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setDebugMessage:", v45);
    objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "ignoreLogging");

    if ((v47 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE006F8], "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v49 = objc_claimAutoreleasedReturnValue();

      v50 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v49, v50))
      {
        AXColorizeFormatLog();
        v54 = v45;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)buf = 138543362;
          v63 = v51;
          _os_log_impl(&dword_232B35000, v49, v50, "%{public}@", buf, 0xCu);
        }

      }
    }

  }
  objc_msgSend(v30, "setCurrentPoint:frontierPoint:", v60, v59, v16, v17, v54);
  -[VKMapViewTourGuideManager tourStatus](self, "tourStatus");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "updateTourStatusWithCurrentLocation:currentPoint:futureLocation:futurePoint:tourPOI:tourPOISide:isStationary:", v14, v22, v15, v29, v58 <= 0.35, v60, v59, v16, v17);
  objc_msgSend(v56, "speed");
  if (-[VKMapViewTourGuideManager _setZoomLevelForUserSpeed:](self, "_setZoomLevelForUserSpeed:"))
  {
    objc_msgSend(v52, "shortTourStatusAnnouncement");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewTourGuideManager _queueTourStatusAnnouncement:](self, "_queueTourStatusAnnouncement:", v53);

  }
  -[VKMapViewTourGuideManager setLastCurrentTourLocation:](self, "setLastCurrentTourLocation:", v14);

}

- (void)_startObservingUpdates
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDDB0C0], "sharedLocationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startHeadingUpdateWithObserver:", self);
  objc_msgSend(v5, "startLocationUpdateWithObserver:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourGuideManager elementManager](self, "elementManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateElementsComplete_, CFSTR("UpdateAccessibilityElementsComplete"), v4);

}

- (void)_stopObservingUpdates
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDDB0C0], "sharedLocationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopHeadingUpdateWithObserver:", self);
  objc_msgSend(v5, "stopLocationUpdateWithObserver:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourGuideManager elementManager](self, "elementManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UpdateAccessibilityElementsComplete"), v4);

}

- (id)_elements
{
  void *v3;
  void *v4;
  void *v5;

  -[VKMapViewTourGuideManager elementManager](self, "elementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VKMapViewTourGuideManager mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityElementsForMapView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_center
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[VKMapViewTourGuideManager elementManager](self, "elementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VKMapViewTourGuideManager mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerForMapView:", v4);
    v6 = v5;
    v8 = v7;

  }
  else
  {
    VKLocationCoordinate2DMake();
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (int64_t)_orientation
{
  void *v3;
  void *v4;
  int64_t v5;

  -[VKMapViewTourGuideManager elementManager](self, "elementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VKMapViewTourGuideManager mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "orientationForMapView:", v4);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (double)_yaw
{
  void *v3;
  double v4;
  void *v5;
  double v6;

  -[VKMapViewTourGuideManager elementManager](self, "elementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VKMapViewTourGuideManager mapView](self, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "yawForMapView:", v5);
    v4 = v6;

  }
  return v4;
}

- (void)_updateElements
{
  void *v3;
  id v4;

  -[VKMapViewTourGuideManager elementManager](self, "elementManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VKMapViewTourGuideManager mapView](self, "mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateAccessibilityElementsForMapView:", v3);

  }
}

- (id)tourStatusForMapView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[VKMapViewTourGuideManager mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[VKMapViewTourGuideManager tourStatus](self, "tourStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "longTourStatusAnnouncement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AXLogWithFacility();
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[VKMapViewTourGuideManager _stopObservingUpdates](self, "_stopObservingUpdates");
  objc_storeWeak((id *)&self->_mapView, 0);
  self->_running = 0;
  v3.receiver = self;
  v3.super_class = (Class)VKMapViewTourGuideManager;
  -[VKMapViewTourGuideManager dealloc](&v3, sel_dealloc);
}

- (VKMapViewTourGuideManager)initWithMapView:(id)a3 elementManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VKMapViewTourGuideManager *v9;
  VKMapViewTourGuideManager *v10;
  VKMapViewTourStatus *v11;
  VKMapViewTourStatus *tourStatus;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
    _AXAssert();
  v14.receiver = self;
  v14.super_class = (Class)VKMapViewTourGuideManager;
  v9 = -[VKMapViewTourGuideManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_elementManager, a4);
    v11 = objc_alloc_init(VKMapViewTourStatus);
    tourStatus = v10->_tourStatus;
    v10->_tourStatus = v11;

    objc_storeWeak((id *)&v10->_mapView, v6);
  }

  return v10;
}

- (void)_updateElementsComplete:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removePointsAndPaths");
  -[VKMapViewTourGuideManager _elements](self, "_elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  AXVKAccessibilityPaths(v4, v5, 25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addBuildingPaths:", v6);

  v7 = objc_opt_class();
  AXVKAccessibilityPaths(v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addPOIPaths:", v8);

  v9 = objc_opt_class();
  AXVKAccessibilityPaths(v4, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addRoadPaths:", v10);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (id)_descriptionForOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_2503C53A0[a3];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (CFAbsoluteTimeGetCurrent()
       - *(double *)&-[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::LastProcessTime >= 0.5)
    {
      -[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::LastProcessTime = CFAbsoluteTimeGetCurrent();
      -[VKMapViewTourGuideManager mapView](self, "mapView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessibilityCenter");
      v7 = v6;
      v9 = v8;

      if (-[VKMapViewTourGuideManager _elementsInvalidForCenter:](self, "_elementsInvalidForCenter:", v7, v9))
      {
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "systemUptime");
        v13 = v12;

        v10 = v13 - *(double *)&-[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::lastUpdate;
        if (v13 - *(double *)&-[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::lastUpdate > 2.0)
        {
          -[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::lastUpdate = *(_QWORD *)&v13;
          objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "ignoreLogging");

          if ((v15 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BE006F8], "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            AXLoggerForFacility();
            v17 = objc_claimAutoreleasedReturnValue();

            v18 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v17, v18))
            {
              AXColorizeFormatLog();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              _AXStringForArgs();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, v18))
              {
                *(_DWORD *)buf = 138543362;
                v26 = v20;
                _os_log_impl(&dword_232B35000, v17, v18, "%{public}@", buf, 0xCu);
              }

            }
          }
          -[VKMapViewTourGuideManager _updateElements](self, "_updateElements");
        }
      }
      -[VKMapViewTourGuideManager mapView](self, "mapView", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "accessibilityOrientation");

      if (-[VKMapViewTourGuideManager _elementsInvalidForOrientation:](self, "_elementsInvalidForOrientation:", v22))
        AXPerformBlockOnMainThreadAfterDelay();
      objc_msgSend(v4, "lastLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "copy");

      -[VKMapViewTourGuideManager _updateTourStatusWithCenter:location:orientation:](self, "_updateTourStatusWithCenter:location:orientation:", v24, v22, v7, v9);
    }
  }
  else
  {
    -[VKMapViewTourGuideManager stopTour](self, "stopTour");
    _AXLogWithFacility();
  }

}

uint64_t __60__VKMapViewTourGuideManager_locationManagerUpdatedLocation___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006F8], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForOrientation:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v8;
        _os_log_impl(&dword_232B35000, v5, v6, "%{public}@", buf, 0xCu);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateElements", v10);
}

- (void)locationManagerUpdatedHeading:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[VKMapViewTourGuideManager mapView](self, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "accessibilityOrientation");

    if (-[VKMapViewTourGuideManager _elementsInvalidForOrientation:](self, "_elementsInvalidForOrientation:", v6))
      AXPerformBlockOnMainThreadAfterDelay();
    -[VKMapViewTourGuideManager mapView](self, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityCenter");
    v9 = v8;
    v11 = v10;

    objc_msgSend(v4, "lastLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    -[VKMapViewTourGuideManager _updateTourStatusWithCenter:location:orientation:](self, "_updateTourStatusWithCenter:location:orientation:", v13, v6, v9, v11);
  }
  else
  {
    -[VKMapViewTourGuideManager stopTour](self, "stopTour");
    _AXLogWithFacility();
  }

}

uint64_t __59__VKMapViewTourGuideManager_locationManagerUpdatedHeading___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006F8], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForOrientation:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v8;
        _os_log_impl(&dword_232B35000, v5, v6, "%{public}@", buf, 0xCu);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateElements", v10);
}

- (void)startTour
{
  void *v3;
  void *v4;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removePointsAndPaths");

    -[VKMapViewTourGuideManager setRunning:](self, "setRunning:", 1);
    -[VKMapViewTourGuideManager setSecondsSinceZoomRequest:](self, "setSecondsSinceZoomRequest:", time(0));
    -[VKMapViewTourGuideManager setLastCurrentTourLocation:](self, "setLastCurrentTourLocation:", 0);
    -[VKMapViewTourGuideManager _startObservingUpdates](self, "_startObservingUpdates");
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdleTimerDisabled:", 1);
    objc_msgSend(v4, "_accessibilitySetIsTourGuideRunning:", 1);
    AXPerformBlockOnMainThreadAfterDelay();

  }
  else
  {
    _AXLogWithFacility();
  }
}

uint64_t __38__VKMapViewTourGuideManager_startTour__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006F8], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, v6))
      {
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_232B35000, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateElements");
}

- (void)stopTour
{
  id v3;
  id v4;

  +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePointsAndPaths");

  -[VKMapViewTourGuideManager setRunning:](self, "setRunning:", 0);
  -[VKMapViewTourGuideManager _stopObservingUpdates](self, "_stopObservingUpdates");
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 0);
  objc_msgSend(v4, "_accessibilitySetIsTourGuideRunning:", 0);

}

+ (id)_descriptionForDetailLevel
{
  if ((unint64_t)(__tourGuideDetailLevel + 1) <= 2)
  {
    AXVectorKitLocString(off_2503C53C8[__tourGuideDetailLevel + 1]);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (int64_t)detailLevel
{
  return __tourGuideDetailLevel;
}

+ (int64_t)detailLevel
{
  return __tourGuideDetailLevel;
}

+ (BOOL)shouldSuppressLocationUpdates
{
  return __tourGuideDetailLevel < 1;
}

+ (void)increaseDetailLevel
{
  UIAccessibilityNotifications v2;
  id v3;

  if (__tourGuideDetailLevel <= 0)
    ++__tourGuideDetailLevel;
  v2 = *MEMORY[0x24BDF71E8];
  objc_msgSend(a1, "_descriptionForDetailLevel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

+ (void)decreaseDetailLevel
{
  UIAccessibilityNotifications v3;
  id v4;

  if ((objc_msgSend(a1, "detailLevel") & 0x8000000000000000) == 0)
    --__tourGuideDetailLevel;
  v3 = *MEMORY[0x24BDF71E8];
  objc_msgSend(a1, "_descriptionForDetailLevel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (VKMapViewAccessibilityElementManager)elementManager
{
  return self->_elementManager;
}

- (void)setElementManager:(id)a3
{
  objc_storeStrong((id *)&self->_elementManager, a3);
}

- (VKMapViewTourStatus)tourStatus
{
  return self->_tourStatus;
}

- (void)setTourStatus:(id)a3
{
  objc_storeStrong((id *)&self->_tourStatus, a3);
}

- (NSString)lastTourStatusAnnouncement
{
  return self->_lastTourStatusAnnouncement;
}

- (void)setLastTourStatusAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_lastTourStatusAnnouncement, a3);
}

- (VKFeatureAccessibilityElement)lastCurrentTourLocation
{
  return self->_lastCurrentTourLocation;
}

- (void)setLastCurrentTourLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastCurrentTourLocation, a3);
}

- (VKMapView)mapView
{
  return (VKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (int64_t)secondsSinceZoomRequest
{
  return self->_secondsSinceZoomRequest;
}

- (void)setSecondsSinceZoomRequest:(int64_t)a3
{
  self->_secondsSinceZoomRequest = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_lastCurrentTourLocation, 0);
  objc_storeStrong((id *)&self->_lastTourStatusAnnouncement, 0);
  objc_storeStrong((id *)&self->_tourStatus, 0);
  objc_storeStrong((id *)&self->_elementManager, 0);
}

@end
