@implementation _LTTextStreamingConfiguration

- (_LTTextStreamingConfiguration)init
{
  char *v2;
  _LTTextStreamingConfiguration *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LTTextStreamingConfiguration;
  v2 = -[_LTTextStreamingConfiguration init](&v6, sel_init);
  v3 = (_LTTextStreamingConfiguration *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_23547B9A0;
    *((_QWORD *)v2 + 3) = 0x3FE0000000000000;
    *((_OWORD *)v2 + 2) = xmmword_23547B9B0;
    v4 = v2;
  }

  return v3;
}

- (_LTTextStreamingConfiguration)initWithMinTimeBetweenTranslations:(double)a3 maxTimeBetweenTranslations:(double)a4 userIdleTime:(double)a5 maxPartialTranslationAttempts:(int64_t)a6 minNumberOfCharactersForTranslation:(int64_t)a7
{
  _LTTextStreamingConfiguration *v12;
  _LTTextStreamingConfiguration *v13;
  _LTTextStreamingConfiguration *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_LTTextStreamingConfiguration;
  v12 = -[_LTTextStreamingConfiguration init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_minTimeBetweenTranslations = a3;
    v12->_maxTimeBetweenTranslations = a4;
    v12->_userIdleTime = a5;
    v12->_maxPartialTranslationAttempts = a6;
    v12->_minNumberOfCharactersForTranslation = a7;
    v14 = v12;
  }

  return v13;
}

- (void)updateMinTimeBetweenTranslations:(double)a3 maxTimeBetweenTranslations:(double)a4 userIdleTime:(double)a5
{
  self->_minTimeBetweenTranslations = a3;
  self->_maxTimeBetweenTranslations = a4;
  self->_userIdleTime = a5;
}

- (_LTTextStreamingConfiguration)initWithCoder:(id)a3
{
  id v4;
  _LTTextStreamingConfiguration *v5;
  double v6;
  double v7;
  double v8;
  _LTTextStreamingConfiguration *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LTTextStreamingConfiguration;
  v5 = -[_LTTextStreamingConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minTimeBetweenTranslations"));
    v5->_minTimeBetweenTranslations = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxTimeBetweenTranslations"));
    v5->_maxTimeBetweenTranslations = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("userIdleTime"));
    v5->_userIdleTime = v8;
    v5->_maxPartialTranslationAttempts = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxPartialTranslationAttempts"));
    v5->_minNumberOfCharactersForTranslation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minNumberOfCharactersForTranslation"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double minTimeBetweenTranslations;
  id v5;

  minTimeBetweenTranslations = self->_minTimeBetweenTranslations;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minTimeBetweenTranslations"), minTimeBetweenTranslations);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maxTimeBetweenTranslations"), self->_maxTimeBetweenTranslations);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("userIdleTime"), self->_userIdleTime);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxPartialTranslationAttempts, CFSTR("maxPartialTranslationAttempts"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minNumberOfCharactersForTranslation, CFSTR("minNumberOfCharactersForTranslation"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_LTTextStreamingConfiguration initWithMinTimeBetweenTranslations:maxTimeBetweenTranslations:userIdleTime:maxPartialTranslationAttempts:minNumberOfCharactersForTranslation:]([_LTTextStreamingConfiguration alloc], "initWithMinTimeBetweenTranslations:maxTimeBetweenTranslations:userIdleTime:maxPartialTranslationAttempts:minNumberOfCharactersForTranslation:", self->_maxPartialTranslationAttempts, self->_minNumberOfCharactersForTranslation, self->_minTimeBetweenTranslations, self->_maxTimeBetweenTranslations, self->_userIdleTime);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<TextStreamingConfiguration %f, %f, %f, %ld, %ld>"), *(_QWORD *)&self->_minTimeBetweenTranslations, *(_QWORD *)&self->_maxTimeBetweenTranslations, *(_QWORD *)&self->_userIdleTime, self->_maxPartialTranslationAttempts, self->_minNumberOfCharactersForTranslation);
}

- (double)minTimeBetweenTranslations
{
  return self->_minTimeBetweenTranslations;
}

- (double)maxTimeBetweenTranslations
{
  return self->_maxTimeBetweenTranslations;
}

- (double)userIdleTime
{
  return self->_userIdleTime;
}

- (int64_t)maxPartialTranslationAttempts
{
  return self->_maxPartialTranslationAttempts;
}

- (int64_t)minNumberOfCharactersForTranslation
{
  return self->_minNumberOfCharactersForTranslation;
}

@end
