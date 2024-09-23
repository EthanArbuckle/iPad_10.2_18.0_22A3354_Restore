@implementation HKSleepStageDaySeries

- (HKSleepStageDaySeries)init
{
  HKSleepStageDaySeries *v2;
  HKSleepStageDaySeries *v3;
  NSArray *sleepStageFillStylesStorage;
  HKFillStyle *sleepStageBackgroundFillStyleStorage;
  HKFillStyle *sleepStageBackgroundInactiveFillStyleStorage;
  UIFont *sleepStageLabelFontStorage;
  UIColor *sleepStageLabelColorStorage;
  NSLock *v9;
  NSLock *seriesMutableStateLock;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKSleepStageDaySeries;
  v2 = -[HKGraphSeries init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
    sleepStageFillStylesStorage = v2->_sleepStageFillStylesStorage;
    v2->_sleepStageFillStylesStorage = (NSArray *)MEMORY[0x1E0C9AA60];

    sleepStageBackgroundFillStyleStorage = v3->_sleepStageBackgroundFillStyleStorage;
    v3->_sleepStageBackgroundFillStyleStorage = 0;

    sleepStageBackgroundInactiveFillStyleStorage = v3->_sleepStageBackgroundInactiveFillStyleStorage;
    v3->_sleepStageBackgroundInactiveFillStyleStorage = 0;

    sleepStageLabelFontStorage = v3->_sleepStageLabelFontStorage;
    v3->_sleepStageLabelFontStorage = 0;

    sleepStageLabelColorStorage = v3->_sleepStageLabelColorStorage;
    v3->_sleepStageLabelColorStorage = 0;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v3->_seriesMutableStateLock;
    v3->_seriesMutableStateLock = v9;

    -[NSLock setName:](v3->_seriesMutableStateLock, "setName:", CFSTR("HKSleepStageDaySeriesLock"));
  }
  return v3;
}

