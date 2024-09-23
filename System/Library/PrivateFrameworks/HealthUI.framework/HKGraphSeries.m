@implementation HKGraphSeries

- (HKGraphSeries)init
{
  char *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HKGraphSeries;
  v2 = -[HKGraphSeries init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    objc_msgSend(*((id *)v2 + 3), "setName:", CFSTR("seriesMutableStateLock"));
    v5 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = 0;

    *((_WORD *)v2 + 4) = 1;
    v2[10] = 1;
    v6 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = 0;

    v7 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

    v8 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = 0;

    v2[11] = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v9;

    v11 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = 0;

    objc_storeWeak((id *)v2 + 9, 0);
    *((_OWORD *)v2 + 9) = HKGraphSeriesDataPointPathNone;
    *((_OWORD *)v2 + 10) = unk_1D7B81CF8;
    *((_OWORD *)v2 + 11) = HKGraphSeriesDataPointPathNone;
    *((_OWORD *)v2 + 12) = unk_1D7B81CF8;
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)v2 + 6) = _Q0;
    *(_WORD *)(v2 + 13) = 1;
    v17 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = 0;

    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = (void *)*((_QWORD *)v2 + 16);
    *((_QWORD *)v2 + 16) = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = (void *)*((_QWORD *)v2 + 17);
    *((_QWORD *)v2 + 17) = v20;

  }
  return (HKGraphSeries *)v2;
}

- (void)setYAxis:(id)a3
{
  HKAxis *v4;
  void *v5;
  HKAxis *yAxisStorage;
  id v7;

  v4 = (HKAxis *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  yAxisStorage = self->_yAxisStorage;
  self->_yAxisStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)setAxisScalingRule:(id)a3
{
  HKGraphSeriesAxisScalingRule *v4;
  void *v5;
  HKGraphSeriesAxisScalingRule *axisScalingRuleStorage;
  id v7;

  v4 = (HKGraphSeriesAxisScalingRule *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  axisScalingRuleStorage = self->_axisScalingRuleStorage;
  self->_axisScalingRuleStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)setInvertYAxis:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_invertYAxisStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)setIsCriticalForAutoscale:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_isCriticalForAutoscaleStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HKGraphSeries dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)HKGraphSeries;
  -[HKGraphSeries dealloc](&v4, sel_dealloc);
}

