@implementation NLSearchParserManager

+ (NLSearchParserManager)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_7);
  return (NLSearchParserManager *)defaultManager___DefaultManager;
}

NLSearchParserManager *__39__NLSearchParserManager_defaultManager__block_invoke()
{
  NLSearchParserManager *result;
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("contextIdentifier");
  v2[0] = CFSTR("com.apple.NLP");
  result = -[NLSearchParserManager initWithOptions:]([NLSearchParserManager alloc], "initWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1));
  defaultManager___DefaultManager = (uint64_t)result;
  return result;
}

+ (id)availableLanguages
{
  return NLSearchParserCopyAvailableLanguages();
}

- (NLSearchParserManager)initWithOptions:(id)a3
{
  NLSearchParserManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NLSearchParserManager;
  v4 = -[NLSearchParserManager init](&v6, sel_init);
  if (v4)
    v4->_parser = (void *)NLSearchParserCreate((const __CFDictionary *)a3);
  return v4;
}

- (NLSearchParserManager)initWithLocale:(id)a3 context:(id)a4 options:(id)a5
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  v9 = v8;
  if (a3)
    objc_msgSend(v8, "setObject:forKey:", a3, CFSTR("locale"));
  if (a4)
    objc_msgSend(v9, "setObject:forKey:", a4, CFSTR("contextIdentifier"));
  return -[NLSearchParserManager initWithOptions:](self, "initWithOptions:", v9);
}

- (void)enumerateDateRangeAttributedParseForOptions:(id)a3 withBlock:(id)a4
{
  _QWORD v7[8];
  _QWORD v8[3];
  char v9;

  if (objc_msgSend(a3, "valueForKey:", CFSTR("startDateQuery"))
    && objc_msgSend(a3, "valueForKey:", CFSTR("startDateQuery"))
    && objc_msgSend(a3, "valueForKey:", CFSTR("endDateQuery")))
  {
    if (objc_msgSend(a3, "valueForKey:", CFSTR("endDateQuery")))
    {
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x2020000000;
      v9 = 0;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke;
      v7[3] = &unk_1E45D04C8;
      v7[4] = self;
      v7[5] = a3;
      v7[6] = a4;
      v7[7] = v8;
      -[NLSearchParserManager enumerateSearchSuggestions:options:withBlock:](self, "enumerateSearchSuggestions:options:withBlock:", 0, a3, v7);
      _Block_object_dispose(v8, 8);
    }
  }
}

void __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[8];
  _QWORD v11[5];
  uint64_t v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = __Block_byref_object_copy__17;
  v11[4] = __Block_byref_object_dispose__17;
  v12 = 0;
  v12 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a2);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_60;
  v10[3] = &unk_1E45D04A0;
  v6 = a1[6];
  v7 = a1[7];
  v10[4] = a2;
  v10[5] = v6;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v10[1] = 3221225472;
  v10[6] = v11;
  v10[7] = v7;
  objc_msgSend(v8, "enumerateAttributedParsesForQuery:options:withBlock:", a2, v9, v10);
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    *a3 = 1;
  _Block_object_dispose(v11, 8);
}

void __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_60(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  _QWORD v7[8];
  _QWORD v8[3];
  char v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6 = objc_msgSend(a2, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_2;
  v7[3] = &unk_1E45D0478;
  v7[4] = a1[4];
  v7[5] = v8;
  v7[6] = a1[6];
  v7[7] = a3;
  objc_msgSend(a2, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v7);
  if (!objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "length"))
  {
    (*(void (**)(void))(a1[5] + 16))();
    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
      *a3 = 1;
  }
  _Block_object_dispose(v8, 8);
}

uint64_t __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  void *v11;

  result = objc_msgSend(a2, "count");
  if (result)
  {
    v11 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("dateType"));
    if (objc_msgSend(v11, "intValue") == 41
      || (result = objc_msgSend(v11, "intValue"), (_DWORD)result == 42)
      || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4), &stru_1E45D0A48, 0, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  *a5 = **(_BYTE **)(a1 + 56);
  return result;
}

- (void)enumerateAttributedParsesForQuery:(id)a3 options:(id)a4 withBlock:(id)a5
{
  uint64_t v9;
  id v10;
  const __CFArray *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  CFTypeRef cf;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("locale")))
      NLSearchParserSetLocale((uint64_t)self->_parser, (const __CFLocale *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("locale")));
    if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("date")))
      NLSearchParserSetDate((uint64_t)self->_parser, (CFTypeRef)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("date")));
    if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("customResourceDirectory")))
      NLSearchParserSetCustomResourceDirectory((uint64_t)self->_parser, (const __CFURL *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("customResourceDirectory")));
    if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("includeFutureDates")), "BOOLValue"))NLSearchParserSetFutureDates((uint64_t)self->_parser, 1);
  }
  NLSearchParserSetString((uint64_t)self->_parser, (const __CFString *)a3);
  v9 = NLSearchParserCopyParseWithOptions((uint64_t)self->_parser, 0, 4);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", a3);
  v30 = 0;
  if (v9)
  {
    cf = (CFTypeRef)v9;
    v11 = NLSearchParseCandidateCopyAttributedInput(v9);
    if (-[__CFArray count](v11, "count"))
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v9);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v17 = objc_msgSend(v16, "length");
            v20 = 0;
            v21 = &v20;
            v22 = 0x3052000000;
            v23 = __Block_byref_object_copy__17;
            v24 = __Block_byref_object_dispose__17;
            v25 = 0;
            v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", objc_msgSend(v16, "string"));
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __77__NLSearchParserManager_enumerateAttributedParsesForQuery_options_withBlock___block_invoke;
            v19[3] = &unk_1E45D04F0;
            v19[4] = &v20;
            objc_msgSend(v16, "enumerateAttributesInRange:options:usingBlock:", 0, v17, 0, v19);
            if ((objc_msgSend(v12, "containsObject:", v21[5]) & 1) == 0)
            {
              (*((void (**)(id, uint64_t, char *))a5 + 2))(a5, v21[5], &v30);
              if (v30)
              {
                _Block_object_dispose(&v20, 8);
                goto LABEL_26;
              }
              objc_msgSend(v12, "addObject:", v21[5]);
            }
            _Block_object_dispose(&v20, 8);
          }
          v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v13)
            continue;
          break;
        }
      }
    }
    else
    {
      (*((void (**)(id, id, char *))a5 + 2))(a5, v10, &v30);
    }
