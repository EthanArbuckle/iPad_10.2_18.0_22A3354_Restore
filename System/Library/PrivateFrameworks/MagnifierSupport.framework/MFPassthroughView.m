@implementation MFPassthroughView

- (_TtC16MagnifierSupport17MFPassthroughView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MagnifierSupport17MFPassthroughView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport17MFPassthroughView_enabled) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport17MFPassthroughView_heightOfPanAreaAboveDrawer) = (Class)0x403E000000000000;
  v4 = a3;

  result = (_TtC16MagnifierSupport17MFPassthroughView *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  _TtC16MagnifierSupport17MFPassthroughView *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_2274BA1DC(v4, x, y);

  return v4 & 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC16MagnifierSupport17MFPassthroughView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_2274BA450((uint64_t)a4, x, y);

  return v10;
}

- (_TtC16MagnifierSupport17MFPassthroughView)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport17MFPassthroughView *result;

  result = (_TtC16MagnifierSupport17MFPassthroughView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
