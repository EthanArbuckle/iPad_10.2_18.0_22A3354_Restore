@implementation MedicationDayScheduleCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell *v8;
  uint64_t v9;

  v4 = sub_2318D4A94();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D4A88();
  v8 = self;
  sub_231892288();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell *)sub_2318928E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell____lazy_storage___scheduleView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell *)sub_2318D6150();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell____lazy_storage___scheduleView));
  sub_2318939A0((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell_item, (unint64_t *)&qword_25418AA50, (unint64_t *)&qword_25418AA40);
}

@end
