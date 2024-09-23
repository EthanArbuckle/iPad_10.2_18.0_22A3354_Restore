@implementation NLTokenizer

- (NLTokenizer)initWithUnit:(NLTokenUnit)unit
{
  NLTokenizer *v4;
  NLTokenizer *v5;
  uint64_t v6;
  __NLTokenizer *v7;
  NLTokenizer *v8;
  objc_super v10;
  objc_super v11;

  v4 = self;
  if (unit == NLTokenUnitDocument
    && (v11.receiver = self,
        v11.super_class = (Class)NLTokenizer,
        v5 = -[NLTokenizer init](&v11, sel_init),
        (v4 = v5) != 0))
  {
    v5->_unit = 3;
  }
  else
  {
    v6 = NLTokenizerCreate();
    if (v6)
    {
      v7 = (__NLTokenizer *)v6;
      v10.receiver = v4;
      v10.super_class = (Class)NLTokenizer;
      v8 = -[NLTokenizer init](&v10, sel_init);
      v4 = v8;
      if (v8)
      {
        v8->_unit = unit;
        v8->_tokenizer = v7;
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_tokenizer)
    NLTokenizerRelease();
  v3.receiver = self;
  v3.super_class = (Class)NLTokenizer;
  -[NLTokenizer dealloc](&v3, sel_dealloc);
}

- (NLTokenUnit)unit
{
  return self->_unit;
}

- (void)setString:(NSString *)string
{
  NSString *v5;

  v5 = string;
  objc_storeStrong((id *)&self->_string, string);
  if (self->_tokenizer)
  {
    -[NSString length](v5, "length");
    NLTokenizerSetString();
  }

}

- (NSString)string
{
  return self->_string;
}

- (void)setLanguage:(NLLanguage)language
{
  __CFString *v4;
  CFLocaleRef v5;
  CFLocaleRef v6;
  NSString *v7;
  NSString *v8;
  __CFString *localeIdentifier;

  v4 = language;
  localeIdentifier = v4;
  if (self->_tokenizer)
  {
    v5 = CFLocaleCreate(0, v4);
    v4 = localeIdentifier;
    if (v5)
    {
      v6 = v5;
      NLTokenizerSetLocale();
      CFRelease(v6);
      v4 = localeIdentifier;
    }
  }
  v7 = (NSString *)-[__CFString copy](v4, "copy");
  v8 = self->_language;
  self->_language = v7;

}

- (id)language
{
  return self->_language;
}

- (id)_wordCharacterSet
{
  if (_wordCharacterSet_onceToken != -1)
    dispatch_once(&_wordCharacterSet_onceToken, &__block_literal_global_7);
  return (id)_wordCharacterSet_wordCharacterSet;
}

void __32__NLTokenizer__wordCharacterSet__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v0);

  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v1);

  objc_msgSend(v4, "invert");
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_wordCharacterSet_wordCharacterSet;
  _wordCharacterSet_wordCharacterSet = v2;

}

