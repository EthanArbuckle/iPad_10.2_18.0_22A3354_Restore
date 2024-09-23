@implementation TileTipView

- (_TtC19HealthMedicationsUI11TileTipView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC17764C();
}

- (void)didTapView
{
  void (*v2)(uint64_t);
  _TtC19HealthMedicationsUI11TileTipView *v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView_onTap);
  v3 = self;
  v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (void)didTapDismiss
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC19HealthMedicationsUI11TileTipView *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView_onDismiss);
  if (v2)
  {
    v4 = self;
    v3 = sub_1BC0F2690((uint64_t)v2);
    v2(v3);
    sub_1BC0F2600((uint64_t)v2);

  }
}

- (_TtC19HealthMedicationsUI11TileTipView)initWithFrame:(CGRect)a3
{
  _TtC19HealthMedicationsUI11TileTipView *result;

  result = (_TtC19HealthMedicationsUI11TileTipView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1BC0F2600(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView_onDismiss));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView____lazy_storage___subdetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView____lazy_storage___dismissImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView____lazy_storage___actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI11TileTipView_detailLabelBottomConstraint));
}

@end
