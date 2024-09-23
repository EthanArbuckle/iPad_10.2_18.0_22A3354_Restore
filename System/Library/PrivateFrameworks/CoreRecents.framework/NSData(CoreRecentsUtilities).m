@implementation NSData(CoreRecentsUtilities)

- (uint64_t)cr_md5DigestHexString
{
  return objc_msgSend((id)objc_msgSend(a1, "_cn_md5Hash"), "_cn_hexString");
}

@end
