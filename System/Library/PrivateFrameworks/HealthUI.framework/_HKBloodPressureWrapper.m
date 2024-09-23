@implementation _HKBloodPressureWrapper

- (HKStatistics)systolic
{
  return self->_systolic;
}

- (void)setSystolic:(id)a3
{
  objc_storeStrong((id *)&self->_systolic, a3);
}

- (HKStatistics)diastolic
{
  return self->_diastolic;
}

- (void)setDiastolic:(id)a3
{
  objc_storeStrong((id *)&self->_diastolic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolic, 0);
  objc_storeStrong((id *)&self->_systolic, 0);
}

@end
