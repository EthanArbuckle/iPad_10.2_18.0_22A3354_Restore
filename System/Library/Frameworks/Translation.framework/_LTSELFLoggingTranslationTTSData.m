@implementation _LTSELFLoggingTranslationTTSData

- (_LTSELFLoggingTranslationTTSData)initWithSourceOrTargetLanguage:(int64_t)a3 isAutoplayTranslation:(BOOL)a4 ttsPlaybackSpeed:(int64_t)a5 audioChannel:(int64_t)a6
{
  _LTSELFLoggingTranslationTTSData *v10;
  _LTSELFLoggingTranslationTTSData *v11;
  _LTSELFLoggingTranslationTTSData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_LTSELFLoggingTranslationTTSData;
  v10 = -[_LTSELFLoggingTranslationTTSData init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isAutoplayTranslation = a4;
    v10->_audioChannel = a6;
    v10->_playbackSpeed = a5;
    v10->_sourceOrTargetLanguage = a3;
    v12 = v10;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sourceOrTargetLanguage;
  id v5;

  sourceOrTargetLanguage = self->_sourceOrTargetLanguage;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sourceOrTargetLanguage, CFSTR("sourceOrTargetLanguage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAutoplayTranslation, CFSTR("isAutoplayTranslation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_audioChannel, CFSTR("audioChannel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_playbackSpeed, CFSTR("playbackSpeed"));

}

- (_LTSELFLoggingTranslationTTSData)initWithCoder:(id)a3
{
  id v4;
  _LTSELFLoggingTranslationTTSData *v5;
  _LTSELFLoggingTranslationTTSData *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LTSELFLoggingTranslationTTSData;
  v5 = -[_LTSELFLoggingTranslationTTSData init](&v8, sel_init);
  if (v5)
  {
    v5->_sourceOrTargetLanguage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceOrTargetLanguage"));
    v5->_isAutoplayTranslation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoplayTranslation"));
    v5->_audioChannel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("audioChannel"));
    v5->_playbackSpeed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("playbackSpeed"));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_LTSELFLoggingTranslationTTSData initWithSourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:]([_LTSELFLoggingTranslationTTSData alloc], "initWithSourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:", -[_LTSELFLoggingTranslationTTSData sourceOrTargetLanguage](self, "sourceOrTargetLanguage"), -[_LTSELFLoggingTranslationTTSData isAutoplayTranslation](self, "isAutoplayTranslation"), -[_LTSELFLoggingTranslationTTSData playbackSpeed](self, "playbackSpeed"), -[_LTSELFLoggingTranslationTTSData audioChannel](self, "audioChannel"));
}

- (int64_t)sourceOrTargetLanguage
{
  return self->_sourceOrTargetLanguage;
}

- (void)setSourceOrTargetLanguage:(int64_t)a3
{
  self->_sourceOrTargetLanguage = a3;
}

- (BOOL)isAutoplayTranslation
{
  return self->_isAutoplayTranslation;
}

- (void)setIsAutoplayTranslation:(BOOL)a3
{
  self->_isAutoplayTranslation = a3;
}

- (int64_t)audioChannel
{
  return self->_audioChannel;
}

- (void)setAudioChannel:(int64_t)a3
{
  self->_audioChannel = a3;
}

- (int64_t)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(int64_t)a3
{
  self->_playbackSpeed = a3;
}

@end
