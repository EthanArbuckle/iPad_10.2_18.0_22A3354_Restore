@implementation CVNLPLanguageResourceBundle

- (CVNLPLanguageResourceBundle)initWithLexicons:(id)a3 characterLanguageModel:(id)a4 wordLanguageModel:(id)a5
{
  id v9;
  id v10;
  id v11;
  CVNLPLanguageResourceBundle *v12;
  CVNLPLanguageResourceBundle *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CVNLPLanguageResourceBundle;
  v12 = -[CVNLPLanguageResourceBundle init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_characterLanguageModel, a4);
    objc_storeStrong((id *)&v13->_wordLanguageModel, a5);
    objc_storeStrong((id *)&v13->_lexicons, a3);
  }

  return v13;
}

- (id)packagedLexiconCursorsUsingContext:(id)a3
{
  uint64_t v3;

  objc_msgSend_packagedLexiconCursorsUsingTextDecodingContext_(self->_lexicons, a2, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)packagedLexiconRootCursors
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_packagedLexiconRootCursors(self->_lexicons, a2, v2, v3);
}

- (CVNLPDecodingLexicons)lexicons
{
  return self->_lexicons;
}

- (CVNLPDecodingLanguageModel)characterLanguageModel
{
  return self->_characterLanguageModel;
}

- (CVNLPDecodingLanguageModel)wordLanguageModel
{
  return self->_wordLanguageModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordLanguageModel, 0);
  objc_storeStrong((id *)&self->_characterLanguageModel, 0);
  objc_storeStrong((id *)&self->_lexicons, 0);
}

@end
