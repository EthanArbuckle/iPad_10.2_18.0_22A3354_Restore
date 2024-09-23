@implementation HIDPassthroughSliderPositionDriver

- (double)distanceTraveled
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled);
}

- (void)setDistanceTraveled:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = a3;
}

- (double)distanceToDecelerate
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate);
}

- (void)setDistanceToDecelerate:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = a3;
}

- (double)liftoffVelocity
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity);
}

- (void)setLiftoffVelocity:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity) = a3;
}

- (double)velocity
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity);
}

- (void)contactBeganWithAction:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _TtC13CameraEditKit34HIDPassthroughSliderPositionDriver *v8;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = 0;
  v4 = qword_1EF232270;
  v5 = a3;
  v8 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_1B987244C();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EF232918);
  objc_msgSend(v5, sel__timestamp);
  sub_1B9867C1C(v7, 0, 0, 0);

}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4;
  _TtC13CameraEditKit34HIDPassthroughSliderPositionDriver *v5;

  v4 = a3;
  v5 = self;
  sub_1B9866294(v4);

}

- (void)contactEndedWithAction:(id)a3
{
  id v5;
  _TtC13CameraEditKit34HIDPassthroughSliderPositionDriver *v6;

  v5 = a3;
  v6 = self;
  sub_1B9866424(a3);

}

- (_TtC13CameraEditKit34HIDPassthroughSliderPositionDriver)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HIDPassthroughSliderPositionDriver();
  return -[HIDPassthroughSliderPositionDriver init](&v3, sel_init);
}

@end
