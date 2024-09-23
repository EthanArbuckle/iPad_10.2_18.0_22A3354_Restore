@implementation MedicationDayScheduleView

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView *)sub_231890FA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2318930E0();
}

- (void)didTapLog:(id)a3
{
  _TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView *v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2318D5FE8();
  swift_unknownObjectRelease();
  v5 = *(void (**)(uint64_t))((char *)&v4->super.super.super.isa
                                      + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_logActionHandler);
  if (v5)
  {
    v6 = swift_retain();
    v5(v6);
    sub_2317CD52C((uint64_t)v5);
  }

  sub_2317D4B2C((uint64_t)&v7);
}

- (void).cxx_destruct
{
  sub_2317CD52C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_logActionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_logButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_lineItemsStackView));
}

@end
