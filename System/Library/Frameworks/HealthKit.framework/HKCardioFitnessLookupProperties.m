@implementation HKCardioFitnessLookupProperties

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)age
{
  return self->_age;
}

- (void)setAge:(int64_t)a3
{
  self->_age = a3;
}

- (HKQuantity)vo2MaxQuantity
{
  return self->_vo2MaxQuantity;
}

- (void)setVo2MaxQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vo2MaxQuantity, 0);
}

@end
