@implementation HKInteractiveChartAnnotationViewDataSource

- (HKInteractiveChartAnnotationViewDataSource)initWithSelectedRangeFormatter:(id)a3 firstWeekday:(int64_t)a4 currentValueViewDataSourceDelegate:(id)a5
{
  id v9;
  id v10;
  HKInteractiveChartAnnotationViewDataSource *v11;
  HKInteractiveChartAnnotationViewDataSource *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKInteractiveChartAnnotationViewDataSource;
  v11 = -[HKInteractiveChartAnnotationViewDataSource init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_selectedRangeFormatter, a3);
    v12->_firstWeekday = a4;
    objc_storeWeak((id *)&v12->_currentValueViewDataSourceDelegate, v10);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource setMajorFont:](v12, "setMajorFont:", v13);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueUnitFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource setMinorFont:](v12, "setMinorFont:", v14);

    -[HKInteractiveChartAnnotationViewDataSource _buildDateLabels](v12, "_buildDateLabels");
  }

  return v12;
}

- (void)_buildDateLabels
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKInteractiveChartAnnotationViewDataSource setMainDateLabel:](self, "setMainDateLabel:", v3);

  -[HKInteractiveChartAnnotationViewDataSource mainDateLabel](self, "mainDateLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueDateFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewDataSource mainDateLabel](self, "mainDateLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  v7 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKInteractiveChartAnnotationViewDataSource mainDateLabel](self, "mainDateLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  if (!v10)
  -[HKInteractiveChartAnnotationViewDataSource mainDateLabel](self, "mainDateLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBaselineAdjustment:", 1);

}

- (id)dateViewWithOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;

  -[HKInteractiveChartAnnotationViewDataSource lastCombinedDateString](self, "lastCombinedDateString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewDataSource mainDateLabel](self, "mainDateLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (!a3)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKInteractiveChartAnnotationViewDataSource dateViewWithOrientation:].cold.1(v7);
  }
  -[HKInteractiveChartAnnotationViewDataSource mainDateLabel](self, "mainDateLabel");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (void)_updateDateTextWithTimeScope:(int64_t)a3 resolution:(int64_t)a4
{
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
  id v18;

  if (-[HKInteractiveChartAnnotationViewDataSource _isMultiSelectionDateRange](self, "_isMultiSelectionDateRange"))
  {
    -[HKInteractiveChartAnnotationViewDataSource currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource lastDateRange](self, "lastDateRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForValueRange:timeScope:", v8, a3);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[HKInteractiveChartAnnotationViewDataSource setLastUpperDateString:](self, "setLastUpperDateString:", v18);
    -[HKInteractiveChartAnnotationViewDataSource setLastLowerDateString:](self, "setLastLowerDateString:", 0);
    -[HKInteractiveChartAnnotationViewDataSource setLastCombinedDateString:](self, "setLastCombinedDateString:", v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource lastDateRange](self, "lastDateRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:", 126, v11);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKUpperStringForAnnotationDateWithTimeScope((uint64_t)v18, v12, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource setLastUpperDateString:](self, "setLastUpperDateString:", v13);

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKLowerStringForAnnotationDateWithTimeScope((uint64_t)v18, v14, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource setLastLowerDateString:](self, "setLastLowerDateString:", v15);

    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v18, v16, a3, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource setLastCombinedDateString:](self, "setLastCombinedDateString:", v17);

  }
}

- (BOOL)_isMultiSelectionDateRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[HKInteractiveChartAnnotationViewDataSource lastDateRange](self, "lastDateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKInteractiveChartAnnotationViewDataSource lastDateRange](self, "lastDateRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewDataSource lastDateRange](self, "lastDateRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hk_isBeforeDate:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  return -[NSArray count](self->_annotationLabels, "count", a3);
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  -[NSArray objectAtIndexedSubscript:](self->_annotationLabels, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = v6;
    if (a4)
    {
      if (a4 != 1)
      {
LABEL_7:

        return v5;
      }
      v8 = 0;
    }
    else
    {
      v8 = 1;
    }
    objc_msgSend(v6, "setAxis:", v8);
    goto LABEL_7;
  }
  return v5;
}

- (BOOL)showSeparators
{
  return 0;
}

