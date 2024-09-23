@implementation MTVoiceUtils

+ (id)loadVoiceBundle:(__CFBundle *)a3
{
  MTFVoice *v4;
  __CFBundle *v5;
  void **v6;
  unint64_t v7;
  void **v8;
  WrappedMTVoice *v9;
  void *v11;
  MTBEVoiceContents v12;
  PROWReader *v13;
  uint64_t v14;

  v4 = objc_alloc_init(MTFVoice);
  -[MTFVoice setPitchCoeff:](v4, "setPitchCoeff:", SpeechChannelManager::ReadVoicePitchCoefficients(a3, v5));
  v14 = 0;
  SpeechChannelManager::ReadVoiceDescription(a3, (__CFBundle *)&v14, v6);
  -[MTFVoice setVoiceData:](v4, "setVoiceData:", v14);
  v7 = (unint64_t)-[MTFVoice description](v4, "description")[4];
  v11 = 0;
  v12.var0 = 0;
  SpeechChannelManager::ReadPCMVoiceData(a3, v7, &v13, &v12, &v11, v8);
  -[MTFVoice set_pcmData:](v4, "set_pcmData:", v11);
  -[MTFVoice setWrapped:](v4, "setWrapped:", operator new());
  v9 = -[MTFVoice wrapped](v4, "wrapped");
  v9->var0.var0 = v13;
  return v4;
}

@end
