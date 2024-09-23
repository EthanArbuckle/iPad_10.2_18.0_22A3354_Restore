@implementation _SNAudioStreamAnalyzer

- (_SNAudioStreamAnalyzer)initWithFormat:(id)a3 error:(id *)a4
{
  _OWORD v5[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  return (_SNAudioStreamAnalyzer *)sub_1D42E4398((uint64_t)v5);
}

- (void)dealloc
{
  _SNAudioStreamAnalyzer *v2;

  v2 = self;
  sub_1D42E5440();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D42EA474();
  sub_1D42EA24C(OBJC_IVAR____SNAudioStreamAnalyzer_currentFormat);
  sub_1D42EA24C(OBJC_IVAR____SNAudioStreamAnalyzer_analyzerQueue);
  sub_1D42EA24C(OBJC_IVAR____SNAudioStreamAnalyzer_firstPassRecordingPredicate);
  swift_release();
  sub_1D42EA474();
  sub_1D42EA474();
  sub_1D42EA24C(OBJC_IVAR____SNAudioStreamAnalyzer_ringBuffer);
  sub_1D42EA24C(OBJC_IVAR____SNAudioStreamAnalyzer_ringBufferWriteBufferList);
  swift_release();
  swift_release();
}

- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5
{
  _SNAudioStreamAnalyzer *v7;
  _SNAudioStreamAnalyzer *v8;
  _OWORD v10[2];
  _OWORD v11[2];

  if (!a3)
  {
    memset(v11, 0, sizeof(v11));
    swift_unknownObjectRetain();
    v8 = self;
    if (a4)
      goto LABEL_3;
LABEL_5:
    memset(v10, 0, sizeof(v10));
    goto LABEL_6;
  }
  swift_unknownObjectRetain();
  v7 = self;
  swift_unknownObjectRetain();
  sub_1D451B208();
  swift_unknownObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  sub_1D451B208();
  swift_unknownObjectRelease();
LABEL_6:
  sub_1D42E5614((uint64_t)v11, (uint64_t)v10);

  sub_1D42D7018((uint64_t)v10, &qword_1EFE47160);
  sub_1D42D7018((uint64_t)v11, &qword_1EFE47160);
  return 1;
}

- (BOOL)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  _SNAudioStreamAnalyzer *v10;

  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  *(_QWORD *)(swift_allocObject() + 16) = v9;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1D42E5C64();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  return 1;
}

- (void)removeRequest:(id)a3
{
  _SNAudioStreamAnalyzer *v4;
  _SNAudioStreamAnalyzer *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1D42E67D8((uint64_t)v6);

  sub_1D42D7018((uint64_t)v6, &qword_1EFE47160);
}

- (void)removeAllRequests
{
  _SNAudioStreamAnalyzer *v2;

  v2 = self;
  sub_1D42E6D30();

}

- (void)analyzeAudioBuffer:(id)a3 atAudioFramePosition:(int64_t)a4
{
  id v6;
  _SNAudioStreamAnalyzer *v7;

  v6 = a3;
  v7 = self;
  sub_1D42E6FF0(a3);

}

- (void)completeAnalysis
{
  _SNAudioStreamAnalyzer *v2;

  v2 = self;
  sub_1D42E7564();

}

- (NSString)detailedDescription
{
  _SNAudioStreamAnalyzer *v2;
  void *v3;

  v2 = self;
  sub_1D42E773C();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_SNAudioStreamAnalyzer)init
{
  sub_1D42E7838();
}

@end
