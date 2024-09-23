@implementation NSURL

void __44__NSURL_DAVExtensions__initWithDirtyString___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR(";?:@&=+$,|"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)initWithDirtyString__allowedCharacterSet;
  initWithDirtyString__allowedCharacterSet = v1;

}

@end
