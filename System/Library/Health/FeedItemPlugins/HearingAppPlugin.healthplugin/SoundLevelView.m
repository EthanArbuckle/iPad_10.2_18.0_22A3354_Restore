@implementation SoundLevelView

- (_TtC16HearingAppPlugin14SoundLevelView)initWithCoder:(id)a3
{
  id v4;
  _TtC16HearingAppPlugin14SoundLevelView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_headerStackView) = 0;
  v4 = a3;

  result = (_TtC16HearingAppPlugin14SoundLevelView *)sub_2312BC068();
  __break(1u);
  return result;
}

- (_TtC16HearingAppPlugin14SoundLevelView)initWithFrame:(CGRect)a3
{
  _TtC16HearingAppPlugin14SoundLevelView *result;

  result = (_TtC16HearingAppPlugin14SoundLevelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_meterLevelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin14SoundLevelView_headerStackView));
}

@end
