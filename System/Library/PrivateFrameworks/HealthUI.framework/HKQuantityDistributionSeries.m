@implementation HKQuantityDistributionSeries

- (HKQuantityDistributionSeries)init
{
  HKQuantityDistributionSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  HKStrokeStyle *inactiveStrokeStyleStorage;
  HKStrokeStyle *unselectedStrokeStyleStorage;
  HKStrokeStyle *selectedStrokeStyleStorage;
  HKAxisLabelStyle *minMaxLabelStyleStorage;
  HKAxisLabelStyle *minMaxValueStyleStorage;
  HKStrokeStyle *minMaxPointStyleStorage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKQuantityDistributionSeries;
  v2 = -[HKGraphSeries init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKQuantityDistributionSeriesLock"));
    inactiveStrokeStyleStorage = v2->_inactiveStrokeStyleStorage;
    v2->_inactiveStrokeStyleStorage = 0;

    unselectedStrokeStyleStorage = v2->_unselectedStrokeStyleStorage;
    v2->_unselectedStrokeStyleStorage = 0;

    selectedStrokeStyleStorage = v2->_selectedStrokeStyleStorage;
    v2->_selectedStrokeStyleStorage = 0;

    minMaxLabelStyleStorage = v2->_minMaxLabelStyleStorage;
    v2->_minMaxLabelStyleStorage = 0;

    minMaxValueStyleStorage = v2->_minMaxValueStyleStorage;
    v2->_minMaxValueStyleStorage = 0;

    minMaxPointStyleStorage = v2->_minMaxPointStyleStorage;
    v2->_minMaxPointStyleStorage = 0;

    v2->_excludeDistributionStorage = 0;
    v2->_zeroCountForGapStorage = 4;
    v2->_hollowLineRatioStorage = 0.0;
  }
  return v2;
}

