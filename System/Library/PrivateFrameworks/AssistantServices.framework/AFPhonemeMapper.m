@implementation AFPhonemeMapper

- (AFPhonemeMapper)initWithLanguageCode:(id)a3
{
  id v4;
  AFPhonemeMapper *v5;
  uint64_t v6;
  NSString *languageCode;
  uint64_t v8;
  NSDictionary *phonemeMap;
  NSDictionary *v10;
  void *v11;
  uint64_t v12;
  NSRegularExpression *regex;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFPhonemeMapper;
  v5 = -[AFPhonemeMapper init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v6;

    +[AFPhonemeMapper _mapForLanguageCode:](AFPhonemeMapper, "_mapForLanguageCode:", v5->_languageCode);
    v8 = objc_claimAutoreleasedReturnValue();
    phonemeMap = v5->_phonemeMap;
    v5->_phonemeMap = (NSDictionary *)v8;

    v10 = v5->_phonemeMap;
    if (v10)
    {
      -[NSDictionary allKeys](v10, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AFPhonemeMapper _buildRegexMatchingSubstrings:](AFPhonemeMapper, "_buildRegexMatchingSubstrings:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      regex = v5->_regex;
      v5->_regex = (NSRegularExpression *)v12;

    }
    else
    {
      v11 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (id)stringByReplacingPhonemesInString:(id)a3
{
  id v4;
  void *v5;
  NSRegularExpression *regex;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  AFPhonemeMapper *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v4, "length"));
    v21 = 0;
    v22 = &v21;
    v23 = 0x3010000000;
    v25 = 0;
    v26 = 0;
    v24 = &unk_19B1427C9;
    regex = self->_regex;
    v7 = objc_msgSend(v4, "length");
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __53__AFPhonemeMapper_stringByReplacingPhonemesInString___block_invoke;
    v16 = &unk_1E3A2DB10;
    v20 = &v21;
    v8 = v5;
    v17 = v8;
    v9 = v4;
    v18 = v9;
    v19 = self;
    -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](regex, "enumerateMatchesInString:options:range:usingBlock:", v9, 0, 0, v7, &v13);
    objc_msgSend(v9, "substringFromIndex:", v22[5] + v22[4], v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v10);

    v11 = v8;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_phonemeMap, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

void __53__AFPhonemeMapper_stringByReplacingPhonemesInString___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v3 = objc_msgSend(a2, "range");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
    if (v3 >= v6)
    {
      v7 = v4;
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v6, v3 - v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v9);

      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v5, v7);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKey:", v15);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v15;
        v12 = (void *)v10;
      }
      else
      {
        v11 = 0;
        v12 = 0;
      }
      if (v12)
        v13 = v12;
      else
        v13 = v11;
      if (v13)
        objc_msgSend(*(id *)(a1 + 32), "appendString:");
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      *(_QWORD *)(v14 + 32) = v5;
      *(_QWORD *)(v14 + 40) = v7;

    }
  }
}

+ (id)_mapForLanguageCode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB34D0];
    v4 = a3;
    objc_msgSend(v3, "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:inDirectory:", v4, CFSTR("plist"), CFSTR("PhonemeMaps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_buildRegexMatchingSubstrings:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v10);

          objc_msgSend(v4, "appendString:", CFSTR("|"));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, CFSTR(")"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v4, 0, 0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
