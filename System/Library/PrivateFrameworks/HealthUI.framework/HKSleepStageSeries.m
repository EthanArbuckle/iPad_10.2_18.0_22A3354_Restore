@implementation HKSleepStageSeries

- (HKSleepStageSeries)init
{
  HKSleepStageSeries *v2;
  HKSleepStageSeries *v3;
  NSNumber *highlightedSleepStageStorage;
  NSArray *sleepStageFillStylesStorage;
  NSLock *v6;
  NSLock *seriesMutableStateLock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSleepStageSeries;
  v2 = -[HKSleepPeriodSeries init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    highlightedSleepStageStorage = v2->_highlightedSleepStageStorage;
    v2->_highlightedSleepStageStorage = 0;

    sleepStageFillStylesStorage = v3->_sleepStageFillStylesStorage;
    v3->_sleepStageFillStylesStorage = (NSArray *)MEMORY[0x1E0C9AA60];

    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v3->_seriesMutableStateLock;
    v3->_seriesMutableStateLock = v6;

    -[NSLock setName:](v3->_seriesMutableStateLock, "setName:", CFSTR("HKSleepStageSeriesLock"));
  }
  return v3;
}

- (NSNumber)highlightedSleepStage
{
  void *v3;
  NSNumber *v4;
  void *v5;

  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_highlightedSleepStageStorage;
  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
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
  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  highlightedSleepStageStorage = self->_highlightedSleepStageStorage;
  self->_highlightedSleepStageStorage = v4;

  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[HKSleepStageSeries _rebuildFillStyles](self, "_rebuildFillStyles");
}

- (NSArray)sleepStageFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_sleepStageFillStylesStorage;
  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
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
  void *v8;

  v4 = a3;
  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  sleepStageFillStylesStorage = self->_sleepStageFillStylesStorage;
  self->_sleepStageFillStylesStorage = v6;

  -[HKSleepStageSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  -[HKSleepStageSeries _rebuildFillStyles](self, "_rebuildFillStyles");
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
  id v27;
  HKSleepStageSeries *v28;
  id v29;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepStageSeries.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__HKSleepStageSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C44298;
  v26 = v14;
  v27 = v15;
  v28 = self;
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

void __64__HKSleepStageSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HKSleepStageCoordinate *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HKSleepStageCoordinate *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "yValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "xValueAsGenericType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinateForValue:", v6);
    v8 = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v3, "allYValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(a1 + 40), "coordinateForValue:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v12);
    }

    v16 = *(void **)(a1 + 48);
    objc_msgSend(v3, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "highlightedSleepStage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateChartPointUserInfo:forHighlightedSleepStage:", v17, v18);

    v29 = [HKSleepStageCoordinate alloc];
    objc_msgSend(v3, "asleepUnspecifiedOffsets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asleepDeepOffsets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asleepCoreOffsets");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asleepRemOffsets");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "awakeOffsets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inBedOffsets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allYValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v3, "highlighted");
    objc_msgSend(v3, "userInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = (_BYTE)v16;
    v23 = -[HKSleepStageCoordinate initWithXValue:asleepUnspecifiedYValues:asleepDeepYValues:asleepCoreYValues:asleepRemYValues:awakeValues:inBedYValues:yValues:highlighted:userInfo:](v29, "initWithXValue:asleepUnspecifiedYValues:asleepDeepYValues:asleepCoreYValues:asleepRemYValues:awakeValues:inBedYValues:yValues:highlighted:userInfo:", v27, v25, v28, v26, v19, v20, v8, v21, v24, v22);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);
  }

}

- (void)updateChartPointUserInfo:(id)a3 forHighlightedSleepStage:(id)a4
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setAnnotationOptions:", HKSleepChartPointFormatterOptionsForSleepAnalysis(a4));
  objc_msgSend(v7, "sleepDaySummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSleepStageData");

  if (v6)
  {
    objc_msgSend(v7, "setAnnotationOptions:", objc_msgSend(v7, "annotationOptions") | 0x40);
    objc_msgSend(v7, "setCurrentValueViewOptions:", objc_msgSend(v7, "currentValueViewOptions") | 0x40);
    objc_msgSend(v7, "setCurrentValueViewOptionsPriority:", 2);
  }

}

