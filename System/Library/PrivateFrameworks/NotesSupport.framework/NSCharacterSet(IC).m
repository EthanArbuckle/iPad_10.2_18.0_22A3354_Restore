@implementation NSCharacterSet(IC)

+ (uint64_t)ic_illegalFilenameCharacterSet
{
  return objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/\\?%*|\"<>:"));
}

+ (id)ic_attachmentCharacterSet
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_attachmentCharacterString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ic_hashtagAllowedCharacterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NSCharacterSet_IC__ic_hashtagAllowedCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (ic_hashtagAllowedCharacterSet_token != -1)
    dispatch_once(&ic_hashtagAllowedCharacterSet_token, block);
  return (id)ic_hashtagAllowedCharacterSet_characterSet;
}

+ (uint64_t)ic_hashtagTokenizingCharacterSet
{
  return objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(", "));
}

+ (id)ic_animatableTokenCharacterSet
{
  if (ic_animatableTokenCharacterSet_token != -1)
    dispatch_once(&ic_animatableTokenCharacterSet_token, &__block_literal_global_22);
  return (id)ic_animatableTokenCharacterSet_characterSet;
}

+ (id)ic_uriIdentifierAllowedCharacterSet
{
  if (ic_uriIdentifierAllowedCharacterSet_token != -1)
    dispatch_once(&ic_uriIdentifierAllowedCharacterSet_token, &__block_literal_global_6_1);
  return (id)ic_uriIdentifierAllowedCharacterSet_characterSet;
}

@end
