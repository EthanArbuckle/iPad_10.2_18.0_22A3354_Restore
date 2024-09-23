@implementation HKDateAxis

- (HKDateAxis)initWithCurrentCalendar:(id)a3 axisStyle:(id)a4
{
  id v7;
  id v8;
  HKAxisConfiguration *v9;
  HKDateZoomScale *v10;
  HKDateCoordinateTransform *v11;
  HKDateAxis *v12;
  HKDateAxis *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(HKAxisConfiguration);
  v10 = -[HKDateZoomScale initWithCurrentCalendar:]([HKDateZoomScale alloc], "initWithCurrentCalendar:", v7);
  -[HKAxisConfiguration setZoomScaleEngine:](v9, "setZoomScaleEngine:", v10);

  v11 = -[HKDateCoordinateTransform initWithCurrentCalendar:]([HKDateCoordinateTransform alloc], "initWithCurrentCalendar:", v7);
  -[HKAxisConfiguration setTransform:](v9, "setTransform:", v11);

  -[HKAxisConfiguration setPreferredStyle:](v9, "setPreferredStyle:", v8);
  v15.receiver = self;
  v15.super_class = (Class)HKDateAxis;
  v12 = -[HKAxis initWithConfiguration:](&v15, sel_initWithConfiguration_, v9);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_currentCalendar, a3);

  return v13;
}

