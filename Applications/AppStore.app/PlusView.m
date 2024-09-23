@implementation PlusView

- (_TtC8AppStore8PlusView)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore8PlusView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore8PlusView_plusColor) = 0;
  v4 = a3;

  result = (_TtC8AppStore8PlusView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PlusView.swift", 23, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC8AppStore8PlusView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10019DA7C(x, y, width, height);

}

- (_TtC8AppStore8PlusView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore8PlusView *result;

  result = (_TtC8AppStore8PlusView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.PlusView", 17, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
