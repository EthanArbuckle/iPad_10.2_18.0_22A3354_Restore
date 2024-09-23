@implementation DebugFormatDebuggerSourceBreakpointView

- (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView *result;
  _OWORD v8[8];

  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView_sourceFile;
  sub_1BA8EBB18(v8);
  sub_1BAF97E40((uint64_t)v8, (uint64_t)v5);
  v6 = a3;

  result = (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView *v8;
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
  -[DebugFormatDebuggerSourceBreakpointView bounds](v8, sel_bounds);
  v16.origin.x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, -40.0, -20.0);
  v15.x = x;
  v15.y = y;
  v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (_TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView)initWithFrame:(CGRect)a3
{
  sub_1BAFC69A0();
}

- (void).cxx_destruct
{
  _QWORD v2[16];

  sub_1BAF97E40((uint64_t)self + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceBreakpointView_sourceFile, (uint64_t)v2);
  sub_1BA6A0C50(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BAF927BC);
  swift_release();
}

@end
