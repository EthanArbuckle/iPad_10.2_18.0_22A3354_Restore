@implementation NSArray(MPMediaQueryAdditions)

- (BOOL)MPIsEmpty
{
  return objc_msgSend(a1, "count") == 0;
}

@end
