@implementation NSFileHandle(IsOpenFor)

- (uint64_t)isOpenForUpdating
{
  return (fcntl(objc_msgSend(a1, "fileDescriptor"), 3) >> 1) & 1;
}

@end
