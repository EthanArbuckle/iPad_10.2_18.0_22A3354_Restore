@implementation CRKFetchRestrictionsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
