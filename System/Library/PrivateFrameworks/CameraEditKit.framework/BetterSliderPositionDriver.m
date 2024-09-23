@implementation BetterSliderPositionDriver

- (_TtC13CameraEditKit26BetterSliderPositionDriver)init
{
  return (_TtC13CameraEditKit26BetterSliderPositionDriver *)sub_1B9868EF8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation);
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_decelerationTarget);
}

- (double)velocity
{
  _TtC13CameraEditKit26BetterSliderPositionDriver *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1B98691B8();
  v4 = v3;

  return v4;
}

- (void)contactBeganWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit26BetterSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B9869D58();

}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit26BetterSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B986934C(v4);

}

- (void)contactEndedWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit26BetterSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B9869DD8();

}

@end
