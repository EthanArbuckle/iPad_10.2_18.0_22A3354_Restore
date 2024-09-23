@implementation _WDChartDataCacheControllerDisplayTypeTimeScopeTuple

- (_WDChartDataCacheControllerDisplayTypeTimeScopeTuple)initWithDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v7;
  _WDChartDataCacheControllerDisplayTypeTimeScopeTuple *v8;
  _WDChartDataCacheControllerDisplayTypeTimeScopeTuple *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_WDChartDataCacheControllerDisplayTypeTimeScopeTuple;
  v8 = -[_WDChartDataCacheControllerDisplayTypeTimeScopeTuple init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayType, a3);
    v9->_timeScope = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_timeScope ^ -[HKDisplayType hash](self->_displayType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[HKDisplayType isEqual:](self->_displayType, "isEqual:", v4[1]);
    v6 = self->_timeScope == v4[2] && v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end
