@implementation TESLocaleData

+ (id)animationNameForTextEffectType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E66F9F48 + a3 - 1);
}

+ (int64_t)textEffectTypeForAnimationName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("big")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("small")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("jitter")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("explode")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("shakeVertical")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("shakeHorizontal")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bloom")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bounce")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bold")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("underline")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("italic")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("strikeThrough")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)localeDataWithLocaleIdentifier:(id)a3
{
  id v3;
  TESLocaleData *v4;

  v3 = a3;
  v4 = -[TESLocaleData initWithLocaleIdentifier:]([TESLocaleData alloc], "initWithLocaleIdentifier:", v3);

  return v4;
}

+ (id)localeDataWithLocale:(id)a3
{
  id v3;
  TESLocaleData *v4;

  v3 = a3;
  v4 = -[TESLocaleData initWithLocale:]([TESLocaleData alloc], "initWithLocale:", v3);

  return v4;
}

- (TESLocaleData)initWithLocaleIdentifier:(id)a3
{
  void *v4;
  TESLocaleData *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[TESLocaleData initWithLocale:](self, "initWithLocale:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (TESLocaleData)initWithLocale:(id)a3
{
  id v4;
  TESLocaleData *v5;
  uint64_t v6;
  NSLocale *locale;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TESLocaleData;
  v5 = -[TESLocaleData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

  }
  return v5;
}

- (void)enumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSUInteger length;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[3];
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  length = a4.length;
  location = a4.location;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  +[TESMatcherManager sharedManager](TESMatcherManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TESLocaleData locale](self, "locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "matcherForLocale:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a5 & 2) != 0)
  {
    objc_msgSend(v14, "phraseMatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "matchesForString:searchRange:", v10, location, length);
    LOBYTE(v24[0]) = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v15);
          if (v11)
            (*((void (**)(id, _QWORD, _QWORD *))v11 + 2))(v11, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v24);
          if (LOBYTE(v24[0]))
          {

            goto LABEL_15;
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__TESLocaleData_enumerateTextEffectCandidatesInString_searchRange_options_usingBlock___block_invoke;
  v21[3] = &unk_1E66F9F00;
  v23 = v24;
  v22 = v11;
  objc_msgSend(v14, "enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:", v10, location, length, a5, v21);

  _Block_object_dispose(v24, 8);
LABEL_15:

}

uint64_t __86__TESLocaleData_enumerateTextEffectCandidatesInString_searchRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)textEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  length = a4.length;
  location = a4.location;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__TESLocaleData_textEffectCandidatesInString_searchRange_options___block_invoke;
  v15[3] = &unk_1E66F9F28;
  v16 = v11;
  v12 = v11;
  -[TESLocaleData enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:](self, "enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:", v10, location, length, a5, v15);

  v13 = (void *)objc_msgSend(v12, "copy");
  return v13;
}

uint64_t __66__TESLocaleData_textEffectCandidatesInString_searchRange_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
