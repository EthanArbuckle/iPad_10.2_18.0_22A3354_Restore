@implementation AVSpeechSynthesisProviderVoice

- (void)setVoiceSize:(int64_t)voiceSize
{
  self->_voiceSize = voiceSize;
}

- (void)setGender:(AVSpeechSynthesisVoiceGender)gender
{
  self->_gender = gender;
}

- (void)setAge:(NSInteger)age
{
  self->_age = age;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (AVSpeechSynthesisVoiceGender)gender
{
  return self->_gender;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)voiceSize
{
  return self->_voiceSize;
}

- (NSString)version
{
  return self->_version;
}

- (NSInteger)age
{
  return self->_age;
}

- (void)setVersion:(NSString *)version
{
  objc_storeStrong((id *)&self->_version, version);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_primaryLanguages, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1)
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_4333);
}

- (AVSpeechSynthesisProviderVoice)initWithName:(NSString *)name identifier:(NSString *)identifier primaryLanguages:(NSArray *)primaryLanguages supportedLanguages:(NSArray *)supportedLanguages
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AVSpeechSynthesisProviderVoice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("name"));

  -[AVSpeechSynthesisProviderVoice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[AVSpeechSynthesisProviderVoice primaryLanguages](self, "primaryLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("primaryLanguages"));

  -[AVSpeechSynthesisProviderVoice supportedLanguages](self, "supportedLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("supportedLanguages"));

  -[AVSpeechSynthesisProviderVoice version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("version"));

  objc_msgSend(v9, "encodeInt64:forKey:", -[AVSpeechSynthesisProviderVoice voiceSize](self, "voiceSize"), CFSTR("voiceSize"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[AVSpeechSynthesisProviderVoice gender](self, "gender"), CFSTR("gender"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[AVSpeechSynthesisProviderVoice age](self, "age"), CFSTR("age"));

}

- (AVSpeechSynthesisProviderVoice)initWithCoder:(id)a3
{
  id v4;
  AVSpeechSynthesisProviderVoice *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AVSpeechSynthesisProviderVoice *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AVSpeechSynthesisProviderVoice;
  v5 = -[AVSpeechSynthesisProviderVoice init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setIdentifier:](v5, "setIdentifier:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("primaryLanguages"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setSupportedLanguages:](v5, "setSupportedLanguages:", v11);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedLanguages"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setSupportedLanguages:](v5, "setSupportedLanguages:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voiceSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setVoiceSize:](v5, "setVoiceSize:", objc_msgSend(v13, "longLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setVersion:](v5, "setVersion:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gender"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setGender:](v5, "setGender:", objc_msgSend(v15, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("age"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderVoice setAge:](v5, "setAge:", objc_msgSend(v16, "integerValue"));

    v17 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AVSpeechSynthesisProviderVoice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[AVSpeechSynthesisProviderVoice identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  -[AVSpeechSynthesisProviderVoice supportedLanguages](self, "supportedLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportedLanguages:", v7);

  objc_msgSend(v4, "setVoiceSize:", -[AVSpeechSynthesisProviderVoice voiceSize](self, "voiceSize"));
  -[AVSpeechSynthesisProviderVoice version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVersion:", v8);

  objc_msgSend(v4, "setGender:", -[AVSpeechSynthesisProviderVoice gender](self, "gender"));
  objc_msgSend(v4, "setAge:", -[AVSpeechSynthesisProviderVoice age](self, "age"));
  return v4;
}

- (NSArray)primaryLanguages
{
  return self->_primaryLanguages;
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_supportedLanguages, a3);
}

@end
