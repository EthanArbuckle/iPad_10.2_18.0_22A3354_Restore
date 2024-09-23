@implementation WalkSuggestionProvider

- (_TtC23FitnessCoachingServices22WalkSuggestionProvider)init
{
  _TtC23FitnessCoachingServices22WalkSuggestionProvider *result;

  result = (_TtC23FitnessCoachingServices22WalkSuggestionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_healthStore));
}

- (id)currentDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC23FitnessCoachingServices22WalkSuggestionProvider *v10;
  void *v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EC00);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CC3C588C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider), *(_QWORD *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider + 16]);
  v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EF00);
  sub_1CC3C5C4C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1CC3C5880();
    sub_1CC32C820((uint64_t)v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  }

  v11 = (void *)sub_1CC3C5850();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (id)currentCalendar
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC23FitnessCoachingServices22WalkSuggestionProvider *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1CC3C5934();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider), *(_QWORD *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider + 16]);
  v7 = self;
  sub_1CC32F898();

  v8 = (void *)sub_1CC3C58EC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (id)firstOnWristDateToday
{
  return 0;
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v7 = sub_1CC3C56DC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v17 - v12;
  v14 = _Block_copy(a6);
  sub_1CC3C56C4();
  sub_1CC3C56C4();
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
  _Block_release(v14);
  return 1;
}

@end