- (CGSize)cornerRadii
{
  void *v3;
  CGFloat width;
  CGFloat height;
  void *v6;
  double v7;
  double v8;
  CGSize result;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  width = self->_cornerRadiiStorage.width;
  height = self->_cornerRadiiStorage.height;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setCornerRadii:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  id v7;

  height = a3.height;
  width = a3.width;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  self->_cornerRadiiStorage.width = width;
  self->_cornerRadiiStorage.height = height;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKFillStyle)sleepStageBackgroundFillStyle
{
  void *v3;
  HKFillStyle *v4;
  void *v5;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_sleepStageBackgroundFillStyleStorage;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSleepStageBackgroundFillStyle:(id)a3
{
  id v4;
  void *v5;
  HKFillStyle *v6;
  HKFillStyle *sleepStageBackgroundFillStyleStorage;
  id v8;

  v4 = a3;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKFillStyle *)objc_msgSend(v4, "copy");
  sleepStageBackgroundFillStyleStorage = self->_sleepStageBackgroundFillStyleStorage;
  self->_sleepStageBackgroundFillStyleStorage = v6;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKFillStyle)sleepStageBackgroundInactiveFillStyle
{
  void *v3;
  HKFillStyle *v4;
  void *v5;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_sleepStageBackgroundInactiveFillStyleStorage;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSleepStageBackgroundInactiveFillStyle:(id)a3
{
  id v4;
  void *v5;
  HKFillStyle *v6;
  HKFillStyle *sleepStageBackgroundInactiveFillStyleStorage;
  id v8;

  v4 = a3;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKFillStyle *)objc_msgSend(v4, "copy");
  sleepStageBackgroundInactiveFillStyleStorage = self->_sleepStageBackgroundInactiveFillStyleStorage;
  self->_sleepStageBackgroundInactiveFillStyleStorage = v6;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (NSArray)sleepStageFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_sleepStageFillStylesStorage;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSleepStageFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *sleepStageFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  sleepStageFillStylesStorage = self->_sleepStageFillStylesStorage;
  self->_sleepStageFillStylesStorage = v6;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (NSNumber)highlightedSleepStage
{
  void *v3;
  NSNumber *v4;
  void *v5;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_highlightedSleepStageStorage;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setHighlightedSleepStage:(id)a3
{
  NSNumber *v4;
  void *v5;
  NSNumber *highlightedSleepStageStorage;
  void *v7;

  v4 = (NSNumber *)a3;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  highlightedSleepStageStorage = self->_highlightedSleepStageStorage;
  self->_highlightedSleepStageStorage = v4;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[HKSleepStageDaySeries _rebuildFillStyles](self, "_rebuildFillStyles");
}

- (UIFont)sleepStageLabelFont
{
  void *v3;
  UIFont *v4;
  void *v5;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_sleepStageLabelFontStorage;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSleepStageLabelFont:(id)a3
{
  UIFont *v4;
  void *v5;
  UIFont *sleepStageLabelFontStorage;
  id v7;

  v4 = (UIFont *)a3;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  sleepStageLabelFontStorage = self->_sleepStageLabelFontStorage;
  self->_sleepStageLabelFontStorage = v4;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (UIColor)sleepStageLabelColor
{
  void *v3;
  UIColor *v4;
  void *v5;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_sleepStageLabelColorStorage;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSleepStageLabelColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *sleepStageLabelColorStorage;
  id v7;

  v4 = (UIColor *)a3;
  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  sleepStageLabelColorStorage = self->_sleepStageLabelColorStorage;
  self->_sleepStageLabelColorStorage = v4;

  -[HKSleepStageDaySeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (int64_t)overlayType
{
  return 2;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v18;
  __int128 v19;
  int64_t resolution;
  _QWORD v21[4];
  id v22;
  HKSleepStageDaySeries *v23;
  id v24;

  v10 = a5;
  objc_msgSend(a3, "chartPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepStageDaySeries.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v10, "transform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__HKSleepStageDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v21[3] = &unk_1E9C454E8;
  v22 = v12;
  v23 = self;
  v24 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);
  v19 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v14, &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __67__HKSleepStageDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  HKSleepStageDayCoordinate *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HKSleepStageDayCoordinate *v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v20, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v20, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateForValue:", v9);
    v11 = v10;

    objc_msgSend(*(id *)(a1 + 40), "highlightedSleepStage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v20, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAnnotationOverridePrefixColorsActive:", MEMORY[0x1E0C9AAA0]);

    }
    v14 = *(void **)(a1 + 48);
    v15 = [HKSleepStageDayCoordinate alloc];
    objc_msgSend(v20, "yValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (int)objc_msgSend(v16, "intValue");
    objc_msgSend(v20, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HKSleepStageDayCoordinate initWithXValueStart:xValueEnd:sleepStage:userInfo:](v15, "initWithXValueStart:xValueEnd:sleepStage:userInfo:", v17, v18, v7, v11);
    objc_msgSend(v14, "addObject:", v19);

  }
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  unsigned int v32;
  BOOL v33;
  __int128 v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v41;
  _OWORD v43[3];
  _QWORD v44[4];
  id v45;
  HKSleepStageDaySeries *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  BOOL v59;
  _QWORD v60[8];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v60[6] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0DC3508];
  v41 = a3;
  objc_msgSend(v14, "bezierPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v15;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v16;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v17;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v18;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v19;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  v23 = 6;
  v24 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKSleepStageDaySeries cornerRadii](self, "cornerRadii");
  v27 = v26;
  v29 = v28;
  -[HKSleepStageDaySeries highlightedSleepStage](self, "highlightedSleepStage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v32 = objc_msgSend(v30, "intValue");
    if (v32 > 5)
      v23 = 0;
    else
      v23 = qword_1D7B82A40[v32];
  }
  v33 = -[HKGraphSeries allowsSelection](self, "allowsSelection");
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __164__HKSleepStageDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v44[3] = &unk_1E9C45510;
  v59 = v33;
  v45 = v31;
  v46 = self;
  v51 = x;
  v52 = y;
  v53 = width;
  v54 = height;
  v55 = v27;
  v56 = v29;
  v57 = v27 + 0.75;
  v58 = v29 + 0.75;
  v47 = v22;
  v48 = v24;
  v49 = v25;
  v50 = v23;
  v34 = *(_OWORD *)&a6->c;
  v43[0] = *(_OWORD *)&a6->a;
  v43[1] = v34;
  v43[2] = *(_OWORD *)&a6->tx;
  v35 = v25;
  v36 = v24;
  v37 = v22;
  v38 = v31;
  objc_msgSend(v41, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v43, 1, v44);

  -[HKSleepStageDaySeries _drawStagesBackgroundWithRects:buildPath:cornerRadii:highlightedSleepStage:axisRect:renderContext:](self, "_drawStagesBackgroundWithRects:buildPath:cornerRadii:highlightedSleepStage:axisRect:renderContext:", v35, v36, v38, a7, v27 + 0.75, v29 + 0.75, x, y, width, height);
  -[HKSleepStageDaySeries sleepStageFillStyles](self, "sleepStageFillStyles");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepStageDaySeries _drawPaths:withFillStyles:axisRect:context:](self, "_drawPaths:withFillStyles:axisRect:context:", v37, v39, a7, x, y, width, height);

}

void __164__HKSleepStageDaySeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a2;
  objc_msgSend(v38, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v38, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepDaySummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v38, "sleepStage") == 5 || (v7 = objc_msgSend(v38, "sleepStage"), v8 = v38, v7 == 4))
  {
    v9 = 0;
    v10 = (objc_msgSend(v6, "hasSleepStageData") & 1) == 0 && *(_BYTE *)(a1 + 144) != 0;
    v8 = v38;
  }
  else
  {
    v10 = 0;
    v9 = 1;
  }
  v11 = *(unsigned __int8 *)(a1 + 144);
  if (*(_BYTE *)(a1 + 144))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v12 = *(_QWORD *)(a1 + 72);
      v13 = objc_msgSend(v8, "sleepStage");
      v8 = v38;
      v11 = v12 == v13;
      v14 = *(_BYTE *)(a1 + 144) == 0;
    }
    else
    {
      v14 = 0;
      v11 = 1;
    }
  }
  else
  {
    v14 = 1;
  }
  v15 = v10 || v14;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "_nonSleepStageBarRectForCoordinate:axisRect:", v8, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
  }
  else
  {
    v24 = v9 & v11;
    objc_msgSend(*(id *)(a1 + 40), "_sleepStageBarRectForCoordinate:axisRect:", v8, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v17 = v25;
    v19 = v26;
    v21 = v27;
    v23 = v28;
    if (v24 != 1)
      goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v38, "sleepStage"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, v17, v19, v21, v23, *(double *)(a1 + 112), *(double *)(a1 + 120));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendPath:", v30);

LABEL_20:
  if (!v15)
  {
    v31 = v17 + -1.5;
    v32 = v19 + -1.5;
    v33 = v21 + 3.0;
    v34 = v23 + 3.0;
    +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, v31, v32, v33, v34, *(double *)(a1 + 128), *(double *)(a1 + 136));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "appendPath:", v35);
    v36 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v31, v32, v33, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v37);

  }
}

- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 axisRect:(CGRect)a5 context:(CGContext *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v19 = a3;
  v13 = a4;
  if (objc_msgSend(v19, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEmpty") & 1) == 0)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_msgSend(objc_retainAutorelease(v15), "CGPath");
          -[HKGraphSeries alpha](self, "alpha");
          objc_msgSend(v16, "renderPath:context:axisRect:alpha:", v17, a6, x, y, width, height, v18);
        }

      }
      ++v14;
    }
    while (v14 < objc_msgSend(v19, "count"));
  }

}

- (void)_drawStagesBackgroundWithRects:(id)a3 buildPath:(id)a4 cornerRadii:(CGSize)a5 highlightedSleepStage:(id)a6 axisRect:(CGRect)a7 renderContext:(CGContext *)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v34 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  -[HKSleepStageDaySeries mergeOverlappingRects:](self, "mergeOverlappingRects:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "CGRectValue");
        +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendPath:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v19);
  }
  -[HKSleepStageDaySeries _buildConnectionPathFromBackgroundRects:](self, "_buildConnectionPathFromBackgroundRects:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendPath:", v23);
  if (a6)
    -[HKSleepStageDaySeries sleepStageBackgroundInactiveFillStyle](self, "sleepStageBackgroundInactiveFillStyle");
  else
    -[HKSleepStageDaySeries sleepStageBackgroundFillStyle](self, "sleepStageBackgroundFillStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepStageDaySeries _drawPaths:withFillStyles:axisRect:context:](self, "_drawPaths:withFillStyles:axisRect:context:", v25, v26, a8, x, y, width, height);

}

