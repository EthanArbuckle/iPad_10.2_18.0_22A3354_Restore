@implementation HKHandwashingFactorAndTrendViewController

- (HKHandwashingFactorAndTrendViewController)initWithHandwashingDisplayType:(id)a3 applicationItems:(id)a4 trendModel:(id)a5 factorDisplayTypes:(id)a6 displayDate:(id)a7 mode:(int64_t)a8 options:(unint64_t)a9
{
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKHandwashingFactorAndTrendViewController;
  return -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:](&v10, sel_initWithBaseChartDisplayType_trendModel_factorDisplayTypes_displayDate_applicationItems_mode_timeScopeRanges_initialTimeScope_wrappedOverlay_overrideFirstWeekday_overrideCalendar_additionalChartOptions_, a3, a5, a6, a7, a4, a8, 0, 8, 0, -1, 0, a9);
}

- (id)createChartOverlayViewController
{
  HKHandwashingInteractiveChartViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  HKHandwashingInteractiveChartViewController *v7;

  v3 = [HKHandwashingInteractiveChartViewController alloc];
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController displayDate](self, "displayDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController restorationUserActivity](self, "restorationUserActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKHandwashingInteractiveChartViewController initWithApplicationItems:displayDate:restorationUserActivity:additionalChartOptions:](v3, "initWithApplicationItems:displayDate:restorationUserActivity:additionalChartOptions:", v4, v5, v6, -[HKOverlayRoomViewController additionalChartOptions](self, "additionalChartOptions"));

  return v7;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  HKHandwashingFactorAndTrendViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  HKHandwashingFactorAndTrendViewController *v15;

  v8 = a5;
  v9 = a4;
  v10 = -[HKOverlayRoomViewController filteredInteractiveChartOptionsForMode:](self, "filteredInteractiveChartOptionsForMode:", a3);
  v11 = [HKHandwashingFactorAndTrendViewController alloc];
  -[HKOverlayRoomFactorAndTrendViewController baseChartDisplayType](self, "baseChartDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomFactorAndTrendViewController trendModel](self, "trendModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController factorDisplayTypes](self, "factorDisplayTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKHandwashingFactorAndTrendViewController initWithHandwashingDisplayType:applicationItems:trendModel:factorDisplayTypes:displayDate:mode:options:](v11, "initWithHandwashingDisplayType:applicationItems:trendModel:factorDisplayTypes:displayDate:mode:options:", v12, v8, v13, v14, v9, a3, v10);

  return v15;
}

@end