- (HKStrokeStyle)inactiveStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_inactiveStrokeStyleStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setInactiveStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *inactiveStrokeStyleStorage;
  id v8;

  v4 = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  inactiveStrokeStyleStorage = self->_inactiveStrokeStyleStorage;
  self->_inactiveStrokeStyleStorage = v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKStrokeStyle)unselectedStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_unselectedStrokeStyleStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setUnselectedStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *unselectedStrokeStyleStorage;
  id v8;

  v4 = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  unselectedStrokeStyleStorage = self->_unselectedStrokeStyleStorage;
  self->_unselectedStrokeStyleStorage = v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKStrokeStyle)selectedStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedStrokeStyleStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *selectedStrokeStyleStorage;
  id v8;

  v4 = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  selectedStrokeStyleStorage = self->_selectedStrokeStyleStorage;
  self->_selectedStrokeStyleStorage = v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKAxisLabelStyle)minMaxLabelStyle
{
  void *v3;
  HKAxisLabelStyle *v4;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_minMaxLabelStyleStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setMinMaxLabelStyle:(id)a3
{
  id v4;
  void *v5;
  HKAxisLabelStyle *v6;
  HKAxisLabelStyle *minMaxLabelStyleStorage;
  id v8;

  v4 = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKAxisLabelStyle *)objc_msgSend(v4, "copy");
  minMaxLabelStyleStorage = self->_minMaxLabelStyleStorage;
  self->_minMaxLabelStyleStorage = v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKAxisLabelStyle)minMaxValueStyle
{
  void *v3;
  HKAxisLabelStyle *v4;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_minMaxValueStyleStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setMinMaxValueStyle:(id)a3
{
  id v4;
  void *v5;
  HKAxisLabelStyle *v6;
  HKAxisLabelStyle *minMaxValueStyleStorage;
  id v8;

  v4 = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKAxisLabelStyle *)objc_msgSend(v4, "copy");
  minMaxValueStyleStorage = self->_minMaxValueStyleStorage;
  self->_minMaxValueStyleStorage = v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKStrokeStyle)minMaxPointStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_minMaxPointStyleStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setMinMaxPointStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *minMaxPointStyleStorage;
  id v8;

  v4 = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  minMaxPointStyleStorage = self->_minMaxPointStyleStorage;
  self->_minMaxPointStyleStorage = v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (BOOL)excludeDistribution
{
  void *v3;
  void *v4;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_excludeDistributionStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setExcludeDistribution:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_excludeDistributionStorage = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (int64_t)zeroCountForGap
{
  void *v3;
  int64_t zeroCountForGapStorage;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  zeroCountForGapStorage = self->_zeroCountForGapStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return zeroCountForGapStorage;
}

- (void)setZeroCountForGap:(int64_t)a3
{
  void *v5;
  id v6;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_zeroCountForGapStorage = a3;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (double)hollowLineRatio
{
  void *v3;
  double hollowLineRatioStorage;
  void *v5;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  hollowLineRatioStorage = self->_hollowLineRatioStorage;
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return hollowLineRatioStorage;
}

- (void)setHollowLineRatio:(double)a3
{
  void *v5;
  double v6;
  id v7;

  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = 1.0;
  if (a3 <= 1.0)
    v6 = a3;
  self->_hollowLineRatioStorage = fmax(v6, 0.0);
  -[HKQuantityDistributionSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (id)_quickDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("MM/dd/YYYY-HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  double height;
  double y;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  height = a6.size.height;
  y = a6.origin.y;
  v9 = a3;
  -[HKQuantityDistributionSeries minMaxLabelStyle](self, "minMaxLabelStyle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        -[HKQuantityDistributionSeries minMaxValueStyle](self, "minMaxValueStyle"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v9)
    && v12
    && height > 0.0)
  {
    objc_msgSend(v9, "minValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
    objc_msgSend(v9, "maxValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    +[HKAxis expandByPointsLow:high:modelRange:pointRange:](HKAxis, "expandByPointsLow:high:modelRange:pointRange:", 36.0, 36.0, v15, v18, y, y + height);
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v21, v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v9;
  }

  return v23;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  __int128 v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  double v48;
  double v49;
  id v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  _QWORD *v58;
  uint64_t *v59;
  _QWORD *v60;
  uint64_t *v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGContext *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[3];
  BOOL v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  _QWORD v83[3];
  char v84;
  uint64_t v85;
  double *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[3];
  char v98;
  _QWORD v99[3];
  char v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v51 = a5;
  v50 = a8;
  v20 = a9;
  CGContextSaveGState(a7);
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
    -[HKQuantityDistributionSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
  else
    -[HKQuantityDistributionSeries inactiveStrokeStyle](self, "inactiveStrokeStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applyToContext:", a7);
  objc_msgSend(v21, "lineWidth");
  v23 = v22;
  -[HKQuantityDistributionSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lineWidth");
  v26 = v25;

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v52 = v20;
  objc_msgSend(v20, "virtualMarginInsets");
  v48 = v28;
  v49 = v27;
  v30 = v29;
  v32 = v31;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x2020000000;
  v100 = 1;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x2020000000;
  v98 = 1;
  v91 = 0;
  v92 = (double *)&v91;
  v93 = 0x3010000000;
  v96 = 0;
  v94 = &unk_1D7BC951A;
  v95 = 0;
  v85 = 0;
  v86 = (double *)&v85;
  v87 = 0x3010000000;
  v89 = 0;
  v90 = 0;
  v88 = &unk_1D7BC951A;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v84 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v78 = 0;
  v78 = -[HKQuantityDistributionSeries excludeDistribution](self, "excludeDistribution");
  v56[0] = MEMORY[0x1E0C809B0];
  if (v23 >= v26)
    v33 = v23;
  else
    v33 = v26;
  v56[1] = 3221225472;
  v56[2] = __171__HKQuantityDistributionSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v56[3] = &unk_1E9C435B0;
  v65 = x;
  v66 = y;
  v67 = width;
  v68 = height;
  v69 = v33;
  v70 = x + v30;
  v71 = x + width - v32;
  v59 = &v91;
  v60 = v97;
  v61 = &v85;
  v62 = v77;
  v72 = a7;
  v58 = v99;
  v56[4] = self;
  v76 = v104;
  v75 = v103;
  v74 = v102;
  v73 = v101;
  v63 = v83;
  v64 = &v79;
  v34 = v21;
  v57 = v34;
  v35 = *(_OWORD *)&a6->c;
  v53 = *(_OWORD *)&a6->a;
  v54 = v35;
  v55 = *(_OWORD *)&a6->tx;
  objc_msgSend(v19, "enumerateCoordinatesWithTransform:roundToViewScale:block:", &v53, 0, v56);
  v36 = objc_msgSend(v20, "seriesDrawingDuringScrolling");
  v37 = objc_msgSend(v20, "seriesDrawingDuringTiling");
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
  {
    if (!*((_BYTE *)v80 + 24))
    {
      -[HKQuantityDistributionSeries minMaxLabelStyle](self, "minMaxLabelStyle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        -[HKQuantityDistributionSeries minMaxValueStyle](self, "minMaxValueStyle");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
          v41 = v37;
        else
          v41 = 1;
        if (((v41 | v36) & 1) != 0)
        {

        }
        else
        {
          v42 = -[HKQuantityDistributionSeries excludeDistribution](self, "excludeDistribution");

          if (v42)
          {
            v43 = v92[4];
            v44 = v92[5];
            v45 = v86[4];
            v46 = v86[5];
            v47 = *(_OWORD *)&a6->c;
            v53 = *(_OWORD *)&a6->a;
            v54 = v47;
            v55 = *(_OWORD *)&a6->tx;
            -[HKQuantityDistributionSeries _drawMinMaxLabelsForMin:max:pointTransform:axisRect:context:](self, "_drawMinMaxLabelsForMin:max:pointTransform:axisRect:context:", &v53, a7, v43, v44, v45, v46, x + v30, y + v49, width - (v30 + v32), height - (v49 + v48));
          }
        }
      }
    }
  }
  CGContextRestoreGState(a7);

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(v97, 8);
  _Block_object_dispose(v99, 8);

}

void __171__HKQuantityDistributionSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  char v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGContext *v40;
  double v41;
  CGContext *v42;
  double v43;
  void *v44;
  unint64_t v45;
  double v46;
  CGContext *v47;
  double v48;
  double v49;
  CGContext *v50;
  id v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGContext *v67;
  double v68;
  CGContext *v69;
  double v70;
  void *v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76;
  void *v77;
  _OWORD v78[4];
  _OWORD v79[2];

  v7 = a2;
  v8 = a4;
  v9 = *(double *)(a1 + 104);
  v10 = *(double *)(a1 + 120);
  objc_msgSend(v7, "minPoint");
  v12 = v11;
  v13 = *(double *)(a1 + 136);
  if (v11 >= *(double *)(a1 + 104) - v13 && v11 <= v9 + v10 + v13)
  {
    objc_msgSend(v7, "distributionSegments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if ((v16 & 1) == 0)
    {
      if (v12 >= *(double *)(a1 + 144) && v12 <= *(double *)(a1 + 152))
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
          || (objc_msgSend(v8, "minPoint"), v17 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
        {
          objc_msgSend(v8, "minPoint");
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)(v18 + 32) = v19;
          *(_QWORD *)(v18 + 40) = v20;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
          || (objc_msgSend(v8, "maxPoint"), v21 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)))
        {
          objc_msgSend(v8, "maxPoint");
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          *(_QWORD *)(v22 + 32) = v23;
          *(_QWORD *)(v22 + 40) = v24;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        }
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        objc_msgSend(v7, "distributionSegments");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26)
        {
          v27 = 0;
          do
          {
            objc_msgSend(v7, "distributionSegments");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndexedSubscript:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "CGPointValue");
            v31 = v30;
            v33 = v32;

            objc_msgSend(v7, "distributionSegments");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", v27 + 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "CGPointValue");
            v37 = v36;
            v39 = v38;

            v40 = *(CGContext **)(a1 + 160);
            v41 = HKUIFloorToScreenScale(v31);
            CGContextMoveToPoint(v40, v41, v33);
            v42 = *(CGContext **)(a1 + 160);
            v43 = HKUIFloorToScreenScale(v37);
            CGContextAddLineToPoint(v42, v43, v39);
            CGContextStrokePath(*(CGContextRef *)(a1 + 160));
            objc_msgSend(v7, "distributionSegments");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "count");

            v27 += 2;
          }
          while (v27 < v45);
        }
        objc_msgSend(*(id *)(a1 + 32), "hollowLineRatio");
        if (v46 > 0.0)
        {
          CGContextSaveGState(*(CGContextRef *)(a1 + 160));
          v47 = *(CGContext **)(a1 + 160);
          v48 = *(double *)(a1 + 136);
          objc_msgSend(*(id *)(a1 + 32), "hollowLineRatio");
          CGContextSetLineWidth(v47, v48 * v49);
          v50 = *(CGContext **)(a1 + 160);
          objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
          v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CGContextSetStrokeColorWithColor(v50, (CGColorRef)objc_msgSend(v51, "CGColor"));

          objc_msgSend(v7, "distributionSegments");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "count");

          if (v53)
          {
            v54 = 0;
            do
            {
              objc_msgSend(v7, "distributionSegments");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectAtIndexedSubscript:", v54);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "CGPointValue");
              v58 = v57;
              v60 = v59;

              objc_msgSend(v7, "distributionSegments");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", v54 + 1);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "CGPointValue");
              v64 = v63;
              v66 = v65;

              v67 = *(CGContext **)(a1 + 160);
              v68 = HKUIFloorToScreenScale(v58);
              CGContextMoveToPoint(v67, v68, v60);
              v69 = *(CGContext **)(a1 + 160);
              v70 = HKUIFloorToScreenScale(v64);
              CGContextAddLineToPoint(v69, v70, v66);
              CGContextStrokePath(*(CGContextRef *)(a1 + 160));
              objc_msgSend(v7, "distributionSegments");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v71, "count");

              v54 += 2;
            }
            while (v54 < v72);
          }
          CGContextRestoreGState(*(CGContextRef *)(a1 + 160));
        }
      }
      v73 = a3[1];
      v79[0] = *a3;
      v79[1] = v73;
      v74 = *(_OWORD *)(a1 + 184);
      v78[0] = *(_OWORD *)(a1 + 168);
      v78[1] = v74;
      v75 = *(_OWORD *)(a1 + 216);
      v78[2] = *(_OWORD *)(a1 + 200);
      v78[3] = v75;
      if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v79, (uint64_t *)v78))
      {
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 32), "selectedStrokeStyle");
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (v76)
          {
            objc_msgSend(*(id *)(a1 + 32), "selectedStrokeStyle");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "applyToContext:", *(_QWORD *)(a1 + 160));

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
          }
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      }
      else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 40), "applyToContext:", *(_QWORD *)(a1 + 160));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      }
    }
  }

}

