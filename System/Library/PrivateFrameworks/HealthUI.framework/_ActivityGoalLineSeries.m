@implementation _ActivityGoalLineSeries

- (_ActivityGoalLineSeries)initWithColor:(id)a3
{
  id v4;
  _ActivityGoalLineSeries *v5;
  HKGradientFillStyle *v6;
  void *v7;
  void *v8;
  HKGradientFillStyle *v9;
  void *v10;
  void *v11;
  void *v12;
  HKAxisLabelStyle *v13;
  _ActivityGoalLineAnnotationFormatter *v14;
  HKLineSeriesPresentationStyle *v15;
  HKLineSeriesPresentationStyle *v16;
  HKLineSeriesPresentationStyle *v17;
  void *v18;
  void *v19;
  HKLineSeriesPointMarkerStyle *v20;
  void *v21;
  void *v22;
  void *v23;
  HKLineSeriesPointMarkerStyle *v24;
  HKGradientFillStyle *v26;
  HKGradientFillStyle *v27;
  objc_super v28;
  HKLineSeriesPresentationStyle *v29;
  HKLineSeriesPresentationStyle *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_ActivityGoalLineSeries;
  v5 = -[HKLineSeries init](&v28, sel_init);
  if (v5)
  {
    v6 = [HKGradientFillStyle alloc];
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v6, "initWithFirstColor:secondColor:", v7, v8);

    v9 = [HKGradientFillStyle alloc];
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v9, "initWithFirstColor:secondColor:", v10, v11);

    +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v4, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDashStyle:", 1);
    v13 = objc_alloc_init(HKAxisLabelStyle);
    -[HKAxisLabelStyle setTextColor:](v13, "setTextColor:", v4);
    v14 = objc_alloc_init(_ActivityGoalLineAnnotationFormatter);
    -[HKAxisLabelStyle setNumberFormatter:](v13, "setNumberFormatter:", v14);

    v15 = objc_alloc_init(HKLineSeriesPresentationStyle);
    -[HKLineSeriesPresentationStyle setStrokeStyle:](v15, "setStrokeStyle:", v12);
    -[HKLineSeriesPresentationStyle setWaveForm:](v15, "setWaveForm:", 0);
    -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v15, "setAxisAnnotationStyle:", v13);
    v16 = objc_alloc_init(HKLineSeriesPresentationStyle);
    -[HKLineSeriesPresentationStyle setStrokeStyle:](v16, "setStrokeStyle:", v12);
    -[HKLineSeriesPresentationStyle setFillStyle:](v16, "setFillStyle:", v26);
    -[HKLineSeriesPresentationStyle setWaveForm:](v16, "setWaveForm:", 0);
    v17 = objc_alloc_init(HKLineSeriesPresentationStyle);
    HKHealthKeyColor();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v18, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setDashStyle:", 2);
    -[HKLineSeriesPresentationStyle setStrokeStyle:](v17, "setStrokeStyle:", v19);
    v20 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v4, 0, 3.0);
    -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v17, "setPointMarkerStyle:", v20);
    -[HKLineSeriesPresentationStyle setFillStyle:](v17, "setFillStyle:", v27);
    -[HKLineSeriesPresentationStyle setWaveForm:](v17, "setWaveForm:", 0);
    v31[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setUnhighlightedPresentationStyles:](v5, "setUnhighlightedPresentationStyles:", v21);

    v30 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setHighlightedPresentationStyles:](v5, "setHighlightedPresentationStyles:", v22);

    v29 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeries setSelectedPresentationStyles:](v5, "setSelectedPresentationStyles:", v23);

    -[HKLineSeries setInactivePresentationStyle:](v5, "setInactivePresentationStyle:", v15);
    v24 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v4, 0, 5.0);
    -[HKLineSeries setSelectedPointMarkerStyle:](v5, "setSelectedPointMarkerStyle:", v24);
    -[HKLineSeries setFlatLastValue:](v5, "setFlatLastValue:", 1);
    -[HKGraphSeries setAllowsSelection:](v5, "setAllowsSelection:", 0);

  }
  return v5;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  CGFloat MinX;
  CGFloat MaxX;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  _OWORD v37[3];
  _QWORD v38[11];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  CGRect v55;
  CGRect v56;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v20 = a5;
  v21 = a8;
  v22 = a9;
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  MinX = CGRectGetMinX(v55);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  MaxX = CGRectGetMaxX(v56);
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__21;
  v53 = __Block_byref_object_dispose__21;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__21;
  v43 = __Block_byref_object_dispose__21;
  v44 = 0;
  -[HKLineSeries unhighlightedPresentationStyles](self, "unhighlightedPresentationStyles");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "strokeStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __166___ActivityGoalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v38[3] = &unk_1E9C451B8;
  *(CGFloat *)&v38[8] = MinX;
  *(CGFloat *)&v38[9] = MaxX;
  v38[4] = self;
  v38[5] = &v49;
  v38[10] = a7;
  v38[6] = &v45;
  v38[7] = &v39;
  v28 = *(_OWORD *)&a6->c;
  v37[0] = *(_OWORD *)&a6->a;
  v37[1] = v28;
  v37[2] = *(_OWORD *)&a6->tx;
  objc_msgSend(v19, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v37, 1, v38);
  v29 = (void *)v50[5];
  if (v29)
  {
    objc_msgSend(v29, "coordinate");
    v31 = v30;
    CGContextMoveToPoint(a7, v32, v30);
    CGContextAddLineToPoint(a7, MaxX, v31);
    v33 = v46[3] + 1;
    v46[3] = v33;
  }
  else
  {
    v33 = v46[3];
  }
  if (v33 >= 1)
  {
    objc_msgSend(v27, "applyToContext:", a7);
    CGContextStrokePath(a7);
  }
  objc_msgSend(v22, "axisAnnotationDelegateForSeries:", self);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v40[5];
  if (v35)
  {
    objc_msgSend(v35, "coordinate");
    -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v34, v36);
  }
  else
  {
    objc_msgSend(v34, "clearAxisAnnotations");
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

}

- (BOOL)_lineSeriesCoordinateIsPaused:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "activitySummaryData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPaused");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