- (HKGraphSeriesDataSource)dataSource
{
  void *v3;
  HKGraphSeriesDataSource *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_dataSourceStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setDataSource:(id)a3
{
  void *v5;
  HKGraphSeriesDataSource *dataSourceStorage;
  void *v7;
  void *v8;
  HKGraphSeriesDataSource *v9;

  v9 = (HKGraphSeriesDataSource *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  dataSourceStorage = self->_dataSourceStorage;
  if (dataSourceStorage == v9)
  {
    -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

  }
  else
  {
    if (dataSourceStorage)
      -[HKGraphSeriesDataSource setDelegate:](dataSourceStorage, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_dataSourceStorage, a3);
    -[HKGraphSeriesDataSource setDelegate:](self->_dataSourceStorage, "setDelegate:", self);
    -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

    -[HKGraphSeries _setDirtyWithNewData:](self, "_setDirtyWithNewData:", 0);
  }

}

- (BOOL)adjustYAxisForLabels
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_adjustYAxisForLabelsStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setAdjustYAxisForLabels:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_adjustYAxisForLabelsStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (id)seriesDataSourceContext
{
  void *v3;
  id v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_seriesDataSourceContextStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSeriesDataSourceContext:(id)a3
{
  id v4;
  void *v5;
  id seriesDataSourceContextStorage;
  id v7;

  v4 = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  seriesDataSourceContextStorage = self->_seriesDataSourceContextStorage;
  self->_seriesDataSourceContextStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (BOOL)isCriticalForAutoscale
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_isCriticalForAutoscaleStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (BOOL)wantsRoundingDuringYRangeExpansion
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_wantsRoundingDuringYRangeExpansionStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setWantsRoundingDuringYRangeExpansion:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_wantsRoundingDuringYRangeExpansionStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (HKGraphSeriesAxisScalingRule)axisScalingRule
{
  void *v3;
  HKGraphSeriesAxisScalingRule *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_axisScalingRuleStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (UIColor)offScreenIndicatorColor
{
  void *v3;
  void *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[UIColor colorWithAlphaComponent:](self->_offScreenIndicatorColorStorage, "colorWithAlphaComponent:", self->_offscreenIndicatorAlphaStorage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return (UIColor *)v4;
}

- (void)setOffScreenIndicatorColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *offScreenIndicatorColorStorage;
  id v7;

  v4 = (UIColor *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  offScreenIndicatorColorStorage = self->_offScreenIndicatorColorStorage;
  self->_offScreenIndicatorColorStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (BOOL)invertYAxis
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_invertYAxisStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (HKAxis)yAxis
{
  void *v3;
  HKAxis *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_yAxisStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (HKSeriesDelegate)delegate
{
  void *v3;
  id WeakRetained;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateStorage);
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return (HKSeriesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_storeWeak((id *)&self->_delegateStorage, v4);
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (NSArray)titleLegendEntries
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_titleLegendEntriesStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setTitleLegendEntries:(id)a3
{
  NSArray *v4;
  void *v5;
  NSArray *titleLegendEntriesStorage;
  id v7;

  v4 = (NSArray *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  titleLegendEntriesStorage = self->_titleLegendEntriesStorage;
  self->_titleLegendEntriesStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (NSArray)detailLegendEntries
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_detailLegendEntriesStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setDetailLegendEntries:(id)a3
{
  NSArray *v4;
  void *v5;
  NSArray *detailLegendEntriesStorage;
  id v7;

  v4 = (NSArray *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  detailLegendEntriesStorage = self->_detailLegendEntriesStorage;
  self->_detailLegendEntriesStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (BOOL)drawLegendInsideSeries
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_drawLegendInsideSeriesStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setDrawLegendInsideSeries:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_drawLegendInsideSeriesStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (double)alpha
{
  void *v3;
  double alphaStorage;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  alphaStorage = self->_alphaStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return alphaStorage;
}

- (void)setAlpha:(double)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_alphaStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (double)offscreenIndicatorAlpha
{
  void *v3;
  double offscreenIndicatorAlphaStorage;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  offscreenIndicatorAlphaStorage = self->_offscreenIndicatorAlphaStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return offscreenIndicatorAlphaStorage;
}

- (void)setOffscreenIndicatorAlpha:(double)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_offscreenIndicatorAlphaStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (BOOL)allowsSelection
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_allowsSelectionStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setAllowsSelection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (self->_allowsSelectionStorage == v3)
  {
    -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

  }
  else
  {
    self->_allowsSelectionStorage = v3;
    -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unlock");

    -[HKGraphSeries _setDirtyWithNewData:](self, "_setDirtyWithNewData:", 0);
  }
}

- (BOOL)drawSelectionLineBehindAllSeries
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_drawSelectionLineBehindAllSeriesStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setDrawSelectionLineBehindAllSeries:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_drawSelectionLineBehindAllSeriesStorage = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- ($E95C1AA31F623F7CA201BB06ED3AA00A)selectedPathRange
{
  void *v5;
  __int128 v6;
  __int128 v7;
  $E95C1AA31F623F7CA201BB06ED3AA00A *result;
  id v9;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.resolution;
  *(_OWORD *)&retstr->var0.var0.index = *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.index;
  *(_OWORD *)&retstr->var0.var0.resolution = v6;
  v7 = *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.resolution;
  *(_OWORD *)&retstr->var1.var0.index = *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.index;
  *(_OWORD *)&retstr->var1.var0.resolution = v7;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return result;
}

- (void)setSelectedPathRange:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id v9;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = *(_OWORD *)&a3->var0.var0.index;
  v7 = *(_OWORD *)&a3->var0.var0.resolution;
  v8 = *(_OWORD *)&a3->var1.var0.resolution;
  *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.index = *(_OWORD *)&a3->var1.var0.index;
  *(_OWORD *)&self->_selectedPathRangeStorage.max.blockPath.resolution = v8;
  *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.index = v6;
  *(_OWORD *)&self->_selectedPathRangeStorage.min.blockPath.resolution = v7;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

}

- (id)closestXCoordinateRange
{
  void *v3;
  HKValueRange *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_closestXCoordinateRangeStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setClosestXCoordinateRange:(id)a3
{
  HKValueRange *v4;
  void *v5;
  HKValueRange *closestXCoordinateRangeStorage;
  id v7;

  v4 = (HKValueRange *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  closestXCoordinateRangeStorage = self->_closestXCoordinateRangeStorage;
  self->_closestXCoordinateRangeStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKValueRange)visibleValueRange
{
  void *v3;
  HKValueRange *v4;
  void *v5;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_visibleValueRangeStorage;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)updateForAutoscale:(id)a3
{
  HKValueRange *v4;
  void *v5;
  HKValueRange *visibleValueRangeStorage;
  void *v7;

  v4 = (HKValueRange *)a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  visibleValueRangeStorage = self->_visibleValueRangeStorage;
  self->_visibleValueRangeStorage = v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[HKGraphSeries _setDirtyWithNewData:](self, "_setDirtyWithNewData:", 0);
}

- (id)_expandYRange:(id)a3 withXRange:(id)a4 dateZoom:(int64_t)a5 resolution:(int64_t)a6 chartRect:(CGRect)a7
{
  id v11;
  id v12;
  HKChartPointRangeBuilder *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  HKChartPointRangeBuilder *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void *v43;
  HKGraphSeries *v44;
  HKChartPointRangeBuilder *v45;
  int64_t v46;
  int64_t v47;

  v11 = a3;
  v12 = a4;
  v13 = objc_alloc_init(HKChartPointRangeBuilder);
  objc_msgSend(v12, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "timeIntervalSinceDate:", v14);
  v17 = v16;
  objc_msgSend(v14, "dateByAddingTimeInterval:", v16 * -2.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", v17 + v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = MEMORY[0x1E0C809B0];
  v41 = 3221225472;
  v42 = __72__HKGraphSeries__expandYRange_withXRange_dateZoom_resolution_chartRect___block_invoke;
  v43 = &unk_1E9C45AC0;
  v46 = a5;
  v47 = a6;
  v44 = self;
  v21 = v13;
  v45 = v21;
  -[HKGraphSeries _enumeratePathIndexesInValueRange:zoomLevel:resolution:block:](self, "_enumeratePathIndexesInValueRange:zoomLevel:resolution:block:", v20, a5, a6, &v40);
  -[HKChartPointRangeBuilder suggestedValueRangeWithRounding:](v21, "suggestedValueRangeWithRounding:", -[HKGraphSeries wantsRoundingDuringYRangeExpansion](self, "wantsRoundingDuringYRangeExpansion", v40, v41, v42, v43, v44));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v11, "maxValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    objc_msgSend(v22, "maxValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    if (v25 < v28)
      v25 = v28;
    objc_msgSend(v11, "minValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    objc_msgSend(v22, "minValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;

    if (v31 >= v34)
      v35 = v34;
    else
      v35 = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v36, v37);
    v38 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = v11;
  }

  return v38;
}

void __72__HKGraphSeries__expandYRange_withXRange_dateZoom_resolution_chartRect___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v15 = a2;
  v16 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v3, "_dataBlockForBlockPath:", &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v4, "chartPoints", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 40), "visitChartPoint:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)hasAnyDataLoadedInXAxisRange:(id)a3 dateZoom:(int64_t)a4 resolution:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v8 = a3;
  -[HKGraphSeries yAxis](self, "yAxis");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v8 && v9)
  {
    v24 = 0uLL;
    v25 = 0;
    -[HKGraphSeries dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "blockPathForX:zoom:resolution:", v13, a4, a5);
    }
    else
    {
      v24 = 0uLL;
      v25 = 0;
    }

    v22 = 0uLL;
    v23 = 0;
    -[HKGraphSeries dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v14, "blockPathForX:zoom:resolution:", v15, a4, a5);
    }
    else
    {
      v22 = 0uLL;
      v23 = 0;
    }

    *(_QWORD *)&v24 = v24 - 1;
    *(_QWORD *)&v22 = v22 + 1;
    v20 = v24;
    v21 = v25;
    v18 = v22;
    v19 = v23;
    -[HKGraphSeries _requestDataSourceBlocksFromPath:toPath:](self, "_requestDataSourceBlocksFromPath:toPath:", &v20, &v18);
    -[HKGraphSeries dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v21 = v25;
    v18 = v22;
    v19 = v23;
    v11 = objc_msgSend(v16, "hasAllBlocksAvailableBetweenStartPath:endPath:", &v20, &v18);

  }
  return v11;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)valueRangeForYAxisWithXAxisRange:(id)a3 dateZoom:(int64_t)a4 resolution:(int64_t)a5 chartRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v36[5];
  id v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t *v40;
  int64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD aBlock[6];
  uint64_t v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[5];
  id v55;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  -[HKGraphSeries yAxis](self, "yAxis");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = 0;
  if (!v13 || !v14)
    goto LABEL_19;
  objc_msgSend(v13, "minValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v13, "maxValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__25;
  v54[4] = __Block_byref_object_dispose__25;
  v55 = 0;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0x7FEFFFFFFFFFFFFFLL;
  v46 = 0;
  v47 = (double *)&v46;
  v48 = 0x2020000000;
  v49 = 0xFFEFFFFFFFFFFFFFLL;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke;
  aBlock[3] = &unk_1E9C45AE8;
  aBlock[4] = &v50;
  aBlock[5] = &v46;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke_2;
  v36[3] = &unk_1E9C45B10;
  v41 = a4;
  v42 = a5;
  v36[4] = self;
  v38 = v54;
  v43 = v22;
  v23 = _Block_copy(aBlock);
  v44 = v19;
  v37 = v23;
  v39 = &v50;
  v40 = &v46;
  -[HKGraphSeries _enumeratePathIndexesInValueRange:zoomLevel:resolution:block:](self, "_enumeratePathIndexesInValueRange:zoomLevel:resolution:block:", v13, a4, a5, v36);
  if (v51[3] >= 1.79769313e308)
  {
    -[HKGraphSeries axisScalingRule](self, "axisScalingRule");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_11;
    -[HKGraphSeries axisScalingRule](self, "axisScalingRule");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "noDataStartingRange");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v24 = v24;
      v26 = v24;
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47[3]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v26)
  {
    -[HKGraphSeries _expandYRange:withXRange:dateZoom:resolution:chartRect:](self, "_expandYRange:withXRange:dateZoom:resolution:chartRect:", v26, v13, a4, a5, x, y, width, height);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_11:
  v29 = 0;
LABEL_12:
  -[HKGraphSeries axisScalingRule](self, "axisScalingRule");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30 && v29)
  {
    -[HKGraphSeries axisScalingRule](self, "axisScalingRule");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "yValueRangeForRange:zoomLevel:", v29, a4);
    v32 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v32;
  }
  -[HKGraphSeries marginsForYAxis:xAxisRange:zoomLevel:chartRect:](self, "marginsForYAxis:xAxisRange:zoomLevel:chartRect:", v29, v13, a4, x, y, width, height);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphSeries _clipYAxisValueRangeIfNecessary:](self, "_clipYAxisValueRangeIfNecessary:", v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKGraphSeries adjustYAxisForLabels](self, "adjustYAxisForLabels"))
  {
    objc_msgSend(v15, "setAxisLabelEndings:", 0);
    objc_msgSend(v15, "adjustValueRangeForLabels:", v16);
    v34 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v34;
  }
  else
  {
    objc_msgSend(v15, "setAxisLabelEndings:", 3);
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v54, 8);

LABEL_19:
  return v16;
}

void __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
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
  BOOL v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;

  v7 = a3;
  v8 = a2;
  objc_msgSend(v8, "xValueAsGenericType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v7, "xValueAsGenericType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v8, "maxYValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v7, "maxYValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v8, "minYValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  objc_msgSend(v7, "minYValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  v27 = v14 - v11;
  v28 = 1.0 - (v14 - a4) / (v14 - v11);
  v29 = v17 + (v20 - v17) * v28;
  v30 = v23 + (v26 - v23) * v28;
  if (v17 >= v20)
    v31 = v17;
  else
    v31 = v20;
  if (v23 >= v26)
    v32 = v26;
  else
    v32 = v23;
  v33 = v27 < 0.00000011920929;
  if (v27 < 0.00000011920929)
    v34 = v31;
  else
    v34 = v29;
  if (v33)
    v35 = v32;
  else
    v35 = v30;
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v35 >= *(double *)(v36 + 24))
    v35 = *(double *)(v36 + 24);
  *(double *)(v36 + 24) = v35;
  v37 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v34 < *(double *)(v37 + 24))
    v34 = *(double *)(v37 + 24);
  *(double *)(v37 + 24) = v34;
}

void __80__HKGraphSeries_valueRangeForYAxisWithXAxisRange_dateZoom_resolution_chartRect___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v39 = a2;
  v40 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v3, "_dataBlockForBlockPath:", &v39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v4, "chartPoints", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "minXValueAsGenericType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        objc_msgSend(v10, "maxXValueAsGenericType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "xValueAsGenericType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        v20 = *(double *)(a1 + 88);
        if (v13 <= v20)
        {
          if (v16 >= *(double *)(a1 + 96) && v13 <= v20)
          {
            objc_msgSend(v10, "maxYValue");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v27 = v26;

            objc_msgSend(v10, "minYValue");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            v30 = v29;

            v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v32 = *(double *)(v31 + 24);
            if (v30 < v32)
              v32 = v30;
            *(double *)(v31 + 24) = v32;
            v33 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v34 = *(double *)(v33 + 24);
            if (v27 >= v34)
              v34 = v27;
            *(double *)(v33 + 24) = v34;
            v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            if (v23)
            {
              if (v19 < *(double *)(a1 + 96))
              {
                v22 = *(_QWORD *)(a1 + 40);
                goto LABEL_25;
              }
            }
          }
        }
        else
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
            v21 = v19 < v20;
          else
            v21 = 0;
          if (v21)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
            if (v19 < *(double *)(a1 + 96))
            {
              v22 = *(_QWORD *)(a1 + 40);
              v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
LABEL_25:
              (*(void (**)(uint64_t, uint64_t, void *))(v22 + 16))(v22, v23, v10);
            }
          }
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

}

- (id)_clipYAxisValueRangeIfNecessary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v4)
  {
    -[HKGraphSeries axisScalingRule](self, "axisScalingRule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "yAxisBounds");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "maxValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v4, "minValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "doubleValue");
          if (v16 >= v7)
            v7 = v16;
        }
      }
      if (v14)
      {
        objc_msgSend(v4, "maxValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v14, "doubleValue");
          if (v18 < v10)
            v10 = v18;
        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double result;

  objc_msgSend(a4, "startXValue", a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return result;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  return 1;
}

- (id)seriesCoordinatesWithXAxis:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 resolution:(int64_t)a7
{
  double y;
  double x;
  double height;
  double width;
  double v13;
  double v14;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  y = a6.y;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v16 = a3;
  -[HKGraphSeries _coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:](self, "_coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:", v16, a7, a5, v14, v13, width, height, x, y);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "transform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "axisChartableValueRange");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "coordinateForValue:", v21);
  objc_msgSend(v18, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "transform");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "axisChartableValueRange");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "maxValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "coordinateForValue:", v26);
  objc_msgSend(v23, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v22, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKGraphSeriesBlockCoordinateList coordinateListByCombiningSubCoordinates:chartableValueRange:](HKGraphSeriesBlockCoordinateList, "coordinateListByCombiningSubCoordinates:chartableValueRange:", v17, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (CGAffineTransform)coordinateTransformFromXAxisTransform:(SEL)a3 chartRect:(CGAffineTransform *)a4
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&a4->c;
  v7[0] = *(_OWORD *)&a4->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a4->tx;
  return -[HKGraphSeries coordinateTransformForChartRect:xAxisTransform:](self, "coordinateTransformForChartRect:xAxisTransform:", v7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)drawWithChartRect:(CGRect)a3 seriesCoordinates:(id)a4 zoomLevelConfiguration:(id)a5 coordinateTransform:(CGAffineTransform *)a6 inContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  double v25;
  CGFloat v26;
  __int128 v27;
  _OWORD v28[3];
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a4;
  v20 = a5;
  v21 = a8;
  v22 = a9;
  -[HKGraphSeries yAxis](self, "yAxis");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "requiresScaling");

  if ((v24 & 1) == 0)
  {
    CGContextSaveGState(a7);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    if (!CGRectEqualToRect(v29, *MEMORY[0x1E0C9D628]))
    {
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      CGContextClipToRect(a7, v30);
    }
    -[HKGraphSeries alpha](self, "alpha");
    if (v25 < 1.0)
    {
      -[HKGraphSeries alpha](self, "alpha");
      CGContextSetAlpha(a7, v26);
    }
    v27 = *(_OWORD *)&a6->c;
    v28[0] = *(_OWORD *)&a6->a;
    v28[1] = v27;
    v28[2] = *(_OWORD *)&a6->tx;
    -[HKGraphSeries drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:](self, "drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:", v19, v20, v28, a7, v21, v22, x, y, width, height);
    CGContextRestoreGState(a7);
  }

}

- (CGAffineTransform)coordinateTransformForChartRect:(SEL)a3 xAxisTransform:(CGRect)a4
{
  CGFloat MinY;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v14;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v19.c = v14;
  *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  MinY = CGRectGetMinY(a4);
  *(_OWORD *)&v18.a = *(_OWORD *)&v19.a;
  *(_OWORD *)&v18.c = v14;
  *(_OWORD *)&v18.tx = *(_OWORD *)&v19.tx;
  CGAffineTransformTranslate(&v19, &v18, 0.0, MinY);
  memset(&v18, 0, sizeof(v18));
  -[HKGraphSeries yAxis](self, "yAxis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointTransform");
  HKAffineTransformFromLinearTransforms((uint64_t)&v18, 0.0, 1.0, v10, v11);

  t1 = v18;
  t2 = v19;
  CGAffineTransformConcat(&v17, &t1, &t2);
  v18 = v17;
  v12 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
  return CGAffineTransformConcat(retstr, &v17, &t1);
}

- (BOOL)containsCoordinatesInChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8
{
  double y;
  double x;
  double height;
  double width;
  double v15;
  double v16;
  id v18;
  __int128 v19;
  _OWORD v21[3];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  y = a7.y;
  x = a7.x;
  height = a3.size.height;
  width = a3.size.width;
  v15 = a3.origin.y;
  v16 = a3.origin.x;
  v18 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__HKGraphSeries_containsCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke;
  v22[3] = &unk_1E9C45B38;
  v22[4] = &v23;
  v19 = *(_OWORD *)&a8->c;
  v21[0] = *(_OWORD *)&a8->a;
  v21[1] = v19;
  v21[2] = *(_OWORD *)&a8->tx;
  -[HKGraphSeries enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:](self, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v18, a6, v21, 1, 2, v22, v16, v15, width, height, a5, x, y);
  LOBYTE(a6) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return a6;
}

uint64_t __104__HKGraphSeries_containsCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a5 = 1;
  return result;
}

