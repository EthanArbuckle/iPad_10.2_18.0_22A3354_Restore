@implementation NSData(CDMJSONSerialization)

- (uint64_t)_cdm_safeJSONString
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
}

@end
