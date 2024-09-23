@implementation HKElectrocardiogramChartView

+ (NSArray)defaultGridOptions
{
  HKElectrocardiogramGridOptions *v2;
  void *v3;
  HKElectrocardiogramGridOptions *v4;
  HKElectrocardiogramGridOptions *v5;
  void *v6;
  HKElectrocardiogramGridOptions *v7;
  HKElectrocardiogramGridOptions *v8;
  void *v9;
  HKElectrocardiogramGridOptions *v10;
  HKElectrocardiogramGridOptions *v11;
  void *v12;
  HKElectrocardiogramGridOptions *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v2 = [HKElectrocardiogramGridOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramChartMajorGridlineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKElectrocardiogramGridOptions initWithUnitMultiple:axis:lineColor:lineWidth:](v2, "initWithUnitMultiple:axis:lineColor:lineWidth:", 30, 1, v3, HKUICeilToScreenScale(0.5));
  v16[0] = v4;
  v5 = [HKElectrocardiogramGridOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramChartMajorGridlineColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKElectrocardiogramGridOptions initWithUnitMultiple:axis:lineColor:lineWidth:](v5, "initWithUnitMultiple:axis:lineColor:lineWidth:", 25, 2, v6, HKUICeilToScreenScale(0.5));
  v16[1] = v7;
  v8 = [HKElectrocardiogramGridOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramChartMinorGridlineColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKElectrocardiogramGridOptions initWithUnitMultiple:axis:lineColor:lineWidth:](v8, "initWithUnitMultiple:axis:lineColor:lineWidth:", 5, 3, v9, HKUICeilToScreenScale(0.25));
  v16[2] = v10;
  v11 = [HKElectrocardiogramGridOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_electrocardiogramChartVeryMinorGridlineColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKElectrocardiogramGridOptions initWithUnitMultiple:axis:lineColor:lineWidth:](v11, "initWithUnitMultiple:axis:lineColor:lineWidth:", 1, 3, v12, HKUICeilToScreenScale(0.25));
  v16[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

+ (NSArray)printedGridOptions
{
  HKElectrocardiogramGridOptions *v2;
  void *v3;
  HKElectrocardiogramGridOptions *v4;
  HKElectrocardiogramGridOptions *v5;
  void *v6;
  HKElectrocardiogramGridOptions *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = [HKElectrocardiogramGridOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKElectrocardiogramGridOptions initWithUnitMultiple:axis:lineColor:lineWidth:](v2, "initWithUnitMultiple:axis:lineColor:lineWidth:", 5, 3, v3, 0.5);
  v10[0] = v4;
  v5 = [HKElectrocardiogramGridOptions alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKElectrocardiogramGridOptions initWithUnitMultiple:axis:lineColor:lineWidth:](v5, "initWithUnitMultiple:axis:lineColor:lineWidth:", 1, 3, v6, 0.5);
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (HKElectrocardiogramChartView)initWithGridSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  HKElectrocardiogramChartView *v7;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "defaultGridOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKElectrocardiogramChartView initWithGridSize:gridOptions:](self, "initWithGridSize:gridOptions:", v6, width, height);

  return v7;
}

- (HKElectrocardiogramChartView)initWithGridSize:(CGSize)a3 gridOptions:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char *v12;
  HKElectrocardiogramGridView *v13;
  void *v14;
  HKElectrocardiogramWaveformView *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKElectrocardiogramChartView;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[HKElectrocardiogramChartView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v9, v10, v11);
  if (v12)
  {
    v13 = -[HKElectrocardiogramGridView initWithUnitSize:grids:]([HKElectrocardiogramGridView alloc], "initWithUnitSize:grids:", v7, width, height);
    v14 = (void *)*((_QWORD *)v12 + 53);
    *((_QWORD *)v12 + 53) = v13;

    v15 = -[HKElectrocardiogramWaveformView initWithFrame:]([HKElectrocardiogramWaveformView alloc], "initWithFrame:", v8, v9, v10, v11);
    v16 = (void *)*((_QWORD *)v12 + 54);
    *((_QWORD *)v12 + 54) = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    v18 = (void *)*((_QWORD *)v12 + 55);
    *((_QWORD *)v12 + 55) = v17;

    *(_OWORD *)(v12 + 456) = *MEMORY[0x1E0C9D820];
    objc_msgSend(v12, "_setUpUI");
  }

  return (HKElectrocardiogramChartView *)v12;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[HKElectrocardiogramChartView gridView](self, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "majorGridSize");
  v10 = v9;
  v12 = v11;

  v13 = v10 * ceil(v5 / v10);
  v14 = v12 * ceil(v7 / v12);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_setUpUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;

  -[HKElectrocardiogramChartView gridView](self, "gridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartView addSubview:](self, "addSubview:", v3);

  -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartView addSubview:](self, "addSubview:", v6);

  -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 1);

  -[HKElectrocardiogramChartView gridView](self, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_alignConstraintsWithView:", self);

  -[HKElectrocardiogramChartView gridView](self, "gridView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_alignConstraintsWithView:", self);

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramChartView pointsPerMillivolt](self, "pointsPerMillivolt");
  objc_msgSend(v22, "constraintEqualToConstant:", v23 * 3.0999999);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

}

