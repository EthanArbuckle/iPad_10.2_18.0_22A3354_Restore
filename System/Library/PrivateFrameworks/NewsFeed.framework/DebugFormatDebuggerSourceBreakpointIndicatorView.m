@implementation DebugFormatDebuggerSourceBreakpointIndicatorView

- (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  _TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView_onTap;
  sub_1BA4AD288(0, (unint64_t *)&qword_1ED3B0A50, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DBC348]);
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[DebugFormatDebuggerSourceBreakpointIndicatorView bounds](v8, sel_bounds);
  v16.origin.x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, -40.0, -40.0);
  v15.x = x;
  v15.y = y;
  v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (_TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView)initWithFrame:(CGRect)a3
{
  sub_1BAFC69A0();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView_onTap));
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC8NewsFeed48DebugFormatDebuggerSourceBreakpointIndicatorView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1BAFC7A50();

  return v9;
}

@end
