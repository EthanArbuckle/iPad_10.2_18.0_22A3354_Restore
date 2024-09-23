@implementation IPRegexToolbox

+ (id)regexPatternByUncapturingPattern:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v11;

  v3 = a3;
  v11 = 0;
  v4 = lengthOfPatternAfterUncapturing(v3, &v11, 0);
  if (v11)
  {
    v5 = v4;
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    if (!v6)
      +[IPRegexToolbox regexPatternByUncapturingPattern:].cold.1();
    v7 = v6;
    if (v5 != lengthOfPatternAfterUncapturing(v3, 0, (uint64_t)v6))
      +[IPRegexToolbox regexPatternByUncapturingPattern:].cold.2();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", v7, v5, 1);
  }
  else
  {
    v8 = objc_msgSend(v3, "copy");
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)regexPatternWithPrefix:(id)a3 suffix:(id)a4 choices:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __CFBitVector *Mutable;
  void *v15;
  uint64_t v16;
  CFIndex v17;
  void *v18;
  int v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  _WORD *v26;
  _WORD *v27;
  uint64_t v28;
  CFIndex i;
  void *v30;
  void *v32;
  void *v33;
  CFRange v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = lengthOfPatternAfterUncapturing(v7, 0, 0);
  v11 = lengthOfPatternAfterUncapturing(v8, 0, 0) + v10;
  if (objc_msgSend(v9, "count"))
  {
    v32 = v8;
    v33 = v7;
    v12 = objc_msgSend(v9, "count");
    if (v12)
    {
      v13 = 0;
      Mutable = 0;
      do
      {
        if (Mutable && CFBitVectorGetBitAtIndex(Mutable, v13))
        {
          ++v13;
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = lengthOfPatternAfterUncapturing(v15, 0, 0);
          v17 = ++v13;
          if (v13 < v12)
          {
            do
            {
              if (!Mutable || !CFBitVectorGetBitAtIndex(Mutable, v17))
              {
                objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v18, "isEqual:", v15) & 1) != 0
                  || objc_msgSend(v18, "hasPrefix:", v15)
                  && ((v19 = objc_msgSend(v18, "characterAtIndex:", objc_msgSend(v15, "length")),
                       (v19 - 63) > 0x3D)
                   || ((1 << (v19 - 63)) & 0x3000000000000001) == 0)
                  && v19 != 42)
                {
                  if (!Mutable)
                  {
                    Mutable = CFBitVectorCreateMutable(0, v12);
                    CFBitVectorSetCount(Mutable, v12);
                  }
                  CFBitVectorSetBitAtIndex(Mutable, v17, 1u);
                }

              }
              ++v17;
            }
            while (v12 != v17);
          }
          v11 += v16;

        }
      }
      while (v13 != v12);
      v20 = v12 + v11 - 1;
      if (Mutable)
      {
        v34.location = 0;
        v34.length = v12;
        v21 = 0;
        v20 -= CFBitVectorGetCountOfBit(Mutable, v34, 1u);
LABEL_30:
        v26 = malloc_type_malloc(2 * v20, 0x1000040BDFB0063uLL);
        if (!v26)
          +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:].cold.3();
        v27 = v26;
        v28 = lengthOfPatternAfterUncapturing(v33, 0, (uint64_t)v26);
        if (v12)
        {
          for (i = 0; i != v12; ++i)
          {
            if ((v21 & 1) != 0 || !CFBitVectorGetBitAtIndex(Mutable, i))
            {
              if (i)
                v27[v28++] = 124;
              objc_msgSend(v9, "objectAtIndexedSubscript:", i);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v28 += lengthOfPatternAfterUncapturing(v30, 0, (uint64_t)&v27[v28]);

            }
          }
        }
        if ((v21 & 1) == 0)
          CFRelease(Mutable);
        v8 = v32;
        if (lengthOfPatternAfterUncapturing(v32, 0, (uint64_t)&v27[v28]) + v28 != v20)
          +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:].cold.4();
        v25 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", v27, v20, 1);
        v7 = v33;
        goto LABEL_43;
      }
    }
    else
    {
      Mutable = 0;
      v20 = v11 - 1;
    }
    v21 = 1;
    goto LABEL_30;
  }
  if (v11)
  {
    v22 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
    if (!v22)
      +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:].cold.1();
    v23 = v22;
    v24 = lengthOfPatternAfterUncapturing(v7, 0, (uint64_t)v22);
    if (lengthOfPatternAfterUncapturing(v8, 0, (uint64_t)v23 + 2 * v24) + v24 != v11)
      +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:].cold.2();
    v25 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", v23, v11, 1);
  }
  else
  {
    v25 = &stru_24DAA6418;
  }
