@implementation ObjCSpeechAnalyzerConfiguration

- (AVAudioFormat)audioFormat
{
  id v2;

  sub_1B258CCCC();
  return (AVAudioFormat *)v2;
}

- (void)setAudioFormat:(id)a3
{
  id v5;
  _TtC6Speech31ObjCSpeechAnalyzerConfiguration *v6;

  v5 = a3;
  v6 = self;
  sub_1B258CD3C((uint64_t)a3);

}

- (_TtC6Speech31ObjCSpeechAnalyzerConfiguration)init
{
  sub_1B258CE48();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_123_2();
  v3 = v2;
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_75_3();
  OUTLINED_FUNCTION_144();
  OUTLINED_FUNCTION_619();
  OUTLINED_FUNCTION_189();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
