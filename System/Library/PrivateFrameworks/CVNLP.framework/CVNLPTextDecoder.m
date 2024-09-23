@implementation CVNLPTextDecoder

- (CVNLPTextDecoder)initWithLanguageResourceBundle:(id)a3
{
  id v5;
  CVNLPTextDecoder *v6;
  CVNLPTextDecoder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVNLPTextDecoder;
  v6 = -[CVNLPTextDecoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_languageResourceBundle, a3);

  return v7;
}

- (CVNLPLanguageResourceBundle)languageResourceBundle
{
  return self->_languageResourceBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageResourceBundle, 0);
}

@end
