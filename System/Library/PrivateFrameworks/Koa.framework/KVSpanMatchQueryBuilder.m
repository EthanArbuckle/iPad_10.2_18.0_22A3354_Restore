@implementation KVSpanMatchQueryBuilder

- (KVSpanMatchQueryBuilder)initWithLocale:(id)a3
{
  id v4;
  KVSpanMatchQueryBuilder *v5;
  void *v6;
  objc_class *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  SEMSpanMatchQueryBuilder *builder;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)KVSpanMatchQueryBuilder;
  v5 = -[KVSpanMatchQueryBuilder init](&v14, sel_init);
  if (v5)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v6 = (void *)qword_1EF151F48;
    v19 = qword_1EF151F48;
    if (!qword_1EF151F48)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1B7103F18;
      v15[3] = &unk_1E6B7B448;
      v15[4] = &v16;
      sub_1B7103F18((uint64_t)v15);
      v6 = (void *)v17[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v16, 8);
    v8 = [v7 alloc];
    v11 = objc_msgSend_initWithLocale_(v8, v9, (uint64_t)v4, v10);
    builder = v5->_builder;
    v5->_builder = (SEMSpanMatchQueryBuilder *)v11;

  }
  return v5;
}

- (void)addTokenWithValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 beginIndex:(unsigned int)a6 endIndex:(unsigned int)a7 isSignificant:(BOOL)a8 isWitespace:(BOOL)a9
{
  MEMORY[0x1E0DE7D20](self->_builder, sel_addTokenWithValue_cleanValue_normalizedValues_beginIndex_endIndex_isSignificant_isWhitespace_, a3, a4);
}

- (id)build
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  KVSpanMatchQuery *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_build(self->_builder, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [KVSpanMatchQuery alloc];
  v8 = (void *)objc_msgSend_initWithQuery_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
