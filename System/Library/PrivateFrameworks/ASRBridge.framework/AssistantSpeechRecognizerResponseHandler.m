@implementation AssistantSpeechRecognizerResponseHandler

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v16;

  v8 = sub_235CA37EC();
  v10 = v9;
  v11 = sub_235CA37EC();
  v13 = v12;
  sub_235C71624(0, (unint64_t *)&qword_2542993A8);
  v14 = sub_235CA38B8();
  v15 = a3;
  v16 = self;
  sub_235C6A0E4(v8, v10, v11, v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v13;

  v8 = sub_235CA37EC();
  v10 = v9;
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_235C6A2F0(v8, v10);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPDetected:(id)a4
{
  id v6;
  id v7;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_235C6A59C(v7);

}

- (void)localSpeechRecognizerClient:(id)a3 receivedMultiUserTRPCandidatePackage:(id)a4
{
  id v6;
  id v7;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_235C6AB80(v7);

}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPCandidatePackage:(id)a4
{
  id v6;
  id v7;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_235C6C120(v7);

}

- (void)localSpeechRecognizerClient:(id)a3 receivedContinuityEndDetected:(id)a4
{
  id v6;
  id v7;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_235C6D154(v7);

}

- (void)localSpeechRecognizerClient:(id)a3 requestAttentionAssetDownload:(BOOL)a4
{
  id v6;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v7;

  v6 = a3;
  v7 = self;
  sub_235C6D814(a4);

}

- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7
{
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v17;

  v12 = sub_235CA37EC();
  v14 = v13;
  v15 = a3;
  v16 = a6;
  v17 = self;
  sub_235C6DC88(v12, v14, a5, (uint64_t)v16, a7);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 didAcceptedEagerResultWithRequestId:(id)a4 rcId:(unint64_t)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7
{
  _BOOL4 v7;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v15;

  v7 = a6;
  v11 = sub_235CA37EC();
  v13 = v12;
  v14 = a3;
  v15 = self;
  sub_235C6E2FC(v11, v13, a5, v7);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceIdScoreCard:(id)a4
{
  id v6;
  id v7;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_235C6ECD0(v7);

}

- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 error:(id)a6
{
  id v7;
  uint64_t v10;
  void *v11;
  id v12;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v13;
  id v14;

  v7 = a5;
  if (!a4)
  {
    if (a5)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  sub_235CA3798();
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v10 = sub_235CA37EC();
  v7 = v11;
LABEL_6:
  v12 = a3;
  v13 = self;
  v14 = a6;
  sub_235C70570(v12, v10, (uint64_t)v7, 0, 1, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 endpointMode:(int64_t)a6 error:(id)a7
{
  id v9;
  uint64_t v12;
  void *v13;
  id v14;
  _TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler *v15;
  id v16;

  v9 = a5;
  if (!a4)
  {
    if (a5)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  sub_235CA3798();
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v12 = sub_235CA37EC();
  v9 = v13;
LABEL_6:
  v14 = a3;
  v15 = self;
  v16 = a7;
  sub_235C70570(v14, v12, (uint64_t)v9, (void *)a6, 0, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_myriadMonitor);
  v3 = (char *)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  v4 = sub_235CA3498();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_requestQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
