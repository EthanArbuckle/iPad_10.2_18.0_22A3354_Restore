@implementation HMFVersion(HMBModel)

- (BOOL)isGreaterThan:()HMBModel
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isLessThan:()HMBModel
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)isGreaterThanOrEqualTo:()HMBModel
{
  return objc_msgSend(a1, "isLessThan:") ^ 1;
}

- (uint64_t)isLessThanOrEqualTo:()HMBModel
{
  return objc_msgSend(a1, "isGreaterThan:") ^ 1;
}

@end