- (id)_buildConnectionPathFromBackgroundRects:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v7)
  {
    v8 = v7;
    v30 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "CGRectValue");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v18 = v6;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v32 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "CGRectValue");
              if (v23 > v11 && v23 <= v11 + v15)
              {
                -[HKSleepStageDaySeries _buildConnectionFromStageRect:toStageRect:](self, "_buildConnectionFromStageRect:toStageRect:", v11, v13, v15, v17, v23, v24, v25, v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "appendPath:", v28);

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v20);
        }

      }
      v8 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mergeOverlappingRects:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5 = 0;
    do
    {
      v6 = v5 + 1;
      v7 = v5 + 1;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "CGRectValue");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;

        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "CGRectValue");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;

        v28.origin.x = v10;
        v28.origin.y = v12;
        v28.size.width = v14;
        v28.size.height = v16;
        v31.origin.x = v19;
        v31.origin.y = v21;
        v31.size.width = v23;
        v31.size.height = v25;
        if (CGRectIntersectsRect(v28, v31) && vabdd_f64(v16, v25) < 0.1 && vabdd_f64(v12, v21) < 0.1)
        {
          v29.origin.x = v10;
          v29.origin.y = v12;
          v29.size.width = v14;
          v29.size.height = v16;
          v32.origin.x = v19;
          v32.origin.y = v21;
          v32.size.width = v23;
          v32.size.height = v25;
          v30 = CGRectUnion(v29, v32);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:atIndexedSubscript:", v26, v5);

          objc_msgSend(v4, "removeObjectAtIndex:", v7);
        }
        else
        {
          ++v7;
        }
      }
      while (v7 < objc_msgSend(v4, "count"));
      ++v5;
    }
    while (v6 < objc_msgSend(v4, "count") - 1);
  }

  return v4;
}

- (id)_buildConnectionFromStageRect:(CGRect)a3 toStageRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  -[HKSleepStageDaySeries cornerRadii](self, "cornerRadii");
  v18 = v14;
  -[HKSleepStageDaySeries determineTopConnectionPathFromRect:toRect:cornerRadius:](self, "determineTopConnectionPathFromRect:toRect:cornerRadius:", v11, v10, v9, v8, x, y, width, height, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startPoint");
  objc_msgSend(v13, "moveToPoint:");
  -[HKSleepStageDaySeries _addSomnogramConnectionPath:toBezierPath:](self, "_addSomnogramConnectionPath:toBezierPath:", v15, v13);
  -[HKSleepStageDaySeries determineBottomConnectionPathFromRect:toRect:cornerRadius:](self, "determineBottomConnectionPathFromRect:toRect:cornerRadius:", v11, v10, v9, v8, x, y, width, height, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startPoint");
  objc_msgSend(v13, "addLineToPoint:");
  -[HKSleepStageDaySeries _addSomnogramConnectionPath:toBezierPath:](self, "_addSomnogramConnectionPath:toBezierPath:", v16, v13);
  objc_msgSend(v13, "closePath");

  return v13;
}

- (id)determineTopConnectionPathFromRect:(CGRect)a3 toRect:(CGRect)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  HKSleepSomnogramBar *v9;
  HKSleepSomnogramBar *v10;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  HKSleepSomnogramConnection *v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", x, y, width, height);
  v11 = a5 * 1.5;
  switch(HKSleepSomnogramConnectionOrientationForBars(v9, v10, 1))
  {
    case 0:
    case 1:
      -[HKSleepSomnogramBar left](v10, "left");
      v13 = v12;
      -[HKSleepSomnogramBar top](v10, "top");
      v15 = v14 + a5;
      -[HKSleepSomnogramBar left](v10, "left");
      v17 = v16;
      -[HKSleepSomnogramBar left](v9, "left");
      v19 = v17 - v18;
      -[HKSleepSomnogramBar left](v10, "left");
      v21 = v20;
      if (v19 < v11)
        goto LABEL_9;
      v21 = v20 - a5;
      -[HKSleepSomnogramBar top](v9, "top");
      goto LABEL_13;
    case 2:
      -[HKSleepSomnogramBar right](v9, "right");
      v21 = v23;
      -[HKSleepSomnogramBar top](v9, "top");
      v25 = v24 + a5;
      -[HKSleepSomnogramBar right](v10, "right");
      v27 = v26;
      -[HKSleepSomnogramBar right](v9, "right");
      if (v27 - v28 >= v11)
      {
        -[HKSleepSomnogramBar right](v9, "right");
        v13 = v42 + a5;
LABEL_11:
        -[HKSleepSomnogramBar top](v10, "top");
        v15 = v43;
      }
      else
      {
        -[HKSleepSomnogramBar right](v10, "right");
        v13 = v29;
        -[HKSleepSomnogramBar top](v10, "top");
        v15 = v30 + a5;
      }
LABEL_14:
      v44 = -[HKSleepSomnogramConnection initWithStartPoint:endPoint:]([HKSleepSomnogramConnection alloc], "initWithStartPoint:endPoint:", v21, v25, v13, v15);

      return v44;
    case 3:
      -[HKSleepSomnogramBar right](v10, "right");
      v13 = v34;
      -[HKSleepSomnogramBar top](v10, "top");
      v15 = v35 + a5;
      -[HKSleepSomnogramBar right](v9, "right");
      v37 = v36;
      -[HKSleepSomnogramBar right](v10, "right");
      v39 = v37 - v38;
      -[HKSleepSomnogramBar right](v10, "right");
      v21 = v40;
      if (v39 >= v11)
      {
        v21 = v40 + a5;
        -[HKSleepSomnogramBar bottom](v9, "bottom");
LABEL_13:
        v25 = v22;
      }
      else
      {
LABEL_9:
        -[HKSleepSomnogramBar top](v9, "top");
        v25 = v41 + a5;
      }
      goto LABEL_14;
    case 4:
      -[HKSleepSomnogramBar horizontalMidpoint](v9, "horizontalMidpoint");
      v21 = v31;
      -[HKSleepSomnogramBar top](v9, "top");
      v25 = v32;
      -[HKSleepSomnogramBar horizontalMidpoint](v10, "horizontalMidpoint");
      v13 = v33;
      goto LABEL_11;
    default:
      v13 = *MEMORY[0x1E0C9D538];
      v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v25 = v15;
      v21 = *MEMORY[0x1E0C9D538];
      goto LABEL_14;
  }
}

