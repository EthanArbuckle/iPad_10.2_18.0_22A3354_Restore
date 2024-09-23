@implementation _LTSpeechTranscription

- (_LTSpeechTranscription)initWithFormattedString:(id)a3 locale:(id)a4 confidence:(double)a5 minConfidence:(double)a6 maxConfidence:(double)a7
{
  id v13;
  id v14;
  _LTSpeechTranscription *v15;
  _LTSpeechTranscription *v16;
  _LTSpeechTranscription *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_LTSpeechTranscription;
  v15 = -[_LTSpeechTranscription init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_locale, a4);
    objc_storeStrong((id *)&v16->_formattedString, a3);
    v16->_maxConfidence = a7;
    v16->_confidence = a5;
    v16->_minConfidence = a6;
    v16->_lowConfidence = 0;
    v17 = v16;
  }

  return v16;
}

- (_LTSpeechTranscription)initWithCoder:(id)a3
{
  id v4;
  _LTSpeechTranscription *v5;
  uint64_t v6;
  NSLocale *locale;
  uint64_t v8;
  NSString *formattedString;
  uint64_t v10;
  NSString *sanitizedFormattedString;
  double v12;
  double v13;
  double v14;
  _LTSpeechTranscription *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSpeechTranscription;
  v5 = -[_LTSpeechTranscription init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formattedString"));
    v8 = objc_claimAutoreleasedReturnValue();
    formattedString = v5->_formattedString;
    v5->_formattedString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedFormattedString"));
    v10 = objc_claimAutoreleasedReturnValue();
    sanitizedFormattedString = v5->_sanitizedFormattedString;
    v5->_sanitizedFormattedString = (NSString *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minConfidence"));
    v5->_minConfidence = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxConfidence"));
    v5->_maxConfidence = v14;
    v5->_lowConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowConfidence"));
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *locale;
  id v5;

  locale = self->_locale;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedString, CFSTR("formattedString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sanitizedFormattedString, CFSTR("sanitizedFormattedString"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minConfidence"), self->_minConfidence);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maxConfidence"), self->_maxConfidence);
  objc_msgSend(v5, "encodeBool:forKey:", self->_lowConfidence, CFSTR("lowConfidence"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (void)setFormattedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sanitizedFormattedString
{
  return self->_sanitizedFormattedString;
}

- (void)setSanitizedFormattedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)minConfidence
{
  return self->_minConfidence;
}

- (void)setMinConfidence:(double)a3
{
  self->_minConfidence = a3;
}

- (double)maxConfidence
{
  return self->_maxConfidence;
}

- (void)setMaxConfidence:(double)a3
{
  self->_maxConfidence = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sanitizedFormattedString, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
