@implementation ClimateSlotCell

- (void)prepareForReuse
{
  uint64_t v3;
  void *v4;
  _TtC7Climate15ClimateSlotCell *v5;
  void *v6;
  objc_super v7;

  v3 = OBJC_IVAR____TtC7Climate15ClimateSlotCell_climateSlot;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate15ClimateSlotCell_climateSlot);
  v5 = self;
  objc_msgSend(v4, "removeFromSuperview");
  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for ClimateSlotCell();
  -[ClimateSlotCell prepareForReuse](&v7, "prepareForReuse");

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC7Climate15ClimateSlotCell *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100011848(v4);

  return v6;
}

- (_TtC7Climate15ClimateSlotCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate15ClimateSlotCell_isHeightCalculated) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate15ClimateSlotCell_climateSlot) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ClimateSlotCell();
  return -[ClimateSlotCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Climate15ClimateSlotCell)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate15ClimateSlotCell_isHeightCalculated) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate15ClimateSlotCell_climateSlot) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateSlotCell();
  return -[ClimateSlotCell initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate15ClimateSlotCell_climateSlot));
}

@end
