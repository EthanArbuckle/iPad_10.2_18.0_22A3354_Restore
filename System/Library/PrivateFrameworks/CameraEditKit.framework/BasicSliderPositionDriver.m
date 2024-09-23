@implementation BasicSliderPositionDriver

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled);
}

- (void)setDistanceTraveled:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = a3;
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate);
}

- (void)setDistanceToDecelerate:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = a3;
}

- (double)velocity
{
  return sub_1B986B270();
}

- (void)contactBeganWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit25BasicSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B986B64C();

}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit25BasicSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B986B33C(v4);

}

- (void)contactEndedWithAction:(id)a3
{
  sub_1B986B6EC();
}

- (_TtC13CameraEditKit25BasicSliderPositionDriver)init
{
  char *v2;
  char *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = 0;
  v2 = (char *)self + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample;
  *((_QWORD *)v2 + 1) = 0;
  *((_QWORD *)v2 + 2) = 0;
  *(_QWORD *)v2 = 0;
  v2[24] = 1;
  v3 = (char *)self + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample;
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = 0;
  v3[24] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BasicSliderPositionDriver();
  return -[BasicSliderPositionDriver init](&v5, sel_init);
}

@end
