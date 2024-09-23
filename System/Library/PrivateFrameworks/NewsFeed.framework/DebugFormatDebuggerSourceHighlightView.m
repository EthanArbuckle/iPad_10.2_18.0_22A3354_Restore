@implementation DebugFormatDebuggerSourceHighlightView

- (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAFF58BC();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView *v2;

  v2 = self;
  sub_1BAFF4A78();

}

- (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView *result;

  result = (_TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD v3[16];

  sub_1BA5193C4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_sourceFile, (uint64_t)v3, (uint64_t (*)(_QWORD))sub_1BA8EBB30);
  sub_1BA6A0C50(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BAF927BC);
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_didTapOnHighlight));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_messageFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_messageTextColor));
  sub_1BAFF57E0((uint64_t)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatDebuggerSourceHighlightView_highlight);
}

@end
