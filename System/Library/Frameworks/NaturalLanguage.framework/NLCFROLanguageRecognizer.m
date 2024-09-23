@implementation NLCFROLanguageRecognizer

- (NLCFROLanguageRecognizer)init
{
  uint64_t v3;
  void *v4;
  NLCFROLanguageRecognizer *v5;
  NSMutableString *v6;
  NSMutableString *string;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0D174C8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = NLTaggerCreate();
  if (v3)
  {
    v4 = (void *)v3;
    v9.receiver = self;
    v9.super_class = (Class)NLCFROLanguageRecognizer;
    v5 = -[NLLanguageRecognizer init](&v9, sel_init);
    self = v5;
    if (v5)
    {
      v5->_tagger = v4;
      v6 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
      string = self->_string;
      self->_string = v6;

    }
  }
  return self;
}

- (void)dealloc
{
  void *tagger;
  objc_super v4;

  tagger = self->_tagger;
  if (tagger)
    CFRelease(tagger);
  v4.receiver = self;
  v4.super_class = (Class)NLCFROLanguageRecognizer;
  -[NLLanguageRecognizer dealloc](&v4, sel_dealloc);
}

+ (id)dominantLanguageForString:(id)a3
{
  void *v3;
  id v4;
  const void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0D174C8];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 1);
  v5 = (const void *)NLTaggerCreate();
  NLTaggerSetString();

  v6 = (void *)NLTaggerCopyTagAtIndex();
  CFRelease(v5);
  return v6;
}

- (void)processString:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableString length](self->_string, "length"))
    -[NSMutableString appendString:](self->_string, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->_string, "appendString:", v4);

}

- (void)reset
{
  -[NSMutableString replaceCharactersInRange:withString:](self->_string, "replaceCharactersInRange:withString:", 0, -[NSMutableString length](self->_string, "length"), &stru_1E4A3BA10);
}

- (id)dominantLanguage
{
  void *v2;

  NLTaggerSetString();
  v2 = (void *)NLTaggerCopyTagAtIndex();
  NLTaggerSetString();
  return v2;
}

- (id)languageHypothesesWithMaximum:(unint64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[NLCFROLanguageRecognizer dominantLanguage](self, "dominantLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "setObject:forKey:", &unk_1E4A47E18, v6);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
