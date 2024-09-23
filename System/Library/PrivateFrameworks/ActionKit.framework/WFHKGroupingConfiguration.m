@implementation WFHKGroupingConfiguration

- (int64_t)groupingOption
{
  return self->_groupingOption;
}

- (void)setGroupingOption:(int64_t)a3
{
  self->_groupingOption = a3;
}

- (BOOL)fillMissing
{
  return self->_fillMissing;
}

- (void)setFillMissing:(BOOL)a3
{
  self->_fillMissing = a3;
}

- (NSDate)queryStartDate
{
  return self->_queryStartDate;
}

- (void)setQueryStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_queryStartDate, a3);
}

- (NSDate)queryEndDate
{
  return self->_queryEndDate;
}

- (void)setQueryEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_queryEndDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryEndDate, 0);
  objc_storeStrong((id *)&self->_queryStartDate, 0);
}

@end
