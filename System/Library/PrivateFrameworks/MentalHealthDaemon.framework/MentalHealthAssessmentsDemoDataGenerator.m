@implementation MentalHealthAssessmentsDemoDataGenerator

- (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator)init
{
  return (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *)sub_24170A478();
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  id v6;
  id v7;

  swift_unknownObjectWeakAssign();
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState) = (Class)a4;
  v6 = a4;

}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *v14;
  uint64_t v15;

  v8 = sub_24170DAC8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170DABC();
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_24170BB5C();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  _TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *v17;
  uint64_t v18;

  v11 = sub_24170DAC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24170DABC();
  v15 = a3;
  v16 = a7;
  v17 = self;
  sub_24170C454((uint64_t)v14, v16, a5);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *v6;
  uint64_t v7;
  id v8;
  _TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *v9;
  id v10;

  if ((self->_anon_0[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime] & 1) != 0)
  {
    v5 = a3;
    v6 = self;
    v7 = 0;
  }
  else
  {
    v8 = a3;
    v9 = self;
    v7 = sub_24170DBA0();
  }
  v10 = (id)sub_24170DB64();
  objc_msgSend(a3, sel_encodeObject_forKey_, v7, v10);

  swift_unknownObjectRelease();
}

- (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator)initWithCoder:(id)a3
{
  id v3;
  _TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *v4;

  v3 = a3;
  v4 = (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *)sub_24170C788(v3);

  return v4;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_calendar;
  v4 = sub_24170DB1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState));
}

@end