- (void)_drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 axisResolution:(double)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat MaxX;
  CGFloat MinX;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  id v53;
  void *v55;
  id v56;
  void *v57;
  _OWORD v58[3];
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[4];
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[4];
  _QWORD v89[5];
  id v90;
  _QWORD v91[5];
  id v92;
  _QWORD v93[8];
  CGRect v94;
  CGRect v95;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v93[6] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v56 = a9;
  v51 = objc_msgSend(v56, "seriesDrawingDuringTiling");
  if (v51
    && (-[HKSleepPeriodSeries tiledStrokeStyle](self, "tiledStrokeStyle"),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[HKSleepPeriodSeries tiledStrokeStyle](self, "tiledStrokeStyle");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKSleepPeriodSeries strokeStyle](self, "strokeStyle");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v57, "lineWidth");
  v19 = v18;
  objc_msgSend(v56, "screenRectForSeries:", self);
  -[HKSleepPeriodSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  v21 = v20;
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = width;
  v94.size.height = height;
  MaxX = CGRectGetMaxX(v94);
  v95.origin.x = x;
  v95.origin.y = y;
  v95.size.width = width;
  v95.size.height = height;
  MinX = CGRectGetMinX(v95);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v24;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v25;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v26;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v27;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v28;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_msgSend(v55, "mutableCopy");
  v31 = (void *)objc_msgSend(v55, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x3032000000;
  v91[3] = __Block_byref_object_copy__17;
  v91[4] = __Block_byref_object_dispose__17;
  v92 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__17;
  v89[4] = __Block_byref_object_dispose__17;
  v90 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v88[3] = 0xFFEFFFFFFFFFFFFFLL;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__17;
  v86[4] = __Block_byref_object_dispose__17;
  v87 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__17;
  v84[4] = __Block_byref_object_dispose__17;
  v85 = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v83[3] = 0xFFEFFFFFFFFFFFFFLL;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = v19 + v21 + v19 + v21;
  v37 = a8 / 86400.0 * 0.05;
  v59[1] = 3221225472;
  v38 = a8 / 86400.0 - v37;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[2] = __135__HKSleepStageSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke;
  v59[3] = &unk_1E9C442C0;
  v73 = MinX;
  v74 = v36;
  v39 = a8 / 86400.0 + v37;
  v75 = MaxX;
  v59[4] = self;
  v40 = v31;
  v60 = v40;
  v41 = v30;
  v61 = v41;
  v66 = &v79;
  v76 = v21;
  v77 = v38;
  v78 = v39;
  v67 = v88;
  v68 = v86;
  v69 = v83;
  v42 = v32;
  v62 = v42;
  v43 = v34;
  v63 = v43;
  v70 = v84;
  v44 = v33;
  v64 = v44;
  v45 = v35;
  v65 = v45;
  v71 = v91;
  v72 = v89;
  v46 = *(_OWORD *)&a5->c;
  v58[0] = *(_OWORD *)&a5->a;
  v58[1] = v46;
  v58[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v53, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v58, 1, v59);
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
    -[HKSleepPeriodSeries defaultFillStyles](self, "defaultFillStyles");
  else
    -[HKSleepPeriodSeries inactiveFillStyles](self, "inactiveFillStyles");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v41, v47, v57, a6, x, y, width, height);
  -[HKSleepPeriodSeries highlightedFillStyles](self, "highlightedFillStyles");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (!v48)
  {
    -[HKSleepPeriodSeries defaultFillStyles](self, "defaultFillStyles");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKSleepPeriodSeries drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "drawPaths:withFillStyles:strokeStyle:axisRect:context:", v40, v49, v57, a6, x, y, width, height);
  if (!v48)

  if (((v51 | objc_msgSend(v56, "measuringStartupTime") ^ 1) & 1) == 0 && v80[3] >= 1)
  {
    -[HKGraphSeries delegate](self, "delegate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "nonemptyDrawComplete");

  }
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v84, 8);

  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(v89, 8);

  _Block_object_dispose(v91, 8);
}

