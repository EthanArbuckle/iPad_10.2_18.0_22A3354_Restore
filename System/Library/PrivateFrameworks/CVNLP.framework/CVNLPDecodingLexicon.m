@implementation CVNLPDecodingLexicon

- (CVNLPDecodingLexicon)initWithLexicon:(_LXLexicon *)a3 priority:(unint64_t)a4
{
  CVNLPDecodingLexicon *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CVNLPDecodingLexicon;
  v6 = -[CVNLPDecodingLexicon init](&v8, sel_init);
  if (v6)
  {
    v6->_lexicon = (_LXLexicon *)CFRetain(a3);
    v6->_priority = a4;
    v6->__rootCursor = (_LXCursor *)LXLexiconCreateRootCursor();
  }
  return v6;
}

- (CVNLPDecodingLexicon)initWithLexicon:(_LXLexicon *)a3
{
  return (CVNLPDecodingLexicon *)objc_msgSend_initWithLexicon_priority_(self, a2, (uint64_t)a3, 0);
}

- (void)dealloc
{
  _LXCursor *rootCursor;
  objc_super v4;

  CFRelease(self->_lexicon);
  rootCursor = self->__rootCursor;
  if (rootCursor)
  {
    CFRelease(rootCursor);
    self->__rootCursor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVNLPDecodingLexicon;
  -[CVNLPDecodingLexicon dealloc](&v4, sel_dealloc);
}

+ (_LXLexicon)_createLexiconForLocale:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  _LXLexicon *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_localeIdentifier(v3, v4, v5, v6, 0, *MEMORY[0x1E0D437B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v13, (uint64_t)&v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (_LXLexicon *)LXLexiconCreate();
  return v10;
}

+ (id)decodingLexiconForLocale:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const void *LexiconForLocale;
  CVNLPDecodingLexicon *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  LexiconForLocale = (const void *)objc_msgSend__createLexiconForLocale_(v4, v5, (uint64_t)v3, v6);
  if (LexiconForLocale)
  {
    v8 = [CVNLPDecodingLexicon alloc];
    v11 = (void *)objc_msgSend_initWithLexicon_(v8, v9, (uint64_t)LexiconForLocale, v10);
    CFRelease(LexiconForLocale);

    return v11;
  }
  else
  {

    return 0;
  }
}

+ (id)decodingLexiconForLocale:(id)a3 priority:(unint64_t)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const void *LexiconForLocale;
  CVNLPDecodingLexicon *v10;
  const char *v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  LexiconForLocale = (const void *)objc_msgSend__createLexiconForLocale_(v6, v7, (uint64_t)v5, v8);
  if (LexiconForLocale)
  {
    v10 = [CVNLPDecodingLexicon alloc];
    v12 = (void *)objc_msgSend_initWithLexicon_priority_(v10, v11, (uint64_t)LexiconForLocale, a4);
    CFRelease(LexiconForLocale);

    return v12;
  }
  else
  {

    return 0;
  }
}

- (_LXLexicon)lexicon
{
  return self->_lexicon;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (_LXCursor)_rootCursor
{
  return self->__rootCursor;
}

@end
