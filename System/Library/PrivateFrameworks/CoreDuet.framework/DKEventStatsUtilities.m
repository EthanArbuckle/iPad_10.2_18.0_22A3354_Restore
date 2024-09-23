@implementation DKEventStatsUtilities

void __47___DKEventStatsUtilities_safeStringWithString___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567890"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safeStringWithString__nonPermittedCharacterSet;
  safeStringWithString__nonPermittedCharacterSet = v0;

}

@end
