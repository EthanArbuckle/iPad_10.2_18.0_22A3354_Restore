@implementation MLAppleAudioFeatureExtractorSoundPrintParameters

- (id)initSoundPrintParameters:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLAppleAudioFeatureExtractorSoundPrintParameters;
  result = -[MLAppleAudioFeatureExtractorSoundPrintParameters init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (int64_t)soundPrintVersion
{
  return self->_soundPrintVersion;
}

@end
