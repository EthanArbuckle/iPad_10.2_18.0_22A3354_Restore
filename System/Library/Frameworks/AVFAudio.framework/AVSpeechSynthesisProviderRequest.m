@implementation AVSpeechSynthesisProviderRequest

- (AVSpeechSynthesisProviderRequest)initWithSSMLRepresentation:(NSString *)text voice:(AVSpeechSynthesisProviderVoice *)voice
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVSpeechSynthesisProviderRequest voice](self, "voice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("voice"));

  -[AVSpeechSynthesisProviderRequest ssmlRepresentation](self, "ssmlRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("ssmlRepresentation"));

}

- (AVSpeechSynthesisProviderRequest)initWithCoder:(id)a3
{
  id v4;
  AVSpeechSynthesisProviderRequest *v5;
  void *v6;
  void *v7;
  AVSpeechSynthesisProviderRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVSpeechSynthesisProviderRequest;
  v5 = -[AVSpeechSynthesisProviderRequest init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderRequest setVoice:](v5, "setVoice:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ssmlRepresentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechSynthesisProviderRequest setSsmlRepresentation:](v5, "setSsmlRepresentation:", v7);

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AVSpeechSynthesisProviderRequest voice](self, "voice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoice:", v5);

  -[AVSpeechSynthesisProviderRequest ssmlRepresentation](self, "ssmlRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSsmlRepresentation:", v6);

  return v4;
}

- (NSString)ssmlRepresentation
{
  return self->_ssmlRepresentation;
}

- (void)setSsmlRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_ssmlRepresentation, a3);
}

- (AVSpeechSynthesisProviderVoice)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
  objc_storeStrong((id *)&self->_voice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_ssmlRepresentation, 0);
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1)
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_4333);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
