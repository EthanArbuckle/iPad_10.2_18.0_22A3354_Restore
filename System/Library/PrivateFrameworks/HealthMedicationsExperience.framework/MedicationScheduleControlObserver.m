@implementation MedicationScheduleControlObserver

- (void)scheduleControlDidRescheduleItems
{
  _TtC27HealthMedicationsExperience33MedicationScheduleControlObserver *v3;

  if ((*((_BYTE *)&self->super.isa
        + OBJC_IVAR____TtC27HealthMedicationsExperience33MedicationScheduleControlObserver_observerOptions) & 1) != 0)
  {
    sub_1BCB50370();
    sub_1BCB50448();
    v3 = self;
    sub_1BCB63F08();

  }
}

- (void)scheduleControl:(id)a3 didAddOrModifySchedules:(id)a4
{
  id v6;
  _TtC27HealthMedicationsExperience33MedicationScheduleControlObserver *v7;

  if ((*((_BYTE *)&self->super.isa
        + OBJC_IVAR____TtC27HealthMedicationsExperience33MedicationScheduleControlObserver_observerOptions) & 2) != 0)
  {
    sub_1BCB50370();
    sub_1BCB50448();
    v6 = a3;
    v7 = self;
    sub_1BCB63F08();

  }
}

- (_TtC27HealthMedicationsExperience33MedicationScheduleControlObserver)init
{
  _TtC27HealthMedicationsExperience33MedicationScheduleControlObserver *result;

  result = (_TtC27HealthMedicationsExperience33MedicationScheduleControlObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
