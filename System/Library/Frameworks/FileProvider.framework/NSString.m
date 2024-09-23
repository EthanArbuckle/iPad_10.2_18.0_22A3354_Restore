@implementation NSString

void __54__NSString_FPAdditions__fp_prettyPathWithObfuscation___block_invoke()
{
  uint64_t v0;
  void *v1;

  NSTemporaryDirectory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fp_prettyPathWithObfuscation__temporaryDirectory;
  fp_prettyPathWithObfuscation__temporaryDirectory = v0;

}

void __56__NSString_FPAdditions__fp_commonParentPathForItemURLs___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") <= a3)
    goto LABEL_4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v12, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

LABEL_4:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

CFStringTokenizerRef __41__NSString_FPAdditions__fp_wordTokenizer__block_invoke()
{
  const __CFLocale *System;
  CFStringTokenizerRef result;
  CFRange v2;

  System = CFLocaleGetSystem();
  v2.location = 0;
  v2.length = 0;
  result = CFStringTokenizerCreate(0, &stru_1E4450B40, v2, 0, System);
  fp_wordTokenizer_tokenizerRef = (uint64_t)result;
  return result;
}

void __51__NSString_FPAdditions__fp_isCJKLanguageIdentifier__block_invoke()
{
  void *v0;

  v0 = (void *)fp_isCJKLanguageIdentifier_cjkLanguages;
  fp_isCJKLanguageIdentifier_cjkLanguages = (uint64_t)&unk_1E448F4E8;

}

@end