- (void)enumerateCoordinatesInChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8 roundToViewScale:(BOOL)a9 exclusionOptions:(int64_t)a10 block:(id)a11
{
  double y;
  double x;
  double height;
  double width;
  double v21;
  double v22;
  id v25;
  id v26;
  void *v27;
  __int128 v28;
  CGFloat MinX;
  CGFloat MaxX;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGFloat v38;
  CGFloat v39;
  int64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  BOOL v45;
  _OWORD v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGRect v50;
  CGRect v51;

  y = a7.y;
  x = a7.x;
  height = a3.size.height;
  width = a3.size.width;
  v21 = a3.origin.y;
  v22 = a3.origin.x;
  v25 = a4;
  v26 = a11;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphSeries.m"), 888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

  }
  -[HKGraphSeries _coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:](self, "_coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:", v25, a6, a5, v22, v21, width, height, x, y);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  v28 = *(_OWORD *)&a8->c;
  v46[0] = *(_OWORD *)&a8->a;
  v46[1] = v28;
  v46[2] = *(_OWORD *)&a8->tx;
  -[HKGraphSeries coordinateTransformForChartRect:xAxisTransform:](self, "coordinateTransformForChartRect:xAxisTransform:", v46, v22, v21, width, height);
  v50.origin.x = v22;
  v50.origin.y = v21;
  v50.size.width = width;
  v50.size.height = height;
  MinX = CGRectGetMinX(v50);
  v51.origin.x = v22;
  v51.origin.y = v21;
  v51.size.width = width;
  v51.size.height = height;
  MaxX = CGRectGetMaxX(v51);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke;
  v33[3] = &unk_1E9C45B88;
  v35 = v47;
  v36 = v48;
  v37 = v49;
  v45 = a9;
  v38 = MaxX;
  v39 = MinX;
  v40 = a10;
  v41 = v22;
  v42 = v21;
  v43 = width;
  v44 = height;
  v33[4] = self;
  v34 = v26;
  v31 = v26;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v33);

}