- (void)_drawMinMaxLabelsForMin:(CGPoint)a3 max:(CGPoint)a4 pointTransform:(CGAffineTransform *)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  CGFloat height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double a;
  double b;
  double v41;
  double d;
  double tx;
  double ty;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  BOOL v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  double v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  CGFloat v134;
  void *v135;
  void *v136;
  id v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double r1;
  void *r1a;
  double v152;
  double v153;
  double r2;
  double r2a;
  void *v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  void *v161;
  double x;
  double v163;
  double y;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  CGFloat v171;
  double v172;
  double rect;
  void *recta;
  _QWORD v175[4];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[4];
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;

  height = a6.size.height;
  width = a6.size.width;
  x = a6.origin.x;
  y = a6.origin.y;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v179[2] = *MEMORY[0x1E0C80C00];
  -[HKQuantityDistributionSeries minMaxLabelStyle](self, "minMaxLabelStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v16 = objc_claimAutoreleasedReturnValue();

  -[HKQuantityDistributionSeries minMaxLabelStyle](self, "minMaxLabelStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textColor");
  v18 = objc_claimAutoreleasedReturnValue();

  v20 = *MEMORY[0x1E0DC1140];
  v178[0] = *MEMORY[0x1E0DC1138];
  v19 = v178[0];
  v178[1] = v20;
  v166 = (void *)v16;
  v179[0] = v16;
  v179[1] = v18;
  v168 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, v178, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries minMaxValueStyle](self, "minMaxValueStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "font");
  v23 = objc_claimAutoreleasedReturnValue();

  -[HKQuantityDistributionSeries minMaxValueStyle](self, "minMaxValueStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textColor");
  v25 = objc_claimAutoreleasedReturnValue();

  v176[0] = v19;
  v176[1] = v20;
  v167 = (void *)v23;
  v177[0] = v23;
  v177[1] = v25;
  v26 = (void *)v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionSeries minMaxValueStyle](self, "minMaxValueStyle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberFormatter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  rect = height;
  if (v30)
  {
    -[HKQuantityDistributionSeries minMaxValueStyle](self, "minMaxValueStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "numberFormatter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_wholeNumberFormatter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringFromNumber:displayType:unitController:", v33, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v32;
  v37 = (void *)v35;
  v169 = v36;
  objc_msgSend(v36, "stringFromNumber:displayType:unitController:", v35, 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  a = a5->a;
  b = a5->b;
  v41 = a5->c;
  d = a5->d;
  tx = a5->tx;
  ty = a5->ty;
  v45 = v38;
  v172 = tx + v12 * v41 + a * v13;
  v46 = ty + v12 * d + b * v13;
  v47 = tx + v10 * v41 + a * v11;
  v48 = ty + v10 * d + b * v11;
  v171 = v46;
  if ((objc_msgSend(v34, "isEqualToString:", v38) & 1) != 0)
  {
    objc_msgSend(v38, "sizeWithAttributes:", v27);
    v160 = v49;
    v51 = v50;
    v180.origin.x = x;
    v180.origin.y = y;
    v180.size.width = width;
    v180.size.height = rect;
    v52 = v48 + -26.0 > CGRectGetMinY(v180);
    v53 = -3.0;
    if (v52)
      v53 = 26.0;
    -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v160, v51, v47, v48, x, y, width, rect, *(_QWORD *)&v53);
    objc_msgSend(v38, "hk_drawInRect:withAttributes:outlineWidth:outlineColor:context:", v27, v28, a7);
    v54 = v169;
  }
  else
  {
    v158 = v47;
    v159 = v48;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_MIN_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v157 = v34;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedUppercaseString");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v157;
    objc_msgSend(v57, "sizeWithAttributes:", v21);
    v59 = v58;
    v61 = v60;
    objc_msgSend(v157, "sizeWithAttributes:", v27);
    r2 = v62;
    v64 = v63;
    v65 = v46 + 14.0 + v63;
    v66 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
    v181.origin.x = x;
    v181.origin.y = y;
    v181.size.width = width;
    v181.size.height = rect;
    v161 = v21;
    v156 = (void *)v66;
    if (v65 >= CGRectGetMaxY(v181))
    {
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v59, v61, v172, v46, x, y, width, rect, 0x4042800000000000);
      v146 = v80;
      v147 = v79;
      v144 = v82;
      v145 = v81;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", r2, v64, v172, v46, x, y, width, rect, 0x403A000000000000);
      v72 = v83;
      v152 = v84;
      v153 = v85;
      r2a = v86;
    }
    else
    {
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v59, v61, v172, v46, x, y, width, rect, 0xC008000000000000);
      v146 = v68;
      v147 = v67;
      v144 = v70;
      v145 = v69;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", r2, v64, v172, v46, x, y, width, rect, 0xC02C000000000000);
      v72 = v71;
      v74 = v73;
      v153 = v76;
      r2a = v75;
      v77 = objc_msgSend(v57, "rangeOfCharacterFromSet:", v66);
      v78 = v74 + 3.0;
      if (v77 == 0x7FFFFFFFFFFFFFFFLL)
        v78 = v74;
      v152 = v78;
    }
    v87 = x;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_MAX_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "localizedUppercaseString");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v161;
    objc_msgSend(v90, "sizeWithAttributes:", v161);
    v92 = v91;
    v94 = v93;
    objc_msgSend(v45, "sizeWithAttributes:", v27);
    v140 = v95;
    v142 = v96;
    v182.origin.x = x;
    v182.origin.y = y;
    v182.size.width = width;
    v182.size.height = rect;
    v163 = v72;
    if (v159 + -37.0 <= CGRectGetMinY(v182))
    {
      v97 = v158;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v92, v94, v158, v159, v87, y, width, rect, 0xC008000000000000);
      v99 = v114;
      v148 = v115;
      v149 = v116;
      r1 = v117;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v140, v142, v158, v159, v87, y, width, rect, 0xC02C000000000000);
      v105 = v118;
      v107 = v119;
      v109 = v120;
      v111 = v121;
    }
    else
    {
      v97 = v158;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v92, v94, v158, v159, v87, y, width, rect, 0x4042800000000000);
      v99 = v98;
      v101 = v100;
      v149 = v103;
      r1 = v102;
      -[HKQuantityDistributionSeries _textRectForSize:location:screenRect:yOffset:](self, "_textRectForSize:location:screenRect:yOffset:", v140, v142, v158, v159, v87, y, width, rect, 0x403A000000000000);
      v105 = v104;
      v107 = v106;
      v109 = v108;
      v111 = v110;
      v112 = objc_msgSend(v90, "rangeOfCharacterFromSet:", v156);
      v113 = v101 + -3.0;
      if (v112 == 0x7FFFFFFFFFFFFFFFLL)
        v113 = v101;
      v148 = v113;
    }
    v54 = v169;
    v183.origin.x = v99;
    v183.origin.y = v148;
    v183.size.height = v149;
    v183.size.width = r1;
    v141 = v107;
    v143 = v105;
    v188.origin.x = v105;
    v188.origin.y = v107;
    v188.size.width = v109;
    v188.size.height = v111;
    v184 = CGRectUnion(v183, v188);
    v189.size.width = 0.0;
    v189.size.height = 0.0;
    v189.origin.x = v97;
    v189.origin.y = v159;
    v185 = CGRectUnion(v184, v189);
    v122 = v185.origin.x;
    v123 = v185.origin.y;
    v124 = v185.size.width;
    v125 = v185.size.height;
    v185.origin.x = v147;
    v185.origin.y = v146;
    v185.size.width = v145;
    v185.size.height = v144;
    v190.origin.x = v163;
    v190.origin.y = v152;
    v190.size.height = v153;
    v190.size.width = r2a;
    v186 = CGRectUnion(v185, v190);
    v191.size.width = 0.0;
    v191.size.height = 0.0;
    v191.origin.y = v171;
    v191.origin.x = v172;
    v192 = CGRectUnion(v186, v191);
    v187.origin.x = v122;
    v187.origin.y = v123;
    v187.size.width = v124;
    v187.size.height = v125;
    v193 = CGRectIntersection(v187, v192);
    if (CGRectEqualToRect(*MEMORY[0x1E0C9D628], v193))
    {
      recta = v28;
      +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v90, v161, v99, v148, r1, v149);
      r1a = (void *)objc_claimAutoreleasedReturnValue();
      v175[0] = r1a;
      +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v45, v27, v143, v141, v109, v111);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v175[1] = v126;
      +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v57, v161, v147, v146, v145, v144);
      v165 = v90;
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v175[2] = v127;
      +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v157, v27, v163, v152, r2a, v153);
      v128 = v26;
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v175[3] = v129;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 4);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKStringDrawing drawStrings:outlineWidth:outlineColor:context:](HKStringDrawing, "drawStrings:outlineWidth:outlineColor:context:", v130, recta, a7, 8.0);

      v28 = recta;
      v26 = v128;
      v34 = v157;

      v90 = v165;
      v54 = v169;

      v21 = v161;
    }

    v47 = v158;
    v48 = v159;
  }
  -[HKQuantityDistributionSeries minMaxPointStyle](self, "minMaxPointStyle");
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  if (v131)
  {
    -[HKQuantityDistributionSeries minMaxPointStyle](self, "minMaxPointStyle");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "lineWidth");
    v134 = v133;

    -[HKQuantityDistributionSeries minMaxPointStyle](self, "minMaxPointStyle");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "strokeColor");
    v136 = v28;
    v137 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a7, (CGColorRef)objc_msgSend(v137, "CGColor"));

    v28 = v136;
    v138 = HKUIFloorToScreenScale(v172);
    CGContextAddArc(a7, v138, v171, v134, 0.0, 6.28318531, 1);
    CGContextFillPath(a7);
    v139 = HKUIFloorToScreenScale(v47);
    CGContextAddArc(a7, v139, v48, v134, 0.0, 6.28318531, 1);
    CGContextFillPath(a7);
  }

}

