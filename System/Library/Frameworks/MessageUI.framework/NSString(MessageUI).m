@implementation NSString(MessageUI)

- (uint64_t)ef_repeatedStringTimes:()MessageUI
{
  return objc_msgSend(&stru_1E5A6A588, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(a1, "length") * a3, a1, 0);
}

@end
