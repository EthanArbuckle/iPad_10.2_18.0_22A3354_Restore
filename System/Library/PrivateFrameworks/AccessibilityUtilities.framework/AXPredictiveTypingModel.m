@implementation AXPredictiveTypingModel

- (AXPredictiveTypingModel)init
{
  AXPredictiveTypingModel *v2;
  void *v3;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)AXPredictiveTypingModel;
  v2 = -[AXPredictiveTypingModel init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D434C8];
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v2->_wordModel = (void *)LMLanguageModelCreate();

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  LMLanguageModelRelease();
  v3.receiver = self;
  v3.super_class = (Class)AXPredictiveTypingModel;
  -[AXPredictiveTypingModel dealloc](&v3, sel_dealloc);
}

- (void)enumerateTokensForText:(id)a3 usingBlock:(id)a4
{
  __CFString *v5;
  void (**v6)(id, void *, CFIndex, CFIndex, _BYTE *);
  const __CFLocale *v7;
  __CFStringTokenizer *v8;
  CFRange CurrentTokenRange;
  void *v10;
  int v11;
  unsigned __int8 v12;
  CFRange v13;

  v5 = (__CFString *)a3;
  v6 = (void (**)(id, void *, CFIndex, CFIndex, _BYTE *))a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en"));
  v7 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
  v13.length = -[__CFString length](v5, "length");
  v13.location = 0;
  v8 = CFStringTokenizerCreate(0, v5, v13, 4uLL, v7);
  v12 = 0;
  do
  {
    if (!CFStringTokenizerAdvanceToNextToken(v8))
      break;
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
    -[__CFString substringWithRange:](v5, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10, CurrentTokenRange.location, CurrentTokenRange.length, &v12);
    v11 = v12;

  }
  while (!v11);
  CFRelease(v8);

}

- (unsigned)_newContextForText:(id)a3 includeLastToken:(BOOL)a4 length:(int64_t *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  int64_t v11;
  unsigned int *v12;
  uint64_t i;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  AXPredictiveTypingModel *v21;

  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __70__AXPredictiveTypingModel__newContextForText_includeLastToken_length___block_invoke;
  v19 = &unk_1E24C4F30;
  v10 = v9;
  v20 = v10;
  v21 = self;
  -[AXPredictiveTypingModel enumerateTokensForText:usingBlock:](self, "enumerateTokensForText:usingBlock:", v8, &v16);
  v11 = objc_msgSend(v10, "count", v16, v17, v18, v19) - !v6;
  v12 = (unsigned int *)malloc_type_malloc(4 * v11, 0x100004052888210uLL);
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12[i] = objc_msgSend(v14, "unsignedIntegerValue");

    }
  }
  if (a5)
    *a5 = v11;

  return v12;
}

void __70__AXPredictiveTypingModel__newContextForText_includeLastToken_length___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LMLanguageModelGetTokenIDForString());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (id)_completionPredictionsForPrefix:(id)a3 entireText:(id)a4 desiredNumber:(unint64_t)a5
{
  id v8;
  id v9;
  unsigned int *v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  AXPredictiveTypingModel *v20;
  void *v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v10 = -[AXPredictiveTypingModel _newContextForText:includeLastToken:length:](self, "_newContextForText:includeLastToken:length:", v9, 0, &v22);
  if (3 * a5 <= 0x32)
    v11 = 50;
  else
    v11 = 3 * a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = self;
  v21 = v8;
  v13 = v12;
  v14 = v9;
  v15 = v8;
  LMLanguageModelEnumerateCompletionsForPrefixWithBlock();
  free(v10);
  objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_2, v19, 3221225472, __84__AXPredictiveTypingModel__completionPredictionsForPrefix_entireText_desiredNumber___block_invoke, &unk_1E24C4F58, v20);
  if (objc_msgSend(v13, "count") <= a5)
  {
    v16 = v13;
  }
  else
  {
    objc_msgSend(v13, "subarrayWithRange:", 0, a5);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  return v17;
}

void __84__AXPredictiveTypingModel__completionPredictionsForPrefix_entireText_desiredNumber___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  AXTypingPrediction *v5;
  void *v6;
  void *v7;
  double v8;
  id StringForTokenID;

  StringForTokenID = (id)LMLanguageModelCreateStringForTokenID();
  if (objc_msgSend(StringForTokenID, "length"))
  {
    v5 = objc_alloc_init(AXTypingPrediction);
    -[AXTypingPrediction setFullWord:](v5, "setFullWord:", StringForTokenID);
    objc_msgSend(StringForTokenID, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 40), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXTypingPrediction setTextToInsert:](v5, "setTextToInsert:", v7);

    -[AXTypingPrediction setPrefix:](v5, "setPrefix:", *(_QWORD *)(a1 + 40));
    -[AXTypingPrediction setRangeToReplace:](v5, "setRangeToReplace:", objc_msgSend(*(id *)(a1 + 48), "length"), 0);
    LMLanguageModelConditionalProbability();
    -[AXTypingPrediction setProbability:](v5, "setProbability:", __exp10(v8));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count") == *(_QWORD *)(a1 + 80))
    *a3 = 1;

}

