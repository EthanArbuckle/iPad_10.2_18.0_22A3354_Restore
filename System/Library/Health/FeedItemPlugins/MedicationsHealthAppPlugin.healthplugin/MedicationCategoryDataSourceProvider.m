@implementation MedicationCategoryDataSourceProvider

- (_TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider)init
{
  _TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider *result;

  result = (_TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_healthStore));
  sub_2317D4B2C((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_pinnedContentManager);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_scheduleControlObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider_scheduleControl));
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__currentDate;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0];
  sub_2317D4194(0, &qword_25418AF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__currentDayDoseEvents;
  sub_2317D4194(0, &qword_25418AF78, (uint64_t (*)(uint64_t))sub_2317D4178, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__currentDayScheduleItems;
  sub_2317D4194(0, &qword_25418AF80, (uint64_t (*)(uint64_t))sub_2317D40EC, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self
      + OBJC_IVAR____TtC26MedicationsHealthAppPlugin36MedicationCategoryDataSourceProvider__onboardingCompleted;
  sub_2318140B8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

@end
