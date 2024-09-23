@implementation HKChartSummaryTimescopeTrend

- (id)initForTimeScope:(int64_t)a3 trendSpans:(id)a4 localizableTrendDescription:(id)a5
{
  id v9;
  id v10;
  HKChartSummaryTimescopeTrend *v11;
  id *p_isa;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKChartSummaryTimescopeTrend;
  v11 = -[HKChartSummaryTimescopeTrend init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_timeScope = a3;
    objc_storeStrong((id *)&v11->_trendSpans, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  HKChartSummaryTimescopeTrend *v4;
  HKChartSummaryTimescopeTrend *v5;
  BOOL v6;

  v4 = (HKChartSummaryTimescopeTrend *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_timeScope == v5->_timeScope
        && -[NSArray isEqual:](self->_trendSpans, "isEqual:", v5->_trendSpans)
        && -[NSString isEqualToString:](self->_localizableTrendDescription, "isEqualToString:", v5->_localizableTrendDescription);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t timeScope;
  uint64_t v4;

  timeScope = self->_timeScope;
  v4 = -[NSArray hash](self->_trendSpans, "hash") ^ timeScope;
  return v4 ^ -[NSString hash](self->_localizableTrendDescription, "hash");
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (NSArray)trendSpans
{
  return self->_trendSpans;
}

- (NSString)localizableTrendDescription
{
  return self->_localizableTrendDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizableTrendDescription, 0);
  objc_storeStrong((id *)&self->_trendSpans, 0);
}

@end
