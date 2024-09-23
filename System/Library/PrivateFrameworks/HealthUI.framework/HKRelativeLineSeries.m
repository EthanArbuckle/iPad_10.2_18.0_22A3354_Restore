@implementation HKRelativeLineSeries

- (id)initFromLineSeries:(id)a3 color:(id)a4 unavailableColor:(id)a5 indeterminateLozengeLineWidth:(double)a6 chartSizeClass:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  HKRelativeLineSeries *v15;
  HKRelativeLineSeries *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HKRelativeLineSeries;
  v15 = -[HKLineSeries init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_color, a4);
    objc_storeStrong((id *)&v16->_unavailableColor, a5);
    v16->_indeterminateLozengeLineWidth = a6;
    v16->_indeterminateLozengeHollowLineRatio = 0.5;
    v16->_chartSizeClass = a7;
    objc_msgSend(v12, "unhighlightedPresentationStyles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setUnhighlightedPresentationStyles:](v16, "setUnhighlightedPresentationStyles:", v17);

    objc_msgSend(v12, "highlightedPresentationStyles");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setHighlightedPresentationStyles:](v16, "setHighlightedPresentationStyles:", v18);

    objc_msgSend(v12, "selectedPresentationStyles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setSelectedPresentationStyles:](v16, "setSelectedPresentationStyles:", v19);

    objc_msgSend(v12, "selectedPointMarkerStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setSelectedPointMarkerStyle:](v16, "setSelectedPointMarkerStyle:", v20);

    objc_msgSend(v12, "inactivePresentationStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setInactivePresentationStyle:](v16, "setInactivePresentationStyle:", v21);

    -[HKLineSeries setFlatLastValue:](v16, "setFlatLastValue:", objc_msgSend(v12, "flatLastValue"));
    -[HKLineSeries setExtendLastValue:](v16, "setExtendLastValue:", objc_msgSend(v12, "extendLastValue"));
    -[HKLineSeries setExtendFirstValue:](v16, "setExtendFirstValue:", objc_msgSend(v12, "extendFirstValue"));
    objc_msgSend(v12, "maximumConnectionDistance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setMaximumConnectionDistance:](v16, "setMaximumConnectionDistance:", v22);

  }
  return v16;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  __int128 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  id v36;
  CGAffineTransform *v37;
  id v38;
  id v39;
  CGContext *v40;
  id v41;
  void *v42;
  objc_super v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v55 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v41 = a5;
  v39 = a8;
  v20 = a9;
  v21 = *(_OWORD *)&a6->c;
  v51 = *(_OWORD *)&a6->a;
  v52 = v21;
  v37 = a6;
  v38 = v20;
  v53 = *(_OWORD *)&a6->tx;
  v40 = a7;
  -[HKRelativeLineSeries _drawIndeterminateLozengesForBlockCoordinates:pointTransform:renderContext:seriesRenderingDelegate:](self, "_drawIndeterminateLozengesForBlockCoordinates:pointTransform:renderContext:seriesRenderingDelegate:", v19, &v51, a7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v42 = v19;
  objc_msgSend(v19, "coordinates");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v48 != v28)
          objc_enumerationMutation(v24);
        v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (v27)
        {
          v31 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "coordinate");
          objc_msgSend(v31, "valueWithCGPoint:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v32);

        }
        objc_msgSend(v30, "userInfo");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[HKRelativeLineSeries _isUserInfoIndeterminateRelativeValue:](self, "_isUserInfoIndeterminateRelativeValue:", v33);

        if (!v27)
          objc_msgSend(v22, "addObject:", v30);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v26);
  }

  if (v42)
    objc_msgSend(v42, "blockPathStart");
  else
    memset(v46, 0, sizeof(v46));
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v22, v46);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = 3221225472;
  v44[2] = __163__HKRelativeLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v44[3] = &unk_1E9C476A0;
  v45 = v23;
  v43.receiver = self;
  v43.super_class = (Class)HKRelativeLineSeries;
  v44[0] = MEMORY[0x1E0C809B0];
  v35 = *(_OWORD *)&v37->c;
  v51 = *(_OWORD *)&v37->a;
  v52 = v35;
  v53 = *(_OWORD *)&v37->tx;
  v36 = v23;
  -[HKLineSeries drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:](&v43, sel_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints_, v34, v41, &v51, v40, v39, v38, x, y, width, height, v44);

}

