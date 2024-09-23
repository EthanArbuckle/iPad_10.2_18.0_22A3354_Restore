@implementation AnalogClockFaceViewController

- (_TtC11ClockPoster29AnalogClockFaceViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC11ClockPoster29AnalogClockFaceViewController *result;

  v5 = OBJC_IVAR____TtC11ClockPoster29AnalogClockFaceViewController_clockFace;
  type metadata accessor for AnalogClockFaceView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11ClockPoster29AnalogClockFaceViewController *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC11ClockPoster29AnalogClockFaceViewController *v2;

  v2 = self;
  sub_237E37A38();

}

- (void).cxx_destruct
{
  sub_237E2846C((uint64_t)self + OBJC_IVAR____TtC11ClockPoster29AnalogClockFaceViewController_look);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster29AnalogClockFaceViewController_clockFace));
}

@end
