@implementation NSString

uint64_t __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(a1 + 32) & 4) != 0)
    a3 = -1;
  return a2 + a3;
}

uint64_t __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 40) & 4) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "length");
  else
    return 0;
}

void __68__NSString_ContactsFoundationPhoneNumbers___cn_LTRControlCharacters__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\u202A\u202C\u202D"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_cn_LTRControlCharacters_cn_once_object_2;
  _cn_LTRControlCharacters_cn_once_object_2 = v0;

}

void __83__NSString_ContactsFoundationPhoneNumbers___cn_whitespaceExceptAscii32CharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCharactersInRange:", 32, 1);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_cn_whitespaceExceptAscii32CharacterSet_cn_once_object_3;
  _cn_whitespaceExceptAscii32CharacterSet_cn_once_object_3 = v0;

}

void __76__NSString_ContactsFoundationPhoneNumbers___cn_phoneNumberInvalidCharacters__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "_cn_LTRControlCharacters");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "_cn_whitespaceExceptAscii32CharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_cn_phoneNumberInvalidCharacters_cn_once_object_1;
  _cn_phoneNumberInvalidCharacters_cn_once_object_1 = v2;

}

void __74__NSString_ContactsFoundation___cn_rangeOfCommonPrefixWithString_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v11;
  id v12;

  v11 = a3 + a4;
  if (a3 + a4 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 40), "compare:options:range:"))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;

  }
  else
  {
    *a7 = 1;
  }
}

void __44__NSString_ContactsFoundation___cn_flatMap___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const __CFString *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v2;
  if (v2)
    v3 = (const __CFString *)v2;
  else
    v3 = &stru_1E29BCC70;
  objc_msgSend(v1, "appendString:", v3);

}

@end
