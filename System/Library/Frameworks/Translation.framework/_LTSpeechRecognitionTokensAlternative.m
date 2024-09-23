@implementation _LTSpeechRecognitionTokensAlternative

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_confidence, CFSTR("confidence"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lowConfidence, CFSTR("lowConfidence"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSpaceAfter, CFSTR("spaceAfter"));

}

- (_LTSpeechRecognitionTokensAlternative)initWithCoder:(id)a3
{
  id v4;
  _LTSpeechRecognitionTokensAlternative *v5;
  uint64_t v6;
  NSString *text;
  _LTSpeechRecognitionTokensAlternative *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTSpeechRecognitionTokensAlternative;
  v5 = -[_LTSpeechRecognitionTokensAlternative init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_confidence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("confidence"));
    v5->_lowConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowConfidence"));
    v5->_hasSpaceAfter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("spaceAfter"));
    v8 = v5;
  }

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
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

- (BOOL)hasSpaceAfter
{
  return self->_hasSpaceAfter;
}

- (void)setHasSpaceAfter:(BOOL)a3
{
  self->_hasSpaceAfter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
