@implementation NSTermOfAddress(ContactsFoundation)

+ (id)os_log
{
  if (os_log_cn_once_token_1_4 != -1)
    dispatch_once(&os_log_cn_once_token_1_4, &__block_literal_global_5_1);
  return (id)os_log_cn_once_object_1_4;
}

+ (uint64_t)unspecified
{
  return objc_msgSend(MEMORY[0x1E0CB3960], "localizedForLanguageIdentifier:withPronouns:", CFSTR("unt"), MEMORY[0x1E0C9AA60]);
}

+ (uint64_t)empty
{
  return objc_msgSend(MEMORY[0x1E0CB3960], "localizedForLanguageIdentifier:withPronouns:", &stru_1E29BCC70, MEMORY[0x1E0C9AA60]);
}

+ (id)termOfAddressFromDataRepresentation:()ContactsFoundation
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "_cn_trimTrailingZeros");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNDataEncoder decodeAddressingGrammarData:](_TtC18ContactsFoundation13CNDataEncoder, "decodeAddressingGrammarData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)termOfAddressFromStringRepresentation:()ContactsFoundation
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99D50];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithBase64EncodedString:options:", v5, 0);

    objc_msgSend(a1, "termOfAddressFromDataRepresentation:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)isUnspecified
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "languageIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("unt"));

  return v2;
}

- (id)dataRepresentation
{
  void *v1;
  void *v2;
  void *v3;

  +[CNDataEncoder encodeAddressingGrammar:](_TtC18ContactsFoundation13CNDataEncoder, "encodeAddressingGrammar:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "_cn_padDataToLength:", 280);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)stringRepresentation
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dataRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)pronounDescriptions
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if ((CNIsAddressingGrammarEmpty_block_invoke((uint64_t)a1, a1) & 1) != 0
    || (objc_msgSend(a1, "pronouns"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v2),
        v2,
        v3))
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "pronouns");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_map:", &__block_literal_global_13_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_cn_distinctObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)pronounDescriptionsForAddressingGrammars:()ContactsFoundation uppercased:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  char v10;

  v5 = a3;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v5))
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__NSTermOfAddress_ContactsFoundation__pronounDescriptionsForAddressingGrammars_uppercased___block_invoke;
    v9[3] = &__block_descriptor_33_e35___NSString_16__0__NSTermOfAddress_8l;
    v10 = a4;
    objc_msgSend(v5, "_cn_compactMap:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cn_distinctObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (uint64_t)localizedDescriptionForAddressingGrammars:()ContactsFoundation
{
  return objc_msgSend(a1, "localizedDescriptionForAddressingGrammars:uppercased:", a3, 0);
}

+ (__CFString)localizedDescriptionForAddressingGrammars:()ContactsFoundation uppercased:
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v6))
  {
    v7 = &stru_1E29BCC70;
  }
  else
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedShortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if ((a4 & 1) != 0)
      {
        objc_msgSend(v8, "locale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uppercaseStringWithLocale:", v11);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = v9;
      }

    }
    else
    {
      objc_msgSend(a1, "pronounDescriptionsForAddressingGrammars:uppercased:", v6, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v8))
      {
        v7 = &stru_1E29BCC70;
      }
      else if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(v8, "firstObject");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = objc_msgSend(v8, "count");
        v13 = (void *)MEMORY[0x1E0CB3940];
        CNContactsFoundationBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12 == 2)
        {
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_DESCRIPTION_MULTIPLE-%@-%@"), &stru_1E29BCC70, CFSTR("AddressingGrammar"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringWithFormat:", v16, v17, v18);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_DESCRIPTION_MULTIPLE-%@-%@-%@"), &stru_1E29BCC70, CFSTR("AddressingGrammar"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringWithFormat:", v16, v17, v18, v19);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
    }

  }
  return v7;
}

- (__CFString)localizedShortDescription
{
  void *v1;
  __CFString *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "pronounDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v1))
  {
    v2 = &stru_1E29BCC70;
  }
  else if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(v1, "count");
    v4 = (void *)MEMORY[0x1E0CB3940];
    CNContactsFoundationBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3 == 2)
    {
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_DESCRIPTION-%@-%@"), &stru_1E29BCC70, CFSTR("AddressingGrammar"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringWithFormat:", v7, v8, v9);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_DESCRIPTION-%@-%@-%@"), &stru_1E29BCC70, CFSTR("AddressingGrammar"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringWithFormat:", v7, v8, v9, v10);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v2;
}

- (id)localizedLanguageDescription
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForLanguageCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)locale
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "languageIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeWithLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