- (CGSize)gridSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HKElectrocardiogramChartView gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unitSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSArray)gridOptions
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramChartView gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isDisplayingControlSignal
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HKElectrocardiogramChartView gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controlSignalPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setDisplayControlSignal:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  void *v23;
  id v24;

  if (a3)
  {
    v24 = objc_alloc_init(MEMORY[0x1E0DC3508]);
    objc_msgSend(v24, "moveToPoint:", 0.0, 0.0);
    -[HKElectrocardiogramChartView pointsPerSecond](self, "pointsPerSecond");
    v5 = (v4 + v4) / 9.0;
    -[HKElectrocardiogramChartView controlSignalDuration](self, "controlSignalDuration");
    objc_msgSend(v24, "addLineToPoint:", v6 * v5, 0.0);
    -[HKElectrocardiogramChartView pointsPerSecond](self, "pointsPerSecond");
    v8 = (v7 + v7) / 9.0;
    -[HKElectrocardiogramChartView controlSignalDuration](self, "controlSignalDuration");
    v10 = v9 * v8;
    -[HKElectrocardiogramChartView pointsPerMillivolt](self, "pointsPerMillivolt");
    objc_msgSend(v24, "addLineToPoint:", v10, -v11);
    -[HKElectrocardiogramChartView pointsPerSecond](self, "pointsPerSecond");
    v13 = v12 * 7.0 / 9.0;
    -[HKElectrocardiogramChartView controlSignalDuration](self, "controlSignalDuration");
    v15 = v14 * v13;
    -[HKElectrocardiogramChartView pointsPerMillivolt](self, "pointsPerMillivolt");
    objc_msgSend(v24, "addLineToPoint:", v15, -v16);
    -[HKElectrocardiogramChartView pointsPerSecond](self, "pointsPerSecond");
    v18 = v17 * 7.0 / 9.0;
    -[HKElectrocardiogramChartView controlSignalDuration](self, "controlSignalDuration");
    objc_msgSend(v24, "addLineToPoint:", v19 * v18, 0.0);
    -[HKElectrocardiogramChartView pointsPerSecond](self, "pointsPerSecond");
    v21 = v20 * 9.0 / 9.0;
    -[HKElectrocardiogramChartView controlSignalDuration](self, "controlSignalDuration");
    objc_msgSend(v24, "addLineToPoint:", v22 * v21, 0.0);
    -[HKElectrocardiogramChartView gridView](self, "gridView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setControlSignalPath:", v24);

  }
  else
  {
    -[HKElectrocardiogramChartView gridView](self, "gridView");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setControlSignalPath:", 0);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HKElectrocardiogramChartView;
  -[HKElectrocardiogramChartView layoutSubviews](&v14, sel_layoutSubviews);
  if (-[HKElectrocardiogramChartView isEdgeMaskEnabled](self, "isEdgeMaskEnabled"))
  {
    -[HKElectrocardiogramChartView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[HKElectrocardiogramChartView gridSize](self, "gridSize");
    +[HKGradientView hk_verticalWaveformMaskGradientWithInsetLocation:](HKGradientView, "hk_verticalWaveformMaskGradientWithInsetLocation:", (v11 + v11) / v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
    -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaskView:", v12);

  }
  else
  {
    -[HKElectrocardiogramChartView waveformContainerView](self, "waveformContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaskView:", 0);
  }

  -[HKElectrocardiogramChartView _updateChartForSizeChange](self, "_updateChartForSizeChange");
}

- (double)controlSignalDuration
{
  return 0.36;
}

- (void)setEdgeMaskEnabled:(BOOL)a3
{
  self->_edgeMaskEnabled = a3;
  -[HKElectrocardiogramChartView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setWaveformPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKElectrocardiogramChartView setWaveformPaths:](self, "setWaveformPaths:", v6, v7, v8);
}

- (void)setWaveformPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaths:", v4);

}

- (void)displayElectrocardiogram:(id)a3 allowsScrolling:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;

  v4 = a4;
  -[HKElectrocardiogramChartView setSample:](self, "setSample:", a3);
  -[HKElectrocardiogramChartView setAllowsScrolling:](self, "setAllowsScrolling:", v4);
  if (v4)
  {
    -[HKElectrocardiogramChartView sample](self, "sample");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramChartView pointsPerSecond](self, "pointsPerSecond");
    v8 = v7;
    -[HKElectrocardiogramChartView pointsPerMillivolt](self, "pointsPerMillivolt");
    LODWORD(v9) = -1081711002;
    LODWORD(v10) = 1073951539;
    objc_msgSend(v6, "hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:", v8, v11, v9, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
      v12 = v13;
    else
      v12 = (id)MEMORY[0x1E0C9AA60];
    -[HKElectrocardiogramChartView setWaveformPaths:](self, "setWaveformPaths:", v12);

  }
  else
  {
    -[HKElectrocardiogramChartView setWaveformPaths:](self, "setWaveformPaths:", MEMORY[0x1E0C9AA60]);
    -[HKElectrocardiogramChartView setLastSize:](self, "setLastSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[HKElectrocardiogramChartView _updateChartForSizeChange](self, "_updateChartForSizeChange");
  }
}

- (void)_updateChartForSizeChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  -[HKElectrocardiogramChartView sample](self, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v30 = v3;
  if (-[HKElectrocardiogramChartView allowsScrolling](self, "allowsScrolling"))
  {
LABEL_6:
    v3 = v30;
LABEL_7:

    return;
  }
  -[HKElectrocardiogramChartView lastSize](self, "lastSize");
  v5 = v4;
  v7 = v6;
  -[HKElectrocardiogramChartView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;

  if (v5 != v9 || v7 != v11)
  {
    -[HKElectrocardiogramChartView bounds](self, "bounds");
    -[HKElectrocardiogramChartView setLastSize:](self, "setLastSize:", v12, v13);
    -[HKElectrocardiogramChartView sample](self, "sample");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "samplingFrequency");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "hertzUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValueForUnit:", v16);
    v18 = v17;

    v19 = v18 * 0.04;
    -[HKElectrocardiogramChartView lastSize](self, "lastSize");
    v21 = v20;
    -[HKElectrocardiogramChartView gridSize](self, "gridSize");
    v23 = (uint64_t)(v19 * (v21 / v22));
    -[HKElectrocardiogramChartView sample](self, "sample");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramChartView lastSize](self, "lastSize");
    v26 = v25;
    -[HKElectrocardiogramChartView pointsPerMillivolt](self, "pointsPerMillivolt");
    LODWORD(v27) = -1081711002;
    LODWORD(v28) = 1073951539;
    objc_msgSend(v24, "hk_waveformPathsWithNumberOfValues:fitToWidth:pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:", v23, v26, v29, v27, v28);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    -[HKElectrocardiogramChartView setWaveformPaths:](self, "setWaveformPaths:", v30);
    goto LABEL_6;
  }
}

