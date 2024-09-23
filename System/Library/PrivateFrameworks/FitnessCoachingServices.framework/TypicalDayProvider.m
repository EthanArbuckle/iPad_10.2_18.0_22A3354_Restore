@implementation TypicalDayProvider

- (_TtC23FitnessCoachingServices18TypicalDayProvider)init
{
  _TtC23FitnessCoachingServices18TypicalDayProvider *result;

  result = (_TtC23FitnessCoachingServices18TypicalDayProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource);

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
  _QWORD *v10;
  _TtC23FitnessCoachingServices18TypicalDayProvider *v11;
  void *v12;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EC00);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CC3C588C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource), *(_QWORD *)&self->dataSource[OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource + 16]);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*v10 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider), *(_QWORD *)(*v10 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider + 24));
  v11 = self;
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

  v12 = (void *)sub_1CC3C5850();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)currentCalendar
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _TtC23FitnessCoachingServices18TypicalDayProvider *v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1CC3C5934();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource), *(_QWORD *)&self->dataSource[OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource + 16]);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*v7 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider), *(_QWORD *)(*v7 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider + 24));
  v8 = self;
  sub_1CC32F898();

  v9 = (void *)sub_1CC3C58EC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v9;
}

- (id)firstOnWristDateToday
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC23FitnessCoachingServices18TypicalDayProvider *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EC00);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource), *(_QWORD *)&self->dataSource[OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource + 16]);
  v6 = self;
  sub_1CC372388((uint64_t)v5);

  v7 = sub_1CC3C588C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1CC3C5850();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return v9;
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  _TtC23FitnessCoachingServices18TypicalDayProvider *v16;
  void (*v17)(_BYTE *, uint64_t);
  _BYTE v19[16];

  v8 = sub_1CC3C56DC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v10);
  v14 = &v19[-v13];
  v15 = _Block_copy(a6);
  sub_1CC3C56C4();
  sub_1CC3C56C4();
  _Block_copy(v15);
  v16 = self;
  sub_1CC3ABE6C((uint64_t)v14, (uint64_t)v12, (uint64_t)v16, (uint64_t)v15);
  _Block_release(v15);

  v17 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v17(v12, v8);
  v17(v14, v8);
  _Block_release(v15);
  return 1;
}

@end
