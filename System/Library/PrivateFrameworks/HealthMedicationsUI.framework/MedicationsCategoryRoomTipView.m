@implementation MedicationsCategoryRoomTipView

- (UIButton)dismissButton
{
  _TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC154DA8();

  return (UIButton *)v3;
}

- (void)setDismissButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissButton) = (Class)a3;
  v3 = a3;

}

- (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC1592B4();
}

- (void)didTapDismiss
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_onDismiss);
  if (v2)
  {
    v4 = self;
    v3 = sub_1BC0F2690((uint64_t)v2);
    v2(v3);
    sub_1BC0F2600((uint64_t)v2);

  }
}

- (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView)initWithFrame:(CGRect)a3
{
  _TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView *result;

  result = (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_headerView));
  sub_1BC0E8594((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_tipImage, type metadata accessor for TipImage);
  sub_1BC0F2600(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_onDismiss));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___actionButtonsStackView));
}

@end