- (CGRect)_textRectForSize:(CGSize)a3 location:(CGPoint)a4 screenRect:(CGRect)a5 yOffset:(double)a6
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat MaxX;
  double v15;
  double v16;
  double MaxY;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat rect;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  v12 = a4.x + a3.width * -0.5;
  v13 = a4.y - a6;
  v24.origin.x = v12;
  v24.origin.y = a4.y - a6;
  v24.size.width = v11;
  v24.size.height = v10;
  v25 = CGRectIntersection(v24, a5);
  if (!CGRectIsNull(v25))
  {
    if (v12 < x)
      v12 = x;
    if (v13 < y)
      v13 = y;
    v26.origin.x = v12;
    v26.origin.y = v13;
    v26.size.width = v11;
    v26.size.height = v10;
    MaxX = CGRectGetMaxX(v26);
    v27.size.height = height;
    v15 = MaxX;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    rect = v27.size.height;
    if (v15 > CGRectGetMaxX(v27))
    {
      v28.origin.x = v12;
      v28.origin.y = v13;
      v28.size.width = v11;
      v28.size.height = v10;
      v16 = CGRectGetMaxX(v28);
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = rect;
      v12 = v12 - (v16 - CGRectGetMaxX(v29));
    }
    v30.origin.x = v12;
    v30.origin.y = v13;
    v30.size.width = v11;
    v30.size.height = v10;
    MaxY = CGRectGetMaxY(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = rect;
    if (MaxY > CGRectGetMaxY(v31))
    {
      v32.origin.x = v12;
      v32.origin.y = v13;
      v32.size.width = v11;
      v32.size.height = v10;
      v18 = CGRectGetMaxY(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = rect;
      v13 = v13 - (v18 - CGRectGetMaxY(v33));
    }
  }
  v19 = v12;
  v20 = v13;
  v21 = v11;
  v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  HKDistributionBlockPoint *v20;
  void *v21;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  int64_t resolution;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "chartPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKQuantityDistributionSeries.m"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  v26 = v10;
  objc_msgSend(v10, "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v11;
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v12;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(obj);
        v20 = -[HKDistributionBlockPoint initWithChartPoint:xAxisTransform:yAxisTransform:gapZeroCount:]([HKDistributionBlockPoint alloc], "initWithChartPoint:xAxisTransform:yAxisTransform:gapZeroCount:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v13, v14, -[HKQuantityDistributionSeries zeroCountForGap](self, "zeroCountForGap"));
        objc_msgSend(v15, "addObject:", v20);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }

  v28 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v15, &v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return a3 == 5 && a4 == 1;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a4, "distributionSegments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "CGPointValue");
        UIDistanceBetweenPoints();
        if (v9 >= v11)
          v9 = v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1.79769313e308;
  }

  return v9;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  double v6;

  x = a3.x;
  objc_msgSend(a4, "minPoint", a3.x, a3.y, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return vabdd_f64(x, v6);
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a4, "distributionSegments", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = 1.79769313e308;
    v11 = -1.79769313e308;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "CGPointValue");
        if (v13 - y < 0.0 && v11 < v13 - y)
          v11 = v13 - y;
        if (v10 >= v13 - y && v13 - y >= 0.0)
          v10 = v13 - y;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1.79769313e308;
    v11 = -1.79769313e308;
  }

  if (v10 >= -v11)
    return v11;
  else
    return v10;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "minPoint");
  v7 = v6;
  objc_msgSend(v5, "minPoint");
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
  objc_msgSend(a3, "maxPoint");
  v7 = v6;
  objc_msgSend(v5, "maxPoint");
  v9 = v8;

  return v7 > v9;
}