- (id)determineBottomConnectionPathFromRect:(CGRect)a3 toRect:(CGRect)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  HKSleepSomnogramBar *v9;
  HKSleepSomnogramBar *v10;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  HKSleepSomnogramConnection *v45;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = -[HKSleepSomnogramBar initWithBarRect:]([HKSleepSomnogramBar alloc], "initWithBarRect:", x, y, width, height);
  v11 = a5 * 1.5;
  switch(HKSleepSomnogramConnectionOrientationForBars(v9, v10, 0))
  {
    case 0:
    case 1:
      -[HKSleepSomnogramBar left](v10, "left");
      v13 = v12;
      -[HKSleepSomnogramBar bottom](v10, "bottom");
      v15 = v14 - a5;
      -[HKSleepSomnogramBar left](v10, "left");
      v17 = v16;
      -[HKSleepSomnogramBar left](v9, "left");
      v19 = v17 - v18;
      -[HKSleepSomnogramBar left](v10, "left");
      v21 = v20;
      if (v19 >= v11)
      {
        v21 = v20 - a5;
        goto LABEL_11;
      }
      -[HKSleepSomnogramBar bottom](v9, "bottom");
      v23 = v22 - a5;
      break;
    case 2:
      -[HKSleepSomnogramBar right](v9, "right");
      v21 = v24;
      -[HKSleepSomnogramBar bottom](v9, "bottom");
      v23 = v25 - a5;
      -[HKSleepSomnogramBar right](v10, "right");
      v27 = v26;
      -[HKSleepSomnogramBar right](v9, "right");
      v29 = v27 - v28;
      -[HKSleepSomnogramBar right](v9, "right");
      v13 = v30;
      if (v29 >= v11)
      {
        v13 = v30 + a5;
        -[HKSleepSomnogramBar bottom](v10, "bottom");
        v15 = v44;
      }
      else
      {
        -[HKSleepSomnogramBar bottom](v10, "bottom");
        v15 = v31 - a5;
      }
      break;
    case 3:
      -[HKSleepSomnogramBar right](v10, "right");
      v13 = v35;
      -[HKSleepSomnogramBar top](v10, "top");
      v15 = v36 + a5;
      -[HKSleepSomnogramBar right](v9, "right");
      v38 = v37;
      -[HKSleepSomnogramBar right](v10, "right");
      v40 = v38 - v39;
      -[HKSleepSomnogramBar right](v10, "right");
      v21 = v41;
      if (v40 >= v11)
      {
        v21 = v41 + a5;
        -[HKSleepSomnogramBar top](v9, "top");
        goto LABEL_14;
      }
      -[HKSleepSomnogramBar top](v9, "top");
      v23 = v42 + a5;
      break;
    case 4:
      -[HKSleepSomnogramBar horizontalMidpoint](v10, "horizontalMidpoint");
      v13 = v32;
      -[HKSleepSomnogramBar bottom](v10, "bottom");
      v15 = v33;
      -[HKSleepSomnogramBar horizontalMidpoint](v9, "horizontalMidpoint");
      v21 = v34;
LABEL_11:
      -[HKSleepSomnogramBar bottom](v9, "bottom");
LABEL_14:
      v23 = v43;
      break;
    default:
      v21 = *MEMORY[0x1E0C9D538];
      v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v15 = v23;
      v13 = *MEMORY[0x1E0C9D538];
      break;
  }
  v45 = -[HKSleepSomnogramConnection initWithStartPoint:endPoint:]([HKSleepSomnogramConnection alloc], "initWithStartPoint:endPoint:", v13, v15, v21, v23);

  return v45;
}

