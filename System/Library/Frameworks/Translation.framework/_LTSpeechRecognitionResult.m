@implementation _LTSpeechRecognitionResult

- (_LTSpeechRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  _LTSpeechRecognitionResult *v5;
  uint64_t v6;
  NSLocale *locale;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *transcriptions;
  uint64_t v13;
  _LTSpeechRecognitionSausage *bestRecognitionAlternatives;
  _LTSpeechRecognitionResult *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSpeechRecognitionResult;
  v5 = -[_LTSpeechRecognitionResult init](&v17, sel_init);
  if (v5)
  {
    v5->_final = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("final"));
    v5->_stable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("transcriptions"));
    v11 = objc_claimAutoreleasedReturnValue();
    transcriptions = v5->_transcriptions;
    v5->_transcriptions = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sausage"));
    v13 = objc_claimAutoreleasedReturnValue();
    bestRecognitionAlternatives = v5->_bestRecognitionAlternatives;
    v5->_bestRecognitionAlternatives = (_LTSpeechRecognitionSausage *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 final;
  id v5;

  final = self->_final;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", final, CFSTR("final"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_stable, CFSTR("stable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transcriptions, CFSTR("transcriptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bestRecognitionAlternatives, CFSTR("sausage"));

}

- (id)bestTranscription
{
  return -[NSArray firstObject](self->_transcriptions, "firstObject");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (void)setFinal:(BOOL)a3
{
  self->_final = a3;
}

- (BOOL)isStable
{
  return self->_stable;
}

- (void)setStable:(BOOL)a3
{
  self->_stable = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)transcriptions
{
  return self->_transcriptions;
}

- (void)setTranscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptions, a3);
}

- (_LTSpeechRecognitionSausage)bestRecognitionAlternatives
{
  return self->_bestRecognitionAlternatives;
}

- (void)setBestRecognitionAlternatives:(id)a3
{
  objc_storeStrong((id *)&self->_bestRecognitionAlternatives, a3);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_bestRecognitionAlternatives, 0);
  objc_storeStrong((id *)&self->_transcriptions, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
