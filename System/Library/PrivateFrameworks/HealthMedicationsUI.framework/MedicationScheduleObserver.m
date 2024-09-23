@implementation MedicationScheduleObserver

- (void)dealloc
{
  _TtC19HealthMedicationsUI26MedicationScheduleObserver *v2;

  v2 = self;
  MedicationScheduleObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver_scheduleControl));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver_healthStore));
  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver_dateInterval, (unint64_t *)&unk_1EDA0E6D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0]);
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationScheduleObserver__scheduleItems;
  sub_1BC0E7998(0, (unint64_t *)&unk_1EF3F9320, (uint64_t (*)(uint64_t))sub_1BC0FE450, MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)scheduleControlDidRescheduleItems
{
  _TtC19HealthMedicationsUI26MedicationScheduleObserver *v2;

  v2 = self;
  sub_1BC0FCB08();

}

- (_TtC19HealthMedicationsUI26MedicationScheduleObserver)init
{
  _TtC19HealthMedicationsUI26MedicationScheduleObserver *result;

  result = (_TtC19HealthMedicationsUI26MedicationScheduleObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
