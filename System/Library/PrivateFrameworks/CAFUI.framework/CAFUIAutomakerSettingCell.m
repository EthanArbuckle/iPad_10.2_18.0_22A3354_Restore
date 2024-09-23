@implementation CAFUIAutomakerSettingCell

- (void)prepareForReuse
{
  _TtC5CAFUI25CAFUIAutomakerSettingCell *v2;

  v2 = self;
  CAFUIAutomakerSettingCell.prepareForReuse()();

}

- (_TtC5CAFUI25CAFUIAutomakerSettingCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI25CAFUIAutomakerSettingCell_representable);
  v9 = (objc_class *)type metadata accessor for CAFUIAutomakerSettingCell(0);
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CAFUITileBaseCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
