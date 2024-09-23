@implementation KVTokenizer

- (KVTokenizer)initWithLocale:(id)a3
{
  id v4;
  KVTokenizer *v5;
  void *v6;
  objc_class *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  SEMTokenizer *tokenizer;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)KVTokenizer;
  v5 = -[KVTokenizer init](&v14, sel_init);
  if (v5)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v6 = (void *)qword_1EF151F38;
    v19 = qword_1EF151F38;
    if (!qword_1EF151F38)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1B70F7D58;
      v15[3] = &unk_1E6B7B448;
      v15[4] = &v16;
      sub_1B70F7D58((uint64_t)v15);
      v6 = (void *)v17[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v16, 8);
    v8 = [v7 alloc];
    v11 = objc_msgSend_initWithLocale_(v8, v9, (uint64_t)v4, v10);
    tokenizer = v5->_tokenizer;
    v5->_tokenizer = (SEMTokenizer *)v11;

  }
  return v5;
}

- (id)locale
{
  return (id)((uint64_t (*)(SEMTokenizer *, char *))MEMORY[0x1E0DE7D20])(self->_tokenizer, sel_locale);
}

- (void)enumerateTokensOfText:(id)a3 usingBlock:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_tokenizer, sel_enumerateTokensOfText_usingBlock_, a3, a4);
}

- (id)queryFromText:(id)a3
{
  id v4;
  KVSpanMatchQuery *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = [KVSpanMatchQuery alloc];
  objc_msgSend_queryFromText_(self->_tokenizer, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithQuery_(v5, v9, (uint64_t)v8, v10);

  return v11;
}

- (SEMTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

@end
