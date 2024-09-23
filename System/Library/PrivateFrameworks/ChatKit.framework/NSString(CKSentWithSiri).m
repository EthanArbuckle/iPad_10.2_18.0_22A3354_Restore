@implementation NSString(CKSentWithSiri)

- (uint64_t)ck_isSiriRecognizableWithLanguageCode:()CKSentWithSiri
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  if (v3)
  {
    objc_msgSend(v3, "exemplarCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formUnionWithCharacterSet:", v5);

  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v6);

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isSupersetOfSet:", v7);

  return v8;
}

@end
