@implementation NSString(DEURLPathEscaping)

- (uint64_t)escape
{
  if (escape_onceToken != -1)
    dispatch_once(&escape_onceToken, &__block_literal_global_7);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", escape__set);
}

@end
