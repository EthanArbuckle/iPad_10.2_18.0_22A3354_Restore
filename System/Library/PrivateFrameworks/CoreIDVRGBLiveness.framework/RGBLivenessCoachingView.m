@implementation RGBLivenessCoachingView

- (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_completion);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_shouldLoop) = 0;
  v5 = a3;

  result = (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView *)sub_213A146FC();
  __break(1u);
  return result;
}

- (void)didFinishVideoPlayBack
{
  _TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView *v2;

  v2 = self;
  sub_2139D5AA8();

}

- (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView)initWithFrame:(CGRect)a3
{
  _TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView *result;

  result = (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_playerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_player));
  sub_2139907E4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_completion));
}

@end
