@implementation HKBarSeries

- (HKBarSeries)init
{
  HKBarSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  HKBarSeriesConfiguration *v5;
  HKBarSeriesConfiguration *defaultConfigurationStorage;
  NSMutableArray *v7;
  NSMutableArray *overrideConfigurationsStorage;
  HKStrokeStyle *unselectedStrokeStyleStorage;
  HKStrokeStyle *selectedStrokeStyleStorage;
  HKStrokeStyle *tiledStrokeStyleStorage;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKBarSeries;
  v2 = -[HKGraphSeries init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKBarSeriesLock"));
    v5 = objc_alloc_init(HKBarSeriesConfiguration);
    defaultConfigurationStorage = v2->_defaultConfigurationStorage;
    v2->_defaultConfigurationStorage = v5;

    -[HKBarSeriesConfiguration setIsIncludedBlock:](v2->_defaultConfigurationStorage, "setIsIncludedBlock:", &__block_literal_global_15);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    overrideConfigurationsStorage = v2->_overrideConfigurationsStorage;
    v2->_overrideConfigurationsStorage = v7;

    unselectedStrokeStyleStorage = v2->_unselectedStrokeStyleStorage;
    v2->_unselectedStrokeStyleStorage = 0;

    selectedStrokeStyleStorage = v2->_selectedStrokeStyleStorage;
    v2->_selectedStrokeStyleStorage = 0;

    tiledStrokeStyleStorage = v2->_tiledStrokeStyleStorage;
    v2->_tiledStrokeStyleStorage = 0;

    v2->_cornerRadiiStorage.width = 0.0;
    v2->_cornerRadiiStorage.height = 0.0;
  }
  return v2;
}

- (void)setTiledStrokeStyle:(id)a3
{
  HKStrokeStyle *v4;
  void *v5;
  HKStrokeStyle *tiledStrokeStyleStorage;
  id v7;

  v4 = (HKStrokeStyle *)a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  tiledStrokeStyleStorage = self->_tiledStrokeStyleStorage;
  self->_tiledStrokeStyleStorage = v4;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)setCornerRadii:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  id v7;

  height = a3.height;
  width = a3.width;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  self->_cornerRadiiStorage.width = width;
  self->_cornerRadiiStorage.height = height;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)setUnselectedStrokeStyle:(id)a3
{
  HKStrokeStyle *v4;
  void *v5;
  HKStrokeStyle *unselectedStrokeStyleStorage;
  id v7;

  v4 = (HKStrokeStyle *)a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  unselectedStrokeStyleStorage = self->_unselectedStrokeStyleStorage;
  self->_unselectedStrokeStyleStorage = v4;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)setUnselectedFillStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKBarSeriesConfiguration setUnselectedFillStyle:](self->_defaultConfigurationStorage, "setUnselectedFillStyle:", v4);
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

uint64_t __19__HKBarSeries_init__block_invoke()
{
  return 1;
}

