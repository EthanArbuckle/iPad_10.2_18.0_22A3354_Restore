@implementation HKQuantityWrapper

- (HKQuantityWrapper)initWithQuantity:(id)a3 dateInterval:(id)a4
{
  HKQuantity *v6;
  NSDateInterval *v7;
  HKQuantityWrapper *v8;
  HKQuantity *quantity;
  HKQuantity *v10;
  NSDateInterval *dateInterval;
  objc_super v13;

  v6 = (HKQuantity *)a3;
  v7 = (NSDateInterval *)a4;
  v13.receiver = self;
  v13.super_class = (Class)HKQuantityWrapper;
  v8 = -[HKQuantityWrapper init](&v13, sel_init);
  quantity = v8->_quantity;
  v8->_quantity = v6;
  v10 = v6;

  dateInterval = v8->_dateInterval;
  v8->_dateInterval = v7;

  return v8;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end