+ (id)segmentsFromChartPoint:(id)a3 zeroCountForGap:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "minYValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxYValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v10 = v9;
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(a1, "segmentsFromChartPoint:minY:maxY:zeroCountForGap:", v6, a4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)segmentsFromChartPoint:(id)a3 minY:(double)a4 maxY:(double)a5 zeroCountForGap:(int64_t)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  BOOL v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "minimumBucketValue");
  v12 = v11;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v9, "bucketCounts", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v37;
    v18 = v12;
    v19 = v12;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v13);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "integerValue"))
        {
          v21 = v16 < a6;
          v16 = 0;
          if (!v21)
          {
            v12 = v19;
            v18 = v19;
          }
        }
        else
        {
          if (!v16)
            v12 = v19;
          if (++v16 == a6)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v22);
            objc_msgSend(v10, "addObject:", v23);

            v16 = a6;
          }
        }
        objc_msgSend(v9, "bucketIncrement");
        v19 = v19 + v24;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }
  else
  {
    v18 = v12;
    v19 = v12;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v25);
  objc_msgSend(v10, "addObject:", v26);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    if (v29 < a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v30, 0);

    }
    objc_msgSend(v10, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v32;

    if (v33 > a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v34, objc_msgSend(v10, "count") - 1);

    }
  }

  return v10;
}

