@implementation NSString

void __52__NSString_CALIDExtensions__stringByEncodingSlashes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("/"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)stringByEncodingSlashes_allowedCharacterSet;
  stringByEncodingSlashes_allowedCharacterSet = v1;

}

void __50__NSString_DAVExtensions__stringByURLQuotingPaths__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("@?"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)stringByURLQuotingPaths_allowedCharacterSet;
  stringByURLQuotingPaths_allowedCharacterSet = v1;

}

void __45__NSString_DAVExtensions__stringByURLQuoting__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("?"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)stringByURLQuoting_allowedCharacterSet;
  stringByURLQuoting_allowedCharacterSet = v1;

}

@end