uint64_t __163__HKRelativeLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);

  return v7;
}

- (void)_drawIndeterminateLozengesForBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 renderContext:(CGContext *)a5 seriesRenderingDelegate:(id)a6
{
  id v10;
  __int128 v11;
  id v12;
  _OWORD v13[3];
  _QWORD v14[5];
  id v15;
  CGContext *v16;

  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __123__HKRelativeLineSeries__drawIndeterminateLozengesForBlockCoordinates_pointTransform_renderContext_seriesRenderingDelegate___block_invoke;
  v14[3] = &unk_1E9C476C8;
  v15 = v10;
  v16 = a5;
  v14[4] = self;
  v11 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a4->tx;
  v12 = v10;
  objc_msgSend(a3, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v13, 1, v14);

}

void __123__HKRelativeLineSeries__drawIndeterminateLozengesForBlockCoordinates_pointTransform_renderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "_isUserInfoIndeterminateRelativeValue:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 32), "_drawIndeterminateLozengeForCoordinate:context:seriesRenderingDelegate:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)_drawIndeterminateLozengeForCoordinate:(id)a3 context:(CGContext *)a4 seriesRenderingDelegate:(id)a5
{
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double indeterminateLozengeHollowLineRatio;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v7 = a3;
  CGContextSaveGState(a4);
  CGContextSetLineCap(a4, kCGLineCapRound);
  objc_msgSend(v7, "start");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "end");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKRelativeLineSeries _colorForUserInfo:](self, "_colorForUserInfo:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  CGContextSetLineWidth(a4, self->_indeterminateLozengeLineWidth);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  v22 = objc_retainAutorelease(v17);
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v22, "CGColor"));
  CGContextMoveToPoint(a4, v9, v11);
  CGContextAddLineToPoint(a4, v13, v15);
  CGContextStrokePath(a4);
  indeterminateLozengeHollowLineRatio = self->_indeterminateLozengeHollowLineRatio;
  if (indeterminateLozengeHollowLineRatio > 0.0)
  {
    CGContextSetLineWidth(a4, indeterminateLozengeHollowLineRatio * self->_indeterminateLozengeLineWidth);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIDynamicColorWithColors(v19, v20);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v21, "CGColor"));

    CGContextMoveToPoint(a4, v9, v11);
    CGContextAddLineToPoint(a4, v13, v15);
    CGContextStrokePath(a4);
  }
  CGContextRestoreGState(a4);

}

