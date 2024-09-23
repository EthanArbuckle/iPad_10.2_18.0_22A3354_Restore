@implementation CNStringTokenizer

+ (id)tokenizeString:(id)a3
{
  id v3;
  CNStringTokenizer *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(CNStringTokenizer);
  -[CNStringTokenizer tokenizeString:](v4, "tokenizeString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNStringTokenizer)init
{
  void *v3;
  CNStringTokenizer *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNStringTokenizer initWithLocale:](self, "initWithLocale:", v3);

  return v4;
}

- (CNStringTokenizer)initWithLocale:(id)a3
{
  const __CFLocale *v4;
  CNStringTokenizer *v5;
  CNUnfairLock *v6;
  CNUnfairLock *lock;
  CNStringTokenizer *v8;
  objc_super v10;
  CFRange v11;

  v4 = (const __CFLocale *)a3;
  v10.receiver = self;
  v10.super_class = (Class)CNStringTokenizer;
  v5 = -[CNStringTokenizer init](&v10, sel_init);
  if (v5)
  {
    v11.location = -1;
    v11.length = 0;
    v5->_tokenizer = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &stru_1E29BCC70, v11, 0, v4);
    v6 = objc_alloc_init(CNUnfairLock);
    lock = v5->_lock;
    v5->_lock = v6;

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  v4.receiver = self;
  v4.super_class = (Class)CNStringTokenizer;
  -[CNStringTokenizer dealloc](&v4, sel_dealloc);
}

- (id)tokenizeString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNStringTokenizer rangesOfWordTokensInString:](self, "rangesOfWordTokensInString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__CNStringTokenizer_tokenizeString___block_invoke;
  v9[3] = &unk_1E29BB0E8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __36__CNStringTokenizer_tokenizeString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "rangeValue");
  return objc_msgSend(v2, "substringWithRange:", v3, v4);
}

- (id)rangesOfWordTokensInString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNStringTokenizer rangesOfWordUnitTokensInString:](self, "rangesOfWordUnitTokensInString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "adjustRanges:toIncludeNonBreakingCharactersInString:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rangesOfWordUnitTokensInString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStringTokenizer lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__CNStringTokenizer_rangesOfWordUnitTokensInString___block_invoke;
  v12[3] = &unk_1E29B9308;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  CNRunWithLock(v6, v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

CFStringTokenizerTokenType __52__CNStringTokenizer_rangesOfWordUnitTokensInString___block_invoke(uint64_t a1)
{
  __CFStringTokenizer *v2;
  __CFString *v3;
  CFStringTokenizerTokenType result;
  CFRange CurrentTokenRange;
  void *v6;
  void *v7;
  CFRange v8;

  v2 = (__CFStringTokenizer *)objc_msgSend(*(id *)(a1 + 32), "tokenizer");
  v3 = *(__CFString **)(a1 + 40);
  v8.length = -[__CFString length](v3, "length");
  v8.location = 0;
  CFStringTokenizerSetString(v2, v3, v8);
  for (result = CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)objc_msgSend(*(id *)(a1 + 32), "tokenizer"));
        result;
        result = CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)objc_msgSend(*(id *)(a1 + 32), "tokenizer")))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)objc_msgSend(*(id *)(a1 + 32), "tokenizer"));
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  return result;
}

+ (id)adjustRanges:(id)a3 toIncludeNonBreakingCharactersInString:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t location;
  NSUInteger v11;
  NSUInteger length;
  NSUInteger v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  NSRange v19;
  void *v20;
  NSUInteger v21;
  void *v22;
  id v24;
  NSRange v25;
  NSRange v26;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      location = objc_msgSend(v9, "rangeValue");
      length = v11;

      v13 = objc_msgSend(v6, "length");
      if (++v8 >= objc_msgSend(v7, "count"))
      {
        v16 = 0;
        if (location)
        {
LABEL_7:
          v17 = location + length;
          while (1)
          {
            v18 = location - 1;
            if (!objc_msgSend(a1, "isCharacterNonBreaking:", objc_msgSend(v6, "characterAtIndex:", location - 1)))break;
            ++length;
            --location;
            if (!v18)
            {
              length = v17;
              break;
            }
          }
        }
      }
      else
      {
        objc_msgSend(v7, "objectAtIndex:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v14, "rangeValue");
        v16 = v15;

        if (location)
          goto LABEL_7;
      }
      while (location + length < v13
           && objc_msgSend(a1, "isCharacterNonBreaking:", objc_msgSend(v6, "characterAtIndex:")))
      {
        ++length;
        if (location + length == v13 && v16)
        {
          v25.location = location;
          v25.length = length;
          v26.location = v13;
          v26.length = v16;
          v19 = NSUnionRange(v25, v26);
          location = v19.location;
          length = v19.length;
          objc_msgSend(v7, "removeObjectAtIndex:", v8);
          if (v8 < objc_msgSend(v7, "count"))
          {
            objc_msgSend(v7, "objectAtIndex:", v8);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v20, "rangeValue");
            v16 = v21;

          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v22);

    }
    while (v8 < objc_msgSend(v7, "count"));
  }

  return v24;
}

+ (BOOL)isCharacterNonBreaking:(unsigned __int16)a3
{
  uint64_t v3;

  v3 = a3;
  if (isCharacterNonBreaking__cn_once_token_1 != -1)
    dispatch_once(&isCharacterNonBreaking__cn_once_token_1, &__block_literal_global_40);
  return objc_msgSend((id)isCharacterNonBreaking__cn_once_object_1, "characterIsMember:", v3);
}

void __44__CNStringTokenizer_isCharacterNonBreaking___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-@._+"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isCharacterNonBreaking__cn_once_object_1;
  isCharacterNonBreaking__cn_once_object_1 = v0;

}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