- (void)updateWithSelectionContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 healthStore:(id)a7 viewController:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  HKInteractiveChartAnnotationViewKeyValueLabel *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  void *v41;
  void *v42;
  id obj;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v45 = a7;
  v44 = a8;
  -[HKInteractiveChartAnnotationViewDataSource _dateRangeFromSelectionContext:timeScope:](self, "_dateRangeFromSelectionContext:timeScope:", v13, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewDataSource setLastDateRange:](self, "setLastDateRange:", v15);

  -[HKInteractiveChartAnnotationViewDataSource selectedRangeFormatter](self, "selectedRangeFormatter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v13;
  objc_msgSend(v13, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewDataSource majorFont](self, "majorFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewDataSource minorFont](self, "minorFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v14;
  v39 = a5;
  objc_msgSend(v16, "selectedRangeDataWithCoordinateInfo:majorFont:minorFont:displayType:timeScope:context:", v17, v18, v19, v14, a5, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v20;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v50;
    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v29);
        -[HKInteractiveChartAnnotationViewDataSource currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_opt_respondsToSelector();

        if ((v32 & 1) != 0)
        {
          -[HKInteractiveChartAnnotationViewDataSource currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "processSelectedRangeData:displayType:", v30, v42);

        }
        v34 = -[HKInteractiveChartAnnotationViewKeyValueLabel initWithFrame:]([HKInteractiveChartAnnotationViewKeyValueLabel alloc], "initWithFrame:", v25, v26, v27, v28);
        -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v34, "keyLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setSelectedRangeData:", v30);

        objc_msgSend(v30, "titleTapOutBlock");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __133__HKInteractiveChartAnnotationViewDataSource_updateWithSelectionContext_displayType_timeScope_resolution_healthStore_viewController___block_invoke;
          v46[3] = &unk_1E9C3FB90;
          v46[4] = v30;
          v47 = v45;
          v48 = v44;
          -[HKInteractiveChartAnnotationViewKeyValueLabel setTapOutBlock:](v34, "setTapOutBlock:", v46);

        }
        -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v34, "valueLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "attributedString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setAttributedText:", v38);

        objc_msgSend(v21, "addObject:", v34);
        ++v29;
      }
      while (v23 != v29);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v23);
  }

  -[HKInteractiveChartAnnotationViewDataSource setAnnotationLabels:](self, "setAnnotationLabels:", v21);
  -[HKInteractiveChartAnnotationViewDataSource _updateDateTextWithTimeScope:resolution:](self, "_updateDateTextWithTimeScope:resolution:", v39, a6);

}

void __133__HKInteractiveChartAnnotationViewDataSource_updateWithSelectionContext_displayType_timeScope_resolution_healthStore_viewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "titleTapOutBlock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)_dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v12;

  v6 = a3;
  -[HKInteractiveChartAnnotationViewDataSource currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || (-[HKInteractiveChartAnnotationViewDataSource currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate"), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "dateRangeFromSelectionContext:timeScope:", v6, a4), v10 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    if ((unint64_t)a4 > 8)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v6, "selectedPointValueRange");
      if (a4 == 3)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartAnnotationViewDataSource _weeksContainingDateRange:](self, "_weeksContainingDateRange:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v10;
}

- (id)_weeksContainingDateRange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "hk_gregorianCalendarWithLocalTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithValueRange:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_weeksContainingInterval:firstWeekday:", v7, -[HKInteractiveChartAnnotationViewDataSource firstWeekday](self, "firstWeekday"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (NSArray)annotationLabels
{
  return self->_annotationLabels;
}

- (void)setAnnotationLabels:(id)a3
{
  objc_storeStrong((id *)&self->_annotationLabels, a3);
}

- (int64_t)firstWeekday
{
  return self->_firstWeekday;
}

- (void)setFirstWeekday:(int64_t)a3
{
  self->_firstWeekday = a3;
}

- (HKValueRange)lastDateRange
{
  return (HKValueRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastDateRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UILabel)mainDateLabel
{
  return self->_mainDateLabel;
}

- (void)setMainDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_mainDateLabel, a3);
}

- (NSString)lastUpperDateString
{
  return self->_lastUpperDateString;
}

- (void)setLastUpperDateString:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpperDateString, a3);
}

- (NSString)lastLowerDateString
{
  return self->_lastLowerDateString;
}

- (void)setLastLowerDateString:(id)a3
{
  objc_storeStrong((id *)&self->_lastLowerDateString, a3);
}

- (NSString)lastCombinedDateString
{
  return self->_lastCombinedDateString;
}

- (void)setLastCombinedDateString:(id)a3
{
  objc_storeStrong((id *)&self->_lastCombinedDateString, a3);
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

- (HKCurrentValueViewDataSourceDelegate)currentValueViewDataSourceDelegate
{
  return (HKCurrentValueViewDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_currentValueViewDataSourceDelegate);
}

- (void)setCurrentValueViewDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_currentValueViewDataSourceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentValueViewDataSourceDelegate);
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_lastCombinedDateString, 0);
  objc_storeStrong((id *)&self->_lastLowerDateString, 0);
  objc_storeStrong((id *)&self->_lastUpperDateString, 0);
  objc_storeStrong((id *)&self->_mainDateLabel, 0);
  objc_storeStrong((id *)&self->_lastDateRange, 0);
  objc_storeStrong((id *)&self->_annotationLabels, 0);
  objc_storeStrong((id *)&self->_selectedRangeFormatter, 0);
}

- (void)dateViewWithOrientation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "Date formatting in lollipop no longer supports column orientation", v1, 2u);
}

@end
