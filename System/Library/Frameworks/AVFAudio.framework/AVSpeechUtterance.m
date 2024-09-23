@implementation AVSpeechUtterance

- (AVSpeechUtterance)initWithString:(NSString *)string
{

  return 0;
}

- (AVSpeechUtterance)initWithAttributedString:(NSAttributedString *)string
{

  return 0;
}

- (AVSpeechUtterance)initWithSSMLRepresentation:(NSString *)string
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[AVSpeechUtterance voice](self, "voice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("voice"));

  -[AVSpeechUtterance speechString](self, "speechString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("speechString"));

  -[AVSpeechUtterance attributedSpeechString](self, "attributedSpeechString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("speechString"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[AVSpeechUtterance rate](self, "rate");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("rate"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[AVSpeechUtterance pitchMultiplier](self, "pitchMultiplier");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("pitchMultiplier"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[AVSpeechUtterance volume](self, "volume");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("volume"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[AVSpeechUtterance preUtteranceDelay](self, "preUtteranceDelay");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("preUtteranceDelay"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[AVSpeechUtterance postUtteranceDelay](self, "postUtteranceDelay");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("postUtteranceDelay"));

}

- (AVSpeechUtterance)initWithCoder:(id)a3
{
  id v4;
  AVSpeechUtterance *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVSpeechUtterance *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVSpeechUtterance;
  v5 = -[AVSpeechUtterance init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechUtterance setVoice:](v5, "setVoice:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechUtterance setSpeechString:](v5, "setSpeechString:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedSpeechString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSpeechUtterance setAttributedSpeechString:](v5, "setAttributedSpeechString:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    -[AVSpeechUtterance setRate:](v5, "setRate:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pitchMultiplier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    -[AVSpeechUtterance setPitchMultiplier:](v5, "setPitchMultiplier:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volume"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    -[AVSpeechUtterance setVolume:](v5, "setVolume:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preUtteranceDelay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[AVSpeechUtterance setPreUtteranceDelay:](v5, "setPreUtteranceDelay:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postUtteranceDelay"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    -[AVSpeechUtterance setPostUtteranceDelay:](v5, "setPostUtteranceDelay:");

    v14 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AVSpeechUtterance voice](self, "voice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVoice:", v5);

  -[AVSpeechUtterance speechString](self, "speechString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpeechString:", v6);

  -[AVSpeechUtterance attributedSpeechString](self, "attributedSpeechString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedSpeechString:", v7);

  -[AVSpeechUtterance rate](self, "rate");
  objc_msgSend(v4, "setRate:");
  -[AVSpeechUtterance pitchMultiplier](self, "pitchMultiplier");
  objc_msgSend(v4, "setPitchMultiplier:");
  -[AVSpeechUtterance volume](self, "volume");
  objc_msgSend(v4, "setVolume:");
  -[AVSpeechUtterance preUtteranceDelay](self, "preUtteranceDelay");
  objc_msgSend(v4, "setPreUtteranceDelay:");
  -[AVSpeechUtterance postUtteranceDelay](self, "postUtteranceDelay");
  objc_msgSend(v4, "setPostUtteranceDelay:");
  return v4;
}

- (void)setVolume:(float)volume
{
  self->_volume = fmaxf(volume, 0.0);
}

- (void)setRate:(float)rate
{
  self->_rate = fmaxf(rate, 0.0);
}

- (void)setPitchMultiplier:(float)pitchMultiplier
{
  self->_pitchMultiplier = fmaxf(pitchMultiplier, 0.5);
}

- (AVSpeechSynthesisVoice)voice
{
  return self->_voice;
}

- (void)setVoice:(AVSpeechSynthesisVoice *)voice
{
  objc_storeStrong((id *)&self->_voice, voice);
}

- (NSString)speechString
{
  return self->_speechString;
}

- (void)setSpeechString:(id)a3
{
  objc_storeStrong((id *)&self->_speechString, a3);
}

- (NSAttributedString)attributedSpeechString
{
  return self->_attributedSpeechString;
}

- (void)setAttributedSpeechString:(id)a3
{
  objc_storeStrong((id *)&self->_attributedSpeechString, a3);
}

- (float)rate
{
  return self->_rate;
}

- (float)pitchMultiplier
{
  return self->_pitchMultiplier;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)prefersAssistiveTechnologySettings
{
  return self->_prefersAssistiveTechnologySettings;
}

- (void)setPrefersAssistiveTechnologySettings:(BOOL)prefersAssistiveTechnologySettings
{
  self->_prefersAssistiveTechnologySettings = prefersAssistiveTechnologySettings;
}

- (NSTimeInterval)preUtteranceDelay
{
  return self->_preUtteranceDelay;
}

- (void)setPreUtteranceDelay:(NSTimeInterval)preUtteranceDelay
{
  self->_preUtteranceDelay = preUtteranceDelay;
}

- (NSTimeInterval)postUtteranceDelay
{
  return self->_postUtteranceDelay;
}

- (void)setPostUtteranceDelay:(NSTimeInterval)postUtteranceDelay
{
  self->_postUtteranceDelay = postUtteranceDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedSpeechString, 0);
  objc_storeStrong((id *)&self->_speechString, 0);
  objc_storeStrong((id *)&self->_voice, 0);
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1)
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_4333);
}

+ (AVSpeechUtterance)speechUtteranceWithString:(NSString *)string
{
  return 0;
}

+ (AVSpeechUtterance)speechUtteranceWithAttributedString:(NSAttributedString *)string
{
  return 0;
}

+ (AVSpeechUtterance)speechUtteranceWithSSMLRepresentation:(NSString *)string
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