void __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke_2;
  v12[3] = &unk_1E9C45B60;
  v16 = *(_QWORD *)(a1 + 112);
  v7 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v8 = *(unsigned __int8 *)(a1 + 152);
  v12[1] = 3221225472;
  v15 = *(_OWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 136);
  v17 = *(_OWORD *)(a1 + 120);
  v18 = v9;
  v13 = v7;
  v14 = &v19;
  v10 = *(_OWORD *)(a1 + 64);
  v11[0] = *(_OWORD *)(a1 + 48);
  v11[1] = v10;
  v11[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v6, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v11, v8, v12);
  *a4 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
}

void __145__HKGraphSeries_enumerateCoordinatesInChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform_roundToViewScale_exclusionOptions_block___block_invoke_2(uint64_t a1, void *a2, _OWORD *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, id, id, _OWORD *);
  __int128 v18;
  _OWORD v19[2];

  v9 = a2;
  v10 = a4;
  objc_msgSend(v9, "startXValue");
  v12 = v11;
  objc_msgSend(v9, "endXValue");
  v14 = v12 > *(double *)(a1 + 56) || v13 < *(double *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  if (v15 != 2)
  {
    if (v15 == 1 && v14)
      goto LABEL_11;
LABEL_10:
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void (**)(uint64_t, id, id, _OWORD *))(v16 + 16);
    v18 = a3[1];
    v19[0] = *a3;
    v19[1] = v18;
    v17(v16, v10, v9, v19);
    *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    goto LABEL_11;
  }
  if (!v14
    && objc_msgSend(*(id *)(a1 + 32), "blockCoordinateIsVisibleInsideOfChartRect:blockCoordinate:", v9, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104)))
  {
    goto LABEL_10;
  }
LABEL_11:

}

- (void)dataSourceDidUpdateCache:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[HKGraphSeries cachedCoordinateListsByBlockPath](self, "cachedCoordinateListsByBlockPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HKGraphSeries cachedDataBlocksByBlockPath](self, "cachedDataBlocksByBlockPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[HKGraphSeries _setDirtyWithNewData:](self, "_setDirtyWithNewData:", 1);
}

