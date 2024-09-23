@implementation HMFVersion(HMDBackingStoreLocal)

- (BOOL)isGreaterThan:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isLessThan:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)isGreaterThanOrEqualTo:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "isLessThan:") ^ 1;
}

- (uint64_t)isLessThanOrEqualTo:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "isGreaterThan:") ^ 1;
}

@end
