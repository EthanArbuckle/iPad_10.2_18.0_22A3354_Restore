@implementation HMDEventCounter

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (HMDEventCounter)initWithCount:(unint64_t)a3
{
  HMDEventCounter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDEventCounter;
  result = -[HMDEventCounter init](&v5, sel_init);
  if (result)
    result->_count = a3;
  return result;
}

- (HMDEventCounter)init
{
  return -[HMDEventCounter initWithCount:](self, "initWithCount:", 0);
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
