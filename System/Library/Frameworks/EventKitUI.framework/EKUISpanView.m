@implementation EKUISpanView

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 432, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (BOOL)inset
{
  return self->_inset;
}

- (void)setInset:(BOOL)a3
{
  self->_inset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
