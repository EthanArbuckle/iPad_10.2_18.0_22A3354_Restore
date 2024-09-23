@implementation GDKnosisResultContext

- (_TtC20IntelligencePlatform26_GDSwiftGraphObjectContext)context
{
  return (_TtC20IntelligencePlatform26_GDSwiftGraphObjectContext *)GDKnosisResultContext.context.getter();
}

- (id)answers
{
  GDKnosisResultContext *v2;
  void *v3;

  v2 = self;
  sub_1AE690D8C();

  sub_1AE53F468(0, &qword_1EED98E48);
  v3 = (void *)sub_1AE9261C0();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)enumerateAnswersUsingBlock:(id)a3 error:(id *)a4
{
  GDKnosisResultContext *v5;
  void *v7;

  v7 = _Block_copy(a3);
  v5 = self;
  sub_1AE690ED8((void (*)(id, char *))sub_1AE691538);

  _Block_release(v7);
  return 1;
}

- (BOOL)enumerateAnswersForEntityIdentifier:(id)a3 block:(id)a4 error:(id *)a5
{
  id v7;
  GDKnosisResultContext *v8;
  void *v10;

  v10 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  sub_1AE6910E4(v7, (void (*)(id, char *))sub_1AE6914E0);

  _Block_release(v10);
  return 1;
}

- (GDKnosisResultContext)init
{
  GDKnosisResultContext.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