- (id)_formattedStringForDate:(id)a3 zoom:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = v7;
  switch(a4)
  {
    case 0:
      v9 = 0;
      goto LABEL_9;
    case 1:
      v9 = 1;
      goto LABEL_9;
    case 2:
      v9 = 4;
      goto LABEL_9;
    case 3:
      v9 = 3;
      goto LABEL_9;
    case 4:
      v9 = 16;
      goto LABEL_9;
    case 5:
      v9 = 18;
      goto LABEL_9;
    case 6:
      -[HKDateAxis currentCalendar](self, "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startOfDayForDate:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKDateAxis currentCalendar](self, "currentCalendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateBySettingUnit:value:ofDate:options:", 32, 12, v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!HKTimeFormatIsIn24HourMode()
        && ((objc_msgSend(v8, "isEqual:", v12) & 1) != 0 || objc_msgSend(v8, "isEqual:", v14)))
      {
        HKLocalizedStringForDateAndTemplate(v8, 24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        HKLocalizedStringForDateAndTemplate(v8, 25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_18;
    case 7:
      v9 = 27;
LABEL_9:
      HKLocalizedStringForDateAndTemplate(v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 91, CFSTR("Invalid zoom specified (%ld)"), 8);

      goto LABEL_15;
    default:
LABEL_15:
      v10 = 0;
LABEL_18:

      return v10;
  }
}

- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a5 == 2)
  {
    v7 = 0;
  }
  else
  {
    -[HKDateAxis _formattedStringForDate:zoom:](self, "_formattedStringForDate:zoom:", a3, a4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)minorAxisIntervalComponentsForZoomLevelConfiguration:(id)a3
{
  return (id)objc_msgSend(a3, "minorAxisIntervalComponents");
}

- (id)axisLabelIntervalComponentsForZoomLevelConfiguration:(id)a3
{
  return (id)objc_msgSend(a3, "axisLabelIntervalComponents");
}

- (BOOL)canAddLabelForAxisLabelType:(int64_t)a3
{
  return a3 != 2;
}

- (unint64_t)_anchorUnitForZoom:(int64_t)a3
{
  unint64_t result;
  void *v6;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      result = 4;
      break;
    case 3:
      result = 8;
      break;
    case 4:
      result = 0x2000;
      break;
    case 5:
    case 6:
      result = 16;
      break;
    case 7:
      result = 32;
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 142, CFSTR("Invalid zoom level (%ld)"), 8);

      result = 0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int64_t)dateZoomForZoomScale:(double)a3
{
  void *v4;
  int64_t v5;

  -[HKAxis zoomScaleEngine](self, "zoomScaleEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "zoomForZoomScale:", a3);

  return v5;
}

- (id)_axisLabelsWithModelRange:(id)a3 zoom:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__HKDateAxis__axisLabelsWithModelRange_zoom___block_invoke;
  v13[3] = &unk_1E9C44B58;
  v15 = a4;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  -[HKDateAxis _enumerateCoordinatesInModelRange:timeScope:withHandler:](self, "_enumerateCoordinatesInModelRange:timeScope:withHandler:", v7, a4, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

void __45__HKDateAxis__axisLabelsWithModelRange_zoom___block_invoke(uint64_t a1, void *a2, char a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = (void *)objc_opt_new();
  v6 = 1;
  v7 = 2;
  if ((a3 & 4) == 0)
    v7 = -1;
  if ((a3 & 2) == 0)
    v6 = v7;
  if ((a3 & 1) != 0)
    v8 = 0;
  else
    v8 = v6;
  if (*(_QWORD *)(a1 + 48) == 4)
  {
    if ((a3 & 2) == 0)
      goto LABEL_16;
    v9 = 4;
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "canAddLabelForAxisLabelType:", v8))
      goto LABEL_16;
    v9 = *(_QWORD *)(a1 + 48);
  }
  objc_msgSend(*(id *)(a1 + 32), "stringForDate:zoom:labelType:", v12, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v5, "setText:", v10);

LABEL_16:
  objc_msgSend(v5, "setLocation:", v12);
  if (*(_QWORD *)(a1 + 48) == 1)
    v11 = 1;
  else
    v11 = v8;
  objc_msgSend(v5, "setLabelType:", v11);
  if (*(_QWORD *)(a1 + 48) != 3)
    goto LABEL_22;
  if ((a3 & 2) != 0)
  {
    objc_msgSend(v5, "setLabelType:", 1);
LABEL_22:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

- (id)rangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5
{
  -[HKAxis _chartRangeForChartRect:zoomScale:contentOffset:](self, "_chartRangeForChartRect:zoomScale:contentOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a5.x, a5.y);
  return -[HKDateAxis _dateRangeForChartRange:zoomScale:](self, "_dateRangeForChartRange:zoomScale:");
}

- (void)offsetForValueRange:(id)a3 chartRect:(CGRect)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  -[HKAxis transform](self, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateForValue:", v15);
  v17 = v16;

  -[HKAxis transform](self, "transform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maxValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "coordinateForValue:", v19);
  -[HKAxis pointTransform](self, "pointTransform");
  v22 = HKLinearTransformRange(v20, v21, v17);
  if (v23 > 0.0)
    -[HKAxis _offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:](self, "_offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:", a5, a6, x, y, width, height, v22, v23);
}

- (id)_dateRangeForChartRange:(HKRange)a3 zoomScale:(double)a4
{
  double var0;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  var0 = a3.var0;
  -[HKAxis pointTransform](self, "pointTransform");
  v8 = HKLinearTransformInvert(v6, v7);
  v10 = HKLinearTransformRange(v8, v9, var0);
  v12 = v11;
  -[HKAxis transform](self, "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForCoordinate:", HKRangeMin(v10, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAxis transform](self, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForCoordinate:", HKRangeMax(v10, v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;

  v6 = a3;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", -[HKDateAxis dateZoomForZoomScale:](self, "dateZoomForZoomScale:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canonicalSize");
  v9 = v8 * 3.0;
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = vcvtmd_s64_f64(v11 / v9);

  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14 / v9;
  v16 = floor(v15);
  v17 = vcvtmd_s64_f64(v15);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9 * (double)(uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToDate:", v19);

  v21 = v20 ^ 1u;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((uint64_t)(v21 + v17) >= v12)
  {
    v28 = v7;
    v23 = 0;
    v24 = v17 + v21 + 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9 * (double)v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v23, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v26);

      }
      ++v12;
      v23 = v25;
    }
    while (v24 != v12);

    v7 = v28;
  }

  return v22;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[HKDateAxis _axisLabelsWithModelRange:zoom:](self, "_axisLabelsWithModelRange:zoom:", v6, -[HKDateAxis dateZoomForZoomScale:](self, "dateZoomForZoomScale:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)extendModelRangeWithRange:(id)a3 zoomScale:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v22;
  id v23;

  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "endDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = -[HKDateAxis _anchorUnitForZoom:](self, "_anchorUnitForZoom:", -[HKDateAxis dateZoomForZoomScale:](self, "dateZoomForZoomScale:", a4));
    -[HKDateAxis currentCalendar](self, "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v6, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rangeOfUnit:startDate:interval:forDate:", v10, &v23, 0, v12);
    v13 = v23;

    -[HKDateAxis currentCalendar](self, "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rangeOfUnit:startDate:interval:forDate:", v10, &v22, 0, v15);
    v16 = v22;

    objc_msgSend(v6, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v16, "hk_isBeforeDate:", v17);

    if ((_DWORD)v15)
    {
      -[HKDateAxis currentCalendar](self, "currentCalendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingUnit:value:toDate:options:", v10, 1, v16, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v19;
    }
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v13, v16);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v6;
  }

  return v20;
}

- (void)_enumerateCoordinatesInModelRange:(id)a3 timeScope:(int64_t)a4 withHandler:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void (**v47)(id, id, uint64_t, _BYTE *, double);
  void *v48;
  void *v49;
  void *v50;
  char v51;

  v9 = a3;
  v47 = (void (**)(id, id, uint64_t, _BYTE *, double))a5;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDateAxis axisLabelIntervalComponentsForZoomLevelConfiguration:](self, "axisLabelIntervalComponentsForZoomLevelConfiguration:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  -[HKDateAxis minorAxisIntervalComponentsForZoomLevelConfiguration:](self, "minorAxisIntervalComponentsForZoomLevelConfiguration:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v43 = v10;
  objc_msgSend(v10, "referencePointIntervalComponents");
  v13 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v11;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 288, CFSTR("HKDateAxis: minor components cannot be nil"));

    if (v13)
      goto LABEL_4;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 289, CFSTR("HKDateAxis: reference components cannot be nil"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 287, CFSTR("HKDateAxis: step components cannot be nil"));

  if (!v12)
    goto LABEL_38;
LABEL_3:
  if (!v13)
    goto LABEL_39;
LABEL_4:
  -[HKDateAxis currentCalendar](self, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)v13;
  -[HKDateAxis _firstDateAfter:matchingComponents:timeScope:calendar:](self, "_firstDateAfter:matchingComponents:timeScope:calendar:", v15, v13, a4, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDateAxis _firstDateAfter:matchingComponents:timeScope:calendar:](self, "_firstDateAfter:matchingComponents:timeScope:calendar:", v17, v11, a4, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v12;
  -[HKDateAxis _firstDateAfter:matchingComponents:timeScope:calendar:](self, "_firstDateAfter:matchingComponents:timeScope:calendar:", v19, v12, a4, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 296, CFSTR("HKDateAxis: next minor date is nil"));

  }
  v21 = v20;
  v44 = v9;
  objc_msgSend(v9, "maxValue");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (HKUIObjectIsLarger(v21, (uint64_t)v49))
  {
    v22 = v21;
    goto LABEL_36;
  }
  v48 = 0;
  v23 = v21;
  while (1)
  {
    if (v16 && objc_msgSend(v23, "isEqualToDate:", v16))
    {
      v24 = v23;
      -[HKDateAxis nextDateForDate:components:timeScope:calendar:](self, "nextDateForDate:components:timeScope:calendar:", v16, v45, a4, v14);
      v25 = objc_claimAutoreleasedReturnValue();

      v26 = 1;
      v16 = (void *)v25;
      if (!v18)
        goto LABEL_18;
    }
    else
    {
      v24 = 0;
      v26 = 0;
      if (!v18)
        goto LABEL_18;
    }
    if (objc_msgSend(v23, "isEqualToDate:", v18))
    {
      if (!v24)
        v24 = v23;
      v26 |= 2uLL;
      -[HKDateAxis nextDateForDate:components:timeScope:calendar:](self, "nextDateForDate:components:timeScope:calendar:", v18, v46, a4, v14);
      v27 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v27;
    }
LABEL_18:
    if (v21 && objc_msgSend(v23, "isEqualToDate:", v21))
    {
      if (!v24)
        v24 = v23;
      v26 |= 4uLL;
      -[HKDateAxis nextDateForDate:components:timeScope:calendar:](self, "nextDateForDate:components:timeScope:calendar:", v21, v50, a4, v14);
      v28 = objc_claimAutoreleasedReturnValue();

      v21 = (id)v28;
    }
    if (v24)
    {
      v51 = 0;
      -[HKAxis pointTransform](self, "pointTransform");
      v30 = v29;
      v32 = v31;
      -[HKAxis transform](self, "transform");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "coordinateForValue:", v23);
      v35 = HKLinearTransformValue(v30, v32, v34);

      v47[2](v47, v24, v26, &v51, v35);
      if (v51)
        break;
    }
    -[HKDateAxis nextDateForDate:components:timeScope:calendar:](self, "nextDateForDate:components:timeScope:calendar:", v23, v50, a4, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 4)
    {
      if (v16 && objc_msgSend(v22, "hk_isAfterDate:", v16))
      {
        v36 = v22;

        v37 = v16;
      }
      else
      {
        v36 = 0;
        v37 = v48;
        if (!v48)
        {
LABEL_31:
          v48 = v36;
          goto LABEL_32;
        }
      }
      v38 = v37;

      v22 = v38;
      goto LABEL_31;
    }
LABEL_32:

    v23 = v22;
    if (HKUIObjectIsLarger(v22, (uint64_t)v49))
      goto LABEL_35;
  }

  v22 = v23;
LABEL_35:

LABEL_36:
}

- (id)_firstDateAfter:(id)a3 matchingComponents:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11)
  {
    -[HKDateAxis baseDateForDate:components:calendar:](self, "baseDateForDate:components:calendar:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "hk_isBeforeDate:", v10))
    {
      do
      {
        -[HKDateAxis nextDateForDate:components:timeScope:calendar:](self, "nextDateForDate:components:timeScope:calendar:", v13, v11, a5, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v14;
      }
      while ((objc_msgSend(v14, "hk_isBeforeDate:", v10) & 1) != 0);
    }
    else
    {
      v14 = v13;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)baseDateForDate:(id)a3 components:(id)a4 calendar:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "minute") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "minute") < 2)
    {
      objc_msgSend(v11, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v9, 0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v13 = (void *)v14;
      goto LABEL_16;
    }
LABEL_11:
    objc_msgSend(v11, "hk_startOfHourForDate:addingHours:", v9, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v10, "hour") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "hour") >= 2)
    {
LABEL_14:
      objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 0, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "day") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "day") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 376, CFSTR("_baseDateForDate: no support for specifying .day that is not one"));

    }
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "weekOfYear") < 2)
      objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v11, "firstWeekday"), v9, 0);
    else
      objc_msgSend(v11, "hk_sixMonthPeriodContaining:dateBefore:", v9, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v10, "month") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "month") < 2)
    {
      objc_msgSend(v11, "hk_startOfMonthForDate:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "year") != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_21:
    objc_msgSend(v11, "hk_startOfYearForDate:addingYears:", v9, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateAxis.m"), 397, CFSTR("_baseDateForDate: No support for datecomponents: %@"), v10);

  v13 = 0;
LABEL_16:

  return v13;
}

- (id)nextDateForDate:(id)a3 components:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v11, v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKDateAxis _anchorUnitForZoom:](self, "_anchorUnitForZoom:", a5) == 16 && objc_msgSend(v11, "hour") >= 2)
  {
    objc_msgSend(v12, "components:fromDate:", 62, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hour");
    if (v15 % objc_msgSend(v11, "hour"))
    {
      objc_msgSend(v14, "setHour:", objc_msgSend(v11, "hour") * (objc_msgSend(v14, "hour") / objc_msgSend(v11, "hour")));
      objc_msgSend(v12, "dateFromComponents:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v10))
      {
        objc_msgSend(v14, "setHour:", objc_msgSend(v14, "hour") + objc_msgSend(v11, "hour"));
        objc_msgSend(v12, "dateFromComponents:", v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = v16;
      }
    }

  }
  return v13;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
}

@end
