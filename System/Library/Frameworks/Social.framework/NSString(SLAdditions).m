@implementation NSString(SLAdditions)

- (CFStringRef)urlEncodedString
{
  return objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], originalString, 0, CFSTR(":/?#[]@!$&‚Äö√Ñ√¥()*+,;='"),
                                           0x8000100u));
}

- (BOOL)hasCaseInsensitiveSuffix:()SLAdditions
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a1, "rangeOfString:options:", a3, 5);
  return v5 && objc_msgSend(a1, "length") == v4 + v5;
}

@end