- (id)_colorForUserInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
  {
    v5 = v4;
    objc_msgSend(v5, "relativeValueState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "integerValue") == 1)
    {

      v7 = &OBJC_IVAR___HKRelativeLineSeries__unavailableColor;
    }
    else
    {
      objc_msgSend(v5, "relativeValueState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      v7 = &OBJC_IVAR___HKRelativeLineSeries__color;
      if (v10 == 2)
        v7 = &OBJC_IVAR___HKRelativeLineSeries__unavailableColor;
    }
    v8 = *(id *)((char *)&self->super.super.super.isa + *v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartInactiveSeriesColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  __int128 v23;
  int64_t resolution;
  _QWORD v25[4];
  id v26;
  HKRelativeLineSeries *v27;
  id v28;
  id v29;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRelativeLineSeries.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __66__HKRelativeLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C476F0;
  v26 = v14;
  v27 = self;
  v28 = v15;
  v29 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
  v23 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v17, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __66__HKRelativeLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  _HKRelativeLineSeriesBlockCoordinate *v22;
  void *v23;
  _HKRelativeLineSeriesBlockCoordinate *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  _HKRelativeLineSeriesBlockCoordinate *v30;
  _HKRelativeLineSeriesBlockCoordinate *v31;
  id v32;

  v32 = a2;
  v3 = (void *)a1[4];
  objc_msgSend(v32, "xValueAsGenericType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateForValue:", v4);
  v6 = v5;

  v7 = (void *)a1[5];
  objc_msgSend(v32, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "_isUserInfoIndeterminateRelativeValue:", v8);

  if ((_DWORD)v7)
  {
    v9 = (void *)a1[5];
    objc_msgSend(v32, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_indeterminateLozengeValueForUserInfo:", v10);
    v12 = v11;

    v13 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coordinateForValue:", v14);
    v16 = v15;

    v17 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "coordinateForValue:", v18);
    v20 = v19;

    v21 = (void *)a1[7];
    v22 = [_HKRelativeLineSeriesBlockCoordinate alloc];
    objc_msgSend(v32, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22;
    v25 = v6;
    v26 = v16;
  }
  else
  {
    v27 = (void *)a1[6];
    objc_msgSend(v32, "yValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "coordinateForValue:", v28);
    v20 = v29;

    v21 = (void *)a1[7];
    v30 = [_HKRelativeLineSeriesBlockCoordinate alloc];
    objc_msgSend(v32, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v30;
    v25 = v6;
    v26 = v20;
  }
  v31 = -[_HKRelativeLineSeriesBlockCoordinate initWithStart:end:userInfo:](v24, "initWithStart:end:userInfo:", v23, v25, v26, v6, v20);
  objc_msgSend(v21, "addObject:", v31);

}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (BOOL)_shouldForceGapBetweenUserInfo:(id)a3 andUserInfo:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  v7 = -[HKRelativeLineSeries _isUserInfoIndeterminateRelativeValue:](self, "_isUserInfoIndeterminateRelativeValue:", a3)|| -[HKRelativeLineSeries _isUserInfoIndeterminateRelativeValue:](self, "_isUserInfoIndeterminateRelativeValue:", v6);

  return v7;
}

- (BOOL)_isUserInfoIndeterminateRelativeValue:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "relativeValueState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue") != 3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_indeterminateLozengeValueForUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double *v8;
  double v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "unit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "_changeInDegreeFahrenheitUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    v8 = (double *)&unk_1D7B82CA0;
    if (v7)
      v8 = (double *)&unk_1D7B82CB0;
    v9 = v8[self->_chartSizeClass == 1];
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5378];
    v9 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKRelativeLineSeries _indeterminateLozengeValueForUserInfo:].cold.1(v10);
  }

  return v9;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v7;
  double v8;
  double v9;
  void *v11;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRelativeLineSeries.m"), 265, CFSTR("distanceFromPoint type class failure"));

  }
  objc_msgSend(v7, "midpoint");
  UIDistanceBetweenPoints();
  v9 = v8;

  return v9;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  id v8;
  double v9;
  double v10;
  void *v12;

  x = a3.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRelativeLineSeries.m"), 273, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  objc_msgSend(v8, "midpoint");
  v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  id v8;
  double v9;
  double v10;
  void *v12;

  y = a3.y;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRelativeLineSeries.m"), 282, CFSTR("yAxisDiffToPoint type class failure"));

  }
  objc_msgSend(v8, "midpoint");
  v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGPoint v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "midpoint");
  v11.x = v8;
  v11.y = v9;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectContainsPoint(v12, v11);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "midpoint");
  v7 = v6;
  objc_msgSend(v5, "midpoint");
  v9 = v8;

  return v7 < v9;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "midpoint");
  v7 = v6;
  objc_msgSend(v5, "midpoint");
  v9 = v8;

  return v7 > v9;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)unavailableColor
{
  return self->_unavailableColor;
}

- (double)indeterminateLozengeLineWidth
{
  return self->_indeterminateLozengeLineWidth;
}

- (double)indeterminateLozengeHollowLineRatio
{
  return self->_indeterminateLozengeHollowLineRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)_indeterminateLozengeValueForUserInfo:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  id v4;
  int v5;
  void *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_class();
  v3 = v2;
  v5 = 138543618;
  v6 = v2;
  v7 = 2114;
  v8 = (id)objc_opt_class();
  v4 = v8;
  _os_log_error_impl(&dword_1D7813000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Received unexpected user info %{public}@", (uint8_t *)&v5, 0x16u);

}

@end
