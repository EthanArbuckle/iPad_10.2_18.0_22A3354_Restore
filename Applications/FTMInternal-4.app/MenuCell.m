@implementation MenuCell

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MenuCell();
  return -[MenuCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MenuCell();
  v4 = v5.receiver;
  -[MenuCell setSelected:](&v5, "setSelected:", v3);
  sub_1001A3614();

}

- (_TtC13FTMInternal_48MenuCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _TtC13FTMInternal_48MenuCell *v9;
  _TtC13FTMInternal_48MenuCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuCellSize) = (Class)0x403C000000000000;
  v8 = OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuIconImageView;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1001A3474();

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for MenuCell();
  v10 = -[MenuCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  sub_1001A381C();

  return v10;
}

- (_TtC13FTMInternal_48MenuCell)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC13FTMInternal_48MenuCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuCellSize) = (Class)0x403C000000000000;
  v4 = OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuIconImageView;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1001A3474();

  result = (_TtC13FTMInternal_48MenuCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/MenuBar.swift", 27, 2, 159, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuIconImageView));
}

@end
