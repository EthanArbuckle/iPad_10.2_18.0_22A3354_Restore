@implementation LocationDataProvider

- (_TtC10ClockAngel20LocationDataProvider)init
{
  return (_TtC10ClockAngel20LocationDataProvider *)sub_100027B2C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10ClockAngel20LocationDataProvider__isLocationUpdating));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ClockAngel20LocationDataProvider__location));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ClockAngel20LocationDataProvider_stream));
  v3 = (char *)self + OBJC_IVAR____TtC10ClockAngel20LocationDataProvider_distanceFilter;
  v4 = sub_10000A58C(&qword_1000B0128);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10002AE88(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC10ClockAngel20LocationDataProvider____lazy_storage___locationManager));
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC10ClockAngel20LocationDataProvider *v10;

  v7 = sub_100015494(0, &qword_1000B0330, CLLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1000289F8(v9, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC10ClockAngel20LocationDataProvider *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_10002B6A8((uint64_t)v8);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC10ClockAngel20LocationDataProvider *v5;

  v4 = a3;
  v5 = self;
  sub_100028F28(v4);

}

@end
