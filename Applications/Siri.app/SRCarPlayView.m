@implementation SRCarPlayView

- (_TtC4Siri13SRCarPlayView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  sub_1000982CC((uint64_t)v3, v4, v5);
}

- (void)didTapToDismissWithSender:(id)a3
{
  id v4;
  _TtC4Siri13SRCarPlayView *v5;

  v4 = a3;
  v5 = self;
  sub_100097D84(v4);

}

- (_TtC4Siri13SRCarPlayView)initWithFrame:(CGRect)a3
{
  _TtC4Siri13SRCarPlayView *result;

  result = (_TtC4Siri13SRCarPlayView *)_swift_stdlib_reportUnimplementedInitializer("Siri.SRCarPlayView", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000769B8((uint64_t)self + OBJC_IVAR____TtC4Siri13SRCarPlayView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetContainerView));

}

@end