- (const)_tokenAtIndex:(unint64_t)a3
{
  const $BE5D9439A6AC50F82D67159C8E3E9CC4 *v4;
  int64_t var0;
  int64_t var1;
  NSString *string;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (-[NSString length](self->_string, "length") <= a3 || !self->_tokenizer)
    return 0;
  v4 = (const $BE5D9439A6AC50F82D67159C8E3E9CC4 *)NLTokenizerGoToTokenAtIndex();
  if (v4)
  {
    if (-[NLTokenizer unit](self, "unit") == NLTokenUnitWord)
    {
      var0 = v4->var0.var0;
      var1 = v4->var0.var1;
      string = self->_string;
      -[NLTokenizer _wordCharacterSet](self, "_wordCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString rangeOfCharacterFromSet:options:range:](string, "rangeOfCharacterFromSet:options:range:", v8, 0, var0, var1);
      v10 = v9;

      if (!v10)
        return 0;
    }
  }
  return v4;
}

- (NSRange)tokenRangeAtIndex:(NSUInteger)characterIndex
{
  NSUInteger v5;
  NSUInteger var1;
  NSUInteger var0;
  const $BE5D9439A6AC50F82D67159C8E3E9CC4 *v8;
  const $BE5D9439A6AC50F82D67159C8E3E9CC4 *v9;
  NSUInteger v10;
  NSRange result;

  v5 = -[NSString length](self->_string, "length");
  if (v5 <= characterIndex)
    goto LABEL_7;
  var1 = v5;
  if (-[NLTokenizer unit](self, "unit") != NLTokenUnitDocument)
  {
    if (self->_tokenizer)
    {
      v8 = -[NLTokenizer _tokenAtIndex:](self, "_tokenAtIndex:", characterIndex);
      if (v8)
      {
        v9 = v8;
        var0 = v8->var0.var0;
        var1 = v9->var0.var1;
        goto LABEL_8;
      }
    }
LABEL_7:
    var1 = 0;
    var0 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  var0 = 0;
LABEL_8:
  v10 = var1;
  result.length = v10;
  result.location = var0;
  return result;
}

- (NSRange)tokenRangeForRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger var1;
  NSUInteger v8;
  uint64_t var0;
  const $BE5D9439A6AC50F82D67159C8E3E9CC4 *v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  const $BE5D9439A6AC50F82D67159C8E3E9CC4 *v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  unint64_t v24;
  unint64_t v26;
  NSRange result;

  length = range.length;
  location = range.location;
  v6 = -[NSString length](self->_string, "length");
  if (v6 <= location)
    goto LABEL_16;
  var1 = v6;
  if (location + length <= v6)
    v8 = length;
  else
    v8 = v6 - location;
  if (-[NLTokenizer unit](self, "unit") == NLTokenUnitDocument)
  {
    var0 = 0;
    goto LABEL_17;
  }
  if (!self->_tokenizer)
  {
LABEL_16:
    var1 = 0;
    var0 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_17;
  }
  v10 = -[NLTokenizer _tokenAtIndex:](self, "_tokenAtIndex:", location);
  if (!v10)
  {
    if (-[NLTokenizer unit](self, "unit") == NLTokenUnitWord)
    {
      v18 = v8 + location;
      v19 = location;
      while (v19 < v18)
      {
        v20 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self->_string, "rangeOfComposedCharacterSequenceAtIndex:", v19);
        v22 = v20 + v21;
        if (v20 + v21 <= v19 || v22 >= v18)
          break;
        v10 = -[NLTokenizer _tokenAtIndex:](self, "_tokenAtIndex:", v22);
        v19 = v22;
        if (v10)
          goto LABEL_9;
      }
    }
    goto LABEL_16;
  }
LABEL_9:
  var0 = v10->var0.var0;
  var1 = v10->var0.var1;
  if (v8)
  {
    v11 = var1 + var0;
    v12 = v8 + location;
    if (var1 + var0 < v8 + location)
    {
      v13 = v12 - 1;
      v14 = -[NLTokenizer _tokenAtIndex:](self, "_tokenAtIndex:", v12 - 1);
      if (v14)
      {
LABEL_12:
        v15 = v14->var0.var1 + v14->var0.var0;
        if (v15 > v11)
          var1 = v15 - var0;
      }
      else if (-[NLTokenizer unit](self, "unit") == NLTokenUnitWord)
      {
        while (v13 > v11)
        {
          v24 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self->_string, "rangeOfComposedCharacterSequenceAtIndex:", v13 - 1);
          if (v24 >= v13 || v24 < v11)
            break;
          v26 = v24;
          v14 = -[NLTokenizer _tokenAtIndex:](self, "_tokenAtIndex:", v24);
          v13 = v26;
          if (v14)
            goto LABEL_12;
        }
      }
    }
  }
LABEL_17:
  v16 = var0;
  v17 = var1;
  result.length = v17;
  result.location = v16;
  return result;
}

- (NSArray)tokensForRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  length = range.length;
  location = range.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__NLTokenizer_tokensForRange___block_invoke;
  v9[3] = &unk_1E4A3B570;
  v7 = v6;
  v10 = v7;
  -[NLTokenizer enumerateTokensInRange:usingBlock:](self, "enumerateTokensInRange:usingBlock:", location, length, v9);

  return (NSArray *)v7;
}

