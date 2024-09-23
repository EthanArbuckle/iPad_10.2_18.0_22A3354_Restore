@implementation NSMutableData(ABCMutableDataAdditions)

- (uint64_t)abAppendString:()ABCMutableDataAdditions
{
  return objc_msgSend(a1, "appendData:", objc_msgSend(a3, "dataUsingEncoding:", 1));
}

@end
