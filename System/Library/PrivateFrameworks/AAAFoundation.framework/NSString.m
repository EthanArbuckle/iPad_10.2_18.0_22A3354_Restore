@implementation NSString

void __59__NSString_AAAFoundation__URLQueryValueAllowedCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)URLQueryValueAllowedCharacterSet__URLQueryValueAllowedCharacterSet;
  URLQueryValueAllowedCharacterSet__URLQueryValueAllowedCharacterSet = v0;

}

@end
