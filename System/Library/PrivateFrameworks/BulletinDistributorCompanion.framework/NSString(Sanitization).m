@implementation NSString(Sanitization)

- (uint64_t)blt_sanitizeForURL
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", &stru_24D767458, CFSTR("_"));
}

@end
