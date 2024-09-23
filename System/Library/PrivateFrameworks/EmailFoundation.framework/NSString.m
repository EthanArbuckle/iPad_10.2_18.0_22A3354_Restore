@implementation NSString

void __77__NSString_EmailFoundationAdditions___ef_sqliteFormattedWithFormatSpecifier___block_invoke(int a1, void *a2)
{
  sqlite3_free(a2);
}

void __88__NSString_EmailFoundationAdditions__ef_stringByRemovingUnbalancedOpenQuote_closeQuote___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "first");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "rangeValue");
  objc_msgSend(v2, "deleteCharactersInRange:", v3, v4);

}

void __74__NSString_EmailFoundationAdditions__ef_quotedWordComponentsForLanguages___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (a3)
  {
    objc_msgSend(v5, "ef_stringByRemovingQuotesForLanguages:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v6;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ef_wordComponentsForLocale:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
}

void __100__NSString_EmailFoundationAdditions__ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C%@"), a3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v7, v5, 0, 0, objc_msgSend(v6, "length"));

}

void __62__NSString_EmailFoundationAdditions__ef_substringWithIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:");

}

void __64__NSString_EmailFoundationAdditions__ef_isUnsignedIntegerString__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ef_isUnsignedIntegerString_nonDigitCharacterSet;
  ef_isUnsignedIntegerString_nonDigitCharacterSet = v0;

}

- (id)_escapeForXML
{
  void *v1;

  if (a1)
  {
    v1 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
      0,
      0,
      objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
      0,
      0,
      objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
      0,
      0,
      objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("&apos;"),
      0,
      0,
      objc_msgSend(v1, "length"));
    objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("&quot;"),
      0,
      0,
      objc_msgSend(v1, "length"));
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id __83__NSString_EmailFoundationAdditions__ef_pathByReplacingRelativePathWithFolderName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR(".")) & 1) != 0
    || (v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("..")), v5 = v3, v4))
  {
    v5 = *(void **)(a1 + 32);
  }
  v6 = v5;

  return v6;
}

@end
