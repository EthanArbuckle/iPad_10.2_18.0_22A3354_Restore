@implementation NSString(LPInternal)

- (BOOL)_lp_isEqualToAny:()LPInternal
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__NSString_LPInternal___lp_isEqualToAny___block_invoke;
  v4[3] = &unk_1E44AA7C0;
  v4[4] = a1;
  return objc_msgSend(a3, "indexOfObjectPassingTest:", v4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_lp_isEqualIgnoringCase:()LPInternal
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

- (BOOL)_lp_isEqualToAnyIgnoringCase:()LPInternal
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__NSString_LPInternal___lp_isEqualToAnyIgnoringCase___block_invoke;
  v4[3] = &unk_1E44AA7C0;
  v4[4] = a1;
  return objc_msgSend(a3, "indexOfObjectPassingTest:", v4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_lp_hasCaseInsensitiveSuffix:()LPInternal
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "rangeOfString:options:", v4, 13) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)_lp_directionallyIsolatedString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("⁨%@⁩"), a1);
}

- (uint64_t)_lp_stringType
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_getAssociatedObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)_lp_setStringType:()LPInternal
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_stringType, v2, (void *)1);

}

- (BOOL)_lp_isLTRText
{
  void *v2;
  id v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getNLLanguageRecognizerClass(void)::softClass;
  v11 = getNLLanguageRecognizerClass(void)::softClass;
  if (!getNLLanguageRecognizerClass(void)::softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___ZL28getNLLanguageRecognizerClassv_block_invoke;
    v7[3] = &unk_1E44A7DB0;
    v7[4] = &v8;
    ___ZL28getNLLanguageRecognizerClassv_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "dominantLanguageForString:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v4) == 1;
  else
    v5 = 1;

  return v5;
}

@end
