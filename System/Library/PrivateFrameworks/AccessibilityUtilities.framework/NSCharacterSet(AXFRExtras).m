@implementation NSCharacterSet(AXFRExtras)

+ (id)whitespaceNewlineAndSpecialCharacterSet
{
  id v0;
  id v1;
  int i;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (whitespaceNewlineAndSpecialCharacterSet_CharacterSet)
  {
    v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }
  else
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    for (i = 0; i != 15; ++i)
      objc_msgSend(v1, "appendFormat:", CFSTR("%C"), (i + 65520));
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "addCharactersInString:", v1);
    v5 = objc_msgSend(v4, "copy");
    v6 = (void *)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
    whitespaceNewlineAndSpecialCharacterSet_CharacterSet = v5;

    v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }
  return v0;
}

+ (id)wordBreakCharacterSet
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (wordBreakCharacterSet_CharacterSetIncludesPunctuation)
  {
    v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceNewlineAndSpecialCharacterSet");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v1, "mutableCopy");

    objc_msgSend(v2, "addCharactersInString:", CFSTR("\x05"));
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "formUnionWithCharacterSet:", v3);
    v4 = objc_msgSend(v2, "copy");
    v5 = (void *)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
    wordBreakCharacterSet_CharacterSetIncludesPunctuation = v4;

    v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }
  return v0;
}

@end
