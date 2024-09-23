@implementation EMSuppressNotAuthenticatedAction

- (int64_t)signpostType
{
  return 15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
