@implementation SpeechRecognizerResponseHandler

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6
{
  sub_235C988BC(0xD000000000000052, 0x8000000235CA6A40);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5
{
  sub_235C988BC(0xD00000000000004ELL, 0x8000000235CA69F0);
}

- (void)localSpeechRecognizerClient:(id)a3 didAcceptedEagerResultWithRequestId:(id)a4 rcId:(unint64_t)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7
{
  sub_235C988BC(0xD000000000000067, 0x8000000235CA6980);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceIdScoreCard:(id)a4
{
  sub_235C988BC(0xD000000000000038, 0x8000000235CA6940);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6 metadata:(id)a7
{
  sub_235C988BC(0xD00000000000005BLL, 0x8000000235CA68E0);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 speechPackage:(id)a6 metadata:(id)a7
{
  sub_235C988BC(0xD000000000000062, 0x8000000235CA6870);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
  sub_235C988BC(0xD000000000000057, 0x8000000235CA6810);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultCandidateWithRequestId:(id)a4 speechPackage:(id)a5
{
  sub_235C988BC(0xD000000000000057, 0x8000000235CA67B0);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceCommandCandidateWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
  sub_235C988BC(0xD000000000000061, 0x8000000235CA6740);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedContinuityEndDetected:(id)a4
{
  sub_235C988BC(0xD00000000000003DLL, 0x8000000235CA6700);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPDetected:(id)a4
{
  sub_235C988BC(0xD000000000000033, 0x8000000235CA66C0);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPCandidatePackage:(id)a4
{
  sub_235C988BC(0xD00000000000003BLL, 0x8000000235CA6680);
}

- (void)localSpeechRecognizerClient:(id)a3 requestAttentionAssetDownload:(BOOL)a4
{
  sub_235C988BC(0xD00000000000003DLL, 0x8000000235CA6640);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedMultiUserTRPCandidatePackage:(id)a4
{
  sub_235C988BC(0xD000000000000044, 0x8000000235CA65F0);
}

- (_TtC9ASRBridge31SpeechRecognizerResponseHandler)init
{
  _TtC9ASRBridge31SpeechRecognizerResponseHandler *result;

  result = (_TtC9ASRBridge31SpeechRecognizerResponseHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v4 = sub_235CA2790();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
