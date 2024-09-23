@implementation _ActivityCurrentValueView

- (_ActivityCurrentValueView)initWithDisplayTypeController:(id)a3 unitPreferenceController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 currentValueViewCallbacks:(id)a6 activitySummaryDataProvider:(id)a7 activityOptions:(unint64_t)a8 firstWeekday:(int64_t)a9 isChartSharingContext:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  _ActivityCurrentValueView *v20;
  HKInteractiveChartAnnotationView *v21;
  HKInteractiveChartAnnotationView *annotationView;
  _ActivityCurrentValueDataSource *v23;
  _ActivityCurrentValueDataSource *currentValueDataSource;
  uint64_t v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_ActivityCurrentValueView;
  v20 = -[_ActivityCurrentValueView initWithFrame:](&v28, sel_initWithFrame_, 0.0, 0.0, 320.0, 48.0);
  if (v20)
  {
    v21 = -[HKInteractiveChartAnnotationView initWithContext:]([HKInteractiveChartAnnotationView alloc], "initWithContext:", 2);
    annotationView = v20->_annotationView;
    v20->_annotationView = v21;

    LOBYTE(v26) = a10;
    v23 = -[_ActivityCurrentValueDataSource initWithDisplayTypeController:unitController:wheelchairUseCharacteristicCache:currentValueViewContext:firstWeekday:activityOptions:currentValueViewCallbacks:isChartSharingContext:]([_ActivityCurrentValueDataSource alloc], "initWithDisplayTypeController:unitController:wheelchairUseCharacteristicCache:currentValueViewContext:firstWeekday:activityOptions:currentValueViewCallbacks:isChartSharingContext:", v27, v16, v17, 1, a9, a8, v18, v26);
    currentValueDataSource = v20->_currentValueDataSource;
    v20->_currentValueDataSource = v23;

    -[HKInteractiveChartAnnotationView setDataSource:](v20->_annotationView, "setDataSource:", v20->_currentValueDataSource);
    -[_ActivityCurrentValueView addSubview:](v20, "addSubview:", v20->_annotationView);
    objc_storeStrong((id *)&v20->_activitySummaryDataProvider, a7);
    -[HKInteractiveChartAnnotationView setTranslatesAutoresizingMaskIntoConstraints:](v20->_annotationView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    v20->_isChartSharingContext = a10;
    -[_ActivityCurrentValueView setPreservesSuperviewLayoutMargins:](v20, "setPreservesSuperviewLayoutMargins:", 1);
  }

  return v20;
}

