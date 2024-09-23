@implementation HKCumulativeQuantitySeriesSample

- (HKQuantity)sum
{
  return (HKQuantity *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sum, 0);
}

@end
