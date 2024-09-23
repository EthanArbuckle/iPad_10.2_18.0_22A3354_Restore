@implementation MLComputePlanCost

- (MLComputePlanCost)initWithWeight:(double)a3
{
  MLComputePlanCost *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLComputePlanCost;
  result = -[MLComputePlanCost init](&v5, sel_init);
  if (result)
    result->_weight = a3;
  return result;
}

- (double)weight
{
  return self->_weight;
}

@end
