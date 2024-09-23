@implementation WaveformPlayIndicator

- (_TtC11MediaCoreUI21WaveformPlayIndicator)init
{
  return (_TtC11MediaCoreUI21WaveformPlayIndicator *)sub_241328134();
}

- (void)dealloc
{
  _TtC11MediaCoreUI21WaveformPlayIndicator *v2;

  v2 = self;
  sub_241329FD4();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  sub_24132DACC(*(unint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_mode));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette);
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC11MediaCoreUI21WaveformPlayIndicator_colorPalette));

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC11MediaCoreUI21WaveformPlayIndicator)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_24132E754();
}

- (void)tintColorDidChange
{
  _TtC11MediaCoreUI21WaveformPlayIndicator *v2;

  v2 = self;
  sub_24132BE40();

}

- (void)layoutSubviews
{
  _TtC11MediaCoreUI21WaveformPlayIndicator *v2;

  v2 = self;
  sub_24132B464();

}

- (void)didMoveToWindow
{
  _TtC11MediaCoreUI21WaveformPlayIndicator *v2;

  v2 = self;
  sub_24132C158();

}

- (_TtC11MediaCoreUI21WaveformPlayIndicator)initWithFrame:(CGRect)a3
{
  _TtC11MediaCoreUI21WaveformPlayIndicator *result;

  result = (_TtC11MediaCoreUI21WaveformPlayIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
