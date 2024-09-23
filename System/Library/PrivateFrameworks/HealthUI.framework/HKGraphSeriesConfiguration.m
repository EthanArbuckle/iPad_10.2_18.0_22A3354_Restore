@implementation HKGraphSeriesConfiguration

- (HKGraphSeries)graphSeries
{
  return self->_graphSeries;
}

- (void)setGraphSeries:(id)a3
{
  objc_storeStrong((id *)&self->_graphSeries, a3);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_graphSeries, 0);
}

@end
