@implementation NSString

void __69__NSString_CoreDAVExtensions__CDVStringByAddingPercentEscapesForHREF__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "addCharactersInString:", CFSTR("%"));
  objc_msgSend(v3, "removeCharactersInString:", CFSTR("@?:#"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)CDVStringByAddingPercentEscapesForHREF_allowedCharacterSet;
  CDVStringByAddingPercentEscapesForHREF_allowedCharacterSet = v1;

}

void __85__NSString_CoreDAVExtensions__CDVStringByAddingPercentEscapesForHREFIncludingPercent__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("@?:#"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)CDVStringByAddingPercentEscapesForHREFIncludingPercent_allowedCharacterSet;
  CDVStringByAddingPercentEscapesForHREFIncludingPercent_allowedCharacterSet = v1;

}

void __79__NSString_CoreDAVExtensions__CDVStringByAddingPercentEscapesForUserOrPassword__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR(":@/?#[]&"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)CDVStringByAddingPercentEscapesForUserOrPassword_allowedCharacterSet;
  CDVStringByAddingPercentEscapesForUserOrPassword_allowedCharacterSet = v1;

}

@end
