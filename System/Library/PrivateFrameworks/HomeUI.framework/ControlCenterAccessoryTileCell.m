@implementation ControlCenterAccessoryTileCell

- (BOOL)toggleable
{
  _TtC6HomeUI30ControlCenterAccessoryTileCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1B90140A0();

  return v3 & 1;
}

- (void)setToggleable:(BOOL)a3
{
  int v3;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable);
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable) = a3;
  if (v3 != a3)
    -[ControlCenterAccessoryTileCell setNeedsUpdateConfiguration](self, sel_setNeedsUpdateConfiguration);
}

- (id)tappableAreaForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC6HomeUI30ControlCenterAccessoryTileCell *v5;
  __CFString *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_1B90142C0(x, y);

  return v6;
}

- (_TtC6HomeUI30ControlCenterAccessoryTileCell)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ControlCenterAccessoryTileCell();
  return -[HUAccessoryTileCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6HomeUI30ControlCenterAccessoryTileCell)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlCenterAccessoryTileCell();
  return -[HUAccessoryTileCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
