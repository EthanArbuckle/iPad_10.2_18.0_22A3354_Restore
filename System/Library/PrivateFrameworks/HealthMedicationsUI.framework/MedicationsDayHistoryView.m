@implementation MedicationsDayHistoryView

- (_TtC19HealthMedicationsUI25MedicationsDayHistoryView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI25MedicationsDayHistoryView *)sub_1BC1D19EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI25MedicationsDayHistoryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC1D5060();
}

- (void)dealloc
{
  void *v3;
  _TtC19HealthMedicationsUI25MedicationsDayHistoryView *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView_timer);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationsDayHistoryView();
  -[MedicationsDayHistoryView dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___doseStatusImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___timeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___chevronImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___headerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___lineItemsStackView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView_timer));
  swift_bridgeObjectRelease();
  sub_1BC0F8D88((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView_elapsedTimeCache);
}

@end
