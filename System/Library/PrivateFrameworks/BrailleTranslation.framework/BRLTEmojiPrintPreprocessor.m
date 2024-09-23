@implementation BRLTEmojiPrintPreprocessor

- (BRLTEmojiPrintPreprocessor)initWithPrimaryLanguageCode:(id)a3
{
  id v5;
  BRLTEmojiPrintPreprocessor *v6;
  BRLTEmojiPrintPreprocessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTEmojiPrintPreprocessor;
  v6 = -[BRLTEmojiPrintPreprocessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_primaryLanguageCode, a3);
    -[BRLTEmojiPrintPreprocessor _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (BRLTEmojiPrintPreprocessor)init
{
  BRLTEmojiPrintPreprocessor *v2;
  BRLTEmojiPrintPreprocessor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRLTEmojiPrintPreprocessor;
  v2 = -[BRLTEmojiPrintPreprocessor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BRLTEmojiPrintPreprocessor _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  id v3;

  -[BRLTEmojiPrintPreprocessor _setupLocale](self, "_setupLocale");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__setupLocale, *MEMORY[0x24BDBD3F0], 0);

}

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v8 = a3;
  v9 = a6;
  if (v8)
  {
    v22 = v9;
    v10 = objc_msgSend(v8, "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    objc_msgSend(v8, "length");
    v14 = v8;
    v15 = v11;
    v16 = v12;
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
    v17 = v24[3];
    if (v10 > v17)
    {
      v18 = v15;
      v19 = v16;
      objc_msgSend(v14, "substringWithRange:", v17, v10 - v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendString:", v20);

      while (v10 != v17)
      {
        v27 = v17;
        objc_msgSend(v19, "appendBytes:length:", &v27, 8);
        ++v17;
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v16);
    v13 = v15;

    _Block_object_dispose(&v23, 8);
    v9 = v22;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __100__BRLTEmojiPrintPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v8 = a3 - v7;
  if (a3 > v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(void **)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    v12 = v10;
    objc_msgSend(v9, "substringWithRange:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v13);

    do
    {
      v20 = v7;
      objc_msgSend(v12, "appendBytes:length:", &v20, 8);
      ++v7;
    }
    while (a3 != v7);

  }
  v14 = (void *)CEMEmojiTokenCopyName();
  if (objc_msgSend(v14, "length"))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v15 = CFSTR(":");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &_TranscriberNoteStart, 5);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (*(_BYTE *)(a1 + 64))
    {
      v16 = CFSTR(":");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &_TranscriberNoteEnd, 5);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "length");
    objc_msgSend(*(id *)(a1 + 40), "appendString:", v18);
    for (; v19; --v19)
    {
      v20 = a3;
      objc_msgSend(*(id *)(a1 + 48), "appendBytes:length:", &v20, 8);
    }

    v14 = v18;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3 + a4;

}

- (void)_setupLocale
{
  const __CFLocale *v3;
  __EmojiLocaleDataWrapper *locale;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *primaryLanguageCode;
  NSUInteger v11;
  NSString *v12;

  v3 = CFLocaleCopyCurrent();
  locale = self->_locale;
  if (locale)
  {
    CFRelease(locale);
    self->_locale = 0;
  }
  CFLocaleGetValue(v3, (CFLocaleKey)*MEMORY[0x24BDBD418]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString componentsSeparatedByString:](self->_primaryLanguageCode, "componentsSeparatedByString:", CFSTR("-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v9) & 1) != 0)
  {

    primaryLanguageCode = (NSString *)v5;
  }
  else
  {
    v11 = -[NSString length](self->_primaryLanguageCode, "length");

    primaryLanguageCode = (NSString *)v5;
    if (v11)
      primaryLanguageCode = self->_primaryLanguageCode;
  }
  v12 = primaryLanguageCode;
  self->_locale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
  if (v3)
    CFRelease(v3);

}

- (void)dealloc
{
  __EmojiLocaleDataWrapper *locale;
  objc_super v4;

  locale = self->_locale;
  if (locale)
    CFRelease(locale);
  v4.receiver = self;
  v4.super_class = (Class)BRLTEmojiPrintPreprocessor;
  -[BRLTEmojiPrintPreprocessor dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLanguageCode, 0);
}

@end
