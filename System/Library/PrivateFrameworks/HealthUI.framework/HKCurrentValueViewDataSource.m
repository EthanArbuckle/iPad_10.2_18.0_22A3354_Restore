@implementation HKCurrentValueViewDataSource

- (HKCurrentValueViewDataSource)initWithDateCache:(id)a3 healthStore:(id)a4 selectedRangeFormatter:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKCurrentValueViewDataSource *v12;
  HKCurrentValueViewDataSource *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKCurrentValueViewDataSource;
  v12 = -[HKCurrentValueViewDataSource init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_selectedRangeFormatter, a5);
    objc_storeStrong((id *)&v13->_dateCache, a3);
    objc_storeStrong((id *)&v13->_healthStore, a4);
    v13->_pendingData = 0;
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCurrentValueViewDataSource setMajorFont:](v13, "setMajorFont:", v14);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueUnitFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCurrentValueViewDataSource setMinorFont:](v13, "setMinorFont:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[HKCurrentValueViewDataSource setDateLabelView:](v13, "setDateLabelView:", v16);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueDateFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCurrentValueViewDataSource dateLabelView](v13, "dateLabelView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v17);

    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HKCurrentValueViewDataSource setAnnotationLabels:](v13, "setAnnotationLabels:", v19);

  }
  return v13;
}

- (void)updateDataSourceWithGraphView:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a4;
  v9 = a3;
  -[HKCurrentValueViewDataSource setDisplayType:](self, "setDisplayType:", v8);
  -[HKCurrentValueViewDataSource _dateIntervalStringForGraphView:timeScope:](self, "_dateIntervalStringForGraphView:timeScope:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource setDateIntervalString:](self, "setDateIntervalString:", v10);

  -[HKCurrentValueViewDataSource selectedRangeFormatter](self, "selectedRangeFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource majorFont](self, "majorFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource minorFont](self, "minorFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectedRangeDataWithGraphView:majorFont:minorFont:displayType:timeScope:context:", v9, v12, v13, v8, a5, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource setSelectedRangeData:](self, "setSelectedRangeData:", v14);

  v15 = -[HKCurrentValueViewDataSource _pendingDataForGraphView:](self, "_pendingDataForGraphView:", v9);
  -[HKCurrentValueViewDataSource setPendingData:](self, "setPendingData:", v15);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource setTitleColor:](self, "setTitleColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource setValueColor:](self, "setValueColor:", v17);

  -[HKCurrentValueViewDataSource annotationLabels](self, "annotationLabels");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource selectedRangeData](self, "selectedRangeData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource _updateAnnotationLabels:fromRangeData:displayType:](self, "_updateAnnotationLabels:fromRangeData:displayType:", v19, v18, v8);

}

- (id)_dateIntervalStringForGraphView:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;

  v6 = a3;
  -[HKCurrentValueViewDataSource _delegateValueStringForGraphView:timeScope:](self, "_delegateValueStringForGraphView:timeScope:", v6, a4);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "effectiveVisibleRangeActive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKCurrentValueViewDataSource defaultStringForValueRange:timeScope:](HKCurrentValueViewDataSource, "defaultStringForValueRange:timeScope:", v9, a4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v7 = v8;
    else
      v7 = &stru_1E9C4C428;
  }
  v10 = v7;

  return v10;
}