LABEL_26:
    CFRelease(cf);
  }
  else
  {
    (*((void (**)(id, id, char *))a5 + 2))(a5, v10, &v30);
  }
}

uint64_t __77__NLSearchParserManager_enumerateAttributedParsesForQuery_options_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t result;

  v7 = objc_msgSend(a2, "valueForKey:", CFSTR("kNLDateComponents"));
  v8 = objc_msgSend(a2, "valueForKey:", CFSTR("kNLStartDateComponents"));
  v9 = (void *)objc_msgSend(a2, "valueForKey:", CFSTR("kNLEndDateComponents"));
  v10 = (void *)objc_msgSend(a2, "valueForKey:", CFSTR("kNLFrequencyDateComponents"));
  v11 = (void *)objc_msgSend(a2, "valueForKey:", CFSTR("kNLDateType"));
  v12 = objc_msgSend(a2, "valueForKey:", CFSTR("kNLDateModifier"));
  v13 = objc_msgSend(a2, "valueForKey:", CFSTR("kNLDisplayDate"));
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = v14;
  if (v13 && v7 | v8)
  {
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("displayDateString"));
    if (v7)
      v7 = (uint64_t)dateComponentsForDate((void *)v7);
    if (v8)
      v8 = (uint64_t)dateComponentsForDate((void *)v8);
    if (v9)
    {
      v16 = dateComponentsForDate(v9);
      if (v10)
        goto LABEL_9;
    }
    else
    {
      v16 = 0;
      if (v10)
      {
LABEL_9:
        v17 = dateComponentsForDate(v10);
        if (!v8)
        {
LABEL_11:
          if (v16)
            objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("endDateComponents"));
          if (v7)
            objc_msgSend(v15, "setObject:forKey:", v7, CFSTR("dateComponents"));
          if (v10)
            objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("frequencyDateComponents"));
          if (v11)
            objc_msgSend(v15, "setObject:forKey:", v11, CFSTR("dateType"));
          if (!v12)
            return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAttributes:range:", v15, a3, a4);
          v18 = CFSTR("dateModifier");
          v19 = v15;
          v20 = (void *)v12;
LABEL_23:
          objc_msgSend(v19, "setObject:forKey:", v20, v18);
          return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAttributes:range:", v15, a3, a4);
        }
LABEL_10:
        objc_msgSend(v15, "setObject:forKey:", v8, CFSTR("startDateComponents"));
        goto LABEL_11;
      }
    }
    v17 = 0;
    if (!v8)
      goto LABEL_11;
    goto LABEL_10;
  }
  result = objc_msgSend(v11, "intValue");
  if ((_DWORD)result == 42)
  {
    v18 = CFSTR("dateType");
    v19 = v15;
    v20 = v11;
    goto LABEL_23;
  }
  return result;
}

- (id)tokenizeAndEnumerateAttributedParsesForQuery:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 && objc_msgSend(a3, "length"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke_2;
    v11[3] = &unk_1E45D0518;
    v11[4] = a5;
    -[NLSearchParserManager enumerateAttributedParsesForQuery:options:withBlock:](self, "enumerateAttributedParsesForQuery:options:withBlock:", a3, a4, v11);
  }
  else if (a4 && objc_msgSend(a4, "objectForKey:", CFSTR("startDateQuery")))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke;
    v12[3] = &unk_1E45D0518;
    v12[4] = a5;
    -[NLSearchParserManager enumerateDateRangeAttributedParseForOptions:withBlock:](self, "enumerateDateRangeAttributedParseForOptions:withBlock:", a4, v12);
  }
  return v9;
}

uint64_t __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateSearchSuggestions:(id)a3 options:(id)a4 withBlock:(id)a5
{
  void *parser;
  _QWORD v6[6];
  _QWORD v7[3];
  char v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  parser = self->_parser;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__NLSearchParserManager_enumerateSearchSuggestions_options_withBlock___block_invoke;
  v6[3] = &unk_1E45D0540;
  v6[4] = a5;
  v6[5] = v7;
  NLSearchParserEnumerateSuggestions((uint64_t)parser, (uint64_t)a3, (const __CFDictionary *)a4, (uint64_t)v6);
  _Block_object_dispose(v7, 8);
}

uint64_t __70__NLSearchParserManager_enumerateSearchSuggestions_options_withBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)dealloc
{
  void *parser;
  objc_super v4;

  parser = self->_parser;
  if (parser)
    CFRelease(parser);
  v4.receiver = self;
  v4.super_class = (Class)NLSearchParserManager;
  -[NLSearchParserManager dealloc](&v4, sel_dealloc);
}

@end
