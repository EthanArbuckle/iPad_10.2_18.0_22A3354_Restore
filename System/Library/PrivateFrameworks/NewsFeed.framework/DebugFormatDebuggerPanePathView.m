@implementation DebugFormatDebuggerPanePathView

- (_TtC8NewsFeed31DebugFormatDebuggerPanePathView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed31DebugFormatDebuggerPanePathView *)sub_1BB1E907C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed31DebugFormatDebuggerPanePathView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB1E9790();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed31DebugFormatDebuggerPanePathView *v2;

  v2 = self;
  sub_1BB1E94CC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_topSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_bottomSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_filePathLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDebuggerPanePathView_lineColumnLabel));
}

@end
