@implementation HKInteractiveChartMenstruationData

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (BOOL)startOfCycle
{
  return self->_startOfCycle;
}

- (void)setStartOfCycle:(BOOL)a3
{
  self->_startOfCycle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