- (void)_addSomnogramConnectionPath:(id)a3 toBezierPath:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a4;
  v5 = a3;
  objc_msgSend(v5, "startPoint");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "endPoint");
  v11 = v10;
  v13 = v12;

  if (v9 == v13)
    goto LABEL_2;
  v14 = v22;
  if (v7 == v11)
    goto LABEL_4;
  v15 = vabdd_f64(v11, v7);
  if (v7 >= v11 || v9 <= v13)
  {
    if (v7 >= v11 || v9 >= v13)
    {
      if (v7 <= v11 || v9 <= v13)
      {
        v16 = v9 + v15;
        v17 = 4.71238898;
        v18 = 3.14159265;
        goto LABEL_17;
      }
      v19 = v13 + v15;
      objc_msgSend(v22, "addLineToPoint:", v7, v19);
      v20 = 6.28318531;
      v21 = 4.71238898;
    }
    else
    {
      v19 = v13 - v15;
      objc_msgSend(v22, "addLineToPoint:", v7, v19);
      v20 = 3.14159265;
      v21 = 1.57079633;
    }
    objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v19, v15, v20, v21);
    goto LABEL_5;
  }
  v16 = v9 - v15;
  v17 = 1.57079633;
  v18 = 6.28318531;
LABEL_17:
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v7, v16, v15, v17, v18);
LABEL_2:
  v14 = v22;
LABEL_4:
  objc_msgSend(v14, "addLineToPoint:", v11, v13);
LABEL_5:

}

- (void)drawOverlayInContext:(CGContext *)a3 seriesOverlayData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD v31[3];

  v6 = a4;
  if (objc_msgSend(v6, "count") == 1 && -[HKGraphSeries allowsSelection](self, "allowsSelection"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "graphSeriesCoordinates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v7, "graphSeriesPointTransform");
    else
      memset(v31, 0, sizeof(v31));
    objc_msgSend(v7, "graphSeriesScreenRect");
    -[HKSleepStageDaySeries _visibleSleepStagesInBlockCoordinates:pointTransform:screenRect:](self, "_visibleSleepStagesInBlockCoordinates:pointTransform:screenRect:", v9, v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9CEA6D0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isSubsetOfSet:", v11) && objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9CEA6E8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToSet:", v12);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v13 & 1) != 0)
      {
        v16 = CFSTR("IN_BED");
        v17 = CFSTR("HealthUI-Localizable");
      }
      else
      {
        v16 = CFSTR("ASLEEP_UNSPECIFIED");
        v17 = CFSTR("HealthUI-Localizable-Acacia");
      }
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E9C4C428, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "graphSeriesScreenRect");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v7, "graphSeriesScreenRect");
      -[HKSleepStageDaySeries _drawLabelAndRuleLineForString:inRect:horizontalOffset:verticalOffset:axisRect:context:](self, "_drawLabelAndRuleLineForString:inRect:horizontalOffset:verticalOffset:axisRect:context:", v18, a3, v20, v22, v24, v26, 6.0, 6.0, v27, v28, v29, v30);

    }
    else
    {
      objc_msgSend(v7, "graphSeriesScreenRect");
      -[HKSleepStageDaySeries _drawSleepStageLabels:axisRect:](self, "_drawSleepStageLabels:axisRect:", a3);
    }

  }
}

