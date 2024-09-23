@implementation UIAXPKSpendingElement

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (double)chartValue
{
  return self->_chartValue;
}

- (void)setChartValue:(double)a3
{
  self->_chartValue = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currency, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
