@implementation LACSharedModePolicyTraitsManager

- (int64_t)policyTraitsForSharedMode:(id)a3
{
  return objc_msgSend(a3, "isActive");
}

@end