uint64_t __84__AXPredictiveTypingModel__completionPredictionsForPrefix_entireText_desiredNumber___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "probability");
  v7 = v6;
  objc_msgSend(v5, "probability");
  if (v7 <= v8 + 2.22044605e-16)
  {
    objc_msgSend(v4, "probability");
    v11 = v10;
    objc_msgSend(v5, "probability");
    v9 = v11 < v12 + -2.22044605e-16;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)_lastPartialWordForText:(id)a3 orEndOfSentence:(BOOL *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = objc_msgSend(v5, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AXPredictiveTypingModel__lastPartialWordForText_orEndOfSentence___block_invoke;
  v10[3] = &unk_1E24C4FC0;
  v12 = &v18;
  v7 = v5;
  v11 = v7;
  v13 = &v14;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 1283, v10);
  if (a4)
    *a4 = *((_BYTE *)v15 + 24);
  v8 = (id)v19[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __67__AXPredictiveTypingModel__lastPartialWordForText_orEndOfSentence___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  if (a5 + a6 == a3 + a4)
  {
    v9 = objc_msgSend(a2, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length")
      && (objc_msgSend(v11, "characterAtIndex:", 0) == 63
       || objc_msgSend(v11, "characterAtIndex:", 0) == 46
       || objc_msgSend(v11, "characterAtIndex:", 0) == 33))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }

  *a7 = 1;
}

- (id)_nextWordPredictionsForText:(id)a3 desiredNumber:(unint64_t)a4
{
  id v6;
  void *v7;
  unsigned int *v8;
  id v9;
  id v10;
  id v12;
  uint64_t v13;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = -[AXPredictiveTypingModel _newContextForText:includeLastToken:length:](self, "_newContextForText:includeLastToken:length:", v6, 1, &v13);
  v12 = v7;
  v9 = v6;
  LMLanguageModelEnumeratePredictionsWithBlock();
  free(v8);
  v10 = v12;

  return v10;
}

uint64_t __69__AXPredictiveTypingModel__nextWordPredictionsForText_desiredNumber___block_invoke(uint64_t a1, _DWORD *a2, double a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  void *StringForTokenID;
  AXTypingPrediction *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  if (*a2 < 3u)
    goto LABEL_11;
  StringForTokenID = (void *)LMLanguageModelCreateStringForTokenID();
  if (objc_msgSend(StringForTokenID, "length"))
  {
    v10 = objc_alloc_init(AXTypingPrediction);
    -[AXTypingPrediction setFullWord:](v10, "setFullWord:", StringForTokenID);
    objc_msgSend(StringForTokenID, "stringByAppendingString:", CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXTypingPrediction setTextToInsert:](v10, "setTextToInsert:", v11);

    if (objc_msgSend(StringForTokenID, "length") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "characterIsMember:", objc_msgSend(StringForTokenID, "characterAtIndex:", 0)) & 1) != 0)
      {
        v13 = objc_msgSend(*(id *)(a1 + 40), "length");

        if (v13)
        {
          v14 = objc_msgSend(*(id *)(a1 + 40), "length") - 1;
          v15 = 1;
LABEL_9:
          -[AXTypingPrediction setRangeToReplace:](v10, "setRangeToReplace:", v14, v15);
          -[AXTypingPrediction setProbability:](v10, "setProbability:", __exp10(a3));
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    v14 = objc_msgSend(*(id *)(a1 + 40), "length");
    v15 = 0;
    goto LABEL_9;
  }
LABEL_10:

LABEL_11:
  result = objc_msgSend(*(id *)(a1 + 48), "count");
  if (result == *(_QWORD *)(a1 + 56))
    *a6 = 1;
  return result;
}

- (id)predictionsForText:(id)a3 desiredNumber:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v11;

  objc_msgSend(a3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  -[AXPredictiveTypingModel _lastPartialWordForText:orEndOfSentence:](self, "_lastPartialWordForText:orEndOfSentence:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[AXPredictiveTypingModel _completionPredictionsForPrefix:entireText:desiredNumber:](self, "_completionPredictionsForPrefix:entireText:desiredNumber:", v7, v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[AXPredictiveTypingModel _nextWordPredictionsForText:desiredNumber:](self, "_nextWordPredictionsForText:desiredNumber:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_6:

  return v9;
}

- (id)predictionsForText:(id)a3
{
  return -[AXPredictiveTypingModel predictionsForText:desiredNumber:](self, "predictionsForText:desiredNumber:", a3, 15);
}

@end
