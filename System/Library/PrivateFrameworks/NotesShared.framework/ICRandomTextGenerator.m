@implementation ICRandomTextGenerator

- (ICRandomTextGenerator)initWithRandomNumberGenerator:(id)a3
{
  id v4;
  ICRandomTextGenerator *v5;
  ICRandomTextGenerator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICRandomTextGenerator;
  v5 = -[ICRandomTextGenerator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICRandomTextGenerator setRandomNumberGenerator:](v5, "setRandomNumberGenerator:", v4);

  return v6;
}

- (BOOL)isRightToLeftLanguage
{
  return -[ICRandomTextGenerator language](self, "language") == 5
      || -[ICRandomTextGenerator language](self, "language") == 7;
}

- (id)word
{
  return -[ICRandomTextGenerator generateMinWords:maxWords:](self, "generateMinWords:maxWords:", 1, 1);
}

- (id)lineOfText
{
  return -[ICRandomTextGenerator generateMinWords:maxWords:](self, "generateMinWords:maxWords:", 3, 20);
}

- (id)sentence
{
  return -[ICRandomTextGenerator generateMinSentences:maxSentences:minWords:maxWords:](self, "generateMinSentences:maxSentences:minWords:maxWords:", 1, 1, 3, 20);
}

- (id)paragraph
{
  void *v2;
  void *v3;

  -[ICRandomTextGenerator generateMinSentences:maxSentences:minWords:maxWords:](self, "generateMinSentences:maxSentences:minWords:maxWords:", 1, 20, 3, 20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)loadWordsForLanguage:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  if (loadWordsForLanguage__onceToken != -1)
    dispatch_once(&loadWordsForLanguage__onceToken, &__block_literal_global_5);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)loadWordsForLanguage__wordFileNames, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:subdirectory:", v5, CFSTR("words"), CFSTR("Internal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v6, 4, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  if (v7)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "length"));
      v10 = objc_msgSend(v7, "length");
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __46__ICRandomTextGenerator_loadWordsForLanguage___block_invoke_26;
      v17 = &unk_1E76C7AE8;
      v18 = v9;
      v11 = v9;
      objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, &v14);
      v12 = -[NSObject copy](v11, "copy", v14, v15, v16, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Internal");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICRandomTextGenerator loadWordsForLanguage:].cold.1((uint64_t)v6, (uint64_t)v8, v11);
    v12 = 0;
  }

  return v12;
}

void __46__ICRandomTextGenerator_loadWordsForLanguage___block_invoke()
{
  void *v0;

  v0 = (void *)loadWordsForLanguage__wordFileNames;
  loadWordsForLanguage__wordFileNames = (uint64_t)&unk_1E771AA58;

}

uint64_t __46__ICRandomTextGenerator_loadWordsForLanguage___block_invoke_26(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)wordsForLanguage:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (wordsForLanguage__onceToken != -1)
    dispatch_once(&wordsForLanguage__onceToken, &__block_literal_global_29);
  v5 = (void *)wordsForLanguage__wordsByLanguage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(a1, "loadWordsForLanguage:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)wordsForLanguage__wordsByLanguage;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    }
  }
  return v7;
}

void __42__ICRandomTextGenerator_wordsForLanguage___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)wordsForLanguage__wordsByLanguage;
  wordsForLanguage__wordsByLanguage = (uint64_t)v0;

}

+ (BOOL)hasSpacesBetweenWordsForLanguage:(unint64_t)a3
{
  return a3 - 4 < 0xFFFFFFFFFFFFFFFELL;
}

+ (id)sentencePunctuationForLanguage:(unint64_t)a3 endOfParagraph:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;

  v4 = a4;
  v6 = CFSTR(". ");
  if (a4)
    v6 = CFSTR(".");
  v7 = v6;
  if (a3 - 2 < 2)
  {
    v9 = CFSTR("。");
LABEL_11:

    v7 = (__CFString *)v9;
    return v7;
  }
  if (a3 == 4)
  {
    v9 = CFSTR(" ");
    goto LABEL_11;
  }
  if (a3 == 5)
  {
    v8 = CFSTR("۔");
    if (v4)
      v8 = CFSTR("۔ ");
    v9 = v8;
    goto LABEL_11;
  }
  return v7;
}

- (id)generateWords:(unint64_t)a3 minLength:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;

  objc_msgSend((id)objc_opt_class(), "wordsForLanguage:", -[ICRandomTextGenerator language](self, "language"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") - 1;
  -[ICRandomTextGenerator randomNumberGenerator](self, "randomNumberGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "randomIndexMin:max:", 0, v8);

  if (v10 >= objc_msgSend(v7, "count"))
  {
    v22 = os_log_create("com.apple.notes", "Internal");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ICRandomTextGenerator generateWords:minLength:].cold.1(v22);

    v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedCapitalizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v11, "initWithString:", v13);

    v15 = objc_msgSend((id)objc_opt_class(), "hasSpacesBetweenWordsForLanguage:", -[ICRandomTextGenerator language](self, "language"));
    v16 = a3 - 1;
    if (a3 != 1)
    {
      v17 = v15;
      v18 = 1;
      do
      {
        if (a4 && objc_msgSend(v14, "length") >= a4)
          break;
        -[ICRandomTextGenerator randomNumberGenerator](self, "randomNumberGenerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "randomIndexMin:max:", 0, v8);

        if (v17)
          objc_msgSend(v14, "appendString:", CFSTR(" "));
        objc_msgSend(v7, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v21);

        ++v18;
      }
      while (v16 >= v18);
    }
  }

  return v14;
}

- (id)generateMinWords:(unint64_t)a3 maxWords:(unint64_t)a4
{
  void *v7;
  void *v8;

  -[ICRandomTextGenerator randomNumberGenerator](self, "randomNumberGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRandomTextGenerator generateWords:minLength:](self, "generateWords:minLength:", objc_msgSend(v7, "randomIndexMin:max:", a3, a4), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)generateWordsWithMinLength:(unint64_t)a3
{
  return -[ICRandomTextGenerator generateWords:minLength:](self, "generateWords:minLength:", 0, a3);
}

- (id)generateMinSentences:(unint64_t)a3 maxSentences:(unint64_t)a4 minWords:(unint64_t)a5 maxWords:(unint64_t)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t i;
  void *v15;
  void *v16;

  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[ICRandomTextGenerator randomNumberGenerator](self, "randomNumberGenerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "randomIndexMin:max:", a3, a4);

  if (v13)
  {
    for (i = 0; i != v13; ++i)
    {
      -[ICRandomTextGenerator generateMinWords:maxWords:](self, "generateMinWords:maxWords:", a5, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v15);
      objc_msgSend((id)objc_opt_class(), "sentencePunctuationForLanguage:endOfParagraph:", -[ICRandomTextGenerator language](self, "language"), i >= v13 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v16);

    }
  }
  return v11;
}

- (unint64_t)language
{
  return self->_language;
}

- (void)setLanguage:(unint64_t)a3
{
  self->_language = a3;
}

- (ICRandomNumberGenerator)randomNumberGenerator
{
  return self->_randomNumberGenerator;
}

- (void)setRandomNumberGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_randomNumberGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
}

+ (void)loadWordsForLanguage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Can't load words file %@ because %@", (uint8_t *)&v3, 0x16u);
}

- (void)generateWords:(os_log_t)log minLength:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Trying to generate random words, but the words aren't avaialble", v1, 2u);
}

@end
