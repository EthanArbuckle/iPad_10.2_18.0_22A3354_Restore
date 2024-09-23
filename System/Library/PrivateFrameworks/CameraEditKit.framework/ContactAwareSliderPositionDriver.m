@implementation ContactAwareSliderPositionDriver

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled);
}

- (void)setDistanceTraveled:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled) = a3;
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate);
}

- (void)setDistanceToDecelerate:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate) = a3;
}

- (double)velocity
{
  _TtC13CameraEditKit32ContactAwareSliderPositionDriver *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1B986C7D0();
  v4 = v3;

  return v4;
}

- (void)contactBeganWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit32ContactAwareSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B986BF24(v4);

}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit32ContactAwareSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B986C0E8(v4);

}

- (void)contactEndedWithAction:(id)a3
{
  id v5;
  _TtC13CameraEditKit32ContactAwareSliderPositionDriver *v6;

  v5 = a3;
  v6 = self;
  sub_1B986C4B0(a3);

}

- (_TtC13CameraEditKit32ContactAwareSliderPositionDriver)init
{
  return (_TtC13CameraEditKit32ContactAwareSliderPositionDriver *)sub_1B986C8DC();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