void __30__NLTokenizer_tokensForRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)enumerateTokensInRange:(NSRange)range usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  NSUInteger v8;
  NLTokenUnit v9;
  void *v10;
  NSUInteger v11;
  NSUInteger *NextToken;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  uint64_t v35;
  NLTokenUnit v36;
  void *v37;
  NSUInteger v38;
  char v39;

  length = range.length;
  location = range.location;
  v7 = block;
  v8 = -[NSString length](self->_string, "length");
  v39 = 0;
  v9 = -[NLTokenizer unit](self, "unit");
  -[NLTokenizer _wordCharacterSet](self, "_wordCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (enumerateTokensInRange_usingBlock__onceToken != -1)
    dispatch_once(&enumerateTokensInRange_usingBlock__onceToken, &__block_literal_global_8);
  v11 = location + length;
  if (location + length <= v8)
  {
    if (-[NLTokenizer unit](self, "unit") == NLTokenUnitDocument)
    {
      (*((void (**)(void *, _QWORD, NSUInteger, _QWORD, char *))v7 + 2))(v7, 0, v8, 0, &v39);
      goto LABEL_34;
    }
    if (!self->_tokenizer)
      goto LABEL_34;
    NextToken = (NSUInteger *)NLTokenizerGoToTokenAtIndex();
    if (!NextToken)
    {
      if (-[NLTokenizer unit](self, "unit"))
        goto LABEL_34;
      v30 = location;
      do
      {
        if (v30 >= v11)
          goto LABEL_34;
        v31 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self->_string, "rangeOfComposedCharacterSequenceAtIndex:", v30);
        v33 = v31 + v32;
        if (v31 + v32 <= v30 || v33 >= v11)
          goto LABEL_34;
        v35 = NLTokenizerGoToTokenAtIndex();
        v30 = v33;
      }
      while (!v35);
      NextToken = (NSUInteger *)v35;
    }
    v37 = v10;
    v38 = location;
    v36 = v9;
    while (1)
    {
      v13 = NextToken[1];
      if (v13 < 1)
        goto LABEL_34;
      v14 = *NextToken;
      v15 = *NextToken + v13;
      if (*NextToken >= v11 || v15 < location)
        goto LABEL_34;
      if (v9)
        break;
      -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", v10, 0, *NextToken, NextToken[1]);
      if (v18)
      {
        v17 = (NextToken[2] >> 3) & 1;
        if (v14 < v15)
        {
          v19 = v14;
          do
          {
            v20 = -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", enumerateTokensInRange_usingBlock__nonAlphanumericCharacterSet, 0, v19, v15 - v19, v36, v37, v38);
            if (!v21)
              break;
            v22 = v20;
            v23 = v21;
            v24 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self->_string, "rangeOfComposedCharacterSequenceAtIndex:", v20);
            if (v24 + v25 <= v15)
            {
              v23 = v25;
              v22 = v24;
            }
            -[NSString rangeOfCharacterFromSet:options:range:](self->_string, "rangeOfCharacterFromSet:options:range:", enumerateTokensInRange_usingBlock__nonWordInternalCharacterSet, 0, v22, v23);
            if (v26)
            {
              -[NSString substringWithRange:](self->_string, "substringWithRange:", v22, v23);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = CEMStringContainsEmoji();
              v29 = 4;
              if (!v28)
                v29 = 2;
              v17 |= v29;

            }
            v19 = v22 + v23;
          }
          while (v22 + v23 < v15);
        }
        goto LABEL_17;
      }
LABEL_18:
      if (!v39)
      {
        NextToken = (NSUInteger *)NLTokenizerGetNextToken();
        if (NextToken)
          continue;
      }
      goto LABEL_34;
    }
    v17 = 0;
LABEL_17:
    (*((void (**)(void *, NSUInteger, uint64_t, uint64_t, char *))v7 + 2))(v7, v14, v13, v17, &v39);
    v10 = v37;
    location = v38;
    v9 = v36;
    goto LABEL_18;
  }
LABEL_34:

}

void __49__NLTokenizer_enumerateTokensInRange_usingBlock___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)enumerateTokensInRange_usingBlock__nonAlphanumericCharacterSet;
  enumerateTokensInRange_usingBlock__nonAlphanumericCharacterSet = v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("':_-’"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)enumerateTokensInRange_usingBlock__nonWordInternalCharacterSet;
  enumerateTokensInRange_usingBlock__nonWordInternalCharacterSet = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