- (id)_delegateValueStringForGraphView:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[HKCurrentValueViewDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HKCurrentValueViewDataSource delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectiveVisibleRangeActive");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForValueRange:timeScope:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_pendingDataForGraphView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v5 = a3;
  objc_msgSend(v5, "primarySeries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actualVisibleRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (v7 && v6)
  {
    v9 = objc_msgSend(v6, "resolutionForTimeScope:traitResolution:", objc_msgSend(v5, "xAxisDateZoom"), objc_msgSend(v5, "resolutionFromTraitCollectionAttributes"));
    v27 = 0uLL;
    v28 = 0;
    objc_msgSend(v6, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "xAxisDateZoom");
    if (v10)
    {
      objc_msgSend(v10, "blockPathForX:zoom:resolution:", v11, v12, v9);
    }
    else
    {
      v27 = 0uLL;
      v28 = 0;
    }

    v25 = 0uLL;
    v26 = 0;
    objc_msgSend(v6, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maxValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "xAxisDateZoom");
    if (v13)
    {
      objc_msgSend(v13, "blockPathForX:zoom:resolution:", v14, v15, v9);
    }
    else
    {
      v25 = 0uLL;
      v26 = 0;
    }

    v16 = v27;
    v17 = v25;
    if ((uint64_t)v27 > (uint64_t)v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCurrentValueViewDataSource.m"), 101, CFSTR("Visible block start should not be greater than visible block end"));

      v16 = v27;
      v17 = v25;
    }
    *(_QWORD *)&v27 = v16 - 1;
    *(_QWORD *)&v25 = v17 + 1;
    objc_msgSend(v6, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v27;
    v24 = v28;
    v21 = v25;
    v22 = v26;
    v8 = objc_msgSend(v18, "hasPendingQueriesBetweenStartPath:endPath:", &v23, &v21);

  }
  return v8;
}

- (void)_updateAnnotationLabels:(id)a3 fromRangeData:(id)a4 displayType:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  HKInteractiveChartAnnotationViewKeyValueLabel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v28 = *(_QWORD *)v31;
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (v12 >= objc_msgSend(v8, "count"))
        {
          v19 = -[HKInteractiveChartAnnotationViewKeyValueLabel initWithFrame:]([HKInteractiveChartAnnotationViewKeyValueLabel alloc], "initWithFrame:", v13, v14, v15, v16);
          objc_msgSend(v8, "addObject:", v19);
        }
        else
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
          v19 = (HKInteractiveChartAnnotationViewKeyValueLabel *)objc_claimAutoreleasedReturnValue();
        }
        -[HKCurrentValueViewDataSource _delegateTitleForSelectedRangeData:displayType:](self, "_delegateTitleForSelectedRangeData:displayType:", v18, v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v19, "keyLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
          objc_msgSend(v21, "setAttributedText:", v20);
        else
          objc_msgSend(v21, "setSelectedRangeData:", v18);

        -[HKCurrentValueViewDataSource _delegateValueForSelectedRangeData:](self, "_delegateValueForSelectedRangeData:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v19, "valueLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v23)
        {
          objc_msgSend(v24, "setAttributedText:", v23);
        }
        else
        {
          objc_msgSend(v18, "attributedString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setAttributedText:", v26);

        }
        ++v12;

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
    if (v12 < objc_msgSend(v8, "count"))
      objc_msgSend(v8, "removeObjectsInRange:", v12, objc_msgSend(v8, "count") - v12);
  }
  else
  {
    objc_msgSend(v8, "removeAllObjects");
  }

}

- (id)_delegateTitleForSelectedRangeData:(id)a3 displayType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[HKCurrentValueViewDataSource delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HKCurrentValueViewDataSource delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleForSelectedRangeData:displayType:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_delegateValueForSelectedRangeData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HKCurrentValueViewDataSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HKCurrentValueViewDataSource delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForSelectedRangeData:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)defaultStringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithValueRange:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a4 == 6)
      objc_msgSend(MEMORY[0x1E0CB3590], "hk_hourDateIntervalFormatter");
    else
      objc_msgSend(MEMORY[0x1E0CB3590], "hk_dayIntervalFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDateInterval:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKCurrentValueViewDataSource titleColor](self, "titleColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource dateLabelView](self, "dateLabelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[HKCurrentValueViewDataSource dateIntervalString](self, "dateIntervalString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCurrentValueViewDataSource dateLabelView](self, "dateLabelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  return -[HKCurrentValueViewDataSource dateLabelView](self, "dateLabelView");
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HKCurrentValueViewDataSource annotationLabels](self, "annotationLabels", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3 < 0
    || (-[HKCurrentValueViewDataSource annotationLabels](self, "annotationLabels"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 <= a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCurrentValueViewDataSource.m"), 193, CFSTR("Inconsistent current value view columns"));

  }
  -[HKCurrentValueViewDataSource annotationLabels](self, "annotationLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)showSeparators
{
  return 0;
}

- (NSArray)selectedRangeData
{
  return self->_selectedRangeData;
}

- (void)setSelectedRangeData:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRangeData, a3);
}

- (HKCurrentValueViewDataSourceDelegate)delegate
{
  return (HKCurrentValueViewDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (BOOL)pendingData
{
  return self->_pendingData;
}

- (void)setPendingData:(BOOL)a3
{
  self->_pendingData = a3;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (void)setSelectedRangeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRangeFormatter, a3);
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateCache, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (NSString)dateIntervalString
{
  return self->_dateIntervalString;
}

- (void)setDateIntervalString:(id)a3
{
  objc_storeStrong((id *)&self->_dateIntervalString, a3);
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (void)setValueColor:(id)a3
{
  objc_storeStrong((id *)&self->_valueColor, a3);
}

- (UIFont)majorFont
{
  return self->_majorFont;
}

- (void)setMajorFont:(id)a3
{
  objc_storeStrong((id *)&self->_majorFont, a3);
}

- (UIFont)minorFont
{
  return self->_minorFont;
}

- (void)setMinorFont:(id)a3
{
  objc_storeStrong((id *)&self->_minorFont, a3);
}

- (UILabel)dateLabelView
{
  return self->_dateLabelView;
}

- (void)setDateLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabelView, a3);
}

- (NSMutableArray)annotationLabels
{
  return self->_annotationLabels;
}

- (void)setAnnotationLabels:(id)a3
{
  objc_storeStrong((id *)&self->_annotationLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationLabels, 0);
  objc_storeStrong((id *)&self->_dateLabelView, 0);
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_dateIntervalString, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_selectedRangeFormatter, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedRangeData, 0);
}

@end
