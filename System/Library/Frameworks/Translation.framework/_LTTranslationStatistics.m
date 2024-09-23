@implementation _LTTranslationStatistics

- (_LTTranslationStatistics)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationStatistics *v5;
  _LTTranslationStatistics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LTTranslationStatistics;
  v5 = -[_LTTranslationStatistics init](&v8, sel_init);
  if (v5)
  {
    v5->_inputTokenCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputTokenCount"));
    v5->_inputSubtokenCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputSubtokenCount"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t inputTokenCount;
  id v5;

  inputTokenCount = self->_inputTokenCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", inputTokenCount, CFSTR("inputTokenCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_inputSubtokenCount, CFSTR("inputSubtokenCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)inputTokenCount
{
  return self->_inputTokenCount;
}

- (void)setInputTokenCount:(int64_t)a3
{
  self->_inputTokenCount = a3;
}

- (int64_t)inputSubtokenCount
{
  return self->_inputSubtokenCount;
}

- (void)setInputSubtokenCount:(int64_t)a3
{
  self->_inputSubtokenCount = a3;
}

@end
