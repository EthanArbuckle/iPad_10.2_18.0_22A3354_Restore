@implementation PlaybackEngineSessionManager.OPACKDecoderDelegate

- (Class)decoder:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  uint64_t v5;

  sub_210E92BA8();
  sub_210E92CC8();
  v5 = OUTLINED_FUNCTION_57_0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
    return (Class)swift_getObjCClassFromMetadata();
  else
    return 0;
}

- (_TtCC17MediaPlaybackCore28PlaybackEngineSessionManagerP33_1E9E2D41781E1C170C90974595EBBAFA20OPACKDecoderDelegate)init
{
  return (_TtCC17MediaPlaybackCore28PlaybackEngineSessionManagerP33_1E9E2D41781E1C170C90974595EBBAFA20OPACKDecoderDelegate *)sub_210CDC654();
}

@end