LABEL_43:

  return v25;
}

+ (id)regexPatternForLanguageID:(id)a3 eventVocabularyArray:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || (objc_msgSend(v6, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || (objc_msgSend(v6, "hasPrefix:", CFSTR("ko")) & 1) != 0
    || (objc_msgSend(v6, "hasPrefix:", CFSTR("th")) & 1) != 0)
  {
    v8 = CFSTR(")");
    v9 = CFSTR("(?:");
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("fr")) & 1) != 0)
  {
    v8 = CFSTR(")\\b");
    v9 = CFSTR("(?:\\b|[dljt]['’])(?:");
  }
  else
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("it")))
      v9 = CFSTR("(?:\\b|[lnmcdst]['’])(?:");
    else
      v9 = CFSTR("\\b(?:");
    v8 = CFSTR(")\\b");
  }
  objc_msgSend(a1, "regexPatternWithPrefix:suffix:choices:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (unint64_t)numberOfMatchesForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)MEMORY[0x219A2F708]();
    if (v5 && (objc_msgSend(v7, "options") & 1) == 0)
    {
      objc_msgSend(v8, "lowercaseString");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
    v11 = objc_msgSend(v8, "length");
    if (v11 >= 0x2710)
      v12 = 10000;
    else
      v12 = v11;
    v13 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v8, 2, 0, v12);
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)firstMatchingKeywordForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x219A2F708]();
  if (!v8)
    goto LABEL_11;
  if (v5)
  {
    if ((objc_msgSend(v7, "options") & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x219A2F708]();
      objc_msgSend(v8, "lowercaseString");
      v11 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v10);
      v12 = 0;
      v8 = (id)v11;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v8, "length");
  v14 = v13 >= 0x2710 ? 10000 : v13;
  v15 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v8, 2, 0, v14);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = v15;
    v19 = v16;
    v20 = (void *)MEMORY[0x219A2F708]();
    objc_msgSend(v8, "substringWithRange:", v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;
    if (v12)
    {
      objc_msgSend(v21, "lowercaseString");
      v22 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v22;
    }
    objc_autoreleasePoolPop(v20);
  }
  else
  {
LABEL_11:
    v17 = 0;
  }
  objc_autoreleasePoolPop(v9);

  return v17;
}

+ (id)matchingKeywordResultsForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x219A2F708]();
  if (v5)
  {
    objc_msgSend(v8, "lowercaseString");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  v11 = objc_msgSend(v8, "length");
  if (v11 >= 0x2710)
    v12 = 10000;
  else
    v12 = v11;
  objc_msgSend(v7, "matchesInString:options:range:", v8, 2, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);

  return v13;
}

+ (BOOL)isRangeNearbyExclusionKeyword:(_NSRange)a3 text:(id)a4 limitToSurroundingText:(BOOL)a5 language:(id)a6
{
  _BOOL4 v7;
  NSUInteger location;
  id v10;
  id v11;
  uint64_t *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  NSUInteger v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t block;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;

  v7 = a5;
  location = a3.location;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("en")))
  {
    block = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke;
    v28 = &__block_descriptor_40_e5_v8__0l;
    v29 = a1;
    if (isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken != -1)
      dispatch_once(&isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken, &block);
    v12 = &isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult;
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("fr")))
    {
      v18 = 0;
      goto LABEL_17;
    }
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke_2;
    v23 = &__block_descriptor_40_e5_v8__0l;
    v24 = a1;
    if (isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken_55 != -1)
      dispatch_once(&isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken_55, &v20);
    v12 = &isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult_54;
  }
  v13 = (id)*v12;
  v14 = v13;
  v15 = location > 0x32;
  if (v7 && v15)
    v16 = location - 50;
  else
    v16 = 0;
  if (v7 && v15)
    v17 = 50;
  else
    v17 = location;
  v18 = objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v10, 0, v16, v17, v20, v21, v22, v23, v24, block, v26, v27, v28, v29) != 0x7FFFFFFFFFFFFFFFLL;

LABEL_17:
  return v18;
}