- (double)pointsPerSecond
{
  double v2;

  -[HKElectrocardiogramChartView gridSize](self, "gridSize");
  return v2 / 0.04;
}

- (double)pointsPerMillivolt
{
  double v2;

  -[HKElectrocardiogramChartView gridSize](self, "gridSize");
  return v2 / 0.1;
}

- (double)lineWidth
{
  void *v2;
  double v3;
  double v4;

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4;

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (UIColor)lineColor
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setLineColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKElectrocardiogramChartView waveformView](self, "waveformView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineColor:", v4);

}

- (BOOL)isEdgeMaskEnabled
{
  return self->_edgeMaskEnabled;
}

- (HKElectrocardiogramGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
  objc_storeStrong((id *)&self->_gridView, a3);
}

- (HKElectrocardiogramWaveformView)waveformView
{
  return self->_waveformView;
}

- (void)setWaveformView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformView, a3);
}

- (UIView)waveformContainerView
{
  return self->_waveformContainerView;
}

- (void)setWaveformContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformContainerView, a3);
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (BOOL)allowsScrolling
{
  return self->_allowsScrolling;
}

- (void)setAllowsScrolling:(BOOL)a3
{
  self->_allowsScrolling = a3;
}

- (CGSize)lastSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastSize.width;
  height = self->_lastSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastSize:(CGSize)a3
{
  self->_lastSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_waveformContainerView, 0);
  objc_storeStrong((id *)&self->_waveformView, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
}

@end