+ (id)transformedSegmentsFromChartPoint:(id)a3 forX:(double)a4 minY:(double)a5 maxY:(double)a6 zeroCountForGap:(int64_t)a7
{
  void *v8;
  void *v9;
  _QWORD v11[5];

  objc_msgSend(a1, "segmentsFromChartPoint:minY:maxY:zeroCountForGap:", a3, a7, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__HKQuantityDistributionSeries_transformedSegmentsFromChartPoint_forX_minY_maxY_zeroCountForGap___block_invoke;
  v11[3] = &__block_descriptor_40_e27___NSValue_16__0__NSNumber_8l;
  *(double *)&v11[4] = a4;
  objc_msgSend(v8, "hk_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __97__HKQuantityDistributionSeries_transformedSegmentsFromChartPoint_forX_minY_maxY_zeroCountForGap___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 32);
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v2, v3);
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKStrokeStyle)inactiveStrokeStyleStorage
{
  return self->_inactiveStrokeStyleStorage;
}

- (void)setInactiveStrokeStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (HKStrokeStyle)unselectedStrokeStyleStorage
{
  return self->_unselectedStrokeStyleStorage;
}

- (void)setUnselectedStrokeStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (HKStrokeStyle)selectedStrokeStyleStorage
{
  return self->_selectedStrokeStyleStorage;
}

- (void)setSelectedStrokeStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (HKAxisLabelStyle)minMaxLabelStyleStorage
{
  return self->_minMaxLabelStyleStorage;
}

- (void)setMinMaxLabelStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (HKAxisLabelStyle)minMaxValueStyleStorage
{
  return self->_minMaxValueStyleStorage;
}

- (void)setMinMaxValueStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (HKStrokeStyle)minMaxPointStyleStorage
{
  return self->_minMaxPointStyleStorage;
}

- (void)setMinMaxPointStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)excludeDistributionStorage
{
  return self->_excludeDistributionStorage;
}

- (void)setExcludeDistributionStorage:(BOOL)a3
{
  self->_excludeDistributionStorage = a3;
}

- (int64_t)zeroCountForGapStorage
{
  return self->_zeroCountForGapStorage;
}

- (void)setZeroCountForGapStorage:(int64_t)a3
{
  self->_zeroCountForGapStorage = a3;
}

- (double)hollowLineRatioStorage
{
  return self->_hollowLineRatioStorage;
}

- (void)setHollowLineRatioStorage:(double)a3
{
  self->_hollowLineRatioStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minMaxPointStyleStorage, 0);
  objc_storeStrong((id *)&self->_minMaxValueStyleStorage, 0);
  objc_storeStrong((id *)&self->_minMaxLabelStyleStorage, 0);
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_inactiveStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
