@implementation NTKSolarRichComplicatonCircularPath

+ (id)pathWithDiameter:(double)a3 horizonLineTop:(double)a4 horizonLineHeight:(double)a5 maxCurveHeight:(double)a6 solarTimeModel:(id)a7 sunriseWaypoint:(id)a8 sunsetWayPoint:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v16 = a7;
  v17 = a8;
  v18 = a9;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __150__NTKSolarRichComplicatonCircularPath_pathWithDiameter_horizonLineTop_horizonLineHeight_maxCurveHeight_solarTimeModel_sunriseWaypoint_sunsetWayPoint___block_invoke;
  v24[3] = &unk_1E6BD3600;
  v28 = a3;
  v29 = a6;
  v25 = v16;
  v26 = v17;
  v27 = v18;
  v30 = a5;
  v31 = a4;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  objc_msgSend(a1, "_cachedSolarPathForDiameter:horizonLineTop:horizonLineHeight:maxCurveHeight:solarTimeModel:sunriseWaypoint:sunsetWayPoint:cacheMissBlock:", v21, v20, v19, v24, a3, a4, a5, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

NTKSolarPath *__150__NTKSolarRichComplicatonCircularPath_pathWithDiameter_horizonLineTop_horizonLineHeight_maxCurveHeight_solarTimeModel_sunriseWaypoint_sunsetWayPoint___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  NTKSolarPath *v3;
  double v6;
  NTKSolarPath *v7;
  NTKBezierPathPointModel *v8;
  void *v9;
  NTKBezierPathPointModel *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v1 = *(double *)(a1 + 56);
  v2 = 0.0;
  if (vabdd_f64(0.0, v1) >= 1.0)
  {
    v3 = 0;
    v6 = v1 * 0.5;
    while (1)
    {
      v7 = v3;
      v3 = -[NTKSolarPath initWithBounds:solarTimeModel:verticallyFitsPathToBounds:usePlaceholderData:]([NTKSolarPath alloc], "initWithBounds:solarTimeModel:verticallyFitsPathToBounds:usePlaceholderData:", *(_QWORD *)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 32), "usePlaceholderData"), 0.0, 0.0, (v1 + v2) * 0.5, *(double *)(a1 + 64));

      v8 = [NTKBezierPathPointModel alloc];
      -[NTKSolarPath bezierPath](v3, "bezierPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NTKBezierPathPointModel initWithPath:](v8, "initWithPath:", v9);

      objc_msgSend(*(id *)(a1 + 40), "percentageThroughPeriodForWaypointDate");
      if (v11 == -1.0)
      {
        objc_msgSend(*(id *)(a1 + 48), "percentageThroughPeriodForWaypointDate");
        if (v14 == -1.0)
        {
          -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](v10, "pointOnPathForHorizontalPercentage:", 0.5);
          v25 = v24;
          -[NTKSolarPath altitudeAtPercentage:](v3, "altitudeAtPercentage:", 0.5);
          v20 = v26 + v25;
          goto LABEL_10;
        }
        v13 = *(void **)(a1 + 32);
        v12 = *(void **)(a1 + 48);
      }
      else
      {
        v13 = *(void **)(a1 + 32);
        v12 = *(void **)(a1 + 40);
      }
      objc_msgSend(v12, "waypointDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "percentageThroughPeriodForDate:", v15);
      v17 = v16;

      -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](v10, "pointOnPathForHorizontalPercentage:", v17);
      v19 = v18 + *(double *)(a1 + 72);
      v20 = floorf(v19);
LABEL_10:
      v21 = *(double *)(a1 + 80) - v20;
      -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:](v10, "pointOnPathForHorizontalPercentage:", 0.0);
      if (sqrt((v6 - (v21 + v23)) * (v6 - (v21 + v23))+ (v6 - (v22 + (*(double *)(a1 + 56) - (v1 + v2) * 0.5) * 0.5))* (v6 - (v22 + (*(double *)(a1 + 56) - (v1 + v2) * 0.5) * 0.5))) < *(double *)(a1 + 56) * 0.5)v2 = (v1 + v2) * 0.5;
      else
        v1 = (v1 + v2) * 0.5;

      if (vabdd_f64(v2, v1) < 1.0)
        return v3;
    }
  }
  v3 = 0;
  return v3;
}

+ (id)_solarPathCache
{
  if (_solarPathCache_once != -1)
    dispatch_once(&_solarPathCache_once, &__block_literal_global_76);
  return (id)_solarPathCache___solarPathCache;
}

void __54__NTKSolarRichComplicatonCircularPath__solarPathCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_solarPathCache___solarPathCache;
  _solarPathCache___solarPathCache = v0;

}

+ (id)_cachedSolarPathForDiameter:(double)a3 horizonLineTop:(double)a4 horizonLineHeight:(double)a5 maxCurveHeight:(double)a6 solarTimeModel:(id)a7 sunriseWaypoint:(id)a8 sunsetWayPoint:(id)a9 cacheMissBlock:(id)a10
{
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v18 = a10;
  objc_msgSend(a1, "_cachedSolarPathKeyForDiameter:horizonLineTop:horizonLineHeight:maxCurveHeight:solarTimeModel:sunriseWaypoint:sunsetWayPoint:", a7, a8, a9, a3, a4, a5, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_solarPathCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ntkCachedObjectForKey:creationBlock:", v19, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_cachedSolarPathKeyForDiameter:(double)a3 horizonLineTop:(double)a4 horizonLineHeight:(double)a5 maxCurveHeight:(double)a6 solarTimeModel:(id)a7 sunriseWaypoint:(id)a8 sunsetWayPoint:(id)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v15 = (void *)MEMORY[0x1E0CB37A0];
  v16 = a9;
  v17 = a8;
  v18 = a7;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("diameter:%f-horizonLineTop:%f-horizonLineHeight:%f-maxCurveHeight:%f-"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ntkCacheableKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "appendFormat:", CFSTR("solarTimeModel:%@-"), v20);
  objc_msgSend(v17, "ntkCacheableKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "appendFormat:", CFSTR("sunriseWaypoint:%@-"), v21);
  objc_msgSend(v16, "ntkCacheableKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "appendFormat:", CFSTR("sunsetWaypoint:%@"), v22);
  return v19;
}

@end
