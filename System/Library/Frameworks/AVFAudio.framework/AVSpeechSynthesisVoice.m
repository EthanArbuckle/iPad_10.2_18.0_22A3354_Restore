@implementation AVSpeechSynthesisVoice

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVSpeechSynthesisVoice language](self, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("language"));

  -[AVSpeechSynthesisVoice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[AVSpeechSynthesisVoice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("name"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[AVSpeechSynthesisVoice quality](self, "quality"), CFSTR("quality"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[AVSpeechSynthesisVoice gender](self, "gender"), CFSTR("gender"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[AVSpeechSynthesisVoice voiceTraits](self, "voiceTraits"), CFSTR("voiceTraits"));

}

- (AVSpeechSynthesisVoice)initWithCoder:(id)a3
{
  id v4;
  AVSpeechSynthesisVoice *v5;
  void *v6;
  void *v7;
  void *v8;
  AVSpeechSynthesisVoice *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVSpeechSynthesisVoice;
  v5 = -[AVSpeechSynthesisVoice init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisVoice setLanguage:](v5, "setLanguage:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisVoice setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisVoice setName:](v5, "setName:", v8);

    -[AVSpeechSynthesisVoice setQuality:](v5, "setQuality:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("quality")));
    -[AVSpeechSynthesisVoice setGender:](v5, "setGender:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gender")));
    -[AVSpeechSynthesisVoice setVoiceTraits:](v5, "setVoiceTraits:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("voiceTraits")));
    v9 = v5;
  }

  return v5;
}

- (NSDictionary)audioFileSettings
{
  return self->_audioFileSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileSettings, 0);
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1)
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_4333);
}

+ (NSArray)speechVoices
{
  return 0;
}

+ (NSString)currentLanguageCode
{
  return 0;
}

+ (AVSpeechSynthesisVoice)voiceWithLanguage:(NSString *)languageCode
{
  return 0;
}

+ (AVSpeechSynthesisVoice)voiceWithIdentifier:(NSString *)identifier
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
