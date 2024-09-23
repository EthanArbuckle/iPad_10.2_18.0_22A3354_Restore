@implementation NSString(SPExtras)

- (uint64_t)_sp_stringByEncodingIllegalFilenameCharacters
{
  if (_sp_stringByEncodingIllegalFilenameCharacters_onceToken != -1)
    dispatch_once(&_sp_stringByEncodingIllegalFilenameCharacters_onceToken, &__block_literal_global);
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", _sp_stringByEncodingIllegalFilenameCharacters_characterSetExcludingSlashAndPercent);
}

@end
