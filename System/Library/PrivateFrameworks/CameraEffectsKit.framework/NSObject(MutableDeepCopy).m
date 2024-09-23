@implementation NSObject(MutableDeepCopy)

- (id)mutableDeepCopy
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(a1, "mutableCopy");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(a1, "copy");
  return a1;
}

@end
