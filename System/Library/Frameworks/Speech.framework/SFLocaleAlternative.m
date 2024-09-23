@implementation SFLocaleAlternative

- (SFLocaleAlternative)initWithLocale:(id)a3 confidence:(double)a4
{
  id v7;
  SFLocaleAlternative *v8;
  SFLocaleAlternative *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFLocaleAlternative;
  v8 = -[SFLocaleAlternative init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_confidence = a4;
  }

  return v9;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
