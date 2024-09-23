@implementation AXMTranslatedText

+ (id)text:(id)a3 confidence:(double)a4 isLowConfidence:(BOOL)a5 targetLocale:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  AXMTranslatedText *v11;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = objc_alloc_init(AXMTranslatedText);
  -[AXMTranslatedText setText:](v11, "setText:", v10);

  -[AXMTranslatedText setConfidence:](v11, "setConfidence:", a4);
  -[AXMTranslatedText setTargetLocale:](v11, "setTargetLocale:", v9);

  -[AXMTranslatedText setLowConfidence:](v11, "setLowConfidence:", v6);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMTranslatedText)initWithCoder:(id)a3
{
  id v4;
  AXMTranslatedText *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMTranslatedText;
  v5 = -[AXMTranslatedText init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTranslatedText setText:](v5, "setText:", v6);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    -[AXMTranslatedText setConfidence:](v5, "setConfidence:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTranslatedText setTargetLocale:](v5, "setTargetLocale:", v7);

    -[AXMTranslatedText setLowConfidence:](v5, "setLowConfidence:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowConfidence")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AXMTranslatedText text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("text"));

  -[AXMTranslatedText confidence](self, "confidence");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("confidence"));
  -[AXMTranslatedText targetLocale](self, "targetLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("targetLocale"));

  objc_msgSend(v6, "encodeBool:forKey:", -[AXMTranslatedText isLowConfidence](self, "isLowConfidence"), CFSTR("lowConfidence"));
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (BOOL)isLowConfidence
{
  return self->_lowConfidence;
}

- (void)setLowConfidence:(BOOL)a3
{
  self->_lowConfidence = a3;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
  objc_storeStrong((id *)&self->_targetLocale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
