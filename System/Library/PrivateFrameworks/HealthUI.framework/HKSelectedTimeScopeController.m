@implementation HKSelectedTimeScopeController

- (HKSelectedTimeScopeController)init
{
  HKSelectedTimeScopeController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSelectedTimeScopeController;
  result = -[HKSelectedTimeScopeController init](&v3, sel_init);
  if (result)
    result->_selectedTimeScope = 6;
  return result;
}

- (int64_t)selectedTimeScope
{
  return self->_selectedTimeScope;
}

- (void)setSelectedTimeScope:(int64_t)a3
{
  self->_selectedTimeScope = a3;
}

@end
