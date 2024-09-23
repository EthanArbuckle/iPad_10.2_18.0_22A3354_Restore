@implementation InteractionSummaryItemCell

- (_TtC19HealthMedicationsUI26InteractionSummaryItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI26InteractionSummaryItemCell *)sub_1BC279CB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI26InteractionSummaryItemCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI26InteractionSummaryItemCell *)sub_1BC279DC4(a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionSummaryItemCell();
  v2 = v3.receiver;
  -[InteractionSummaryItemCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC279EFC();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI26InteractionSummaryItemCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC27A590();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell_item, (unint64_t *)&qword_1EDA0F7D0, (void (*)(uint64_t))sub_1BC0E1B94);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell____lazy_storage___subtitleView));
}

@end
