@implementation SleepObserver

- (void)dealloc
{
  _TtC23FitnessCoachingServices13SleepObserver *v2;

  v2 = self;
  sub_1CC32BB34();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_duetObserver);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_notificationCenter));
  sub_1CC32C7E4(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_state), self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_state]);
}

- (_TtC23FitnessCoachingServices13SleepObserver)init
{
  _TtC23FitnessCoachingServices13SleepObserver *result;

  result = (_TtC23FitnessCoachingServices13SleepObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)currentDate
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC23FitnessCoachingServices13SleepObserver *v9;
  void *v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EC00);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1CC3C588C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider), *(_QWORD *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider + 16]);
  v9 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EF00);
  sub_1CC3C5C4C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1CC3C5880();
    sub_1CC32C820((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  }

  v10 = (void *)sub_1CC3C5850();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (id)currentCalendar
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC23FitnessCoachingServices13SleepObserver *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1CC3C5934();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider), *(_QWORD *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider + 16]);
  v7 = self;
  sub_1CC32F898();

  v8 = (void *)sub_1CC3C58EC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (void)sleepDataProviderUserDayDidUpdate
{
  _TtC23FitnessCoachingServices13SleepObserver *v2;

  v2 = self;
  sub_1CC32C444();

}

@end
