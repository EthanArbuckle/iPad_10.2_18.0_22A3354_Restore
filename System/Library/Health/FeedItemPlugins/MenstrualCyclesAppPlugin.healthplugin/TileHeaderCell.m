@implementation TileHeaderCell

- (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell *)sub_231B100AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin14TileHeaderCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell____lazy_storage___tileHeaderView) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TileHeaderCell();
  return -[TileHeaderCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC24MenstrualCyclesAppPlugin14TileHeaderCell *v4;

  v4 = self;
  sub_231B105B0(a3);

}

- (void).cxx_destruct
{
  sub_2319604AC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell_item, (unint64_t *)&qword_255F4A910, (unint64_t *)&qword_255F48990);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell____lazy_storage___tileHeaderView));
}

@end