- (BOOL)_setInternalDirtyFlag
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_internalDirtyFlag;
  self->_internalDirtyFlag = 1;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)_clearInternalDirtyFlag
{
  void *v3;
  id v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  self->_internalDirtyFlag = 0;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (BOOL)_checkInternalDirtyFlag
{
  void *v3;
  void *v4;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_internalDirtyFlag;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)_setDirtyWithNewData:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (!-[HKGraphSeries _setInternalDirtyFlag](self, "_setInternalDirtyFlag"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__HKGraphSeries__setDirtyWithNewData___block_invoke;
    v5[3] = &unk_1E9C429F0;
    v5[4] = self;
    v6 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

void __38__HKGraphSeries__setDirtyWithNewData___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "_checkInternalDirtyFlag"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_clearInternalDirtyFlag");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "seriesDidInvalidatePaths:newDataArrived:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (id)_visibleXValueRangeWithAxis:(id)a3 chartRect:(CGRect)a4 contentOffset:(CGPoint)a5 zoomScale:(double)a6
{
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;

  if (a3)
  {
    v6 = a5.x / a6;
    v7 = a3;
    objc_msgSend(v7, "pointTransform");
    v10 = HKLinearTransformInvert(v8, v9);
    v12 = HKLinearTransformRange(v10, v11, v6);
    v14 = v13;
    objc_msgSend(v7, "transform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForCoordinate:", HKRangeMin(v12, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "transform");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "valueForCoordinate:", HKRangeMax(v12, v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v19 = v18 == 0;
    else
      v19 = 1;
    if (v19)
    {
      v20 = 0;
    }
    else
    {
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v16, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (id)_coordinateListsForGeneratorWithXAxis:(id)a3 zoomScale:(double)a4 chartRect:(CGRect)a5 contentOffset:(CGPoint)a6 resolution:(int64_t)a7
{
  double y;
  double x;
  double height;
  double width;
  double v12;
  double v13;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  y = a6.y;
  x = a6.x;
  height = a5.size.height;
  width = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v16 = a3;
  -[HKGraphSeries _visibleXValueRangeWithAxis:chartRect:contentOffset:zoomScale:](self, "_visibleXValueRangeWithAxis:chartRect:contentOffset:zoomScale:", v16, v13, v12, width, height, x, y, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "zoomScaleEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "zoomForZoomScale:", a4);

  -[HKGraphSeries _coordinateListsWithXValueRange:xAxis:zoomLevel:resolution:](self, "_coordinateListsWithXValueRange:xAxis:zoomLevel:resolution:", v17, v16, v19, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_enumeratePathIndexesInValueRange:(id)a3 zoomLevel:(int64_t)a4 resolution:(int64_t)a5 block:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t, _OWORD *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v10 = a3;
  v11 = (void (**)(id, uint64_t, _OWORD *))a6;
  v24 = 0uLL;
  v25 = 0;
  -[HKGraphSeries dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "blockPathForX:zoom:resolution:", v13, a4, a5);
  }
  else
  {
    v24 = 0uLL;
    v25 = 0;
  }

  v22 = 0uLL;
  v23 = 0;
  -[HKGraphSeries dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maxValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "blockPathForX:zoom:resolution:", v15, a4, a5);
  }
  else
  {
    v22 = 0uLL;
    v23 = 0;
  }

  *(_QWORD *)&v24 = v24 - 1;
  *(_QWORD *)&v22 = v22 + 1;
  v20 = v24;
  v21 = v25;
  v18 = v22;
  v19 = v23;
  -[HKGraphSeries _requestDataSourceBlocksFromPath:toPath:](self, "_requestDataSourceBlocksFromPath:toPath:", &v20, &v18);
  v16 = v24;
  if ((uint64_t)v24 <= (uint64_t)v22)
  {
    do
    {
      LOBYTE(v20) = 0;
      v11[2](v11, v16, &v20);
      if ((_BYTE)v20)
        break;
    }
    while (v16++ < (uint64_t)v22);
  }

}

- (id)_coordinateListsWithXValueRange:(id)a3 xAxis:(id)a4 zoomLevel:(int64_t)a5 resolution:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;

  v10 = a4;
  if (a3)
  {
    v11 = a3;
    v12 = (void *)objc_opt_new();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__HKGraphSeries__coordinateListsWithXValueRange_xAxis_zoomLevel_resolution___block_invoke;
    v17[3] = &unk_1E9C45BB0;
    v20 = a5;
    v21 = a6;
    v17[4] = self;
    v18 = v10;
    v13 = v12;
    v19 = v13;
    -[HKGraphSeries _enumeratePathIndexesInValueRange:zoomLevel:resolution:block:](self, "_enumeratePathIndexesInValueRange:zoomLevel:resolution:block:", v11, a5, a6, v17);

    v14 = v19;
    v15 = v13;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __76__HKGraphSeries__coordinateListsWithXValueRange_xAxis_zoomLevel_resolution___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 32);
  v10 = a2;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v6, "_cachedCoordinatesForBlockPath:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (v8 = *(void **)(a1 + 32),
        v9 = *(_QWORD *)(a1 + 40),
        v10 = a2,
        v11 = v4,
        v12 = v5,
        objc_msgSend(v8, "_coordinatesForBlockPath:xAxis:", &v10, v9),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

  }
}

- (id)_cachedCoordinatesForBlockPath:(HKGraphSeriesDataBlockPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKGraphSeriesDataBlockPath v11;

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[HKGraphSeries cachedCoordinateListsByBlockPath](self, "cachedCoordinateListsByBlockPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v8;
}

- (void)_cacheCoordinates:(id)a3 forBlockPath:(HKGraphSeriesDataBlockPath *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKGraphSeriesDataBlockPath v12;

  v6 = a3;
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  v12 = *a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries cachedCoordinateListsByBlockPath](self, "cachedCoordinateListsByBlockPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v8);
  else
    objc_msgSend(v9, "removeObjectForKey:", v8);

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

- (id)_coordinatesForBlockPath:(HKGraphSeriesDataBlockPath *)a3 xAxis:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HKGraphSeriesDataBlockPath v11;

  v6 = a4;
  v11 = *a3;
  -[HKGraphSeries _dataBlockForBlockPath:](self, "_dataBlockForBlockPath:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HKGraphSeries yAxis](self, "yAxis");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *a3;
    -[HKGraphSeries coordinatesForBlock:blockPath:xAxis:yAxis:](self, "coordinatesForBlock:blockPath:xAxis:yAxis:", v7, &v11, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *a3;
    -[HKGraphSeries _cacheCoordinates:forBlockPath:](self, "_cacheCoordinates:forBlockPath:", v9, &v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_dataBlockForBlockPath:(HKGraphSeriesDataBlockPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKGraphSeriesDataBlockPath v14;

  v14 = *a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[HKGraphSeries cachedDataBlocksByBlockPath](self, "cachedDataBlocksByBlockPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  if (!v8)
  {
    v14 = *a3;
    -[HKGraphSeries _getBlockFromDataSource:](self, "_getBlockFromDataSource:", &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lock");

      -[HKGraphSeries cachedDataBlocksByBlockPath](self, "cachedDataBlocksByBlockPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v5);

      -[HKGraphSeries seriesMutableStateLock](self, "seriesMutableStateLock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unlock");

    }
  }

  return v8;
}

- (id)_getBlockFromDataSource:(HKGraphSeriesDataBlockPath *)a3
{
  HKGraphSeriesDataSource *dataSourceStorage;
  id seriesDataSourceContextStorage;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  HKGraphSeries *v23;
  NSObject *v24;
  __int128 *v25;
  __int128 v26;
  int64_t v27;
  __int128 v28;
  int64_t resolution;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    dataSourceStorage = self->_dataSourceStorage;
    seriesDataSourceContextStorage = self->_seriesDataSourceContextStorage;
    v28 = *(_OWORD *)&a3->index;
    resolution = a3->resolution;
    -[HKGraphSeriesDataSource cachedBlockForPath:context:](dataSourceStorage, "cachedBlockForPath:context:", &v28, seriesDataSourceContextStorage);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = dispatch_group_create();
    *(_QWORD *)&v28 = 0;
    *((_QWORD *)&v28 + 1) = &v28;
    resolution = 0x3032000000;
    v30 = __Block_byref_object_copy__25;
    v31 = __Block_byref_object_dispose__25;
    v32 = 0;
    dispatch_group_enter(v8);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __41__HKGraphSeries__getBlockFromDataSource___block_invoke;
    v22 = &unk_1E9C45BD8;
    v25 = &v28;
    v23 = self;
    v26 = *(_OWORD *)&a3->index;
    v27 = a3->resolution;
    v9 = v8;
    v24 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], &v19);
    if (dispatch_group_wait(v9, -[HKGraphSeries _mainThreadJoinTimeout](self, "_mainThreadJoinTimeout", v19, v20, v21, v22, v23)))
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[HKGraphSeries _getBlockFromDataSource:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
      v18 = 0;
    }
    else
    {
      v18 = *(id *)(*((_QWORD *)&v28 + 1) + 40);
    }

    _Block_object_dispose(&v28, 8);
    return v18;
  }
}

void __41__HKGraphSeries__getBlockFromDataSource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  v8 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "cachedBlockForPath:context:", &v8, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_requestDataSourceBlocksFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4
{
  HKGraphSeriesDataSource *dataSourceStorage;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  HKGraphSeries *v22;
  NSObject *v23;
  __int128 v24;
  int64_t v25;
  __int128 v26;
  int64_t v27;
  __int128 v28;
  int64_t v29;
  __int128 v30;
  int64_t resolution;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    dataSourceStorage = self->_dataSourceStorage;
    v30 = *(_OWORD *)&a3->index;
    resolution = a3->resolution;
    v28 = *(_OWORD *)&a4->index;
    v29 = a4->resolution;
    -[HKGraphSeriesDataSource blocksRequestedFromPath:toPath:priorityDelegate:](dataSourceStorage, "blocksRequestedFromPath:toPath:priorityDelegate:", &v30, &v28, self);
  }
  else
  {
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __57__HKGraphSeries__requestDataSourceBlocksFromPath_toPath___block_invoke;
    v21 = &unk_1E9C443C0;
    v22 = self;
    v24 = *(_OWORD *)&a3->index;
    v25 = a3->resolution;
    v26 = *(_OWORD *)&a4->index;
    v27 = a4->resolution;
    v9 = v8;
    v23 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], &v18);
    if (dispatch_group_wait(v9, -[HKGraphSeries _mainThreadJoinTimeout](self, "_mainThreadJoinTimeout", v18, v19, v20, v21, v22)))
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[HKGraphSeries _requestDataSourceBlocksFromPath:toPath:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

  }
}

void __57__HKGraphSeries__requestDataSourceBlocksFromPath_toPath___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v2, "blocksRequestedFromPath:toPath:priorityDelegate:", &v5, &v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (unint64_t)_mainThreadJoinTimeout
{
  return dispatch_time(0, 3000000000);
}

- (BOOL)isRangeHighPriority:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HKGraphSeries delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeIsVisible:", v4);

  return v6;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  return a3;
}

- (void)enumerateChartPointsInRange:(id)a3 zoomLevel:(int64_t)a4 resolution:(int64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;

  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "minValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v11, "maxValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__HKGraphSeries_enumerateChartPointsInRange_zoomLevel_resolution_block___block_invoke;
  v19[3] = &unk_1E9C45C00;
  v21 = a4;
  v22 = a5;
  v23 = v14;
  v24 = v17;
  v19[4] = self;
  v20 = v10;
  v18 = v10;
  -[HKGraphSeries _enumeratePathIndexesInValueRange:zoomLevel:resolution:block:](self, "_enumeratePathIndexesInValueRange:zoomLevel:resolution:block:", v11, a4, a5, v19);

}

void __72__HKGraphSeries_enumerateChartPointsInRange_zoomLevel_resolution_block___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v23 = a2;
  v24 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v5, "_dataBlockForBlockPath:", &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "chartPoints", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        LOBYTE(v23) = 0;
        objc_msgSend(v12, "minXValueAsGenericType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        objc_msgSend(v12, "maxXValueAsGenericType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        if (v15 >= *(double *)(a1 + 64) && v18 <= *(double *)(a1 + 72))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          if ((_BYTE)v23)
          {
            *a3 = 1;
            goto LABEL_13;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

}

- (int64_t)overlayType
{
  return 0;
}

- (id)overlayIdentifier
{
  return 0;
}

- (id)overlayInteractiveViewsWithDelegate:(id)a3
{
  return 0;
}

- (BOOL)isHighlighted
{
  _OWORD v3[6];
  _OWORD v4[2];

  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v4[0] = v3[2];
  v4[1] = v3[3];
  v3[0] = HKGraphSeriesDataPointPathNone;
  v3[1] = unk_1D7B81CF8;
  return !HKGraphSeriesDataPointPathEqualToPath(v4, v3);
}

- (void)selectPathsinPathRange:(id *)a3 coordinateRange:(id)a4
{
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[4];
  _OWORD v12[4];
  _QWORD v13[8];

  v6 = a4;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v7 = *(_OWORD *)&a3->var0.var0.resolution;
  v12[0] = *(_OWORD *)&a3->var0.var0.index;
  v12[1] = v7;
  v8 = *(_OWORD *)&a3->var1.var0.resolution;
  v12[2] = *(_OWORD *)&a3->var1.var0.index;
  v12[3] = v8;
  if (!HKGraphSeriesDataPointPathRangeEqualToRange(v12, v13))
  {
    v9 = *(_OWORD *)&a3->var0.var0.resolution;
    v11[0] = *(_OWORD *)&a3->var0.var0.index;
    v11[1] = v9;
    v10 = *(_OWORD *)&a3->var1.var0.resolution;
    v11[2] = *(_OWORD *)&a3->var1.var0.index;
    v11[3] = v10;
    -[HKGraphSeries setSelectedPathRange:](self, "setSelectedPathRange:", v11);
    -[HKGraphSeries setClosestXCoordinateRange:](self, "setClosestXCoordinateRange:", v6);
    -[HKGraphSeries _setDirtyWithNewData:](self, "_setDirtyWithNewData:", 0);
  }

}

- (void)deselectPath
{
  _OWORD v2[4];

  v2[0] = HKGraphSeriesDataPointPathNone;
  v2[1] = unk_1D7B81CF8;
  v2[2] = HKGraphSeriesDataPointPathNone;
  v2[3] = unk_1D7B81CF8;
  -[HKGraphSeries selectPathsinPathRange:coordinateRange:](self, "selectPathsinPathRange:coordinateRange:", v2, 0);
}

- (double)distanceFromTouchPoint:(CGPoint)a3 inChartRect:(CGRect)a4 xAxis:(id)a5 zoomScale:(double)a6 resolution:(int64_t)a7 contentOffset:(CGPoint)a8 xAxisTransform:(CGAffineTransform *)a9
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v15;
  CGFloat v16;
  id v18;
  __int128 v19;
  double v20;
  _OWORD v23[3];
  _QWORD v24[12];
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3.y;
  v16 = a3.x;
  v18 = a5;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  v28 = 0x7FEFFFFFFFFFFFFFLL;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __108__HKGraphSeries_distanceFromTouchPoint_inChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke;
  v24[3] = &unk_1E9C45C28;
  *(CGFloat *)&v24[6] = v16;
  *(CGFloat *)&v24[7] = v15;
  *(double *)&v24[8] = x;
  *(double *)&v24[9] = y;
  *(double *)&v24[10] = width;
  *(double *)&v24[11] = height;
  v24[4] = self;
  v24[5] = &v25;
  v19 = *(_OWORD *)&a9->c;
  v23[0] = *(_OWORD *)&a9->a;
  v23[1] = v19;
  v23[2] = *(_OWORD *)&a9->tx;
  -[HKGraphSeries enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:](self, "enumerateCoordinatesInChartRect:xAxis:zoomScale:resolution:contentOffset:xAxisTransform:roundToViewScale:exclusionOptions:block:", v18, a7, v23, 1, 0, v24, x, y, width, height, a6, a8.x, a8.y);
  v20 = v26[3];
  _Block_object_dispose(&v25, 8);

  return v20;
}

uint64_t __108__HKGraphSeries_distanceFromTouchPoint_inChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "distanceFromPoint:blockCoordinate:chartRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v3 < *(double *)(v4 + 24))
    *(double *)(v4 + 24) = v3;
  return result;
}

- (id)findVisibleBlockCoordinatesForChartRect:(CGRect)a3 xAxis:(id)a4 zoomScale:(double)a5 resolution:(int64_t)a6 contentOffset:(CGPoint)a7 xAxisTransform:(CGAffineTransform *)a8
{
  double y;
  double x;
  double height;
  double width;
  double v15;
  double v16;
  id v18;
  void *v19;
  char v20;
  HKGraphSeriesVisibleBlockCoordinates *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  HKGraphSeriesVisibleBlockCoordinates *v26;
  _OWORD v28[3];
  _QWORD v29[12];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  y = a7.y;
  x = a7.x;
  height = a3.size.height;
  width = a3.size.width;
  v15 = a3.origin.y;
  v16 = a3.origin.x;
  v18 = a4;
  -[HKGraphSeries yAxis](self, "yAxis");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "requiresScaling");

  if ((v20 & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    -[HKGraphSeries _coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:](self, "_coordinateListsForGeneratorWithXAxis:zoomScale:chartRect:contentOffset:resolution:", v18, a6, a5, v16, v15, width, height, x, y);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "axisChartableValueRange");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKGraphSeriesBlockCoordinateList coordinateListByCombiningSubCoordinates:chartableValueRange:](HKGraphSeriesBlockCoordinateList, "coordinateListByCombiningSubCoordinates:chartableValueRange:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v25 = *(_OWORD *)&a8->c;
    v42 = *(_OWORD *)&a8->a;
    v43 = v25;
    v44 = *(_OWORD *)&a8->tx;
    v45 = 0u;
    -[HKGraphSeries coordinateTransformForChartRect:xAxisTransform:](self, "coordinateTransformForChartRect:xAxisTransform:", &v42, v16, v15, width, height);
    *(_QWORD *)&v42 = 0;
    *((_QWORD *)&v42 + 1) = &v42;
    *(_QWORD *)&v43 = 0x3032000000;
    *((_QWORD *)&v43 + 1) = __Block_byref_object_copy__25;
    *(_QWORD *)&v44 = __Block_byref_object_dispose__25;
    *((_QWORD *)&v44 + 1) = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__25;
    v40 = __Block_byref_object_dispose__25;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__25;
    v34 = __Block_byref_object_dispose__25;
    v35 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __113__HKGraphSeries_findVisibleBlockCoordinatesForChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke;
    v29[3] = &unk_1E9C45C50;
    *(double *)&v29[8] = v16;
    *(double *)&v29[9] = v15;
    *(double *)&v29[10] = width;
    *(double *)&v29[11] = height;
    v29[4] = self;
    v29[5] = &v42;
    v29[6] = &v36;
    v29[7] = &v30;
    v28[0] = v45;
    v28[1] = v46;
    v28[2] = v47;
    objc_msgSend(v24, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v28, 0, v29);
    if (*(_QWORD *)(*((_QWORD *)&v42 + 1) + 40) && v37[5])
    {
      v26 = [HKGraphSeriesVisibleBlockCoordinates alloc];
      v21 = -[HKGraphSeriesVisibleBlockCoordinates initWithMinimum:maximum:last:](v26, "initWithMinimum:maximum:last:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 40), v37[5], v31[5]);
    }
    else
    {
      v21 = 0;
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);

  }
  return v21;
}

void __113__HKGraphSeries_findVisibleBlockCoordinatesForChartRect_xAxis_zoomScale_resolution_contentOffset_xAxisTransform___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v6 = a4;
  objc_msgSend(v11, "startXValue");
  if (v7 >= *(double *)(a1 + 64))
  {
    objc_msgSend(v11, "endXValue");
    if (v8 <= *(double *)(a1 + 64) + *(double *)(a1 + 80))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_QWORD *)(v9 + 40))
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "blockCoordinate:lessThan:", v6))
          goto LABEL_7;
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      objc_storeStrong((id *)(v9 + 40), a4);
LABEL_7:
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_QWORD *)(v10 + 40))
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "blockCoordinate:greaterThan:", v6))
        {
LABEL_11:
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
          goto LABEL_12;
        }
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      }
      objc_storeStrong((id *)(v10 + 40), a4);
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (BOOL)untransformedChartPointsForTimeScope:(int64_t)a3 resolution:(int64_t)a4 range:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  BOOL v31;
  char v33;
  id v34;
  id v35;
  int64_t v36;
  int64_t v37;
  HKGraphSeries *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  int64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  int64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "minValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maxValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0uLL;
  v51 = 0;
  v38 = self;
  -[HKGraphSeries dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "blockPathForX:zoom:resolution:", v12, a3, a4);
  }
  else
  {
    v50 = 0uLL;
    v51 = 0;
  }

  v48 = 0uLL;
  v49 = 0;
  -[HKGraphSeries dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "blockPathForX:zoom:resolution:", v13, a3, a4);
  }
  else
  {
    v48 = 0uLL;
    v49 = 0;
  }

  *(_QWORD *)&v50 = v50 - 1;
  *(_QWORD *)&v48 = v48 + 1;
  -[HKGraphSeries dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v50;
  v47 = v51;
  v44 = v48;
  v45 = v49;
  v19 = objc_msgSend(v18, "hasAllBlocksAvailableBetweenStartPath:endPath:", &v46, &v44);

  if (v19)
  {
    v33 = v19;
    v34 = v11;
    v35 = v10;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = v50;
    if ((uint64_t)v50 <= (uint64_t)v48)
    {
      v36 = a3;
      v37 = a4;
      do
      {
        -[HKGraphSeries dataSource](v38, "dataSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v46 = v21;
        *((_QWORD *)&v46 + 1) = a3;
        v47 = a4;
        objc_msgSend(v22, "cachedBlockForPath:context:", &v46, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v39 = v23;
        objc_msgSend(v23, "chartPoints");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v41 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v29, "xValueAsGenericType");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "compare:", v12) != -1 && objc_msgSend(v30, "compare:", v13) != 1)
                objc_msgSend(v20, "addObject:", v29);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          }
          while (v26);
        }

        v31 = v21++ < (uint64_t)v48;
        a3 = v36;
        a4 = v37;
      }
      while (v31);
    }
    v11 = v34;
    (*((void (**)(id, id, uint64_t, _QWORD))v34 + 2))(v34, v20, 1, 0);

    v10 = v35;
    LOBYTE(v19) = v33;
  }

  return v19;
}

