@implementation DebugFormatInspectorSplitView

- (_TtC8NewsFeed29DebugFormatInspectorSplitView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed29DebugFormatInspectorSplitView *)sub_1BB1DED08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed29DebugFormatInspectorSplitView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8NewsFeed29DebugFormatInspectorSplitView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_left;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_right;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed29DebugFormatInspectorSplitView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8NewsFeed29DebugFormatInspectorSplitView *v2;

  v2 = self;
  sub_1BB1DEF38();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_left));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorSplitView_right));
}

@end
