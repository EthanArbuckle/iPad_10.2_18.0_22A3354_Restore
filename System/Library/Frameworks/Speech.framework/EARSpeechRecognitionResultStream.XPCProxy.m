@implementation EARSpeechRecognitionResultStream.XPCProxy

- (void)speechRecognizerDidFinishRecognitionWithError:(id)a3
{
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_1B254F958(a3);

}

- (void)speechRecognizerDidRecognizeFinalResultPackage:(id)a3
{
  id v4;
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v5;

  v4 = a3;
  v5 = self;
  sub_1B254FA18(v4);

}

- (void)speechRecognizerDidRecognizeFinalResultMultiUserPackages:(id)a3
{
  uint64_t v4;
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v5;

  sub_1B24ADA58(0, &qword_1EEFDA220);
  v4 = sub_1B25CC8F8();
  v5 = self;
  sub_1B254FA80(v4);

  swift_bridgeObjectRelease();
}

- (void)speechRecognizerDidRecognizePartialResult:(id)a3
{
  id v4;
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v5;

  v4 = a3;
  v5 = self;
  sub_1B254FB6C(v4);

}

- (void)speechRecognizerDidRecognizeFinalResultCandidatePackage:(id)a3
{
  id v4;
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v5;

  v4 = a3;
  v5 = self;
  sub_1B254FBD4(v4);

}

- (void)speechRecognizerDidRecognizeVoiceCommandCandidatePackage:(id)a3
{
  id v4;
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v5;

  v4 = a3;
  v5 = self;
  sub_1B254FC3C(v4);

}

- (void)speechRecognizerDidProduceLoggablePackage:(id)a3
{
  id v4;
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v5;

  v4 = a3;
  v5 = self;
  sub_1B254FCA4(v4);

}

- (void)speechRecognizerDidProduceEndpointFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 processedAudioDurationInMilliseconds:(int64_t)a8 acousticEndpointerScore:(double)a9
{
  uint64_t v16;
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v17;

  sub_1B24ADA58(0, (unint64_t *)&qword_1EEFD7478);
  v16 = sub_1B25CCBA4();
  v17 = self;
  sub_1B254FDA0(a3, a4, v16, a8, a5, a7, a9);

  swift_bridgeObjectRelease();
}

- (void)speechRecognizerDidProcessAudioDuration:(double)a3
{
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v4;

  v4 = self;
  sub_1B25500D4(a3);

}

- (void)speechRecognizerDidReportStatus:(unint64_t)a3
{
  _TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy *v4;

  v4 = self;
  sub_1B25501A4(a3);

}

- (_TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy)init
{
  sub_1B2550258();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