- (void)updateWithGraphView:(id)a3 timeScope:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[_ActivityCurrentValueView computeVisibleSummaryForGraphView:timeScope:filterDateIntervals:](self, "computeVisibleSummaryForGraphView:timeScope:filterDateIntervals:", a3, a4, MEMORY[0x1E0C9AA60]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "summaryResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ActivityCurrentValueView currentValueDataSource](self, "currentValueDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivitySummary:", v5);

  v7 = objc_msgSend(v12, "timeScope");
  -[_ActivityCurrentValueView currentValueDataSource](self, "currentValueDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeScope:", v7);

  v9 = objc_msgSend(v12, "hasNoData");
  -[_ActivityCurrentValueView currentValueDataSource](self, "currentValueDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentValueViewHasNoData:", v9);

  -[_ActivityCurrentValueView annotationView](self, "annotationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  -[_ActivityCurrentValueView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_ActivityCurrentValueView;
  -[_ActivityCurrentValueView layoutSubviews](&v14, sel_layoutSubviews);
  -[_ActivityCurrentValueView layoutMargins](self, "layoutMargins");
  v4 = v3 + -10.0;
  -[_ActivityCurrentValueView annotationView](self, "annotationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;

  -[_ActivityCurrentValueView bounds](self, "bounds");
  v12 = (v11 - v9) * 0.5;
  if (v10 + v4 * -2.0 < v7)
    v7 = v10 + v4 * -2.0;
  -[_ActivityCurrentValueView annotationView](self, "annotationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v12, v7, v9);

}

- (id)computeVisibleSummaryForGraphView:(id)a3 timeScope:(int64_t)a4 filterDateIntervals:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  if ((unint64_t)a4 >= 6)
  {
    if (a4 != 6)
    {
      v11 = 0;
      goto LABEL_4;
    }
    -[_ActivityCurrentValueView _computeSingleDayVisibleSummaryForGraphView:filterDateIntervals:](self, "_computeSingleDayVisibleSummaryForGraphView:filterDateIntervals:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_ActivityCurrentValueView _computeMultiDayVisibleSummaryForGraphView:timeScope:filterDateIntervals:](self, "_computeMultiDayVisibleSummaryForGraphView:timeScope:filterDateIntervals:", v8, a4, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_4:

  return v11;
}

- (id)_computeMultiDayVisibleSummaryForGraphView:(id)a3 timeScope:(int64_t)a4 filterDateIntervals:(id)a5
{
  id v8;
  id v9;
  _ActivityCurrentValueSummary *v10;
  void *v11;
  id v12;
  _ActivityCurrentValueSummary *v13;
  _ActivitySummaryForCollection *v14;
  _ActivitySummaryForCollection *v15;
  _QWORD v17[5];
  id v18;
  _ActivityCurrentValueSummary *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;

  v8 = a3;
  v9 = a5;
  v10 = -[_ActivityCurrentValueSummary initWithTimeScope:]([_ActivityCurrentValueSummary alloc], "initWithTimeScope:", a4);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__21;
  v26[4] = __Block_byref_object_dispose__21;
  v27 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  +[HKInteractiveChartActivityController firstActivitySeriesForGraphView:](HKInteractiveChartActivityController, "firstActivitySeriesForGraphView:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102___ActivityCurrentValueView__computeMultiDayVisibleSummaryForGraphView_timeScope_filterDateIntervals___block_invoke;
  v17[3] = &unk_1E9C451E0;
  v17[4] = self;
  v12 = v9;
  v18 = v12;
  v20 = v26;
  v13 = v10;
  v19 = v13;
  v21 = &v22;
  objc_msgSend(v8, "enumerateVisibleCoordinatesForSeries:block:", v11, v17);
  -[_ActivityCurrentValueSummary finishCollatingSummaryWithGraphView:](v13, "finishCollatingSummaryWithGraphView:", v8);
  v14 = [_ActivitySummaryForCollection alloc];
  v15 = -[_ActivitySummaryForCollection initWithActivitySummary:timeScope:hasNoData:](v14, "initWithActivitySummary:timeScope:hasNoData:", v13, a4, v23[3] == 0);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

  return v15;
}

- (BOOL)_summaryOutsideRanges:(id)a3 summary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateComponentsForCalendar:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "startOfDayForDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    objc_msgSend(v7, "hk_startOfDateByAddingDays:toDate:", 1, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v12);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v20 = v10;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "intersectsDateInterval:", v13) & 1) != 0)
          {
            v11 = 0;
            goto LABEL_12;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v16)
          continue;
        break;
      }
      v11 = 1;
LABEL_12:
      v10 = v20;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_computeSingleDayVisibleSummaryForGraphView:(id)a3 filterDateIntervals:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _ActivityCurrentValueSummary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _ActivitySummaryForCollection *v15;

  v6 = a4;
  objc_msgSend(a3, "effectiveVisibleRangeCadence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ActivityCurrentValueView activitySummaryDataProvider](self, "activitySummaryDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activitySummariesForDateRange:timeScope:", v7, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && !-[_ActivityCurrentValueView _summaryOutsideRanges:summary:](self, "_summaryOutsideRanges:summary:", v6, v10))
  {
    v14 = 0;
  }
  else
  {
    v11 = -[_ActivityCurrentValueSummary initWithTimeScope:]([_ActivityCurrentValueSummary alloc], "initWithTimeScope:", 6);

    objc_msgSend(v7, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityCurrentValueSummary _setStartDate:](v11, "_setStartDate:", v12);

    objc_msgSend(v7, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityCurrentValueSummary _setEndDate:](v11, "_setEndDate:", v13);

    v14 = 1;
    v10 = v11;
  }
  v15 = -[_ActivitySummaryForCollection initWithActivitySummary:timeScope:hasNoData:]([_ActivitySummaryForCollection alloc], "initWithActivitySummary:timeScope:hasNoData:", v10, 6, v14);

  return v15;
}

- (HKInteractiveChartAnnotationView)annotationView
{
  return self->_annotationView;
}

- (_ActivityCurrentValueDataSource)currentValueDataSource
{
  return self->_currentValueDataSource;
}

- (void)setCurrentValueDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueDataSource, a3);
}

- (HKActivitySummaryDataProvider)activitySummaryDataProvider
{
  return self->_activitySummaryDataProvider;
}

- (void)setActivitySummaryDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryDataProvider, a3);
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMarginConstraint, a3);
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, a3);
}

- (BOOL)isChartSharingContext
{
  return self->_isChartSharingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_activitySummaryDataProvider, 0);
  objc_storeStrong((id *)&self->_currentValueDataSource, 0);
  objc_storeStrong((id *)&self->_annotationView, 0);
}

@end
