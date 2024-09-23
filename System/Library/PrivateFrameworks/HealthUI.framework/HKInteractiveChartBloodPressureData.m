@implementation HKInteractiveChartBloodPressureData

- (HKValueRange)systolicRange
{
  return self->_systolicRange;
}

- (void)setSystolicRange:(id)a3
{
  objc_storeStrong((id *)&self->_systolicRange, a3);
}

- (HKValueRange)diastolicRange
{
  return self->_diastolicRange;
}

- (void)setDiastolicRange:(id)a3
{
  objc_storeStrong((id *)&self->_diastolicRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicRange, 0);
  objc_storeStrong((id *)&self->_systolicRange, 0);
}

@end
