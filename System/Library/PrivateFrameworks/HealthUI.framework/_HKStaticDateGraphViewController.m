@implementation _HKStaticDateGraphViewController

- (_HKStaticDateGraphViewController)initWithFixedRange:(id)a3 currentCalendar:(id)a4
{
  id v7;
  _HKStaticDateGraphViewController *v8;
  NSMutableArray *v9;
  NSMutableArray *allStackedSeries;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKStaticDateGraphViewController;
  v8 = -[HKDateGraphViewController initWithDateZoom:previousDateZoom:previousXAxisSpace:currentCalendar:](&v12, sel_initWithDateZoom_previousDateZoom_previousXAxisSpace_currentCalendar_, 5, 5, a4, 0.0);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allStackedSeries = v8->_allStackedSeries;
    v8->_allStackedSeries = v9;

    objc_storeStrong((id *)&v8->_fixedRange, a3);
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKStaticDateGraphViewController;
  -[HKDateGraphViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[HKGraphViewController graphView](self, "graphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisableSelection:", 1);
  -[_HKStaticDateGraphViewController fixedRange](self, "fixedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v4, v4, v4);

}

- (void)addStackedSeries:(id)a3
{
  -[NSMutableArray addObject:](self->_allStackedSeries, "addObject:", a3);
}

- (int64_t)stackCountForGraphView:(id)a3
{
  void *v3;
  int64_t v4;

  -[_HKStaticDateGraphViewController allStackedSeries](self, "allStackedSeries", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6
{
  id v6;

  -[HKGraphViewController graphView](self, "graphView", a3, a4, a5, a6);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:", 0, 0, 0, 0);

}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  void *v6;
  void *v7;

  -[_HKStaticDateGraphViewController allStackedSeries](self, "allStackedSeries", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableArray)allStackedSeries
{
  return self->_allStackedSeries;
}

- (void)setAllStackedSeries:(id)a3
{
  objc_storeStrong((id *)&self->_allStackedSeries, a3);
}

- (HKValueRange)fixedRange
{
  return self->_fixedRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedRange, 0);
  objc_storeStrong((id *)&self->_allStackedSeries, 0);
}

@end