- (void)clearCaches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HKBarSeries defaultConfiguration](self, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedFillStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCache");

  -[HKBarSeries defaultConfiguration](self, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unselectedFillStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearCache");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HKBarSeries overrideConfigurations](self, "overrideConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "selectedFillStyle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "clearCache");

        objc_msgSend(v12, "unselectedFillStyle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "clearCache");

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v15.receiver = self;
  v15.super_class = (Class)HKBarSeries;
  -[HKGraphSeries clearCaches](&v15, sel_clearCaches);
}

- (HKBarSeriesConfiguration)defaultConfiguration
{
  void *v3;
  HKBarSeriesConfiguration *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_defaultConfigurationStorage;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setDefaultConfiguration:(id)a3
{
  HKBarSeriesConfiguration *v4;
  void *v5;
  HKBarSeriesConfiguration *defaultConfigurationStorage;
  id v7;

  v4 = (HKBarSeriesConfiguration *)a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  defaultConfigurationStorage = self->_defaultConfigurationStorage;
  self->_defaultConfigurationStorage = v4;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (NSMutableArray)overrideConfigurations
{
  void *v3;
  NSMutableArray *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_overrideConfigurationsStorage;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setOverrideConfigurations:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  NSMutableArray *overrideConfigurationsStorage;
  id v7;

  v4 = (NSMutableArray *)a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  overrideConfigurationsStorage = self->_overrideConfigurationsStorage;
  self->_overrideConfigurationsStorage = v4;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKStrokeStyle)unselectedStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_unselectedStrokeStyleStorage;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (HKStrokeStyle)selectedStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedStrokeStyleStorage;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedStrokeStyle:(id)a3
{
  HKStrokeStyle *v4;
  void *v5;
  HKStrokeStyle *selectedStrokeStyleStorage;
  id v7;

  v4 = (HKStrokeStyle *)a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  selectedStrokeStyleStorage = self->_selectedStrokeStyleStorage;
  self->_selectedStrokeStyleStorage = v4;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKStrokeStyle)tiledStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_tiledStrokeStyleStorage;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (HKFillStyle)unselectedFillStyle
{
  void *v3;
  void *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[HKBarSeriesConfiguration unselectedFillStyle](self->_defaultConfigurationStorage, "unselectedFillStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return (HKFillStyle *)v4;
}

- (HKFillStyle)selectedFillStyle
{
  void *v3;
  void *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[HKBarSeriesConfiguration selectedFillStyle](self->_defaultConfigurationStorage, "selectedFillStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return (HKFillStyle *)v4;
}

- (void)setSelectedFillStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKBarSeriesConfiguration setSelectedFillStyle:](self->_defaultConfigurationStorage, "setSelectedFillStyle:", v4);
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (HKFillStyle)inactiveFillStyle
{
  void *v3;
  void *v4;
  void *v5;

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[HKBarSeriesConfiguration inactiveFillStyle](self->_defaultConfigurationStorage, "inactiveFillStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return (HKFillStyle *)v4;
}

- (void)setInactiveFillStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKBarSeriesConfiguration setInactiveFillStyle:](self->_defaultConfigurationStorage, "setInactiveFillStyle:", v4);
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

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

  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  width = self->_cornerRadiiStorage.width;
  height = self->_cornerRadiiStorage.height;
  -[HKBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  void *v21;
  int64_t v22;
  __int128 v23;
  void *v24;
  uint64_t v25;
  _OWORD v26[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3;
  v19 = a5;
  v20 = a9;
  -[HKBarSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21
    || (-[HKBarSeries unselectedFillStyle](self, "unselectedFillStyle"),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[HKBarSeries overrideConfigurations](self, "overrideConfigurations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (!v25)
      goto LABEL_5;
  }
  v22 = -[HKBarSeries visibleBarCountWithZoomLevelConfiguration:](self, "visibleBarCountWithZoomLevelConfiguration:", v19);
  v23 = *(_OWORD *)&a6->c;
  v26[0] = *(_OWORD *)&a6->a;
  v26[1] = v23;
  v26[2] = *(_OWORD *)&a6->tx;
  -[HKBarSeries drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:](self, "drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:", v18, v22, v26, a7, v20, x, y, width, height);
LABEL_5:

}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  return objc_msgSend(a3, "visibleSeriesPointCountAtResolution:", 0);
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  double v5;
  double v6;

  v5 = a4.size.width / (double)a3;
  v6 = v5 * 0.33;
  if (v5 * 0.33 <= a5)
    v6 = a5;
  return floor(v5 - v6 + -1.0) + HKUIOnePixel();
}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat MaxX;
  CGFloat MinX;
  HKBarSeriesFillStyleBezierPaths *v27;
  void *v28;
  void *v29;
  id v30;
  HKBarSeriesFillStyleBezierPaths *v31;
  __int128 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  HKBarSeriesFillStyleBezierPaths *v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[3];
  _QWORD v52[5];
  id v53;
  HKBarSeriesFillStyleBezierPaths *v54;
  uint64_t *v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  double v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;
  CGRect v74;
  CGRect v75;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v73 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v45 = a8;
  v42 = objc_msgSend(v45, "seriesDrawingDuringTiling");
  if (v42
    && (-[HKBarSeries tiledStrokeStyle](self, "tiledStrokeStyle"),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[HKBarSeries tiledStrokeStyle](self, "tiledStrokeStyle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKBarSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v46, "lineWidth");
  v19 = v18;
  -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lineWidth");
  v22 = v21;

  if (v22 < v19)
    v22 = v19;
  objc_msgSend(v45, "screenRectForSeries:", self);
  -[HKBarSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  v24 = v23;
  v74.origin.x = x;
  v74.origin.y = y;
  v74.size.width = width;
  v74.size.height = height;
  MaxX = CGRectGetMaxX(v74);
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v75.size.height = height;
  MinX = CGRectGetMinX(v75);
  v27 = objc_alloc_init(HKBarSeriesFillStyleBezierPaths);
  -[HKBarSeries overrideConfigurations](self, "overrideConfigurations");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "hk_map:", &__block_literal_global_234);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __112__HKBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke_2;
  v52[3] = &unk_1E9C40FA0;
  v56 = MinX;
  v57 = v22 + v24;
  v58 = MaxX;
  v52[4] = self;
  v30 = v29;
  v53 = v30;
  v31 = v27;
  v59 = v68;
  v60 = v69;
  v61 = v70;
  v62 = v71;
  v63 = v24;
  v43 = v31;
  v54 = v31;
  v55 = &v64;
  v32 = *(_OWORD *)&a5->c;
  v51[0] = *(_OWORD *)&a5->a;
  v51[1] = v32;
  v51[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v44, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v51, 1, v52);
  -[HKBarSeries defaultConfiguration](self, "defaultConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries _drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:](self, "_drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:", v33, v43, v46, a6, x, y, width, height);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[HKBarSeries overrideConfigurations](self, "overrideConfigurations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
  if (v35)
  {
    v36 = 0;
    v37 = *(_QWORD *)v48;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v38);
        objc_msgSend(v30, "objectAtIndexedSubscript:", v36 + v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKBarSeries _drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:](self, "_drawConfiguration:fillStyleBezierPaths:strokeStyle:axisRect:context:", v39, v40, v46, a6, x, y, width, height);

        ++v38;
      }
      while (v35 != v38);
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
      v36 += v38;
    }
    while (v35);
  }

  if (((v42 | objc_msgSend(v45, "measuringStartupTime") ^ 1) & 1) == 0 && v65[3] >= 1)
  {
    -[HKGraphSeries delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "nonemptyDrawComplete");

  }
  _Block_object_dispose(&v64, 8);

}

HKBarSeriesFillStyleBezierPaths *__112__HKBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke()
{
  return objc_alloc_init(HKBarSeriesFillStyleBezierPaths);
}

void __112__HKBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke_2(uint64_t a1, void *a2, _OWORD *a3)
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
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double x;
  double y;
  double height;
  double v32;
  double v33;
  double v34;
  void *v35;
  _OWORD v36[4];
  _OWORD v37[2];
  CGRect v38;
  CGRect v39;

  v5 = a2;
  objc_msgSend(v5, "min");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "max");
  v11 = v10;
  v13 = v12;
  v14 = *(double *)(a1 + 72);
  if (*(double *)(a1 + 64) - v7 <= v14 && v7 - *(double *)(a1 + 80) <= v14)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "overrideConfigurations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "_configurationIndexForCoordinate:inConfigurations:", v5, v16);

    if (v17 < 0)
    {
      v18 = *(id *)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    objc_msgSend(v18, "unselectedBezierPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = a3[1];
    v37[0] = *a3;
    v37[1] = v21;
    v22 = *(_OWORD *)(a1 + 104);
    v36[0] = *(_OWORD *)(a1 + 88);
    v36[1] = v22;
    v23 = *(_OWORD *)(a1 + 136);
    v36[2] = *(_OWORD *)(a1 + 120);
    v36[3] = v23;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v37, (uint64_t *)v36))
    {
      objc_msgSend(v19, "selectedBezierPath");
      v24 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v24;
    }
    if (v7 - v11 >= 0.0)
      v25 = v7 - v11;
    else
      v25 = -(v7 - v11);
    if (v9 - v13 >= 0.0)
      v26 = v9 - v13;
    else
      v26 = -(v9 - v13);
    v27 = v11;
    v28 = v13;
    v38 = CGRectStandardize(*(CGRect *)(&v25 - 2));
    v39 = CGRectOffset(v38, *(double *)(a1 + 152) * -0.5, 0.0);
    x = v39.origin.x;
    y = v39.origin.y;
    height = v39.size.height;
    v32 = *(double *)(a1 + 152) + v39.size.width;
    objc_msgSend(*(id *)(a1 + 32), "cornerRadii");
    +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, v32, height, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendPath:", v35);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }

}

+ (id)_approximateRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadii:(CGSize)a5
{
  double height;
  double width;
  char v7;
  double v8;
  double y;
  double x;
  id v11;
  void *v12;
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
  double v25;
  double v26;
  double v27;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  v25 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  v12 = v11;
  v13 = height * 0.707106781;
  v26 = height * 0.707106781;
  v27 = height;
  if ((v7 & 1) != 0)
  {
    v15 = y + height;
    objc_msgSend(v11, "moveToPoint:", x, y + height);
    v14 = width * 0.707106781;
    objc_msgSend(v12, "addLineToPoint:", x + width - width * 0.707106781, v15 - v13);
    objc_msgSend(v12, "addLineToPoint:", x + width, y);
  }
  else
  {
    v14 = width * 0.707106781;
    objc_msgSend(v11, "moveToPoint:", x, y);
  }
  v16 = x + v8;
  if ((v7 & 2) != 0)
  {
    v17 = y + v27;
    objc_msgSend(v12, "addLineToPoint:", v16 - width, y);
    v18 = v14;
    objc_msgSend(v12, "addLineToPoint:", v16 - width + v14, y + v27 - v26);
  }
  else
  {
    v17 = y;
    v18 = v14;
  }
  v19 = y + v25;
  objc_msgSend(v12, "addLineToPoint:", v16, v17);
  if ((v7 & 8) != 0)
  {
    v20 = v27;
    objc_msgSend(v12, "addLineToPoint:", v16, v19 - v27);
    v21 = v26;
    objc_msgSend(v12, "addLineToPoint:", v16 - width + v18, v19 - v27 + v26);
    v16 = v16 - width;
  }
  else
  {
    v21 = v26;
    v20 = v27;
  }
  objc_msgSend(v12, "addLineToPoint:", v16, v19);
  if ((v7 & 4) != 0)
  {
    v22 = x + width;
    v23 = v19 - v20;
    objc_msgSend(v12, "addLineToPoint:", v22, v19);
    objc_msgSend(v12, "addLineToPoint:", v22 - v18, v23 + v21);
    v19 = v23;
  }
  objc_msgSend(v12, "addLineToPoint:", x, v19);
  objc_msgSend(v12, "closePath");
  return v12;
}

+ (id)barSeriesRoundedRect:(CGRect)a3 byRoundingCorners:(unint64_t)a4 cornerRadii:(CGSize)a5
{
  if (a5.width > 2.5 && a5.height > 2.5)
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  else
    objc_msgSend(a1, "_approximateRoundedRect:byRoundingCorners:cornerRadii:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)barSeriesRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", -1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4);
}

- (int64_t)_configurationIndexForCoordinate:(id)a3 inConfigurations:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD);
  char v14;
  int64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v8;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "isIncludedBlock", (_QWORD)v17);
        v13 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v14 = ((uint64_t (**)(_QWORD, id))v13)[2](v13, v5);

        if ((v14 & 1) != 0)
        {
          v15 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  v15 = -1;
LABEL_11:

  return v15;
}

- (void)_drawConfiguration:(id)a3 fillStyleBezierPaths:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v21 = a3;
  v15 = a5;
  v16 = a4;
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
    objc_msgSend(v21, "unselectedFillStyle");
  else
    objc_msgSend(v21, "inactiveFillStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unselectedBezierPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v18, v17, v15, a7, x, y, width, height);

  objc_msgSend(v16, "selectedBezierPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "selectedFillStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries _drawPath:withFillStyle:strokeStyle:axisRect:context:](self, "_drawPath:withFillStyle:strokeStyle:axisRect:context:", v19, v20, v15, a7, x, y, width, height);

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
  id v28;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBarSeries.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__HKBarSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C40CB8;
  v26 = v14;
  v27 = v15;
  v28 = v16;
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

void __57__HKBarSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  HKMinMaxCoordinate *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v16, "xValueAsGenericType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    objc_msgSend(*(id *)(a1 + 40), "coordinateForValue:", &unk_1E9CEAFB8);
    v9 = v8;
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v16, "maxYValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinateForValue:", v11);
    v13 = v12;

    objc_msgSend(v16, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HKMinMaxCoordinate initWithMin:max:userInfo:]([HKMinMaxCoordinate alloc], "initWithMin:max:userInfo:", v14, v7, v9, v7, v13);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);

  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBarSeries.m"), 510, CFSTR("distanceFromPoint type class failure"));

  }
  objc_msgSend(v7, "max");
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBarSeries.m"), 518, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  objc_msgSend(v8, "startXValue");
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBarSeries.m"), 526, CFSTR("yAxisDifferenceToPoint\x13 type class failure"));

  }
  objc_msgSend(v8, "max");
  v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  return objc_msgSend(a4, "isVisibleInChartRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBarSeries.m"), 537, CFSTR("compare type class failure"));

  }
  v9 = v8;
  objc_msgSend(v7, "max");
  v11 = v10;
  objc_msgSend(v9, "max");
  v13 = v12;

  return v11 < v13;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBarSeries.m"), 546, CFSTR("compare type class failure"));

  }
  v9 = v8;
  objc_msgSend(v7, "max");
  v11 = v10;
  objc_msgSend(v9, "max");
  v13 = v12;

  return v11 > v13;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKBarSeriesConfiguration)defaultConfigurationStorage
{
  return self->_defaultConfigurationStorage;
}

- (void)setDefaultConfigurationStorage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConfigurationStorage, a3);
}

- (NSMutableArray)overrideConfigurationsStorage
{
  return self->_overrideConfigurationsStorage;
}

- (void)setOverrideConfigurationsStorage:(id)a3
{
  objc_storeStrong((id *)&self->_overrideConfigurationsStorage, a3);
}

- (HKStrokeStyle)unselectedStrokeStyleStorage
{
  return self->_unselectedStrokeStyleStorage;
}

- (void)setUnselectedStrokeStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, a3);
}

- (HKStrokeStyle)selectedStrokeStyleStorage
{
  return self->_selectedStrokeStyleStorage;
}

- (void)setSelectedStrokeStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, a3);
}

- (HKStrokeStyle)tiledStrokeStyleStorage
{
  return self->_tiledStrokeStyleStorage;
}

- (void)setTiledStrokeStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_tiledStrokeStyleStorage, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiledStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_overrideConfigurationsStorage, 0);
  objc_storeStrong((id *)&self->_defaultConfigurationStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
