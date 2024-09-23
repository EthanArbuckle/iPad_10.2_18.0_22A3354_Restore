@implementation _ActivityCurrentValueDataSource

- (_ActivityCurrentValueDataSource)initWithDisplayTypeController:(id)a3 unitController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 currentValueViewContext:(BOOL)a6 firstWeekday:(int64_t)a7 activityOptions:(unint64_t)a8 currentValueViewCallbacks:(id)a9 isChartSharingContext:(BOOL)a10
{
  _BOOL8 v12;
  id v17;
  _ActivityCurrentValueDataSource *v18;
  _ActivityCurrentValueDataSource *v19;
  uint64_t v20;
  UIView *noDataView;
  objc_super v24;

  v12 = a6;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)_ActivityCurrentValueDataSource;
  v18 = -[HKActivitySummaryAnnotationViewDataSource initWithDisplayTypeController:unitController:wheelchairUseCharacteristicCache:dateCache:currentValueViewContext:activityOptions:firstWeekday:isChartSharingContext:](&v24, sel_initWithDisplayTypeController_unitController_wheelchairUseCharacteristicCache_dateCache_currentValueViewContext_activityOptions_firstWeekday_isChartSharingContext_, a3, a4, a5, 0, v12, a8, a7, a10);
  v19 = v18;
  if (v18)
  {
    -[_ActivityCurrentValueDataSource setCurrentValueViewCallbacks:](v18, "setCurrentValueViewCallbacks:", v17);
    -[_ActivityCurrentValueDataSource _buildNoDataView](v19, "_buildNoDataView");
    v20 = objc_claimAutoreleasedReturnValue();
    noDataView = v19->_noDataView;
    v19->_noDataView = (UIView *)v20;

  }
  return v19;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  objc_super v6;

  if (-[_ActivityCurrentValueDataSource currentValueViewHasNoData](self, "currentValueViewHasNoData"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)_ActivityCurrentValueDataSource;
  -[HKActivitySummaryAnnotationViewDataSource leftMarginViewWithOrientation:](&v6, sel_leftMarginViewWithOrientation_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if (-[_ActivityCurrentValueDataSource currentValueViewHasNoData](self, "currentValueViewHasNoData"))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_ActivityCurrentValueDataSource;
    v5 = -[HKActivitySummaryAnnotationViewDataSource numberOfValuesForAnnotationView:](&v7, sel_numberOfValuesForAnnotationView_, v4);
  }

  return v5;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  void *v7;
  objc_super v9;

  if (-[_ActivityCurrentValueDataSource currentValueViewHasNoData](self, "currentValueViewHasNoData"))
  {
    -[_ActivityCurrentValueDataSource noDataView](self, "noDataView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_ActivityCurrentValueDataSource;
    -[HKActivitySummaryAnnotationViewDataSource valueViewForColumnAtIndex:orientation:](&v9, sel_valueViewForColumnAtIndex_orientation_, a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[_ActivityCurrentValueDataSource _localizedCurrentValueViewDateRange](self, "_localizedCurrentValueViewDateRange", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueDateFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);

  return v4;
}

- (id)_buildNoDataView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CHART_NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v6);

  return v2;
}

- (id)_localizedCurrentValueViewDateRange
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_5:
    -[_ActivityCurrentValueDataSource _dateRangeFromComponents](self, "_dateRangeFromComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ActivityCurrentValueDataSource _dateRangeFromStartDate:endDate:](self, "_dateRangeFromStartDate:endDate:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_dateRangeFromStartDate:(id)a3 endDate:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ActivityCurrentValueDataSource currentValueViewCallbacks](self, "currentValueViewCallbacks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForValueRange:timeScope:", v5, -[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dateRangeFromComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_gregorianDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope"))
  {
    case 0:
      objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 4, 10, v6, 0);

      goto LABEL_4;
    case 1:
LABEL_4:
      v7 = v3;
      v8 = 4;
      v9 = 5;
      goto LABEL_10;
    case 2:
      v7 = v3;
      v8 = 4;
      goto LABEL_9;
    case 3:
      v7 = v3;
      v8 = 0x2000;
      v9 = 26;
      goto LABEL_10;
    case 4:
    case 5:
      v7 = v3;
      v8 = 8;
      goto LABEL_9;
    case 6:
      v7 = v3;
      v8 = 16;
      goto LABEL_9;
    case 7:
      v7 = v3;
      v8 = 32;
LABEL_9:
      v9 = 1;
LABEL_10:
      objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", v8, v9, v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_12;
      -[_ActivityCurrentValueDataSource _dateRangeFromStartDate:endDate:](self, "_dateRangeFromStartDate:endDate:", v6, v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_12:
      v11 = CFSTR("Unknown Date");
      break;
  }

  return v11;
}

- (HKInteractiveChartCurrentValueViewCallbacks)currentValueViewCallbacks
{
  return (HKInteractiveChartCurrentValueViewCallbacks *)objc_loadWeakRetained((id *)&self->_currentValueViewCallbacks);
}

- (void)setCurrentValueViewCallbacks:(id)a3
{
  objc_storeWeak((id *)&self->_currentValueViewCallbacks, a3);
}

- (BOOL)currentValueViewHasNoData
{
  return self->_currentValueViewHasNoData;
}

- (void)setCurrentValueViewHasNoData:(BOOL)a3
{
  self->_currentValueViewHasNoData = a3;
}

- (UIView)noDataView
{
  return self->_noDataView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noDataView, 0);
  objc_destroyWeak((id *)&self->_currentValueViewCallbacks);
}

@end
