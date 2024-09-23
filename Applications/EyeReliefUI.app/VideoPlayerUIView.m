@implementation VideoPlayerUIView

- (_TtC11EyeReliefUI17VideoPlayerUIView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11EyeReliefUI17VideoPlayerUIView *result;

  v5 = OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer;
  v6 = objc_allocWithZone((Class)AVPlayerLayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper) = 0;

  result = (_TtC11EyeReliefUI17VideoPlayerUIView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100011D80, "EyeReliefUI/ShieldIntervention.swift", 36, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VideoPlayerUIView();
  v2 = (char *)v4.receiver;
  -[VideoPlayerUIView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (_TtC11EyeReliefUI17VideoPlayerUIView)initWithFrame:(CGRect)a3
{
  _TtC11EyeReliefUI17VideoPlayerUIView *result;

  result = (_TtC11EyeReliefUI17VideoPlayerUIView *)_swift_stdlib_reportUnimplementedInitializer("EyeReliefUI.VideoPlayerUIView", 29, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper));
}

@end
