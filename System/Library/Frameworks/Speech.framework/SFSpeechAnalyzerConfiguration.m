@implementation SFSpeechAnalyzerConfiguration

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_41_2((uint64_t)self, OBJC_IVAR___SFSpeechAnalyzerConfiguration__config);
}

- (AVAudioFormat)audioFormat
{
  return (AVAudioFormat *)sub_1B24C0590();
}

- (void)setAudioFormat:(id)a3
{
  id v5;
  SFSpeechAnalyzerConfiguration *v6;

  v5 = a3;
  v6 = self;
  sub_1B24C2E90((uint64_t)a3, &OBJC_IVAR___SFSpeechAnalyzerConfiguration__config, sub_1B258CD3C);

}

- (SFSpeechAnalyzerConfiguration)init
{
  return (SFSpeechAnalyzerConfiguration *)SFSpeechAnalyzerConfiguration.init()();
}

@end
