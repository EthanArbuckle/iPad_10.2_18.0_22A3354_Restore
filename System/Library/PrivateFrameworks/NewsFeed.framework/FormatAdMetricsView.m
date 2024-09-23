@implementation FormatAdMetricsView

- (_TtC8NewsFeed19FormatAdMetricsView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed19FormatAdMetricsView *)sub_1BB044990(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed19FormatAdMetricsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB044D18();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed19FormatAdMetricsView_privacyMarker));

}

- (void)metricsViewCollapsed:(id)a3
{
  id v4;
  _TtC8NewsFeed19FormatAdMetricsView *v5;

  v4 = a3;
  v5 = self;
  MEMORY[0x1BCCE1C6C]();

}

@end
