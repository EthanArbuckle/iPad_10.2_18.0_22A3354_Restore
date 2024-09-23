@implementation AchievementDataSource

- (_TtC23FitnessCoachingServices21AchievementDataSource)init
{
  _TtC23FitnessCoachingServices21AchievementDataSource *result;

  result = (_TtC23FitnessCoachingServices21AchievementDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices21AchievementDataSource_query);
  swift_bridgeObjectRelease();
}

- (void)monthlyChallengeForDate:(NSDate *)a3 calendar:(NSCalendar *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSDate *v17;
  NSCalendar *v18;
  _TtC23FitnessCoachingServices21AchievementDataSource *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EC80);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1CC3C63CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF9C7C58;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF9C7C60;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1CC394154((uint64_t)v11, (uint64_t)&unk_1EF9C7C68, (uint64_t)v16);
  swift_release();
}

- (void)achievementsWithNames:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC23FitnessCoachingServices21AchievementDataSource *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89EC80);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1CC3C63CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF9C7C08;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF9C7C18;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1CC394154((uint64_t)v9, (uint64_t)&unk_1EF9C7C28, (uint64_t)v14);
  swift_release();
}

@end
