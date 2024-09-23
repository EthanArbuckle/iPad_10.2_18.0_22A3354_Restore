@implementation NSLocale(Whitespace)

- (uint64_t)usesWhitespace
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (usesWhitespace_onceToken != -1)
    dispatch_once(&usesWhitespace_onceToken, &__block_literal_global_54);
  v2 = (void *)usesWhitespace_nonWhitespaceLanguages;
  objc_msgSend(a1, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

@end
