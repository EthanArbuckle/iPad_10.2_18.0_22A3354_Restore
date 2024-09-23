@implementation MenstrualCyclesAnalysisChangeDetector

- (void)dealloc
{
  _TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector *v2;

  v2 = self;
  sub_2319A1A7C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector_analysisQuery));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector_observerQueue));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector_generatorContext;
  v4 = sub_231C9D960();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector__currentAnalysisResult;
  sub_2319A26C8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_231CA2D0C();
  sub_231CA1CC8();
  swift_bridgeObjectRelease();
  sub_231CA1CC8();
  sub_231CA29AC();

  v4 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector)init
{
  _TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector *result;

  result = (_TtC24MenstrualCyclesAppPlugin37MenstrualCyclesAnalysisChangeDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