+ (void)drawFilledMarkerInContext:(CGContext *)a3 color:(CGColor *)a4 x:(double)a5 y:(double)a6 radius:(double)a7
{
  CGContextSetFillColorWithColor(a3, a4);
  CGContextMoveToPoint(a3, a5, a6);
  CGContextAddArc(a3, a5, a6, a7, 0.0, 6.28318531, 0);
  CGContextFillPath(a3);
}

+ (void)drawInnerDotMarkerInContext:(CGContext *)a3 outColor:(CGColor *)a4 inColor:(CGColor *)a5 x:(double)a6 y:(double)a7 radius:(double)a8
{
  CGContextSetFillColorWithColor(a3, a4);
  CGContextMoveToPoint(a3, a6, a7);
  CGContextAddArc(a3, a6, a7, a8, 0.0, 6.28318531, 0);
  CGContextFillPath(a3);
  CGContextSetFillColorWithColor(a3, a5);
  CGContextMoveToPoint(a3, a6, a7);
  CGContextAddArc(a3, a6, a7, a8 * 0.5, 0.0, 6.28318531, 0);
  CGContextFillPath(a3);
}

- (id)filteredPointSelectionContexts:(id)a3 forTouchPoints:(id)a4 resultsDidChange:(BOOL *)a5
{
  return a3;
}

