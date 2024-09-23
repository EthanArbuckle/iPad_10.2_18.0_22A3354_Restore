@implementation ML3AnyCompoundPredicate

- (id)compoundOperatorJoiner
{
  return CFSTR(" OR ");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