- (void)_drawSleepStageLabels:(CGContext *)a3 axisRect:(CGRect)a4
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
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[6];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v31[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("STAGES_OVERLAY_CONTEXT_AWAKE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("STAGES_OVERLAY_CONTEXT_REM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("STAGES_OVERLAY_CONTEXT_CORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("STAGES_OVERLAY_CONTEXT_DEEP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22);
        -[HKSleepStageDaySeries _enumerationRectForStage:axisRect:](self, "_enumerationRectForStage:axisRect:", v20 + v22, x, y, width, height);
        -[HKSleepStageDaySeries _drawLabelAndRuleLineForString:inRect:horizontalOffset:verticalOffset:axisRect:context:](self, "_drawLabelAndRuleLineForString:inRect:horizontalOffset:verticalOffset:axisRect:context:", v23, a3, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v20 += v22;
    }
    while (v19);
  }

}

- (void)_drawLabelAndRuleLineForString:(id)a3 inRect:(CGRect)a4 horizontalOffset:(double)a5 verticalOffset:(double)a6 axisRect:(CGRect)a7 context:(CGContext *)a8
{
  double height;
  double y;
  double x;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGColor *v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  _QWORD v28[2];
  _QWORD v29[3];

  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v29[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  -[HKSleepStageDaySeries sleepStageLabelFont](self, "sleepStageLabelFont");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[HKSleepStageDaySeries sleepStageLabelColor](self, "sleepStageLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v28[0] = *MEMORY[0x1E0DC1138];
      -[HKSleepStageDaySeries sleepStageLabelFont](self, "sleepStageLabelFont");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v19;
      v28[1] = *MEMORY[0x1E0DC1140];
      -[HKSleepStageDaySeries sleepStageLabelColor](self, "sleepStageLabelColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKSleepStageDaySeries sleepStageLabelColor](self, "sleepStageLabelColor");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = (CGColor *)objc_msgSend(v22, "CGColor");

      objc_msgSend(v15, "sizeWithAttributes:", v21);
      objc_msgSend(v15, "drawInRect:withAttributes:", v21, x + a5, y + a6, v24, v25);
      v26 = y + height;
      CGContextSetStrokeColorWithColor(a8, v23);
      v27 = HKUIOnePixel();
      CGContextSetLineWidth(a8, v27);
      CGContextMoveToPoint(a8, a7.origin.x, v26);
      CGContextAddLineToPoint(a8, a7.origin.x + a7.size.width, v26);
      CGContextStrokePath(a8);

    }
  }

}

- (id)_visibleSleepStagesInBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5
{
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGRect v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__HKSleepStageDaySeries__visibleSleepStagesInBlockCoordinates_pointTransform_screenRect___block_invoke;
  v7[3] = &__block_descriptor_112_e35__16__0__HKSleepStageDayCoordinate_8l;
  v5 = *(_OWORD *)&a4->c;
  v8 = *(_OWORD *)&a4->a;
  v9 = v5;
  v10 = *(_OWORD *)&a4->tx;
  v11 = a5;
  objc_msgSend(a3, "hk_mapToSet:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __89__HKSleepStageDaySeries__visibleSleepStagesInBlockCoordinates_pointTransform_screenRect___block_invoke(double *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "startXValue");
  v5 = a1[8] + a1[6] * 0.0 + a1[4] * v4;
  v6 = a1[10];
  if (v5 >= v6 && v5 <= v6 + a1[12])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "sleepStage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a4;
  -[HKSleepStageDaySeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v14 = v13;
  -[HKSleepStageDaySeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepStageDaySeries.m"), 867, CFSTR("xAxisSelectedCoordinate type class failure"));

  }
  v9 = v8;
  objc_msgSend(v9, "startXValue");
  if (v10 <= a3)
    v11 = a3;
  else
    v11 = v10;
  objc_msgSend(v9, "endXValue");
  v13 = v12;

  if (v11 < v13)
    v13 = v11;

  return v13;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;

  x = a3.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepStageDaySeries.m"), 877, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  v9 = v8;
  objc_msgSend(v9, "startXValue");
  v11 = v10 - x;
  objc_msgSend(v9, "endXValue");
  v13 = v12;

  v14 = fmax(v11, 0.0);
  if (x - v13 <= 0.0)
    v15 = v14;
  else
    v15 = x - v13;

  return v15;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  id v12;
  double v13;
  double v14;
  void *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.y;
  v12 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepStageDaySeries.m"), 892, CFSTR("yAxisDifferenceToPoint type class failure"));

  }
  -[HKSleepStageDaySeries _yAxisOffsetForCoordinate:axisRect:](self, "_yAxisOffsetForCoordinate:axisRect:", v12, x, y, width, height);
  v14 = v13 - v9;

  return v14;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  double v9;
  double v10;
  CGPoint result;

  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGRect)_nonSleepStageBarRectForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = y + (CGRectGetHeight(v16) + -40.0) * 0.5;
  objc_msgSend(v8, "xValueStart");
  v11 = v10;
  objc_msgSend(v8, "xValueEnd");
  v13 = v12;
  objc_msgSend(v8, "xValueStart");
  v15 = v14;

  v17.size.width = v13 - v15;
  v17.size.height = 40.0;
  v17.origin.x = v11;
  v17.origin.y = v9;
  return CGRectStandardize(v17);
}

- (CGRect)_sleepStageBarRectForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[HKSleepStageDaySeries _enumerationRectForStage:axisRect:](self, "_enumerationRectForStage:axisRect:", objc_msgSend(v9, "sleepStage"), x, y, width, height);
  if (v11 + -23.0 + -12.0 >= 6.0)
    v12 = v11 + -23.0 + -12.0;
  else
    v12 = 6.0;
  v13 = v10 + 23.0;
  objc_msgSend(v9, "xValueStart");
  v15 = v14;
  objc_msgSend(v9, "xValueEnd");
  v17 = v16;
  objc_msgSend(v9, "xValueStart");
  v19 = v18;

  v20.size.width = v17 - v19;
  v20.origin.x = v15;
  v20.origin.y = v13;
  v20.size.height = v12;
  return CGRectStandardize(v20);
}

