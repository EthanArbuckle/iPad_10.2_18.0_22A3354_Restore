@implementation NSString

uint64_t __49__NSString_BCSNSStringExtras___bcs_trimmedString__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_bcs_trimmedString_whitespaceCharacterSet;
  _bcs_trimmedString_whitespaceCharacterSet = v1;

  return objc_msgSend((id)_bcs_trimmedString_whitespaceCharacterSet, "addCharactersInString:", CFSTR("﻿"));
}

uint64_t __56__NSString_BCSNSStringExtras___bcs_urlEncodedQueryValue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_bcs_urlEncodedQueryValue_queryValueAllowedCharacters;
  _bcs_urlEncodedQueryValue_queryValueAllowedCharacters = v1;

  return objc_msgSend((id)_bcs_urlEncodedQueryValue_queryValueAllowedCharacters, "removeCharactersInString:", CFSTR("+=&"));
}

@end
