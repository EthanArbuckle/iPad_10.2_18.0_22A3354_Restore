@implementation NSMutableArray(HMFoundation)

- (uint64_t)hmf_removeFirstObject
{
  uint64_t result;

  result = objc_msgSend(a1, "count");
  if (result)
    return objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return result;
}

@end
