@implementation NSString(CALIDExtensions)

- (uint64_t)stringByEncodingSlashes
{
  if (stringByEncodingSlashes_onceToken != -1)
    dispatch_once(&stringByEncodingSlashes_onceToken, &__block_literal_global_0);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", stringByEncodingSlashes_allowedCharacterSet);
}

- (CFStringRef)stringByDecodingSlashes
{
  return (id)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_24C1FD208);
}

@end
