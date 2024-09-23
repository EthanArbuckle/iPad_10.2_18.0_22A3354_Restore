@implementation InteractionFactorsCell

- (_TtC19HealthMedicationsUI22InteractionFactorsCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI22InteractionFactorsCell *)sub_1BC205828(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI22InteractionFactorsCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI22InteractionFactorsCell *)sub_1BC205920(a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionFactorsCell();
  v2 = v3.receiver;
  -[InteractionFactorsCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC205A40();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI22InteractionFactorsCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC205DE8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)layoutSubviews
{
  _TtC19HealthMedicationsUI22InteractionFactorsCell *v2;

  v2 = self;
  sub_1BC206034();

}

- (void)editButtonTapped:(id)a3
{
  _TtC19HealthMedicationsUI22InteractionFactorsCell *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC2B5024();
  swift_unknownObjectRelease();
  sub_1BC20777C();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell____lazy_storage___editButton));
  swift_bridgeObjectRelease();
}

@end