- (CGRect)_enumerationRectForStage:(int64_t)a3 axisRect:(CGRect)a4
{
  CGFloat width;
  double y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = CGRectGetHeight(a4) * 0.25;
  v9 = y + v8;
  v10 = v8 * 3.0;
  if (a3 != 5)
  {
    v9 = y + (double)a3 * v8;
    v10 = v8;
  }
  v11 = v9 + 3.0;
  v12 = x;
  v13 = width;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (double)_yAxisOffsetForCoordinate:(id)a3 axisRect:(CGRect)a4
{
  double v4;

  -[HKSleepStageDaySeries _enumerationRectForStage:axisRect:](self, "_enumerationRectForStage:axisRect:", objc_msgSend(a3, "sleepStage"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return v4 + 23.0;
}

- (void)_rebuildFillStyles
{
  void *v3;
  id v4;

  -[HKSleepStageDaySeries highlightedSleepStage](self, "highlightedSleepStage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities sleepStageFillStylesWithActiveSleepStage:](HKSleepUtilities, "sleepStageFillStylesWithActiveSleepStage:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepStageDaySeries setSleepStageFillStyles:](self, "setSleepStageFillStyles:", v3);

}

- (CGSize)cornerRadiiStorage
{
  double width;
  double height;
  CGSize result;

  width = self->_cornerRadiiStorage.width;
  height = self->_cornerRadiiStorage.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCornerRadiiStorage:(CGSize)a3
{
  self->_cornerRadiiStorage = a3;
}

- (NSArray)sleepStageFillStylesStorage
{
  return self->_sleepStageFillStylesStorage;
}

- (void)setSleepStageFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (HKFillStyle)sleepStageBackgroundFillStyleStorage
{
  return self->_sleepStageBackgroundFillStyleStorage;
}

- (void)setSleepStageBackgroundFillStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (HKFillStyle)sleepStageBackgroundInactiveFillStyleStorage
{
  return self->_sleepStageBackgroundInactiveFillStyleStorage;
}

- (void)setSleepStageBackgroundInactiveFillStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)highlightedSleepStageStorage
{
  return self->_highlightedSleepStageStorage;
}

- (void)setHighlightedSleepStageStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (UIFont)sleepStageLabelFontStorage
{
  return self->_sleepStageLabelFontStorage;
}

- (void)setSleepStageLabelFontStorage:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStageLabelFontStorage, a3);
}

- (UIColor)sleepStageLabelColorStorage
{
  return self->_sleepStageLabelColorStorage;
}

- (void)setSleepStageLabelColorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStageLabelColorStorage, a3);
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_sleepStageLabelColorStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageLabelFontStorage, 0);
  objc_storeStrong((id *)&self->_highlightedSleepStageStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageBackgroundInactiveFillStyleStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageBackgroundFillStyleStorage, 0);
  objc_storeStrong((id *)&self->_sleepStageFillStylesStorage, 0);
}

@end