- (CGRect)adjustRect:(CGRect)a3 forFont:(id)a4
{
  double width;
  double y;
  CGFloat v6;
  id v7;
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
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  v6 = a3.origin.x + -1.0;
  v7 = a4;
  objc_msgSend(v7, "ascender");
  v9 = v8;
  objc_msgSend(v7, "capHeight");
  v11 = y + v9 - v10 + -1.0;
  objc_msgSend(v7, "capHeight");
  v13 = v12;

  v14 = v13 + 2.0;
  v15 = v6;
  v16 = v11;
  v17 = width + 2.0;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)backgroundRectFromStringRect:(CGRect)a3 forFont:(id)a4
{
  double width;
  double y;
  CGFloat v6;
  id v7;
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
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  v6 = a3.origin.x + -1.0;
  v7 = a4;
  objc_msgSend(v7, "ascender");
  v9 = v8;
  objc_msgSend(v7, "capHeight");
  v11 = y + v9 - v10 + -1.0;
  objc_msgSend(v7, "capHeight");
  v13 = v12;

  v14 = v13 + 2.0;
  v15 = v6;
  v16 = v11;
  v17 = width + 2.0;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKGraphSeriesDataSource)dataSourceStorage
{
  return self->_dataSourceStorage;
}

- (BOOL)adjustYAxisForLabelsStorage
{
  return self->_adjustYAxisForLabelsStorage;
}

