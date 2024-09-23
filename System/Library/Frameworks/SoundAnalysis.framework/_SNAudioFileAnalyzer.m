@implementation _SNAudioFileAnalyzer

- (_SNAudioFileAnalyzer)initWithURL:(id)a3 error:(id *)a4
{
  _SNAudioFileAnalyzer *result;
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
  sub_1D4452524((uint64_t)v5);
  return result;
}

- (void)analyzeInRange:(id *)a3
{
  int64_t var3;
  _SNAudioFileAnalyzer *v4;
  CMTimeValue v5[2];
  __int128 v6;
  uint64_t v7;
  int64_t v8;

  var3 = a3->var1.var3;
  v5[0] = a3->var0.var0;
  v5[1] = *(_QWORD *)&a3->var0.var1;
  v6 = *(_OWORD *)&a3->var0.var3;
  v7 = *(_QWORD *)&a3->var1.var1;
  v8 = var3;
  v4 = self;
  sub_1D4453058(v5);

}

- (void)analyze
{
  _SNAudioFileAnalyzer *v2;

  v2 = self;
  sub_1D44532EC();

}

- (void)analyzeWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(char);
  _SNAudioFileAnalyzer *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1D4453D84;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1D4453348((uint64_t)v7, v6);
  sub_1D42B7F68((uint64_t)v7);

}

- (void)cancelAnalysis
{
  sub_1D44536C4();
}

- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5
{
  _SNAudioFileAnalyzer *v7;
  _SNAudioFileAnalyzer *v8;
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
  sub_1D44536F8((uint64_t)v11, (uint64_t)v10);

  sub_1D42D7018((uint64_t)v10, &qword_1EFE47160);
  sub_1D42D7018((uint64_t)v11, &qword_1EFE47160);
  return 1;
}

- (void)removeRequest:(id)a3
{
  _SNAudioFileAnalyzer *v4;
  _SNAudioFileAnalyzer *v5;
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
  sub_1D44539AC((uint64_t)v6);

  sub_1D42D7018((uint64_t)v6, &qword_1EFE47160);
}

- (void)removeAllRequests
{
  _SNAudioFileAnalyzer *v2;

  v2 = self;
  sub_1D4453AD8();

}

- (NSString)detailedDescription
{
  _SNAudioFileAnalyzer *v2;
  void *v3;

  v2 = self;
  sub_1D4453B78();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_SNAudioFileAnalyzer)init
{
  _SNAudioFileAnalyzer.init()();
}

- (void).cxx_destruct
{

}

@end
