@implementation DigitalClockFaceComplicationsView

- (_TtC11ClockPoster33DigitalClockFaceComplicationsView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC11ClockPoster33DigitalClockFaceComplicationsView *result;

  v5 = (char *)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_currentTemperature;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmInfo;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B4E0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_dateLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_temperatureLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmComplication) = 0;
  v9 = a3;

  result = (_TtC11ClockPoster33DigitalClockFaceComplicationsView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11ClockPoster33DigitalClockFaceComplicationsView *v2;

  v2 = self;
  sub_237E88C7C();

}

- (_TtC11ClockPoster33DigitalClockFaceComplicationsView)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster33DigitalClockFaceComplicationsView *result;

  result = (_TtC11ClockPoster33DigitalClockFaceComplicationsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_237E2209C((uint64_t)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_currentTemperature, &qword_25689B250);
  swift_bridgeObjectRelease();
  sub_237E2209C((uint64_t)self + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmInfo, &qword_25689B500);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_temperatureLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster33DigitalClockFaceComplicationsView_alarmComplication));
}

@end
