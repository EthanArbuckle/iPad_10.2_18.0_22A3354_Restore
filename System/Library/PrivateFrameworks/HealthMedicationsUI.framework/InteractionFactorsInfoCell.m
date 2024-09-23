@implementation InteractionFactorsInfoCell

- (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell *)sub_1BC26FE8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell *)sub_1BC26FFB0(a3);
}

- (void)awakeFromNib
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractionFactorsInfoCell();
  v2 = v6.receiver;
  -[InteractionFactorsInfoCell awakeFromNib](&v6, sel_awakeFromNib);
  sub_1BC270184();
  sub_1BC27046C();
  v4 = sub_1BC2B4460();
  v5 = v3;
  swift_bridgeObjectRetain();
  sub_1BC2B44FC();
  swift_bridgeObjectRelease();
  sub_1BC2712DC(v4, v5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell_item);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___criticalHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___criticalBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___seriousHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___seriousBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___moderateHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___moderateBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___minorHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___minorBodyLabel));
}

@end