void __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(*(id *)(a1 + 32), "regexPatternForLanguageID:eventVocabularyArray:", CFSTR("en"), &unk_24DB09108);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v3, 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult;
  isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult = v4;

  objc_autoreleasePoolPop(v2);
}

void __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(*(id *)(a1 + 32), "regexPatternForLanguageID:eventVocabularyArray:", CFSTR("fr"), &unk_24DB09120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v3, 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult_54;
  isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult_54 = v4;

  objc_autoreleasePoolPop(v2);
}

+ (BOOL)isRangeInsideQuotationMarks:(_NSRange)a3 text:(id)a4 limitToSurroundingText:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger location;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = a5;
  location = a3.location;
  v7 = a4;
  if (isRangeInsideQuotationMarks_text_limitToSurroundingText__onceToken != -1)
    dispatch_once(&isRangeInsideQuotationMarks_text_limitToSurroundingText__onceToken, &__block_literal_global_4);
  v11 = 0;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = location > 0x96;
    v9 = v5 && v8 ? 150 : location;
    v10 = v5 && v8 ? location - 150 : 0;
    if (objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:", isRangeInsideQuotationMarks_text_limitToSurroundingText__firstQuotationMarkCharacterSet, 4, v10, v9) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "length");
      if (objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:", isRangeInsideQuotationMarks_text_limitToSurroundingText__lastQuotationMarkCharacterSet, 0) != 0x7FFFFFFFFFFFFFFFLL)v11 = 1;
    }
  }

  return v11;
}

void __74__IPRegexToolbox_isRangeInsideQuotationMarks_text_limitToSurroundingText___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"‘«“„﹃﹁『"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isRangeInsideQuotationMarks_text_limitToSurroundingText__firstQuotationMarkCharacterSet;
  isRangeInsideQuotationMarks_text_limitToSurroundingText__firstQuotationMarkCharacterSet = v0;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"‘»”﹄﹂』"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isRangeInsideQuotationMarks_text_limitToSurroundingText__lastQuotationMarkCharacterSet;
  isRangeInsideQuotationMarks_text_limitToSurroundingText__lastQuotationMarkCharacterSet = v2;

}

+ (id)emailSubjectPrefixRegex
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emailSubjectPrefixRegex__pasOnceToken6 != -1)
    dispatch_once(&emailSubjectPrefixRegex__pasOnceToken6, block);
  objc_msgSend((id)emailSubjectPrefixRegex__pasExprOnceResult, "result");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)MEMORY[0x219A2F708]();
  v3 = objc_alloc(MEMORY[0x24BE7A600]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_2;
  v6[3] = &__block_descriptor_40_e26___NSRegularExpression_8__0l;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "initWithBlock:", v6);
  v5 = (void *)emailSubjectPrefixRegex__pasExprOnceResult;
  emailSubjectPrefixRegex__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v2);
}

id __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_3;
  v2[3] = &__block_descriptor_40_e26___NSRegularExpression_8__0l;
  v2[4] = *(_QWORD *)(a1 + 32);
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("subjectAbbreviationRegex"), v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "regexPatternWithPrefix:suffix:choices:", CFSTR("^(("), CFSTR(") ?[：:])+"), &unk_24DB09138);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v1, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)regularExpressionWithKey:(id)a3 generator:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)MEMORY[0x219A2F708]();
  v6[2](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);

  return v8;
}

+ (void)regexPatternByUncapturingPattern:.cold.1()
{
  __assert_rtn("+[IPRegexToolbox regexPatternByUncapturingPattern:]", "IPRegexToolbox.m", 116, "uncapturedPatternBuffer");
}

+ (void)regexPatternByUncapturingPattern:.cold.2()
{
  __assert_rtn("+[IPRegexToolbox regexPatternByUncapturingPattern:]", "IPRegexToolbox.m", 117, "length == lengthOfPatternAfterUncapturing(pattern, NULL, uncapturedPatternBuffer)");
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.1()
{
  __assert_rtn("+[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]", "IPRegexToolbox.m", 132, "shortCircuitOutput");
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.2()
{
  __assert_rtn("+[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]", "IPRegexToolbox.m", 136, "shortCircuitOutputCursor == patternLength");
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.3()
{
  __assert_rtn("+[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]", "IPRegexToolbox.m", 181, "patternBuffer");
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.4()
{
  __assert_rtn("+[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]", "IPRegexToolbox.m", 198, "cursor == patternLength");
}

@end
