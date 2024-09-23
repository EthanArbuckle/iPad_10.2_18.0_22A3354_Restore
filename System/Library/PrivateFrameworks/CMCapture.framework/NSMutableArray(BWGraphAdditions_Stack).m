@implementation NSMutableArray(BWGraphAdditions_Stack)

- (uint64_t)bw_pop
{
  uint64_t v3;

  if ((objc_msgSend(a1, "bw_empty") & 1) != 0)
    return 0;
  v3 = objc_msgSend(a1, "lastObject");
  objc_msgSend(a1, "removeLastObject");
  return v3;
}

- (BOOL)bw_empty
{
  return objc_msgSend(a1, "count") == 0;
}

@end
