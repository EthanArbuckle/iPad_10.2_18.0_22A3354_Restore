@implementation MentalHealthDemoDataGenerator

- (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator)init
{
  return (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator *)sub_241707824();
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  id v6;
  id v7;

  swift_unknownObjectWeakAssign();
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState) = (Class)a4;
  v6 = a4;

}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = sub_24170DAC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170DABC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  _TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator *v17;
  uint64_t v18;

  v11 = sub_24170DAC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170DABC();
  v15 = a3;
  v16 = a7;
  v17 = self;
  sub_241709A8C((uint64_t)v14, v16, a5);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_241708DA0(v4);

}

- (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator)initWithCoder:(id)a3
{
  id v3;
  _TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator *v4;

  v3 = a3;
  v4 = (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator *)sub_241709CD8(v3);

  return v4;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_calendar;
  v4 = sub_24170DB1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState));
}

@end
