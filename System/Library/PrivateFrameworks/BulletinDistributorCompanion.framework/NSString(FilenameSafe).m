@implementation NSString(FilenameSafe)

- (uint64_t)blt_filenameSafe
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
}

@end
