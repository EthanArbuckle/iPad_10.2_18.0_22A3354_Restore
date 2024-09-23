@implementation MTLCommandQueueSPIStats

- (MTLCommandQueueSPIStats)initWithValues:(id)a3
{
  MTLCommandQueueSPIStats *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLCommandQueueSPIStats;
  result = -[MTLCommandQueueSPIStats init](&v5, sel_init);
  if (result)
    result->_values = (NSDictionary *)a3;
  return result;
}

- (NSDictionary)values
{
  return self->_values;
}

@end
