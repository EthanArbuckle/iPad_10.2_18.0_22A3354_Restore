@implementation NSString(ContactsFoundationPhoneNumbers)

- (id)_cn_stringBySanitizingPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_cn_LTRControlCharacters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_stringByNormalizingWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_cn_LTRControlCharacters
{
  if (_cn_LTRControlCharacters_cn_once_token_2 != -1)
    dispatch_once(&_cn_LTRControlCharacters_cn_once_token_2, &__block_literal_global_91);
  return (id)_cn_LTRControlCharacters_cn_once_object_2;
}

- (id)_cn_stringByNormalizingWhitespace
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "_cn_whitespaceExceptAscii32CharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_cn_containsCharacterInSet:", v2) & 1) != 0)
  {
    objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = a1;
  }

  return v4;
}

+ (id)_cn_whitespaceExceptAscii32CharacterSet
{
  if (_cn_whitespaceExceptAscii32CharacterSet_cn_once_token_3 != -1)
    dispatch_once(&_cn_whitespaceExceptAscii32CharacterSet_cn_once_token_3, &__block_literal_global_65);
  return (id)_cn_whitespaceExceptAscii32CharacterSet_cn_once_object_3;
}

- (uint64_t)_cn_requiresPhoneNumberSanitizing
{
  void *v2;
  uint64_t v3;

  objc_msgSend((id)objc_opt_class(), "_cn_phoneNumberInvalidCharacters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_cn_containsCharacterInSet:", v2);

  return v3;
}

+ (id)_cn_phoneNumberInvalidCharacters
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__NSString_ContactsFoundationPhoneNumbers___cn_phoneNumberInvalidCharacters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_cn_phoneNumberInvalidCharacters_cn_once_token_1 != -1)
    dispatch_once(&_cn_phoneNumberInvalidCharacters_cn_once_token_1, block);
  return (id)_cn_phoneNumberInvalidCharacters_cn_once_object_1;
}

@end
