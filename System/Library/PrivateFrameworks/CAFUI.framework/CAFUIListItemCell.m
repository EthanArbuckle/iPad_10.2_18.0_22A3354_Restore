@implementation CAFUIListItemCell

- (_TtC5CAFUI17CAFUIListItemCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5CAFUI17CAFUIListItemCell *v7;
  void *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5CAFUI17CAFUIListItemCell_item) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CAFUIListItemCell();
  v7 = -[CAFUITileBaseCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)MEMORY[0x23B812F68](0xD000000000000011, 0x800000023757A9A0);
  -[CAFUIListItemCell setAccessibilityIdentifier:](v7, sel_setAccessibilityIdentifier_, v8);

  return v7;
}

- (void)prepareForReuse
{
  _TtC5CAFUI17CAFUIListItemCell *v2;

  v2 = self;
  CAFUIListItemCell.prepareForReuse()();

}

- (void).cxx_destruct
{
  swift_release();
}

@end