- (id)seriesDataSourceContextStorage
{
  return self->_seriesDataSourceContextStorage;
}

- (BOOL)isCriticalForAutoscaleStorage
{
  return self->_isCriticalForAutoscaleStorage;
}

- (BOOL)wantsRoundingDuringYRangeExpansionStorage
{
  return self->_wantsRoundingDuringYRangeExpansionStorage;
}

- (HKGraphSeriesAxisScalingRule)axisScalingRuleStorage
{
  return self->_axisScalingRuleStorage;
}

- (UIColor)offScreenIndicatorColorStorage
{
  return self->_offScreenIndicatorColorStorage;
}

- (BOOL)invertYAxisStorage
{
  return self->_invertYAxisStorage;
}

- (HKAxis)yAxisStorage
{
  return self->_yAxisStorage;
}

- (HKSeriesDelegate)delegateStorage
{
  return (HKSeriesDelegate *)objc_loadWeakRetained((id *)&self->_delegateStorage);
}

- (NSArray)titleLegendEntriesStorage
{
  return self->_titleLegendEntriesStorage;
}

- (NSArray)detailLegendEntriesStorage
{
  return self->_detailLegendEntriesStorage;
}

- (BOOL)drawLegendInsideSeriesStorage
{
  return self->_drawLegendInsideSeriesStorage;
}

- (double)alphaStorage
{
  return self->_alphaStorage;
}

- (double)offscreenIndicatorAlphaStorage
{
  return self->_offscreenIndicatorAlphaStorage;
}

- (BOOL)allowsSelectionStorage
{
  return self->_allowsSelectionStorage;
}

- (BOOL)drawSelectionLineBehindAllSeriesStorage
{
  return self->_drawSelectionLineBehindAllSeriesStorage;
}

- ($E95C1AA31F623F7CA201BB06ED3AA00A)selectedPathRangeStorage
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].var1.var0.index;
  *(_OWORD *)&retstr->var0.var0.index = *(_OWORD *)&self[2].var0.var0.resolution;
  *(_OWORD *)&retstr->var0.var0.resolution = v3;
  v4 = *(_OWORD *)&self[3].var0.var0.index;
  *(_OWORD *)&retstr->var1.var0.index = *(_OWORD *)&self[2].var1.var0.resolution;
  *(_OWORD *)&retstr->var1.var0.resolution = v4;
  return self;
}

- (HKValueRange)closestXCoordinateRangeStorage
{
  return self->_closestXCoordinateRangeStorage;
}

- (HKValueRange)visibleValueRangeStorage
{
  return self->_visibleValueRangeStorage;
}

- (BOOL)internalDirtyFlag
{
  return self->_internalDirtyFlag;
}

- (NSMutableDictionary)cachedCoordinateListsByBlockPath
{
  return self->_cachedCoordinateListsByBlockPath;
}

- (void)setCachedCoordinateListsByBlockPath:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCoordinateListsByBlockPath, a3);
}

- (NSMutableDictionary)cachedDataBlocksByBlockPath
{
  return self->_cachedDataBlocksByBlockPath;
}

- (void)setCachedDataBlocksByBlockPath:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDataBlocksByBlockPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDataBlocksByBlockPath, 0);
  objc_storeStrong((id *)&self->_cachedCoordinateListsByBlockPath, 0);
  objc_storeStrong((id *)&self->_visibleValueRangeStorage, 0);
  objc_storeStrong((id *)&self->_closestXCoordinateRangeStorage, 0);
  objc_storeStrong((id *)&self->_detailLegendEntriesStorage, 0);
  objc_storeStrong((id *)&self->_titleLegendEntriesStorage, 0);
  objc_destroyWeak((id *)&self->_delegateStorage);
  objc_storeStrong((id *)&self->_yAxisStorage, 0);
  objc_storeStrong((id *)&self->_offScreenIndicatorColorStorage, 0);
  objc_storeStrong((id *)&self->_axisScalingRuleStorage, 0);
  objc_storeStrong(&self->_seriesDataSourceContextStorage, 0);
  objc_storeStrong((id *)&self->_dataSourceStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  BOOL result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  BOOL result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  OUTLINED_FUNCTION_0_9();
  NSRequestConcreteImplementation();
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return 0;
}

- (BOOL)supportsMultiTouchSelection
{
  BOOL result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (void)_getBlockFromDataSource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D7813000, a1, a3, "_getBlockFromDataSource: unexpected time out waiting for a block", a5, a6, a7, a8, 0);
}

- (void)_requestDataSourceBlocksFromPath:(uint64_t)a3 toPath:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D7813000, a1, a3, "_requestDataSourceBlocksFromPath: unexpected time out requesting blocks", a5, a6, a7, a8, 0);
}

@end
