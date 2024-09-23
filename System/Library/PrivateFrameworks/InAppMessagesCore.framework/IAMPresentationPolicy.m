@implementation IAMPresentationPolicy

- (IAMPresentationPolicy)initWithMinimumIntervalBetweenPresentations:(double)a3 forPresentationPolicyGroup:(int64_t)a4
{
  IAMPresentationPolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IAMPresentationPolicy;
  result = -[IAMPresentationPolicy init](&v7, sel_init);
  if (result)
  {
    result->_minimumIntervalBetweenPresentations = a3;
    result->_policyGroup = a4;
  }
  return result;
}

+ (int64_t)presentationPolicyGroupForGlobalPresentationPolicyGroup:(int)a3
{
  return a3 == 1;
}

- (int64_t)policyGroup
{
  return self->_policyGroup;
}

- (double)minimumIntervalBetweenPresentations
{
  return self->_minimumIntervalBetweenPresentations;
}

@end
