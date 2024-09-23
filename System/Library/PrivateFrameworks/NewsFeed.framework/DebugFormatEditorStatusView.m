@implementation DebugFormatEditorStatusView

- (_TtC8NewsFeed27DebugFormatEditorStatusView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAFC5AC4();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed27DebugFormatEditorStatusView *v2;

  v2 = self;
  sub_1BAFC556C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = fmin(a3.width, 600.0);
  v4 = fmin(a3.height, 32.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC8NewsFeed27DebugFormatEditorStatusView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed27DebugFormatEditorStatusView *result;

  result = (_TtC8NewsFeed27DebugFormatEditorStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_onHistoryTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_historyButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_onPackageTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_packageButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_onErrorTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_errorButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_onServerTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_serverButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_statusLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed27DebugFormatEditorStatusView_serverReloadQueueLabel));
}

@end
