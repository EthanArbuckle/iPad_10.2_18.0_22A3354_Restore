@implementation NSString(_AX_HA_)

- (unint64_t)unsignedLongLongValue
{
  return strtoull((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 0, 0);
}

@end
