@implementation UserCharacteristicsChangeDetector

- (void)dealloc
{
  _TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector *v2;

  v2 = self;
  sub_231A5485C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector_observerQueue));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector__currentAge;
  sub_231A54F10();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector__currentBiologicalSex;
  sub_231A54F64();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (_TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector)init
{
  _TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector *result;

  result = (_TtC24MenstrualCyclesAppPlugin33UserCharacteristicsChangeDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
