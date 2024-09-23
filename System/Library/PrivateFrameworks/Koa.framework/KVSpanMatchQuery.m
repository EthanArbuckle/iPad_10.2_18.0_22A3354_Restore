@implementation KVSpanMatchQuery

- (KVSpanMatchQuery)initWithQuery:(id)a3
{
  id v5;
  KVSpanMatchQuery *v6;
  KVSpanMatchQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVSpanMatchQuery;
  v6 = -[KVSpanMatchQuery init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_query, a3);

  return v7;
}

- (id)locale
{
  return (id)((uint64_t (*)(SEMSpanMatchQuery *, char *))MEMORY[0x1E0DE7D20])(self->_query, sel_locale);
}

- (id)cleanText
{
  return (id)((uint64_t (*)(SEMSpanMatchQuery *, char *))MEMORY[0x1E0DE7D20])(self->_query, sel_originalText);
}

- (void)setIncludedItemTypes:(id)a3
{
  ((void (*)(SEMSpanMatchQuery *, char *, id))MEMORY[0x1E0DE7D20])(self->_query, sel_setIncludedKVItemTypes_, a3);
}

- (void)setIncludedFieldTypes:(id)a3
{
  ((void (*)(SEMSpanMatchQuery *, char *, id))MEMORY[0x1E0DE7D20])(self->_query, sel_setIncludedKVFieldTypes_, a3);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_query, a2, v2, v3);
}

- (SEMSpanMatchQuery)query
{
  return self->_query;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