void __135__HKSleepStageSeries__drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_axisResolution_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  char v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  char v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;

  v59 = a2;
  v6 = a4;
  objc_msgSend(v59, "xValue");
  v8 = v7;
  v9 = *(double *)(a1 + 152);
  if (*(double *)(a1 + 144) - v8 <= v9 && v8 - *(double *)(a1 + 160) <= v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v59, "awakeValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_drawColumnForLayer:offsets:coordinate:selectedBezierPaths:unselectedBezierPaths:barWidth:pathCount:", 0, v11, v59, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(double *)(a1 + 168));

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v59, "asleepRemYValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    objc_msgSend(v12, "_drawColumnForLayer:offsets:coordinate:selectedBezierPaths:unselectedBezierPaths:barWidth:pathCount:", 1, v13, v59, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(double *)(a1 + 168));

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v59, "asleepCoreYValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_drawColumnForLayer:offsets:coordinate:selectedBezierPaths:unselectedBezierPaths:barWidth:pathCount:", 2, v16, v59, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(double *)(a1 + 168));

    v17 = *(void **)(a1 + 32);
    objc_msgSend(v59, "asleepDeepYValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_drawColumnForLayer:offsets:coordinate:selectedBezierPaths:unselectedBezierPaths:barWidth:pathCount:", 3, v18, v59, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(double *)(a1 + 168));

    v19 = *(void **)(a1 + 32);
    objc_msgSend(v59, "asleepUnspecifiedYValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_drawColumnForLayer:offsets:coordinate:selectedBezierPaths:unselectedBezierPaths:barWidth:pathCount:", 5, v20, v59, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(double *)(a1 + 168));

    v21 = *(void **)(a1 + 32);
    objc_msgSend(v59, "inBedYValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_drawColumnForLayer:offsets:coordinate:selectedBezierPaths:unselectedBezierPaths:barWidth:pathCount:", 4, v22, v59, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(double *)(a1 + 168));

    objc_msgSend(v6, "xValue");
    v24 = vabdd_f64(v23, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
    if (v24 >= *(double *)(a1 + 176))
      v14 = v24 > *(double *)(a1 + 184);
    objc_msgSend(v59, "upperGoalYValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v59;
    if (v25)
    {
      objc_msgSend(v59, "upperGoalYValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v29 = v28;

      v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      if (v30)
      {
        v31 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
        v32 = v31 >= v8 || v14;
        if ((v32 & 1) == 0)
        {
          objc_msgSend(v30, "doubleValue");
          objc_msgSend(*(id *)(a1 + 56), "moveToPoint:", v31, v33);
          objc_msgSend(*(id *)(a1 + 56), "addLineToPoint:", v8, v29);
        }
      }
      v34 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v8, v29);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v35);

      v26 = v59;
    }
    objc_msgSend(v26, "lowerGoalYValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v59, "lowerGoalYValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;

      v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
      if (v40)
      {
        v41 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
        v42 = v41 >= v8 || v14;
        if ((v42 & 1) == 0)
        {
          objc_msgSend(v40, "doubleValue");
          objc_msgSend(*(id *)(a1 + 72), "moveToPoint:", v41, v43);
          objc_msgSend(*(id *)(a1 + 72), "addLineToPoint:", v8, v39);
        }
      }
      v44 = *(void **)(a1 + 80);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v8, v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v45);

    }
    if (v8 <= *(double *)(a1 + 160))
    {
      objc_msgSend(v6, "upperGoalYValue");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
      v48 = *(void **)(v47 + 40);
      *(_QWORD *)(v47 + 40) = v46;

      objc_msgSend(v6, "lowerGoalYValue");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      v51 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = v49;

    }
    objc_msgSend(v6, "xValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v52;
    objc_msgSend(v59, "upperGoalYValue");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v55 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = v53;

    objc_msgSend(v59, "lowerGoalYValue");
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    v58 = *(void **)(v57 + 40);
    *(_QWORD *)(v57 + 40) = v56;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v8;
  }

}

- (void)_drawColumnForLayer:(int64_t)a3 offsets:(id)a4 coordinate:(id)a5 selectedBezierPaths:(id)a6 unselectedBezierPaths:(id)a7 barWidth:(double)a8 pathCount:(int64_t *)a9
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double x;
  double y;
  double width;
  double height;
  double v43;
  double v44;
  void *v45;
  id v46;
  int64_t *v47;
  id v48;
  CGRect v49;
  CGRect v50;

  v48 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v48, "count"))
  {
    v47 = a9;
    objc_msgSend(v16, "xValue");
    v20 = v19;
    v46 = v17;
    if (objc_msgSend(v16, "highlighted"))
      v21 = v17;
    else
      v21 = v18;
    objc_msgSend(v21, "objectAtIndexedSubscript:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v48, "count") < 2)
    {
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v25 = 1;
      v26 = v23;
      do
      {
        objc_msgSend(v48, "objectAtIndexedSubscript:", v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;

        objc_msgSend(v23, "value");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        if ((v25 & 1) != 0)
        {
          if (objc_msgSend(v26, "continuation"))
            v33 = 0;
          else
            v33 = 3;
          if (objc_msgSend(v23, "continuation"))
            v34 = v33;
          else
            v34 = v33 | 0xC;
          if (v32 - v29 >= 0.0)
            v35 = v32 - v29;
          else
            v35 = -(v32 - v29);
          v36 = v20;
          v37 = v29;
          v38 = a8;
          v49 = CGRectStandardize(*(CGRect *)(&v35 - 3));
          v50 = CGRectOffset(v49, a8 * -0.5, 0.0);
          x = v50.origin.x;
          y = v50.origin.y;
          width = v50.size.width;
          height = v50.size.height;
          -[HKSleepPeriodSeries cornerRadii](self, "cornerRadii");
          +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v34, x, y, width, height, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "appendPath:", v45);

          ++v24;
        }

        ++v25;
        v26 = v23;
      }
      while (v25 < objc_msgSend(v48, "count"));
    }
    *v47 = v24;

    v17 = v46;
  }

}

- (void)_rebuildFillStyles
{
  void *v3;
  id v4;

  -[HKSleepStageSeries highlightedSleepStage](self, "highlightedSleepStage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities sleepStageFillStylesWithActiveSleepStage:](HKSleepUtilities, "sleepStageFillStylesWithActiveSleepStage:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSleepPeriodSeries setHighlightedFillStyles:](self, "setHighlightedFillStyles:", v4);
  -[HKSleepPeriodSeries setDefaultFillStyles:](self, "setDefaultFillStyles:", v4);

}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  return a3;
}

- (NSNumber)highlightedSleepStageStorage
{
  return self->_highlightedSleepStageStorage;
}

- (void)setHighlightedSleepStageStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSArray)sleepStageFillStylesStorage
{
  return self->_sleepStageFillStylesStorage;
}

- (void)setSleepStageFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_sleepStageFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedSleepStageStorage, 0);
}

@end
