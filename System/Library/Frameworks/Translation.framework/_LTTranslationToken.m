@implementation _LTTranslationToken

- (_LTTranslationToken)initWithText:(id)a3 confidence:(double)a4
{
  id v6;
  _LTTranslationToken *v7;
  uint64_t v8;
  NSString *text;
  _LTTranslationToken *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTTranslationToken;
  v7 = -[_LTTranslationToken init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_confidence = a4;
    v10 = v7;
  }

  return v7;
}

- (_LTTranslationToken)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationToken *v5;
  uint64_t v6;
  NSString *text;
  double v8;
  _LTTranslationToken *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LTTranslationToken;
  v5 = -[_LTTranslationToken init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v8;
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
