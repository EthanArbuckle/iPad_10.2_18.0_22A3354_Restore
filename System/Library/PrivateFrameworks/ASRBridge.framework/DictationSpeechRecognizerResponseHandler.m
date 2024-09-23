@implementation DictationSpeechRecognizerResponseHandler

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6
{
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  id v12;
  _TtC9ASRBridge40DictationSpeechRecognizerResponseHandler *v13;

  v8 = sub_235CA37EC();
  v10 = v9;
  sub_235C8DAA4();
  v11 = (char *)sub_235CA38B8();
  v12 = a3;
  v13 = self;
  sub_235C8DCFC(v8, v10, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 speechPackage:(id)a6 metadata:(id)a7
{
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _TtC9ASRBridge40DictationSpeechRecognizerResponseHandler *v17;

  v11 = sub_235CA37EC();
  v13 = v12;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = self;
  sub_235C8DF78(v11, v13, v15, v16);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6 metadata:(id)a7
{
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  id v14;
  id v15;
  _TtC9ASRBridge40DictationSpeechRecognizerResponseHandler *v16;

  v10 = sub_235CA37EC();
  v12 = v11;
  sub_235C8DAA4();
  v13 = (char *)sub_235CA38B8();
  v14 = a3;
  v15 = a7;
  v16 = self;
  sub_235C8E278(v10, v12, v13, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultCandidateWithRequestId:(id)a4 speechPackage:(id)a5
{
  sub_235C8BF00(self, (uint64_t)a2, a3, (uint64_t)a4, a5, MEMORY[0x24BE9B388]);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5
{
  sub_235C8BF00(self, (uint64_t)a2, a3, (uint64_t)a4, a5, MEMORY[0x24BE9B380]);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
  sub_235C8C0D4(self, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, MEMORY[0x24BE9B380], 0);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7
{
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  char *v14;
  _TtC9ASRBridge40DictationSpeechRecognizerResponseHandler *v15;

  v10 = sub_235CA37EC();
  v12 = v11;
  v13 = a3;
  v14 = (char *)a6;
  v15 = self;
  sub_235C8E4FC(v10, v12, v14, MEMORY[0x24BE9B380]);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7 metadata:(id)a8
{
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  char *v16;
  id v17;
  _TtC9ASRBridge40DictationSpeechRecognizerResponseHandler *v18;

  v12 = sub_235CA37EC();
  v14 = v13;
  v15 = a3;
  v16 = (char *)a6;
  v17 = a8;
  v18 = self;
  sub_235C8E6BC(v12, v14, v16, v17, MEMORY[0x24BE9B380], 0);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceCommandCandidateWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
  sub_235C8C0D4(self, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, MEMORY[0x24BE9B388], 1);
}

- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 endpointMode:(int64_t)a6 error:(id)a7
{
  id v8;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _TtC9ASRBridge40DictationSpeechRecognizerResponseHandler *v15;
  id v16;

  v8 = a5;
  if (!a4)
  {
    v11 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = (void *)sub_235CA3798();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v12 = sub_235CA37EC();
  v8 = v13;
LABEL_6:
  v14 = a3;
  v15 = self;
  v16 = a7;
  sub_235C8E890(v11, v12, (uint64_t)v8, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions));
}

@end
