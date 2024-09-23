@implementation BRLTJJapaneseProcessor

- (BRLTJJapaneseProcessor)init
{
  BRLTJJapaneseProcessor *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDictionary *kataToHira;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRLTJJapaneseProcessor;
  v2 = -[BRLTJJapaneseProcessor init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("KataToHira"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    kataToHira = v2->_kataToHira;
    v2->_kataToHira = (NSDictionary *)v5;

  }
  return v2;
}

- (id)longVowelExpressedFor:(id)a3 partOfSpeech:(int64_t)a4
{
  id v5;
  id v6;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  BOOL v13;
  void *v14;
  const __CFString *v15;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", CFSTR("うろうろ")) & 1) == 0
    && !objc_msgSend(v5, "isEqual:", CFSTR("こうり")))
  {
    v6 = (id)objc_opt_new();
    if (!objc_msgSend(v5, "length"))
      goto LABEL_4;
    v8 = 0;
    v9 = 0;
    while (1)
    {
      objc_msgSend(v5, "substringWithRange:", v9, 1);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if ((v8 & 1) != 0)
        v12 = -[__CFString isEqual:](v10, "isEqual:", CFSTR("う"));
      else
        v12 = 0;
      if (a4 == 1)
      {
        v13 = v9 == objc_msgSend(v5, "length") - 1;
        if (!v12)
          goto LABEL_16;
      }
      else
      {
        v13 = 0;
        if (!v12)
          goto LABEL_16;
      }
      if (v13)
      {
LABEL_16:
        v14 = v6;
        v15 = v11;
        goto LABEL_17;
      }
      v14 = v6;
      v15 = CFSTR("ー");
LABEL_17:
      objc_msgSend(v14, "appendString:", v15);
      if ((objc_msgSend(&unk_24CBF7F28, "containsObject:", v11) & 1) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend(&unk_24CBF7F40, "containsObject:", v11);

      if (++v9 >= (unint64_t)objc_msgSend(v5, "length"))
        goto LABEL_4;
    }
  }
  v6 = v5;
LABEL_4:

  return v6;
}

- (BOOL)isWordDescriptionLike:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  unint64_t i;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (self->_kataToHira && (unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    if (objc_msgSend(v5, "length"))
    {
      for (i = 0; i < objc_msgSend(v5, "length"); ++i)
      {
        objc_msgSend(v5, "substringWithRange:", i, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_kataToHira, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 || (objc_msgSend(v8, "isEqual:", CFSTR("、")) & 1) != 0)
        {

        }
        else if ((objc_msgSend(v8, "isEqual:", CFSTR(" ")) & 1) == 0)
        {

          goto LABEL_3;
        }

      }
    }
    v6 = 1;
  }
  else
  {
LABEL_3:
    v6 = 0;
  }

  return v6;
}

- (id)replaceKataWithHira:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (self->_kataToHira)
  {
    v6 = (id)objc_opt_new();
    if (objc_msgSend(v5, "length"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v5, "substringWithRange:", v7, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_kataToHira, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = v9;
        else
          v10 = v8;
        objc_msgSend(v6, "appendString:", v10);

        ++v7;
      }
      while (v7 < objc_msgSend(v5, "length"));
    }
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)spacedYomiOfWordDescription:(id)a3
{
  __CFString *v3;
  const __CFAllocator *v4;
  const __CFLocale *v5;
  __CFStringTokenizer *v6;
  void *v7;
  void *v8;
  CFIndex v9;
  unint64_t v10;
  CFRange CurrentTokenRange;
  void *v12;
  CFIndex v13;
  void *v14;
  void *v15;
  int CurrentTokenPartOfSpeech;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  CFIndex v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  CFIndex v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  __CFStringTokenizer *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  CFIndex v46;
  CFRange v47;
  CFRange v48;

  -[BRLTJJapaneseProcessor replaceKataWithHira:](self, "replaceKataWithHira:", a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("ja"));
  v47.location = 0;
  v47.length = 0;
  v6 = CFStringTokenizerCreate(v4, 0, v47, 0, v5);
  CFRelease(v5);
  v48.length = CFStringGetLength(v3);
  v48.location = 0;
  CFStringTokenizerSetString(v6, v3, v48);
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = 0;
  if (CFStringTokenizerAdvanceToNextToken(v6))
  {
    v43 = 0;
    v10 = 0x24BDD1000uLL;
    v41 = v8;
    v42 = v7;
    v40 = v6;
    do
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      -[__CFString substringWithRange:](v3, "substringWithRange:", v9, CurrentTokenRange.location - v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendString:", v12);

      v13 = v9;
      if (CurrentTokenRange.location > v9)
      {
        do
        {
          objc_msgSend(*(id *)(v10 + 1760), "numberWithInteger:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (CurrentTokenRange.location != v13);
      }
      v15 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(v6, 0x400000uLL);
      CurrentTokenPartOfSpeech = _CFStringTokenizerGetCurrentTokenPartOfSpeech();
      if (objc_msgSend(v7, "length") && CurrentTokenRange.location == v9 && ((v43 ^ 1) & 1) == 0)
      {
        objc_msgSend(v7, "appendString:", CFSTR(" "));
        objc_msgSend(*(id *)(v10 + 1760), "numberWithInteger:", v9 - 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

      }
      v18 = 0;
      v44 = CurrentTokenPartOfSpeech;
      v46 = CurrentTokenRange.length + CurrentTokenRange.location;
      v19 = -1;
      while ((CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63)) != v18)
      {
        v20 = v18;
        if (v18 < objc_msgSend(v15, "length"))
        {
          v21 = v3;
          -[__CFString substringWithRange:](v3, "substringWithRange:", v46 + v19, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "substringWithRange:", objc_msgSend(v15, "length") + v19, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](self->_kataToHira, "objectForKey:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v26 = v24;

            v22 = v26;
          }
          v27 = objc_msgSend(v22, "isEqual:", v23);
          ++v18;

          --v19;
          v3 = v21;
          if ((v27 & 1) != 0)
            continue;
        }
        goto LABEL_17;
      }
      v20 = CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63);
LABEL_17:
      v8 = v41;
      if (objc_msgSend(v15, "length") != v20)
      {
        v28 = 0;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", CurrentTokenRange.location);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v29);

          ++v28;
        }
        while (v28 < objc_msgSend(v15, "length") - v20);
      }
      v9 = CurrentTokenRange.length + CurrentTokenRange.location;
      if (v20)
      {
        v30 = v20 + 1;
        v31 = CurrentTokenRange.length + CurrentTokenRange.location - v20;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v32);

          --v30;
          ++v31;
        }
        while (v30 > 1);
      }
      -[BRLTJJapaneseProcessor longVowelExpressedFor:partOfSpeech:](self, "longVowelExpressedFor:partOfSpeech:", v15, v44);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46 == -[__CFString length](v3, "length"))
      {
        v6 = v40;
        v10 = 0x24BDD1000;
        v7 = v42;
      }
      else
      {
        v6 = v40;
        v10 = 0x24BDD1000;
        v7 = v42;
        if (!(v43 & 1 | (-[__CFString characterAtIndex:](v3, "characterAtIndex:", v46) == 12289))
          && (_DWORD)v44 == 4)
        {
          v34 = CFSTR("わ");
          if ((objc_msgSend(v33, "isEqual:", CFSTR("は")) & 1) != 0
            || (v34 = CFSTR("え"), objc_msgSend(v33, "isEqual:", CFSTR("へ"))))
          {

            v33 = (void *)v34;
          }
          v10 = 0x24BDD1000;
        }
      }
      objc_msgSend(v7, "appendString:", v33);
      v35 = objc_msgSend(v33, "isEqual:", CFSTR("の"));
      if ((_DWORD)v44 == 4)
        v36 = v35;
      else
        v36 = 0;
      v43 = v36;

    }
    while (CFStringTokenizerAdvanceToNextToken(v6));
  }
  CFRelease(v6);
  -[__CFString substringWithRange:](v3, "substringWithRange:", v9, -[__CFString length](v3, "length") - v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v37);

  for (; v9 < (unint64_t)-[__CFString length](v3, "length"); ++v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v38);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kataToHira, 0);
}

@end
