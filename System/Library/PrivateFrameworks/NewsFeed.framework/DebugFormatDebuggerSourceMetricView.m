@implementation DebugFormatDebuggerSourceMetricView

- (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAA6618C();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed35DebugFormatDebuggerSourceMetricView *v2;

  v2 = self;
  sub_1BAA65DC8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC8NewsFeed35DebugFormatDebuggerSourceMetricView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed35DebugFormatDebuggerSourceMetricView_label);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  sub_1BB873294();
  sub_1BB873648();
  sub_1BB8732A0();
  sub_1BB873654();
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed35DebugFormatDebuggerSourceMetricView *result;

  result = (_TtC8NewsFeed35DebugFormatDebuggerSourceMetricView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatDebuggerSourceMetricView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatDebuggerSourceMetricView_bubbleLayer));
}

@end
