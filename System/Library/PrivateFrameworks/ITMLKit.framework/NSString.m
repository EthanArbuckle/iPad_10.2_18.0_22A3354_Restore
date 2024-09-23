@implementation NSString

void __38__NSString_ITMLKit__ik_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sSharedStrings;
  sSharedStrings = v0;

}

uint64_t __55__NSString_ITMLKit__ik_sharedInstanceForDataKeysDomain__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sSharedDataKeys;
  sSharedDataKeys = v0;

  return objc_msgSend((id)sSharedDataKeys, "setCountLimit:", 500);
}

@end
