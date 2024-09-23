@implementation _ActivityBarSeries

- (_ActivityBarSeries)initWithUnitPreferenceController:(id)a3 activityBarDelegate:(id)a4 displayTypeController:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ActivityBarSeries *v12;
  _ActivityBarSeries *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ActivityBarSeries;
  v12 = -[HKBarSeries init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_unitPreferenceController, a3);
    objc_storeWeak((id *)&v13->_activityBarDelegate, v10);
    objc_storeStrong((id *)&v13->_displayTypeController, a5);
    v13->_lastLegendUpdateTime = 0.0;
  }

  return v13;
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (void)updateLegendsForTimeScope:(int64_t)a3 range:(id)a4 drawingDuringScrolling:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  double v10;
  _QWORD v11[7];

  v5 = a5;
  v8 = a4;
  v9 = CACurrentMediaTime();
  if (!v5 || (-[_ActivityBarSeries lastLegendUpdateTime](self, "lastLegendUpdateTime"), v9 - v10 >= 0.2))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke;
    v11[3] = &unk_1E9C45168;
    v11[4] = self;
    v11[5] = a3;
    *(double *)&v11[6] = v9;
    -[HKGraphSeries untransformedChartPointsForTimeScope:resolution:range:completion:](self, "untransformedChartPointsForTimeScope:resolution:range:completion:", a3, 0, v8, v11);
  }

}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height;
  double y;
  double x;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
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
  CGFloat MaxX;
  CGFloat MinX;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  BOOL v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  void *v51;
  CGContext *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CGFloat rect;
  double recta;
  CGContext *v64;
  _OWORD v65[3];
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  _ActivityBarSeries *v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  double v79;
  BOOL v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  CGRect v85;
  CGRect v86;

  height = a7.size.height;
  rect = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16 = a8;
  v17 = a3;
  v64 = a6;
  if (objc_msgSend(v16, "seriesDrawingDuringTiling")
    && (-[HKBarSeries tiledStrokeStyle](self, "tiledStrokeStyle"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (void *)v18;
    -[HKBarSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKBarSeries tiledStrokeStyle](self, "tiledStrokeStyle", *(_QWORD *)&rect);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "lineWidth", *(_QWORD *)&rect);
  v22 = v21;
  -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lineWidth");
  v25 = v24;

  if (v25 < v22)
    v25 = v22;
  objc_msgSend(v16, "screenRectForSeries:", self);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  -[HKBarSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4, v27, v29, v31, v33, v25);
  v35 = v34;
  v36 = v25 + v34;
  v85.origin.x = x;
  v85.origin.y = y;
  v85.size.width = recta;
  v85.size.height = height;
  MaxX = CGRectGetMaxX(v85);
  v86.origin.x = x;
  v86.origin.y = y;
  v86.size.width = recta;
  v86.size.height = height;
  MinX = CGRectGetMinX(v86);
  v39 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v40 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v41 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v42 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  -[HKBarSeries selectedFillStyle](self, "selectedFillStyle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = 1;
  }
  else
  {
    -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v45 != 0;

  }
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __119___ActivityBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke;
  v66[3] = &unk_1E9C45190;
  v72 = MinX;
  v73 = v36;
  v74 = MaxX;
  v46 = v39;
  v67 = v46;
  v47 = v40;
  v68 = v47;
  v48 = v42;
  v69 = v48;
  v80 = v44;
  v75 = v81;
  v76 = v82;
  v77 = v83;
  v78 = v84;
  v49 = v41;
  v79 = v35;
  v70 = v49;
  v71 = self;
  v50 = *(_OWORD *)&a5->c;
  v65[0] = *(_OWORD *)&a5->a;
  v65[1] = v50;
  v65[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v17, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v65, 1, v66);

  -[_ActivityBarSeries missedGoalUnselectedFillStyle](self, "missedGoalUnselectedFillStyle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = v64;
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v47, v51, v20, v64, x, y, recta, height);
  }
  else
  {
    -[HKBarSeries unselectedFillStyle](self, "unselectedFillStyle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v64;
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v47, v53, v20, v64, x, y, recta, height);

  }
  -[HKBarSeries unselectedFillStyle](self, "unselectedFillStyle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v46, v54, v20, v52, x, y, recta, height);

  -[HKBarSeries selectedFillStyle](self, "selectedFillStyle");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (!v55)
  {
    -[HKBarSeries unselectedFillStyle](self, "unselectedFillStyle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v57;
  if (v57)
    v59 = (void *)v57;
  else
    v59 = v20;
  -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v49, v56, v59, v52, x, y, recta, height);

  if (!v55)
  -[_ActivityBarSeries pausedUnselectedFillStyle](self, "pausedUnselectedFillStyle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v48, v60, v20, v52, x, y, recta, height);
  }
  else
  {
    -[HKBarSeries unselectedFillStyle](self, "unselectedFillStyle");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v48, v61, v20, v52, x, y, recta, height);

  }
}

- (void)_drawPath:(id)a3 withFillStyle:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  id v19;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v19 = a3;
  v15 = a4;
  v16 = a5;
  if ((objc_msgSend(v19, "isEmpty") & 1) == 0)
  {
    if (v16)
    {
      CGContextSaveGState(a7);
      objc_msgSend(v16, "applyToContext:", a7);
      CGContextAddPath(a7, (CGPathRef)objc_msgSend(objc_retainAutorelease(v19), "CGPath"));
      CGContextStrokePath(a7);
      CGContextRestoreGState(a7);
    }
    if (v15)
    {
      v17 = objc_msgSend(objc_retainAutorelease(v19), "CGPath");
      -[HKGraphSeries alpha](self, "alpha");
      objc_msgSend(v15, "renderPath:context:axisRect:alpha:", v17, a7, x, y, width, height, v18);
    }
  }

}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (HKFillStyle)missedGoalUnselectedFillStyle
{
  return self->_missedGoalUnselectedFillStyle;
}

- (void)setMissedGoalUnselectedFillStyle:(id)a3
{
  objc_storeStrong((id *)&self->_missedGoalUnselectedFillStyle, a3);
}

- (HKFillStyle)pausedUnselectedFillStyle
{
  return self->_pausedUnselectedFillStyle;
}

- (void)setPausedUnselectedFillStyle:(id)a3
{
  objc_storeStrong((id *)&self->_pausedUnselectedFillStyle, a3);
}

- (HKActivityBarSeriesDelegate)activityBarDelegate
{
  return (HKActivityBarSeriesDelegate *)objc_loadWeakRetained((id *)&self->_activityBarDelegate);
}

- (void)setActivityBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activityBarDelegate, a3);
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (int64_t)activityDisplayTypeIdentifier
{
  return self->_activityDisplayTypeIdentifier;
}

- (void)setActivityDisplayTypeIdentifier:(int64_t)a3
{
  self->_activityDisplayTypeIdentifier = a3;
}

- (double)lastLegendUpdateTime
{
  return self->_lastLegendUpdateTime;
}

- (void)setLastLegendUpdateTime:(double)a3
{
  self->_lastLegendUpdateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_destroyWeak((id *)&self->_activityBarDelegate);
  objc_storeStrong((id *)&self->_pausedUnselectedFillStyle, 0);
  objc_storeStrong((id *)&self->_missedGoalUnselectedFillStyle, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
}

@end
